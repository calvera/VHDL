LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY counter4BCD IS
    PORT (
        data : IN std_logic_vector (3 DOWNTO 0);
        load : IN std_logic;
        clk : IN std_logic;
        reset : IN std_logic;
        q : OUT std_logic_vector (3 DOWNTO 0);
        c : OUT std_logic -- prenos, 1, pokud citac pretekl ze stavu 9 do stavu 0
    );
END ENTITY;

ARCHITECTURE main OF counter4BCD IS
    SIGNAL count : unsigned (3 DOWNTO 0);
BEGIN
    PROCESS (clk, reset) BEGIN
        IF (reset = '1') THEN
            count <= (OTHERS => '0');
            c <= '0';
        ELSIF (rising_edge(clk)) THEN
            IF (load = '1') THEN
                count <= unsigned(data);
                c <= '0';
            ELSE
                IF (count = 9) THEN
                    count <= (OTHERS => '0');
                    c <= '1';
                ELSE
                    count <= count + 1;
                    c <= '0';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    q <= std_logic_vector(count);
END ARCHITECTURE;