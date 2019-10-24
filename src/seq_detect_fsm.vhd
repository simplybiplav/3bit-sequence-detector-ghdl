library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seq_det_fsm is
    port (
            clk: in std_logic;
            a,b: in std_logic;
            rst: in std_logic;
            result_out: out std_logic
        );

end seq_det_fsm;


architecture seq_det_fsm_arch of seq_det_fsm is

signal fout_a,fout_b: std_logic;
signal comp_result: std_logic;

type seq_state_type is ( match0, match1, match2, match3);
signal state_reg, state_next: seq_state_type;

begin

a_register: entity work.dff(dff_arch) port map( rst =>rst, clk=>clk, d=>a, q=>fout_a);
b_register: entity work.dff(dff_arch) port map( rst =>rst, clk=>clk, d=>b, q=>fout_b);
comparator: entity work.one_bit_comp(one_bit_comp_arch) port map(i0 =>fout_a , i1=> fout_b , comp_out =>comp_result);

-- state register section


process (rst,clk)
begin
    if (rst = '1') then
        state_reg <= match0;
    elsif ( rising_edge(clk) ) then
        state_reg <= state_next;
    end if;

end process;

--- end state register section

--- fsm next state section

process (state_reg,comp_result)
begin
    case state_reg is 
        when match0 =>

            if( comp_result = '1' ) then
                state_next <= match1;
            else
                state_next <= match0;
            end if;

        when match1 =>

            if( comp_result = '1' ) then
                state_next <= match2;
            else
                state_next <=match0;
            end if;

        when match2 =>

            if( comp_result = '1' ) then
                state_next <=match3;
            else
                state_next <=match0;
            end if;

        when match3 =>

            if( comp_result = '1' ) then
                state_next <=match3;
            else
                state_next <=match0;
            end if;

    end case;



end process;


--- end fsm next state section



--- output section

result_out <= '1' when (state_reg = match3) else
             '0';

--- output section
end seq_det_fsm_arch; 
