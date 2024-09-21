---------------------------------------------------------------------
--======================== three bits adder =========================
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity three_bits_adder is 
    port (
        a_t, b_t, c_t: in std_logic_vector(1 downto 0);
        carry_in_three: in std_logic;
        z_zero, z_one, z_two: out std_logic;
        carry_out_three: out std_logic
    );
end entity three_bits_adder;

architecture three_bits_adder_behav of three_bits_adder is 

    component full_adder is 
        port (
            a_f, b_f: in std_logic;
            carry_in: in std_logic;
            carry_out, sum: out std_logic
        );
    end component;

    signal carry_out_one, carry_out_two: std_logic;

begin
    fa1: full_adder 
     port map(
        a_f => a_t(0),
        b_f => a_t(1),
        carry_in => carry_in_three,
        carry_out => carry_out_one,
        sum => z_zero
     );

     fa2: full_adder 
     port map(
        a_f => b_t(0),
        b_f => b_t(1),
        carry_in => carry_out_one,
        carry_out => carry_out_two,
        sum => z_one
     );

     fa3: full_adder 
     port map(
        a_f => c_t(0),
        b_f => c_t(1),
        carry_in => carry_out_two,
        carry_out => carry_out_three,
        sum => z_two
     );

end three_bits_adder_behav;


---------------------------------------------------------------------
--======================== full adder ===============================
---------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is 
    port (
        a_f, b_f: in std_logic;
        carry_in: in std_logic;
        carry_out, sum: out std_logic
    );
end entity full_adder;

architecture behav_full_adder of full_adder is
    component half_adder is 
        port (
            a, b: in std_logic;
            carry, sum: out std_logic
        );
    end component;

    signal carry_one, carry_two, sum_one: std_logic;

begin

    ha1: half_adder
     port map(
        a => a_f,
        b => b_f,
        carry => carry_one,
        sum =>  sum_one
     );

     ha2: half_adder
      port map(
        a => sum_one,
        b => carry_in,
        carry => carry_two,
        sum => sum
      );
    
    carry_out <= carry_one or carry_two;

end behav_full_adder;

---------------------------------------------------------------------
--======================== half adder ===============================
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity half_adder is 
    port (
        a, b: in std_logic;
        carry, sum: out std_logic
    );
end entity half_adder;

architecture behav_half_adder of half_adder is 
begin
    carry <= a and b;
    sum <= a xor b;

end behav_half_adder;
---------------------------------------------------------------------