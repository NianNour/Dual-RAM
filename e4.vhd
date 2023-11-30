library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
entity Single_port_RAM_VHDL is
port(
RAM_ADDR: in std_logic_vector(4 downto 0);
RAM_ADDR2: in std_logic_vector(4 downto 0);
RAM_DATA_IN: in std_logic_vector(7 downto 0);
RAM_DATA_IN2: in std_logic_vector(7 downto 0);
RAM_WR: in std_logic; 
RAM_CLOCK: in std_logic;
RAM_DATA_OUT: out std_logic_vector(7 downto 0);
RAM_DATA_OUT2: out std_logic_vector(7 downto 0)
);
end Single_port_RAM_VHDL;
architecture Behavioral of DUAL_port_RAM_VHDL is
type RAM_ARRAY is array (0 to 31) of std_logic_vector (7 downto 0);
signal RAM: RAM_ARRAY :=(
 x"55",x"66",x"77",x"67", 
 x"99",x"00",x"00",x"11", 
 x"00",x"00",x"00",x"00",
 x"00",x"00",x"00",x"00",
 x"00",x"00",x"00",x"00",
 x"00",x"00",x"00",x"00",
 x"00",x"00",x"00",x"00",
 x"00",x"00",x"00",x"00");
begin
process(RAM_CLOCK)
begin
if(rising_edge(RAM_CLOCK)) then
if(RAM_WR='1') then 
 RAM(to_integer(unsigned(RAM_ADDR))) <= RAM_DATA_IN;
 RAM(to_integer(unsigned(RAM_ADDR2))) <= RAM_DATA_IN2;
end if;
end if;
end process;
process(RAM_CLOCK)
begin
if(rising_edge(RAM_CLOCK)) then
if(RAM_WR='0') then 
 RAM_DATA_OUT <= RAM(to_integer(unsigned(RAM_ADDR)));
 RAM_DATA_OUT2 <= RAM(to_integer(unsigned(RAM_ADDR2)));
end if;
end if;
end process;
end Behavioral;
