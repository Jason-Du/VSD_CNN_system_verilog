//`include "../SRAMcompiler/word72/word72.v"
`include "SRAMcompiler/word72/word72.v"
module word72_wrapper (
  input CK,
  input OEA,
  input OEB,
  input [7:0] WEAN,
  input [7:0] WEBN,
  input [6:0] A,
  input [6:0] B,
  output [127:0] DOA,
  output [127:0] DOB,
  input [127:0] DIA,
  input [127:0] DIB
);
/*---------------------All Parameters---------------------*/	
// For SRAM port                                    
logic CSA = 1'b1;                                     
logic CSB = 1'b1; 
logic [6:0]_A, _B;
/*---------------------All Parameters---------------------*/	
always_comb begin
  _A = A;
  _B = B;
  if(A==B) begin
    if(OEB==1'b1) begin
        _A = {A[6:1],!A[0]};
        _B = B;
      end
    else if(WEAN!=1'b1)begin
        _A = A;
        _B = {B[6:1],!B[0]};
    end
  end 
end
/*---------------------Connection---------------------*/
word72 i_word72_sram(
// A
.A0 (_A[0] ),
.A1 (_A[1] ),
.A2 (_A[2] ),
.A3 (_A[3] ),
.A4 (_A[4] ),
.A5 (_A[5] ),
.A6 (_A[6] ),

// B
.B0 (_B[0] ),
.B1 (_B[1] ),
.B2 (_B[2] ),
.B3 (_B[3] ),
.B4 (_B[4] ),
.B5 (_B[5] ),
.B6 (_B[6] ),

// DOA
.DOA0  (DOA[0] ),
.DOA1  (DOA[1] ),
.DOA2  (DOA[2] ),
.DOA3  (DOA[3] ),
.DOA4  (DOA[4] ),
.DOA5  (DOA[5] ),
.DOA6  (DOA[6] ),
.DOA7  (DOA[7] ),
.DOA8  (DOA[8] ),
.DOA9  (DOA[9] ),
.DOA10 (DOA[10]),
.DOA11 (DOA[11]),
.DOA12 (DOA[12]),
.DOA13 (DOA[13]),
.DOA14 (DOA[14]),
.DOA15 (DOA[15]),
.DOA16 (DOA[16]),
.DOA17 (DOA[17]),
.DOA18 (DOA[18]),
.DOA19 (DOA[19]),
.DOA20 (DOA[20]),
.DOA21 (DOA[21]),
.DOA22 (DOA[22]),
.DOA23 (DOA[23]),
.DOA24 (DOA[24]),
.DOA25 (DOA[25]),
.DOA26 (DOA[26]),
.DOA27 (DOA[27]),
.DOA28 (DOA[28]),
.DOA29 (DOA[29]),
.DOA30 (DOA[30]),
.DOA31 (DOA[31]),
.DOA32 (DOA[32]),
.DOA33 (DOA[33]),
.DOA34 (DOA[34]),
.DOA35 (DOA[35]),
.DOA36 (DOA[36]),
.DOA37 (DOA[37]),
.DOA38 (DOA[38]),
.DOA39 (DOA[39]),
.DOA40 (DOA[40]),
.DOA41 (DOA[41]),
.DOA42 (DOA[42]),
.DOA43 (DOA[43]),
.DOA44 (DOA[44]),
.DOA45 (DOA[45]),
.DOA46 (DOA[46]),
.DOA47 (DOA[47]),
.DOA48 (DOA[48]),
.DOA49 (DOA[49]),
.DOA50 (DOA[50]),
.DOA51 (DOA[51]),
.DOA52 (DOA[52]),
.DOA53 (DOA[53]),
.DOA54 (DOA[54]),
.DOA55 (DOA[55]),
.DOA56 (DOA[56]),
.DOA57 (DOA[57]),
.DOA58 (DOA[58]),
.DOA59 (DOA[59]),
.DOA60 (DOA[60]),
.DOA61 (DOA[61]),
.DOA62 (DOA[62]),
.DOA63 (DOA[63]),
.DOA64 (DOA[64]),
.DOA65 (DOA[65]),
.DOA66 (DOA[66]),
.DOA67 (DOA[67]),
.DOA68 (DOA[68]),
.DOA69 (DOA[69]),
.DOA70 (DOA[70]),
.DOA71 (DOA[71]),
.DOA72 (DOA[72]),
.DOA73 (DOA[73]),
.DOA74 (DOA[74]),
.DOA75 (DOA[75]),
.DOA76 (DOA[76]),
.DOA77 (DOA[77]),
.DOA78 (DOA[78]),
.DOA79 (DOA[79]),
.DOA80 (DOA[80]),
.DOA81 (DOA[81]),
.DOA82 (DOA[82]),
.DOA83 (DOA[83]),
.DOA84 (DOA[84]),
.DOA85 (DOA[85]),
.DOA86 (DOA[86]),
.DOA87 (DOA[87]),
.DOA88 (DOA[88]),
.DOA89 (DOA[89]),
.DOA90 (DOA[90]),
.DOA91 (DOA[91]),
.DOA92 (DOA[92]),
.DOA93 (DOA[93]),
.DOA94 (DOA[94]),
.DOA95 (DOA[95]),
.DOA96 (DOA[96]),
.DOA97 (DOA[97]),
.DOA98 (DOA[98]),
.DOA99 (DOA[99]),
.DOA100 (DOA[100]),
.DOA101 (DOA[101]),
.DOA102 (DOA[102]),
.DOA103 (DOA[103]),
.DOA104 (DOA[104]),
.DOA105 (DOA[105]),
.DOA106 (DOA[106]),
.DOA107 (DOA[107]),
.DOA108 (DOA[108]),
.DOA109 (DOA[109]),
.DOA110 (DOA[110]),
.DOA111 (DOA[111]),
.DOA112 (DOA[112]),
.DOA113 (DOA[113]),
.DOA114 (DOA[114]),
.DOA115 (DOA[115]),
.DOA116 (DOA[116]),
.DOA117 (DOA[117]),
.DOA118 (DOA[118]),
.DOA119 (DOA[119]),
.DOA120 (DOA[120]),
.DOA121 (DOA[121]),
.DOA122 (DOA[122]),
.DOA123 (DOA[123]),
.DOA124 (DOA[124]),
.DOA125 (DOA[125]),
.DOA126 (DOA[126]),
.DOA127 (DOA[127]),

// DOB
.DOB0  (DOB[0] ),
.DOB1  (DOB[1] ),
.DOB2  (DOB[2] ),
.DOB3  (DOB[3] ),
.DOB4  (DOB[4] ),
.DOB5  (DOB[5] ),
.DOB6  (DOB[6] ),
.DOB7  (DOB[7] ),
.DOB8  (DOB[8] ),
.DOB9  (DOB[9] ),
.DOB10 (DOB[10]),
.DOB11 (DOB[11]),
.DOB12 (DOB[12]),
.DOB13 (DOB[13]),
.DOB14 (DOB[14]),
.DOB15 (DOB[15]),
.DOB16 (DOB[16]),
.DOB17 (DOB[17]),
.DOB18 (DOB[18]),
.DOB19 (DOB[19]),
.DOB20 (DOB[20]),
.DOB21 (DOB[21]),
.DOB22 (DOB[22]),
.DOB23 (DOB[23]),
.DOB24 (DOB[24]),
.DOB25 (DOB[25]),
.DOB26 (DOB[26]),
.DOB27 (DOB[27]),
.DOB28 (DOB[28]),
.DOB29 (DOB[29]),
.DOB30 (DOB[30]),
.DOB31 (DOB[31]),
.DOB32 (DOB[32]),
.DOB33 (DOB[33]),
.DOB34 (DOB[34]),
.DOB35 (DOB[35]),
.DOB36 (DOB[36]),
.DOB37 (DOB[37]),
.DOB38 (DOB[38]),
.DOB39 (DOB[39]),
.DOB40 (DOB[40]),
.DOB41 (DOB[41]),
.DOB42 (DOB[42]),
.DOB43 (DOB[43]),
.DOB44 (DOB[44]),
.DOB45 (DOB[45]),
.DOB46 (DOB[46]),
.DOB47 (DOB[47]),
.DOB48 (DOB[48]),
.DOB49 (DOB[49]),
.DOB50 (DOB[50]),
.DOB51 (DOB[51]),
.DOB52 (DOB[52]),
.DOB53 (DOB[53]),
.DOB54 (DOB[54]),
.DOB55 (DOB[55]),
.DOB56 (DOB[56]),
.DOB57 (DOB[57]),
.DOB58 (DOB[58]),
.DOB59 (DOB[59]),
.DOB60 (DOB[60]),
.DOB61 (DOB[61]),
.DOB62 (DOB[62]),
.DOB63 (DOB[63]),
.DOB64 (DOB[64]),
.DOB65 (DOB[65]),
.DOB66 (DOB[66]),
.DOB67 (DOB[67]),
.DOB68 (DOB[68]),
.DOB69 (DOB[69]),
.DOB70 (DOB[70]),
.DOB71 (DOB[71]),
.DOB72 (DOB[72]),
.DOB73 (DOB[73]),
.DOB74 (DOB[74]),
.DOB75 (DOB[75]),
.DOB76 (DOB[76]),
.DOB77 (DOB[77]),
.DOB78 (DOB[78]),
.DOB79 (DOB[79]),
.DOB80 (DOB[80]),
.DOB81 (DOB[81]),
.DOB82 (DOB[82]),
.DOB83 (DOB[83]),
.DOB84 (DOB[84]),
.DOB85 (DOB[85]),
.DOB86 (DOB[86]),
.DOB87 (DOB[87]),
.DOB88 (DOB[88]),
.DOB89 (DOB[89]),
.DOB90 (DOB[90]),
.DOB91 (DOB[91]),
.DOB92 (DOB[92]),
.DOB93 (DOB[93]),
.DOB94 (DOB[94]),
.DOB95 (DOB[95]),
.DOB96 (DOB[96]),
.DOB97 (DOB[97]),
.DOB98 (DOB[98]),
.DOB99 (DOB[99]),
.DOB100 (DOB[100]),
.DOB101 (DOB[101]),
.DOB102 (DOB[102]),
.DOB103 (DOB[103]),
.DOB104 (DOB[104]),
.DOB105 (DOB[105]),
.DOB106 (DOB[106]),
.DOB107 (DOB[107]),
.DOB108 (DOB[108]),
.DOB109 (DOB[109]),
.DOB110 (DOB[110]),
.DOB111 (DOB[111]),
.DOB112 (DOB[112]),
.DOB113 (DOB[113]),
.DOB114 (DOB[114]),
.DOB115 (DOB[115]),
.DOB116 (DOB[116]),
.DOB117 (DOB[117]),
.DOB118 (DOB[118]),
.DOB119 (DOB[119]),
.DOB120 (DOB[120]),
.DOB121 (DOB[121]),
.DOB122 (DOB[122]),
.DOB123 (DOB[123]),
.DOB124 (DOB[124]),
.DOB125 (DOB[125]),
.DOB126 (DOB[126]),
.DOB127 (DOB[127]),
// DIA    
.DIA0  (DIA[0] ),
.DIA1  (DIA[1] ),
.DIA2  (DIA[2] ),
.DIA3  (DIA[3] ),
.DIA4  (DIA[4] ),
.DIA5  (DIA[5] ),
.DIA6  (DIA[6] ),
.DIA7  (DIA[7] ),
.DIA8  (DIA[8] ),
.DIA9  (DIA[9] ),
.DIA10 (DIA[10]),
.DIA11 (DIA[11]),
.DIA12 (DIA[12]),
.DIA13 (DIA[13]),
.DIA14 (DIA[14]),
.DIA15 (DIA[15]),
.DIA16 (DIA[16]),
.DIA17 (DIA[17]),
.DIA18 (DIA[18]),
.DIA19 (DIA[19]),
.DIA20 (DIA[20]),
.DIA21 (DIA[21]),
.DIA22 (DIA[22]),
.DIA23 (DIA[23]),
.DIA24 (DIA[24]),
.DIA25 (DIA[25]),
.DIA26 (DIA[26]),
.DIA27 (DIA[27]),
.DIA28 (DIA[28]),
.DIA29 (DIA[29]),
.DIA30 (DIA[30]),
.DIA31 (DIA[31]),
.DIA32 (DIA[32]),
.DIA33 (DIA[33]),
.DIA34 (DIA[34]),
.DIA35 (DIA[35]),
.DIA36 (DIA[36]),
.DIA37 (DIA[37]),
.DIA38 (DIA[38]),
.DIA39 (DIA[39]),
.DIA40 (DIA[40]),
.DIA41 (DIA[41]),
.DIA42 (DIA[42]),
.DIA43 (DIA[43]),
.DIA44 (DIA[44]),
.DIA45 (DIA[45]),
.DIA46 (DIA[46]),
.DIA47 (DIA[47]),
.DIA48 (DIA[48]),
.DIA49 (DIA[49]),
.DIA50 (DIA[50]),
.DIA51 (DIA[51]),
.DIA52 (DIA[52]),
.DIA53 (DIA[53]),
.DIA54 (DIA[54]),
.DIA55 (DIA[55]),
.DIA56 (DIA[56]),
.DIA57 (DIA[57]),
.DIA58 (DIA[58]),
.DIA59 (DIA[59]),
.DIA60 (DIA[60]),
.DIA61 (DIA[61]),
.DIA62 (DIA[62]),
.DIA63 (DIA[63]),
.DIA64 (DIA[64]),
.DIA65 (DIA[65]),
.DIA66 (DIA[66]),
.DIA67 (DIA[67]),
.DIA68 (DIA[68]),
.DIA69 (DIA[69]),
.DIA70 (DIA[70]),
.DIA71 (DIA[71]),
.DIA72 (DIA[72]),
.DIA73 (DIA[73]),
.DIA74 (DIA[74]),
.DIA75 (DIA[75]),
.DIA76 (DIA[76]),
.DIA77 (DIA[77]),
.DIA78 (DIA[78]),
.DIA79 (DIA[79]),
.DIA80 (DIA[80]),
.DIA81 (DIA[81]),
.DIA82 (DIA[82]),
.DIA83 (DIA[83]),
.DIA84 (DIA[84]),
.DIA85 (DIA[85]),
.DIA86 (DIA[86]),
.DIA87 (DIA[87]),
.DIA88 (DIA[88]),
.DIA89 (DIA[89]),
.DIA90 (DIA[90]),
.DIA91 (DIA[91]),
.DIA92 (DIA[92]),
.DIA93 (DIA[93]),
.DIA94 (DIA[94]),
.DIA95 (DIA[95]),
.DIA96 (DIA[96]),
.DIA97 (DIA[97]),
.DIA98 (DIA[98]),
.DIA99 (DIA[99]),
.DIA100 (DIA[100]),
.DIA101 (DIA[101]),
.DIA102 (DIA[102]),
.DIA103 (DIA[103]),
.DIA104 (DIA[104]),
.DIA105 (DIA[105]),
.DIA106 (DIA[106]),
.DIA107 (DIA[107]),
.DIA108 (DIA[108]),
.DIA109 (DIA[109]),
.DIA110 (DIA[110]),
.DIA111 (DIA[111]),
.DIA112 (DIA[112]),
.DIA113 (DIA[113]),
.DIA114 (DIA[114]),
.DIA115 (DIA[115]),
.DIA116 (DIA[116]),
.DIA117 (DIA[117]),
.DIA118 (DIA[118]),
.DIA119 (DIA[119]),
.DIA120 (DIA[120]),
.DIA121 (DIA[121]),
.DIA122 (DIA[122]),
.DIA123 (DIA[123]),
.DIA124 (DIA[124]),
.DIA125 (DIA[125]),
.DIA126 (DIA[126]),
.DIA127 (DIA[127]),
// DIB
.DIB0  (DIB[0] ),
.DIB1  (DIB[1] ),
.DIB2  (DIB[2] ),
.DIB3  (DIB[3] ),
.DIB4  (DIB[4] ),
.DIB5  (DIB[5] ),
.DIB6  (DIB[6] ),
.DIB7  (DIB[7] ),
.DIB8  (DIB[8] ),
.DIB9  (DIB[9] ),
.DIB10 (DIB[10]),
.DIB11 (DIB[11]),
.DIB12 (DIB[12]),
.DIB13 (DIB[13]),
.DIB14 (DIB[14]),
.DIB15 (DIB[15]),
.DIB16 (DIB[16]),
.DIB17 (DIB[17]),
.DIB18 (DIB[18]),
.DIB19 (DIB[19]),
.DIB20 (DIB[20]),
.DIB21 (DIB[21]),
.DIB22 (DIB[22]),
.DIB23 (DIB[23]),
.DIB24 (DIB[24]),
.DIB25 (DIB[25]),
.DIB26 (DIB[26]),
.DIB27 (DIB[27]),
.DIB28 (DIB[28]),
.DIB29 (DIB[29]),
.DIB30 (DIB[30]),
.DIB31 (DIB[31]),
.DIB32 (DIB[32]),
.DIB33 (DIB[33]),
.DIB34 (DIB[34]),
.DIB35 (DIB[35]),
.DIB36 (DIB[36]),
.DIB37 (DIB[37]),
.DIB38 (DIB[38]),
.DIB39 (DIB[39]),
.DIB40 (DIB[40]),
.DIB41 (DIB[41]),
.DIB42 (DIB[42]),
.DIB43 (DIB[43]),
.DIB44 (DIB[44]),
.DIB45 (DIB[45]),
.DIB46 (DIB[46]),
.DIB47 (DIB[47]),
.DIB48 (DIB[48]),
.DIB49 (DIB[49]),
.DIB50 (DIB[50]),
.DIB51 (DIB[51]),
.DIB52 (DIB[52]),
.DIB53 (DIB[53]),
.DIB54 (DIB[54]),
.DIB55 (DIB[55]),
.DIB56 (DIB[56]),
.DIB57 (DIB[57]),
.DIB58 (DIB[58]),
.DIB59 (DIB[59]),
.DIB60 (DIB[60]),
.DIB61 (DIB[61]),
.DIB62 (DIB[62]),
.DIB63 (DIB[63]),
.DIB64 (DIB[64]),
.DIB65 (DIB[65]),
.DIB66 (DIB[66]),
.DIB67 (DIB[67]),
.DIB68 (DIB[68]),
.DIB69 (DIB[69]),
.DIB70 (DIB[70]),
.DIB71 (DIB[71]),
.DIB72 (DIB[72]),
.DIB73 (DIB[73]),
.DIB74 (DIB[74]),
.DIB75 (DIB[75]),
.DIB76 (DIB[76]),
.DIB77 (DIB[77]),
.DIB78 (DIB[78]),
.DIB79 (DIB[79]),
.DIB80 (DIB[80]),
.DIB81 (DIB[81]),
.DIB82 (DIB[82]),
.DIB83 (DIB[83]),
.DIB84 (DIB[84]),
.DIB85 (DIB[85]),
.DIB86 (DIB[86]),
.DIB87 (DIB[87]),
.DIB88 (DIB[88]),
.DIB89 (DIB[89]),
.DIB90 (DIB[90]),
.DIB91 (DIB[91]),
.DIB92 (DIB[92]),
.DIB93 (DIB[93]),
.DIB94 (DIB[94]),
.DIB95 (DIB[95]),
.DIB96 (DIB[96]),
.DIB97 (DIB[97]),
.DIB98 (DIB[98]),
.DIB99 (DIB[99]),
.DIB100 (DIB[100]),
.DIB101 (DIB[101]),
.DIB102 (DIB[102]),
.DIB103 (DIB[103]),
.DIB104 (DIB[104]),
.DIB105 (DIB[105]),
.DIB106 (DIB[106]),
.DIB107 (DIB[107]),
.DIB108 (DIB[108]),
.DIB109 (DIB[109]),
.DIB110 (DIB[110]),
.DIB111 (DIB[111]),
.DIB112 (DIB[112]),
.DIB113 (DIB[113]),
.DIB114 (DIB[114]),
.DIB115 (DIB[115]),
.DIB116 (DIB[116]),
.DIB117 (DIB[117]),
.DIB118 (DIB[118]),
.DIB119 (DIB[119]),
.DIB120 (DIB[120]),
.DIB121 (DIB[121]),
.DIB122 (DIB[122]),
.DIB123 (DIB[123]),
.DIB124 (DIB[124]),
.DIB125 (DIB[125]),
.DIB126 (DIB[126]),
.DIB127 (DIB[127]),
.WEAN0(WEAN[0]),
.WEAN1(WEAN[1]),
.WEAN2(WEAN[2]),
.WEAN3(WEAN[3]),
.WEAN4(WEAN[4]),
.WEAN5(WEAN[5]),
.WEAN6(WEAN[6]),
.WEAN7(WEAN[7]),
.WEBN0(WEBN[0]),
.WEBN1(WEBN[1]),
.WEBN2(WEBN[2]),
.WEBN3(WEBN[3]),
.WEBN4(WEBN[4]),
.WEBN5(WEBN[5]),
.WEBN6(WEBN[6]),
.WEBN7(WEBN[7]),
.CKA(CK),
.CKB(CK),
.CSA(CSA),
.CSB(CSB),
.OEA(OEA),
.OEB(OEB));

endmodule
