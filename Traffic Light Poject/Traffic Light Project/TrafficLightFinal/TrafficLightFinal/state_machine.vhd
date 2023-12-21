library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity state_machine is
	Port ( clock, reset, sensor, long, med, short, hwy_turn, farm_turn, hwy_cross : in std_logic;
		HL1, HL0, FL1, FL0, HT1, HT0, FT1, FT0, HC1, HC0, FC1, FC0, clear : out std_logic );
		
end state_machine;


architecture Behavioral of state_machine is
	type state_type is (hwygreen0, hwygreen1, hwyyellow0, hwyyellow1, hwyred0, hwyred1, farmgreen0, farmgreen1,
		farmyellow0, farmyellow1, farmred0, farmred1, hwyturn0, hwyturn1, hwyturnyellow0, hwyturnyellow1, farmturn0, 
		farmturn1, farmturnyellow0, farmturnyellow1, farmcross0, farmcross1, hwycross0, hwycross1, hwycrossyellow0, hwycrossyellow1);
	attribute enum_encoding: string;
	attribute enum_encoding of state_type: type is "00000000000000000000000001 00000000000000000000000010 00000000000000000000000100 00000000000000000000001000 00000000000000000000010000 00000000000000000000100000 00000000000000000001000000 00000000000000000010000000 00000000000000000100000000 00000000000000001000000000 00000000000000010000000000 00000000000000100000000000 00000000000001000000000000 00000000000010000000000000 00000000000100000000000000 00000000001000000000000000 00000000010000000000000000 00000000100000000000000000 00000001000000000000000000 00000010000000000000000000 00000100000000000000000000 00001000000000000000000000 00010000000000000000000000 00100000000000000000000000 01000000000000000000000000 10000000000000000000000000";


signal CS, NS: state_type;


begin
	process (clock, reset)
	begin
		if (reset='1') then
			CS <= hwygreen0;
		elsif rising_edge(clock) then
			CS <= NS;
		end if;
	end process;
	process (reset, sensor, long, short, med, hwy_turn, farm_turn, hwy_cross, cs)
	begin
		case CS is
		when hwygreen0 =>
			HL1 <= '0'; HL0 <= '0';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '0';
			clear <= '1';
			if (reset='0' and (sensor='1' or hwy_turn='1' or farm_turn='1' or hwy_cross='1') ) then
				NS <= hwygreen1;
			else
				NS <= hwygreen0;
			end if;
			--HL1 <= ''; HL0 <= '';
			--FL1 <= ''; HL0 <= '';
			--HT1 <= ''; HT0 <= '';
			--FT1 <= ''; FT0 <= '';
			--HC1 <= ''; HC0 <= '';
			--FC1 <= ''; FC0 <= '';
		when hwygreen1 =>
			HL1 <= '0'; HL0 <= '0';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '0';
			clear <= '0';
			if (reset='0' and (sensor='1' or hwy_turn='1' or farm_turn='1' or hwy_cross='1') and long='1' ) then
				--clear <= '1'; this may have broken it
				NS <= farmcross0;
			else
				NS <= hwygreen1;
			end if;
			
		when farmcross0 =>
			HL1 <= '0'; HL0 <= '0';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '1'; FC0 <= '0';
			clear<='1';
			if (reset='0') then
				NS <=farmcross1;
			else
				NS <=farmcross0;
			end if;
			
		when farmcross1 =>
			HL1 <= '0'; HL0 <= '0';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '1'; FC0 <= '0';
			clear <= '0';
			if(reset='0' and med='1') then
				NS <= hwyyellow0;
			else
				NS <=farmcross1;
			end if;
			
			
			
			--new state, when middle timer runs out, flash crosswalk 
		when hwyyellow0 =>
			HL1 <= '1'; HL0 <= '0';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1'; 
			clear <= '1';
			if (reset='0' and (sensor='1' or hwy_turn='1' or farm_turn='1' or hwy_cross='1')) then
				NS <= hwyyellow1;
			else
				NS <= hwygreen0;
			end if;
			
		when hwyyellow1 =>
			HL1 <= '1'; HL0 <= '0';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '0';
			if (reset='0' and short='1') then
				NS <= hwyred0;
			else
				NS <= hwyyellow1;
			end if;
			
		when hwyred0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '1';
			if (reset='0') then
				NS <= hwyred1;
			else
				NS <= hwygreen0;
			end if;
			
		when hwyred1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '0';
			if (reset='0' and short='1' and hwy_turn='1') then
				NS <= hwyturn0;
			elsif (reset='0' and short='1' and farm_turn='1') then
				NS <= farmturn0;
			elsif (reset='0' and short='1' and hwy_cross='1') then
				NS <= hwycross0;
			elsif (reset='0' and short='1') then
				NS <= farmgreen0;
			else
				NS <= hwyred1;
			end if;
			
		when hwycross0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '0';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '0';
			FC1 <= '0'; FC0 <= '1';
			clear<='1';
			if(reset='0') then
				NS <= hwycross1;
			else
				NS <= hwycross0;
			end if;
			
		when hwycross1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '0';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '0';
			FC1 <= '0'; FC0 <= '1';
			clear<='0';
			if(reset='0' and med='1') then
				NS <= farmgreen0;
			else
				NS <= hwycross1;
			end if;
		
		when farmturn0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '0';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '1';
			if (reset='0') then
				NS <= farmturn1;
			else
				NS <= farmturn0;
			end if;
			
		when farmturn1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '0';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '0';
			if (reset='0' and ( farm_turn='0' or long='1' ) ) then
				NS <= farmturnyellow0;
			else
				NS <= farmturn1;
			end if;
			
		when farmturnyellow0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '1'; FT0 <= '0';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '1';
			if (reset='0') then
				NS <= farmturnyellow1;
			else
				NS <= farmturnyellow0;
			end if;
			
		when farmturnyellow1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '1'; FT0 <= '0';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '0';
			if (reset='0' and short='1') then
				NS <= hwyred0;
			else
				NS <= farmturnyellow1;
			end if;
		
		
		when hwyturn0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '0';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '1';
			if (reset='0') then
				NS <= hwyturn1;
			else
				NS <= hwyturn0;
			end if;
		
		when hwyturn1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '0';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '0';
			if (reset='0' and ( hwy_turn='0' or long='1' ) ) then
				NS <= hwyturnyellow0;
			else
				NS <= hwyturn1;
			end if;
			
		when hwyturnyellow0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '1'; HT0 <= '0';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '1';
			if (reset='0') then
				NS <= hwyturnyellow1;
			else
				NS <= hwyturnyellow0;
			end if;
			
		when hwyturnyellow1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '1'; HT0 <= '0';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '0';
			if (reset='0' and short='1') then
				NS <= hwyred0;
			else
				NS <= hwyturnyellow1;
			end if;
			
		when farmgreen0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '0';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '0';
			FC1 <= '0'; FC0 <= '1';
			clear <= '1';
			if (reset='0') then
				NS <= farmgreen1;
			else
				NS <= hwygreen0;
			end if;
			
		when farmgreen1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '0';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '0';
			FC1 <= '0'; FC0 <= '1';
			clear <= '0';
			if (reset='0' and ( sensor='0' or long='1' ) ) then
				clear <='1';
				NS <= hwycrossyellow0;
			else
				NS <= farmgreen1;
			end if;
			
		when hwycrossyellow0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '0';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '1'; HC0 <= '0';
			FC1 <= '0'; FC0 <= '1';
			clear<='1';
			if(reset='0') then
				NS <= hwycrossyellow1;
			else 
				NS <= hwycrossyellow0;
			end if;
			
		when hwycrossyellow1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '0';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '1'; HC0 <= '0';
			FC1 <= '0'; FC0 <= '1';
			clear<='0';
			if(reset='0' and med='1') then
				NS <= farmyellow0;
			else
				NS <=hwycrossyellow1;
			end if;
			
		when farmyellow0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '1'; FL0 <= '0';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '1';
			if (reset='0') then
				NS <= farmyellow1;
			else
				NS <= hwygreen0;
			end if;
			
		when farmyellow1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '1'; FL0 <= '0';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '0';
			if (reset='0' and short='1') then
				NS <= farmred0;
			else
				NS <= farmyellow1;
			end if;
			
		when farmred0 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '1'; FL0 <= '0';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '1';
			if (reset='0') then
				NS <= farmred1;
			else
				NS <= hwygreen0;
			end if;

		when farmred1 =>
			HL1 <= '0'; HL0 <= '1';
			FL1 <= '0'; FL0 <= '1';
			HT1 <= '0'; HT0 <= '1';
			FT1 <= '0'; FT0 <= '1';
			HC1 <= '0'; HC0 <= '1';
			FC1 <= '0'; FC0 <= '1';
			clear <= '0';
			if (reset='0' and short='1') then
				NS <= hwygreen0;
			else
				NS <= farmred1;
			end if; 
			
		end case;
	end process;
end Behavioral;
