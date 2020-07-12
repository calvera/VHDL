-- GENERATED BY http://vhdl.cz/vhdl/vga/
-- © 2015 Martin Maly

-- 800x600, 72Hz
-- Pixel clock from PLL: 50MHz

-- Main frequency: 50MHz
-- PLL multiplier: 1, divider: 1
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sync is
port (
clk: in std_logic;
posx:out integer range 0 to 799;
posy:out integer range 0 to 599;
hsync,vsync: out std_logic;
blank: out std_logic
);
end sync;

architecture main of sync is
signal hpos: integer range 0 to 1057:=0;
signal vpos: integer range 0 to 666:=0;
signal x: integer range 0 to 799:=0;
signal y: integer range 0 to 599:=0;
begin
    process(clk) is begin
      if rising_edge(clk) then
        if (hpos<1040) then hpos<=hpos+1; x<=x+1;
        else
           hpos<=0;
           x<=0;
           if (vpos<666) then vpos<=vpos+1; y<=y+1;
           else vpos<=0;y<=0;
           end if; --vpos
        end if; --hpos
        if (hpos>=56 and hpos<176) then
           hsync<='1';
        else
           hsync<='0';
        end if;
        if (vpos>=37 and vpos<43) then
           vsync<='1';
        else
           vsync<='0';
        end if;
        if ((vpos>=0 and vpos<66)) then y<=0; end if;
        if ((hpos>=0 and hpos<240) or (vpos>=0 and vpos<66)) then
           blank<='1';
           x<=0;
        else
           blank<='0';
        end if;
	posx<=x;
	posy<=y;
	end if; --clk
    end process;
end main; --architecture    
