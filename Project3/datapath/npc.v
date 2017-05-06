module npc(pc, imm, target, npcSel, zero, npc, pcp4);
    input [31:2] pc;
    input [25:0] imm;
    input [31:0] target;
    input [2:0] npcSel; 
    input zero;
    output [31:2] npc;
    output [31:0] pcp4;

    assign pcp4 = {pc, 2'b00};
    assign npc = (zero && npcSel == 3'b001) ? pc + {{14{imm[15]}}, imm[15:0]} :  //beq
                         (npcSel == 3'b010) ? {pc[31:28], imm} :                 //j jal
                         (npcSel == 3'b100) ? target[31:2] :                     //jr
                                              pc + 1;

endmodule
