library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity seq_det_fsm_tb is
end seq_det_fsm_tb;


architecture seq_det_fsm_tb_arch of seq_det_fsm_tb is

constant CLK_PERIOD: time :=10 ns;

signal clk,rst,a,b,result_out: std_logic;
begin

seq_detector: entity work.seq_det_fsm(seq_det_fsm_arch) port map ( clk=>clk, rst=>rst,a=>a,b=>b, result_out=>result_out);

clock: process
begin
    clk <= '0' ;
    wait for CLK_PERIOD/2;
    clk <= '1' ;
    wait for CLK_PERIOD/2;
end process;


io_test: process
begin
    rst <= '0';
    a <= '0';
    b <= '0';
    rst <= '1';
    wait until falling_edge(clk);
    rst <= '0';
    a <= '1';
    b <= '0';
    
    wait until falling_edge(clk);

    a <= '1';
    b <= '1';
    
    wait until falling_edge(clk);
    --wait for CLK_PERIOD * 4;

    a <= '0';
    b <= '0';
    
    wait until falling_edge(clk);
    a <= '1';
    b <= '1';
    
    wait until falling_edge(clk);
    a <= '1';
    b <= '1';
    
    wait until falling_edge(clk);
    a <= '1';
    b <= '0';
    
    wait until falling_edge(clk);
    a <= '1';
    b <= '1';
    
    wait until falling_edge(clk);
    a <= '0';
    b <= '0';
    
    wait until falling_edge(clk);
end process;

end;
