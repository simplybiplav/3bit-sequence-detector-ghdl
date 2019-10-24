library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity one_bit_comp is
    port (
            i0: in std_logic;
            i1: in std_logic;
            comp_out: out std_logic
        );

end one_bit_comp;

architecture one_bit_comp_arch of one_bit_comp is

begin

comp_out <= (i0 and i1) or ( (not i0) and (not i1)) ;

end one_bit_comp_arch;
