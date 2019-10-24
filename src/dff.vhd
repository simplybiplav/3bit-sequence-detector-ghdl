library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff is
    port (
            rst: in std_logic;
            clk: in std_logic;
            d: in std_logic;
            q: out std_logic
        );

end dff;

architecture dff_arch of dff is


begin

process (rst,clk)
begin
    if (rst = '1') then
        q <= '0';
    elsif ( rising_edge(clk) ) then
        q <= d;
    end if;

end process;

end dff_arch;
