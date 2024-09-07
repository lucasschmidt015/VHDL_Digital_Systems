library ieee;
use IEEE.std_logic_1164.all;

entity decoder_2to4en is
    port (
        EN : in std_logic; -- Enable
        A : in std_logic_vector (1 downto 0); -- Decoder Input
        Y_L : out std_logic_vector (3 downto 0) -- Decoder Output (active low)
    );
end entity decoder_2to4en;

architecture decoder_behav of decoder_2to4en is 
begin
    process(EN, A)
    begin
        if (EN = '0') then
            Y_L <= "1111";
        elsif (EN = '1' and A = "00") then
            Y_L <= "1110";
        elsif (EN = '1' and A = "01") then
            Y_L <= "1101";
        elsif (EN = '1' and A = "10") then
            Y_L <= "1011";
        elsif (EN = '1' and A = "11") then
            Y_L <= "0111";
        end if;
    end process;
end decoder_behav;