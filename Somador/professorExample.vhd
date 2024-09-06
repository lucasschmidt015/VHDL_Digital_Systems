LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
    PORT (
       a_f,b_f: in STD_LOGIC;
       carry_in: in STD_LOGIC;
       carry_out, sum: out STD_LOGIC
    );
END ENTITY full_adder;

ARCHITECTURE behav_estrutural OF full_adder IS
    component half_adder IS
    PORT (
        a,b: in STD_LOGIC;
        carry, sum: out STD_LOGIC
    );
    END component;

    signal carry1, carry2, sum_int: STD_LOGIC;

BEGIN
   
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

   carry_out <= carry1 OR carry2;

END behav_estrutural;

----------------------------------------
--ENTITY half_adder
-----------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY half_adder IS
    PORT (
       a,b: in STD_LOGIC;
       carry, sum: out STD_LOGIC
    );
END ENTITY half_adder;

ARCHITECTURE behav_FLUXO OF half_adder IS
BEGIN
   carry <= a AND b;
   sum <= a XOR b;
END behav_FLUXO;



-- ARCHITECTURE behav_algo OF half_adder IS
-- BEGIN
--     process (a,b)
--     begin
--         if ( a = '1' and b = '1') then 
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
-- END behav_algo;


