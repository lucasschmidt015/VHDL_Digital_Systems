library ieee;
use IEEE.std_logic_1164.all;

entity hw is
    port(
        A: in STD_LOGIC;
        B: in STD_LOGIC;
        S: out STD_LOGIC
    );
end hw;

architecture comportamento of hw is
begin
    S <= A and B;
end comportamento;