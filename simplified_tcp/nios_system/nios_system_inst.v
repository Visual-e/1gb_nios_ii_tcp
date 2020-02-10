	nios_system u0 (
		.clk_clk                             (<connected-to-clk_clk>),                             //                             clk.clk
		.led_export                          (<connected-to-led_export>),                          //                             led.export
		.new_sdram_controller_0_wire_addr    (<connected-to-new_sdram_controller_0_wire_addr>),    //     new_sdram_controller_0_wire.addr
		.new_sdram_controller_0_wire_ba      (<connected-to-new_sdram_controller_0_wire_ba>),      //                                .ba
		.new_sdram_controller_0_wire_cas_n   (<connected-to-new_sdram_controller_0_wire_cas_n>),   //                                .cas_n
		.new_sdram_controller_0_wire_cke     (<connected-to-new_sdram_controller_0_wire_cke>),     //                                .cke
		.new_sdram_controller_0_wire_cs_n    (<connected-to-new_sdram_controller_0_wire_cs_n>),    //                                .cs_n
		.new_sdram_controller_0_wire_dq      (<connected-to-new_sdram_controller_0_wire_dq>),      //                                .dq
		.new_sdram_controller_0_wire_dqm     (<connected-to-new_sdram_controller_0_wire_dqm>),     //                                .dqm
		.new_sdram_controller_0_wire_ras_n   (<connected-to-new_sdram_controller_0_wire_ras_n>),   //                                .ras_n
		.new_sdram_controller_0_wire_we_n    (<connected-to-new_sdram_controller_0_wire_we_n>),    //                                .we_n
		.reset_reset_n                       (<connected-to-reset_reset_n>),                       //                           reset.reset_n
		.switch_export                       (<connected-to-switch_export>),                       //                          switch.export
		.tse_mac_mdio_connection_mdc         (<connected-to-tse_mac_mdio_connection_mdc>),         //         tse_mac_mdio_connection.mdc
		.tse_mac_mdio_connection_mdio_in     (<connected-to-tse_mac_mdio_connection_mdio_in>),     //                                .mdio_in
		.tse_mac_mdio_connection_mdio_out    (<connected-to-tse_mac_mdio_connection_mdio_out>),    //                                .mdio_out
		.tse_mac_mdio_connection_mdio_oen    (<connected-to-tse_mac_mdio_connection_mdio_oen>),    //                                .mdio_oen
		.tse_mac_rgmii_connection_rgmii_in   (<connected-to-tse_mac_rgmii_connection_rgmii_in>),   //        tse_mac_rgmii_connection.rgmii_in
		.tse_mac_rgmii_connection_rgmii_out  (<connected-to-tse_mac_rgmii_connection_rgmii_out>),  //                                .rgmii_out
		.tse_mac_rgmii_connection_rx_control (<connected-to-tse_mac_rgmii_connection_rx_control>), //                                .rx_control
		.tse_mac_rgmii_connection_tx_control (<connected-to-tse_mac_rgmii_connection_tx_control>), //                                .tx_control
		.tse_mac_status_connection_set_10    (<connected-to-tse_mac_status_connection_set_10>),    //       tse_mac_status_connection.set_10
		.tse_mac_status_connection_set_1000  (<connected-to-tse_mac_status_connection_set_1000>),  //                                .set_1000
		.tse_mac_status_connection_eth_mode  (<connected-to-tse_mac_status_connection_eth_mode>),  //                                .eth_mode
		.tse_mac_status_connection_ena_10    (<connected-to-tse_mac_status_connection_ena_10>),    //                                .ena_10
		.tse_pcs_mac_rx_clock_connection_clk (<connected-to-tse_pcs_mac_rx_clock_connection_clk>), // tse_pcs_mac_rx_clock_connection.clk
		.tse_pcs_mac_tx_clock_connection_clk (<connected-to-tse_pcs_mac_tx_clock_connection_clk>)  // tse_pcs_mac_tx_clock_connection.clk
	);

