library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity processador16bits is
    Port (
        clk          : in  STD_LOGIC;
        clear        : in  STD_LOGIC;
        en_input     : in  STD_LOGIC;  
        data_out     : out STD_LOGIC_VECTOR(15 downto 0)
    );
end processador16bits;

architecture Behavioral of processador16bits is
    signal pc: STD_LOGIC_VECTOR(3 downto 0);
	 signal instruction : STD_LOGIC_VECTOR(15 downto 0);
    signal opcode                   : STD_LOGIC_VECTOR(3 downto 0);
    signal ra, rb                   : STD_LOGIC_VECTOR(3 downto 0);
    signal rc                       : STD_LOGIC_VECTOR(3 downto 0);
    signal output_vector            : STD_LOGIC_VECTOR(15 downto 0);
    signal Regdst, Regwrite, Regload, en_ALU : STD_LOGIC;
    signal alu_opcode               : STD_LOGIC_VECTOR(2 downto 0);
    signal data_outA, data_outB, alu_result : STD_LOGIC_VECTOR(15 downto 0);
    signal mux1_out                 : STD_LOGIC_VECTOR(3 downto 0); -- 4 bits
    signal mux2_out, mux3_out       : STD_LOGIC_VECTOR(15 downto 0);
begin
    
    PC_INST : entity work.ProgramCounter
        Port map (
            clk   => clk,
            reset => clear,
            pc_out => pc
        );

   
    INSTR_MEM_INST : entity work.InstructionMemory
        Port map (
            clk         => clk,
            address     => pc,
            instruction => instruction
        );


    
    DECODER_INST : entity work.Decoder
        Port map (
            input_vector  => instruction,
            opcode        => opcode,
            ra            => ra,
            rb            => rb,
            rc            => rc,
            output_vector => output_vector
        );

    
    CONTROL_UNIT_INST : entity work.ControlUnit
        Port map (
            Sin      => opcode,
            Regdst   => Regdst,
            Regwrite => Regwrite,
				Regload  => regload,
            en_ALU   => en_ALU,
            opcode   => alu_opcode
        );

    
    REGISTER_BANK_INST : entity work.RegisterBank
        Port map (
            clk       => clk,
            clear     => clear,
            regWrite  => Regwrite,
				regLoad   => Regload,
            ra        => ra,
            rb        => rb,
            rc        => mux1_out,
            data_in   => mux3_out,
            data_outA => data_outA,
            data_outB => data_outB
        );

    
    ALU_INST : entity work.ALU
        Port map (
            A      => data_outA,
            B      => data_outB,
            Op     => alu_opcode,
            Result => alu_result
        );

    
    MUX1_INST : entity work.Mux2to14
        Port map (
            sel => Regdst,
            a   => ra,  
            b   => rc,
            y   => mux1_out
        );

   
    MUX2_INST : entity work.Mux2to1
        Port map (
            sel => en_ALU,
            a   => data_outA,
            b   => alu_result,
            y   => mux2_out
        );

   
    MUX3_INST : entity work.Mux2to1
        Port map (
            sel => en_ALU,
            a   => output_vector,
            b   => mux2_out,
            y   => mux3_out
        );

   
	 data_out <= mux3_out;

end Behavioral;
