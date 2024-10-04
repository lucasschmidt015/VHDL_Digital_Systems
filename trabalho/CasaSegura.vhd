-- library ieee;
-- use ieee.std_logic_1164.all;

-- entity casa_segura_alarme is
--     port (
--         sensor_janela, sensor_porta: in std_logic; --sw
--         seguro_mode: in std_logic;  --sw
--         clock: in std_logic;  --bt
--         painel_usuario: out std_logic   --     
--     );
-- end entity casa_segura_alarme;


library ieee;
use ieee.std_logic_1164.all;

entity casa_segura_alarme is
    port (
        -- 0 => porta
        -- 1 => Janela
        -- 2 => modo seguro
        sw: in std_logic_vector(9 downto 0);
        ledr: out std_logic_vector(9 downto 0)
    );
end entity casa_segura_alarme;

architecture behav_FLUXO of casa_segura_alarme is
    begin
        process(sw)
        begin 
            if (sw(2) = '1') then 
                if (sw(0) = '1' OR sw(1) = '1') then 
                    ledr <= "0000000001";
                else
                    ledr <= "0000000000";
                end if;
            else
                ledr <= "0000000000";
            end if;        
        end process;
end behav_FLUXO;


---------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity casa_segura_caixa_agua is
    port (
        -- 8 - 9 => entrada de A
        -- 7 => Entrada B
        --ledr9 - valvula 
        --ledr8 - bomba
        sw: in std_logic_vector(9 downto 0);
        ledr: out std_logic_vector(9 downto 0)
    );
end entity casa_segura_caixa_agua;

architecture behav_FLUXO2 of casa_segura_caixa_agua is
    begin
        process(sw)
        begin 
            if ((sw(9) = '0' and sw(8) = '0') or  (sw(9) = '0' and sw(8) = '1')) then 
                if (sw(7) = '0') then 
                    ledr <= "1100000000";    
                else 
                    ledr <= "1000000000";
                end if;
            else 
                if (sw(7) = '0') then                     
                    ledr <= "0100000000";
                else 
                    ledr <= "0000000000";                  
                end if;
            end if;
        end process;
end behav_FLUXO2;
