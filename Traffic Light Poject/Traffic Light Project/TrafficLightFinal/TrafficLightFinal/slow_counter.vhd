--slow_clock.vhd begins here--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity slow_clock is
	Port ( clock, clear : in STD_LOGIC;
		speed : out STD_LOGIC_VECTOR (5 downto 0) );

end slow_clock;


architecture Behavioral of slow_clock is
	Signal cnt: STD_LOGIC_VECTOR (30 downto 0);
begin
	process(clock, clear)
		begin
			if clear='1' then cnt(30 downto 25) <= "000000";
			elsif (clock'event and clock='0') then cnt <= cnt + 1;
			end if;
	end process;
	speed <= cnt(30 downto 25);
end Behavioral;