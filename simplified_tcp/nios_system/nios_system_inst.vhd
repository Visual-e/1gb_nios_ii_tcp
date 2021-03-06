	component nios_system is
		port (
			clk_clk                             : in    std_logic                     := 'X';             -- clk
			led_export                          : out   std_logic_vector(7 downto 0);                     -- export
			new_sdram_controller_0_wire_addr    : out   std_logic_vector(11 downto 0);                    -- addr
			new_sdram_controller_0_wire_ba      : out   std_logic_vector(1 downto 0);                     -- ba
			new_sdram_controller_0_wire_cas_n   : out   std_logic;                                        -- cas_n
			new_sdram_controller_0_wire_cke     : out   std_logic;                                        -- cke
			new_sdram_controller_0_wire_cs_n    : out   std_logic;                                        -- cs_n
			new_sdram_controller_0_wire_dq      : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- dq
			new_sdram_controller_0_wire_dqm     : out   std_logic;                                        -- dqm
			new_sdram_controller_0_wire_ras_n   : out   std_logic;                                        -- ras_n
			new_sdram_controller_0_wire_we_n    : out   std_logic;                                        -- we_n
			reset_reset_n                       : in    std_logic                     := 'X';             -- reset_n
			switch_export                       : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			tse_mac_mdio_connection_mdc         : out   std_logic;                                        -- mdc
			tse_mac_mdio_connection_mdio_in     : in    std_logic                     := 'X';             -- mdio_in
			tse_mac_mdio_connection_mdio_out    : out   std_logic;                                        -- mdio_out
			tse_mac_mdio_connection_mdio_oen    : out   std_logic;                                        -- mdio_oen
			tse_mac_rgmii_connection_rgmii_in   : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- rgmii_in
			tse_mac_rgmii_connection_rgmii_out  : out   std_logic_vector(3 downto 0);                     -- rgmii_out
			tse_mac_rgmii_connection_rx_control : in    std_logic                     := 'X';             -- rx_control
			tse_mac_rgmii_connection_tx_control : out   std_logic;                                        -- tx_control
			tse_mac_status_connection_set_10    : in    std_logic                     := 'X';             -- set_10
			tse_mac_status_connection_set_1000  : in    std_logic                     := 'X';             -- set_1000
			tse_mac_status_connection_eth_mode  : out   std_logic;                                        -- eth_mode
			tse_mac_status_connection_ena_10    : out   std_logic;                                        -- ena_10
			tse_pcs_mac_rx_clock_connection_clk : in    std_logic                     := 'X';             -- clk
			tse_pcs_mac_tx_clock_connection_clk : in    std_logic                     := 'X'              -- clk
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk                             => CONNECTED_TO_clk_clk,                             --                             clk.clk
			led_export                          => CONNECTED_TO_led_export,                          --                             led.export
			new_sdram_controller_0_wire_addr    => CONNECTED_TO_new_sdram_controller_0_wire_addr,    --     new_sdram_controller_0_wire.addr
			new_sdram_controller_0_wire_ba      => CONNECTED_TO_new_sdram_controller_0_wire_ba,      --                                .ba
			new_sdram_controller_0_wire_cas_n   => CONNECTED_TO_new_sdram_controller_0_wire_cas_n,   --                                .cas_n
			new_sdram_controller_0_wire_cke     => CONNECTED_TO_new_sdram_controller_0_wire_cke,     --                                .cke
			new_sdram_controller_0_wire_cs_n    => CONNECTED_TO_new_sdram_controller_0_wire_cs_n,    --                                .cs_n
			new_sdram_controller_0_wire_dq      => CONNECTED_TO_new_sdram_controller_0_wire_dq,      --                                .dq
			new_sdram_controller_0_wire_dqm     => CONNECTED_TO_new_sdram_controller_0_wire_dqm,     --                                .dqm
			new_sdram_controller_0_wire_ras_n   => CONNECTED_TO_new_sdram_controller_0_wire_ras_n,   --                                .ras_n
			new_sdram_controller_0_wire_we_n    => CONNECTED_TO_new_sdram_controller_0_wire_we_n,    --                                .we_n
			reset_reset_n                       => CONNECTED_TO_reset_reset_n,                       --                           reset.reset_n
			switch_export                       => CONNECTED_TO_switch_export,                       --                          switch.export
			tse_mac_mdio_connection_mdc         => CONNECTED_TO_tse_mac_mdio_connection_mdc,         --         tse_mac_mdio_connection.mdc
			tse_mac_mdio_connection_mdio_in     => CONNECTED_TO_tse_mac_mdio_connection_mdio_in,     --                                .mdio_in
			tse_mac_mdio_connection_mdio_out    => CONNECTED_TO_tse_mac_mdio_connection_mdio_out,    --                                .mdio_out
			tse_mac_mdio_connection_mdio_oen    => CONNECTED_TO_tse_mac_mdio_connection_mdio_oen,    --                                .mdio_oen
			tse_mac_rgmii_connection_rgmii_in   => CONNECTED_TO_tse_mac_rgmii_connection_rgmii_in,   --        tse_mac_rgmii_connection.rgmii_in
			tse_mac_rgmii_connection_rgmii_out  => CONNECTED_TO_tse_mac_rgmii_connection_rgmii_out,  --                                .rgmii_out
			tse_mac_rgmii_connection_rx_control => CONNECTED_TO_tse_mac_rgmii_connection_rx_control, --                                .rx_control
			tse_mac_rgmii_connection_tx_control => CONNECTED_TO_tse_mac_rgmii_connection_tx_control, --                                .tx_control
			tse_mac_status_connection_set_10    => CONNECTED_TO_tse_mac_status_connection_set_10,    --       tse_mac_status_connection.set_10
			tse_mac_status_connection_set_1000  => CONNECTED_TO_tse_mac_status_connection_set_1000,  --                                .set_1000
			tse_mac_status_connection_eth_mode  => CONNECTED_TO_tse_mac_status_connection_eth_mode,  --                                .eth_mode
			tse_mac_status_connection_ena_10    => CONNECTED_TO_tse_mac_status_connection_ena_10,    --                                .ena_10
			tse_pcs_mac_rx_clock_connection_clk => CONNECTED_TO_tse_pcs_mac_rx_clock_connection_clk, -- tse_pcs_mac_rx_clock_connection.clk
			tse_pcs_mac_tx_clock_connection_clk => CONNECTED_TO_tse_pcs_mac_tx_clock_connection_clk  -- tse_pcs_mac_tx_clock_connection.clk
		);

