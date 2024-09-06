library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port (
        a_f, b_f: in std_logic;
        carry_in in std_logic;
        carry_out, sum:  out std_logic
    );
end entity full_adder;

architecture behav_estrutural of full_adder is 
    component half_adder is
        port (
            a, b: in std_logic;
            carry, sum:  out std_logic
        );
    end component;

    signal carry1, carry2, sum_int: std_logic;
begin
   ha1: half_adder
   port map(
        a => a_f,
        b => b_f,
        carry => carry1,
        sum => sum_int
   );

   ha2: half_adder
   port map(
        a => sum_int,
        b => carry_in,
        carry => carry2,
        sum => sum
   );

   carry_out <= carry1 or carry2;
end behav_FLUXO;



--------------------------------------------
--Entity hald-adder
--------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
    port (
        a, b: in std_logic;
        carry, sum:  out std_logic
    );
end entity half_adder;

architecture behav_FLUXO of half_adder is 
begin
   carry <= a and b;
   sum <= a xor b;
end behav_FLUXO;

-- architecture behav_algo of half_adder is 
-- begin
--     process (a, b)
--     begin
--         if (a = '1'and b = '1') then
--             sum <= '0';
--             carry <= '1';
--         elsif (a > b or b > a) then
--             sum <= '1';
--             carry <= '0';
--         else 
--             sum <= '0';
--             carry <= '0';
--         end if;
--     end process;
-- end behav_algo;

