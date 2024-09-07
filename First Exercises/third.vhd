library ieee;
use IEEE.std_logic_1164.all;

entity bcd7seg is
    port (
        EN : in std_logic; -- Enable
        D : in std_logic_vector (3 downto 0); -- Encoder Input
        S : out std_logic_vector (6 downto 0) -- Encoder Output
    );
end entity bcd7seg;

architecture bcd_behav of bcd7seg is
begin
    process(EN, D)
    begin
        if (EN = '0') then
            S <= "0000000";
        else
            case D is
                when "0000" => S <= "1111110";
                when "0001" => S <= "0110000";
                when "0010" => S <= "1101101";
                when "0011" => S <= "1111001";  
                when "0100" => S <= "0110011";  
                when "0101" => S <= "1011011";  
                when "0110" => S <= "1011111";  
                when "0111" => S <= "1110000";  
                when "1000" => S <= "1111111";  
                when "1001" => S <= "1111011"; 
                when others => S <= "0000000";
            end case;
        end if;
    end process;
end bcd_behav;