module simplified_tcp(  // module and port declaration: fill the gaps
		
	input CLOCK_50,
	
	// KEY
	input   [3:0]KEY,
	//input KEY , verify if needed.
	
	//LED
	output [7:0] S1_LED,
		
	// Ethernet : the signals used are: 
	//the RGMII transmit clock, 
	//the MDC reference, 
	//the MDIO, 
	//the hardware reset, 
	//the RGMII receive clock, 
	//the receive data, 
	//the receive data valid, 
	//the transmit data and 
	//the transmit enable (check the manual)
	output ENET_GTX_CLK,
	output ENET_MDC,
	input ENET_RX_CLK,
	inout ENET_MDIO,	
	//input ENET_TX_CLK, 
	output  [3:0] ENET_TX_DATA,
	output   ENET_RST_N,
	input [3:0] ENET_RX_DATA,
	input  ENET_RX_DV,
	output ENET_TX_EN,
	//sdram memory
	inout [7:0]dq,
	output [11:0]addr,
	output [1:0]ba,
	output cas_n,
	output dqm,
	output ras_n,
	output we_n,
	output clk_n
);

	wire sys_clk, clk_125, clk_25, clk_2p5, tx_clk;
	wire clk_sdram,clk1_125,clk1_25,clk1_2p5;
	wire core_reset_n;
	wire mdc, mdio_in, mdio_oen, mdio_out;
	wire eth_mode, ena_10;
	//wire tx_clk1,gtk_clk1;

	// Assign MDIO and MDC signals
	
	assign mdio_in   = ENET_MDIO;
	assign ENET_MDC  = mdc;
	assign ENET_MDIO = mdio_oen ? 1'bz : mdio_out;
	
	//Assign reset
	
	assign ENET_RST_N = core_reset_n;
	
	//Assign SDRAM CLK
	assign clk_n = clk_sdram; 
	
	//PLL instances
	
	my_pll pll_inst(
		.areset	(1'b0),
		.inclk0	(CLOCK_50),
		.c0		(sys_clk),
		.c1		(clk_125),
		.c2		(clk_25),
		.c3		(clk_2p5),
		.locked (core_reset_n)
	); 
	
	pll_clock_PHY1 pll_inst1(
		.areset	(1'b0),
		.inclk0	(CLOCK_50),
		.c0      (clk_sdram),
		.c1		(clk1_125),
		.c2		(clk1_25),
		.c3		(clk1_2p5)
	); 
	
	// Transmission Clock in FPGA (TSE IP core)
	//assign tx_clk1 = 5;
	assign tx_clk = eth_mode  ? clk_125 : ena_10 ? clk_2p5 : clk_25 ;       		// GbE Mode   = 125MHz clock
																//               ena_10?  :      // 10Mb Mode  = 2.5MHz clock
															//                        ;         // 100Mb Mode = 25 MHz clock
	                          
	// Clock for transmission in PHY chip
	//assign gtx_clk1 = ;
	assign ENET_GTX_CLK= eth_mode ? clk1_125 : ena_10 ? clk1_2p5 : clk1_25;       // GbE Mode   = 125MHz clock
																			//      ena_10?  :      // 10Mb Mode  = 2.5MHz clock
																		//               ;         // 100Mb Mode = 25 MHz clock

	// Nios II system instance
	
    nios_system system_inst (
   .clk_clk                                (sys_clk),                     			// system clock (input)
   .led_export                             (S1_LED),										// led (output)
	.new_sdram_controller_0_wire_addr       (addr),                               // new_sdram_controller_0_wire.addr
   .new_sdram_controller_0_wire_ba         (ba),                                 // new_sdram_controller_0_wire.ba
   .new_sdram_controller_0_wire_cas_n      (cas_n),                              // new_sdram_controller_0_wire.cas_n
   .new_sdram_controller_0_wire_cke        (),                                   // new_sdram_controller_0_wire.cke
   .new_sdram_controller_0_wire_cs_n       (),                                   // new_sdram_controller_0_wire.cs_n
   .new_sdram_controller_0_wire_dq         (dq),                                 // new_sdram_controller_0_wire.dq
   .new_sdram_controller_0_wire_dqm        (dqm),                                // new_sdram_controller_0_wire.dqm
   .new_sdram_controller_0_wire_ras_n      (ras_n),                              // new_sdram_controller_0_wire.ras_n
   .new_sdram_controller_0_wire_we_n       (we_n),                               // new_sdram_controller_0_wire.we_n
	.reset_reset_n                          (core_reset_n),     						// system reset (input)
   .switch_export                          (KEY),      									// swicht button (input)
   .tse_mac_mdio_connection_mdc            (mdc),             					      // mdc (output)
   .tse_mac_mdio_connection_mdio_in        (mdio_in),           				      // mdio_in (input)
   .tse_mac_mdio_connection_mdio_out       (mdio_out),          				      // mdio_out (output)
   .tse_mac_mdio_connection_mdio_oen       (mdio_oen),     	     				      // mdio_oen (output)
   .tse_mac_rgmii_connection_rgmii_in      (ENET_RX_DATA),     					   // rgmii_in (rx data, input)
   .tse_mac_rgmii_connection_rgmii_out     (ENET_TX_DATA),	   				      // gmii_out (tx data, output)
   .tse_mac_rgmii_connection_rx_control    (ENET_RX_DV),      					      // rx_control (receive data valid, input)
   .tse_mac_rgmii_connection_tx_control    (ENET_TX_EN),      					      // tx_control (tx enable, output)
	.tse_mac_status_connection_set_10       (),                                   // tse_mac_status_connection.set_10
	.tse_mac_status_connection_set_1000     (),                                   // set_1000
   .tse_mac_status_connection_eth_mode     (eth_mode),	                        // eth_mode (output)
   .tse_mac_status_connection_ena_10       (ena_10),          	                  // ena_10 (output)
	.tse_pcs_mac_rx_clock_connection_clk 	 (ENET_RX_CLK),		 					   // receive clock (input)
	.tse_pcs_mac_tx_clock_connection_clk 	 (tx_clk) 								      // transmit clock (input)
    );
endmodule 