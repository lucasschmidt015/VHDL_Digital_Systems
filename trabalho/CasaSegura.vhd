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
    process(sw)
    begin 
        if (sw(2) == '1') then 
            if (sw(0) == '1' OR sw(1) == '1') then 
                ledr <= "000000001";
            else
                ledr <= "000000000";
            end if;
        else
            ledr <= "000000000";
        end if;        
    end process
end behav_FLUXO;