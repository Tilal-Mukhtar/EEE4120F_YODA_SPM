-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue May 21 15:05:16 2024
-- Host        : DESKTOP-MNABL7I running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/tmukh/Documents/EEE4120F/SPM/SPM.gen/sources_1/ip/div_gen_0/div_gen_0_stub.vhdl
-- Design      : div_gen_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity div_gen_0 is
  Port ( 
    aclk : in STD_LOGIC;
    s_axis_divisor_tvalid : in STD_LOGIC;
    s_axis_divisor_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_dividend_tvalid : in STD_LOGIC;
    s_axis_dividend_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_dout_tvalid : out STD_LOGIC;
    m_axis_dout_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end div_gen_0;

architecture stub of div_gen_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,s_axis_divisor_tvalid,s_axis_divisor_tdata[31:0],s_axis_dividend_tvalid,s_axis_dividend_tdata[31:0],m_axis_dout_tvalid,m_axis_dout_tdata[63:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "div_gen_v5_1_20,Vivado 2023.2";
begin
end;