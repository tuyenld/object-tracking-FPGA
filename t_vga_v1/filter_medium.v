
// Recommend:   Open with Sublime Text
//Note: Can Lost data
// Minh chu y khong dung for, while...(loop) trong file thiet ke
/*
*   Window Memory: 4 x 3
*   Window Filter: 3 x 3  ==> 2 pixel / scan (16bitDRAM/scan)
*
*     Skip 2 cols at boundary left 
*     Skip 2 rows at boundary top and 1 row at bottom
*
*   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
*	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
*   x 	x  2   	3  	4                                                   
*   x 	x  7   	8  	9                                                   
*   x 	x  12  	13 	14                                                            
*   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
*/
module filter_medium
  (
  input 	wire  			clk,    				// xung clk
  input 	wire 			rst_n,    				// reset
  input 	wire 	[7:0] 	data_in ,				// du lieu vao 8 bit
													// 0 	-> 0
													// 255 	-> 1
  
  input		wire			start_input,			// bat dau chay median
													// 0: ko co du lieu vao
													// 1: co du lieu vao
													
  
  output 	reg 			start_out,				// bat dau du lieu ra
													// 0: chua co du lieu ra
													// 1: co du lieu ra
													
  output 	reg 	[7:0]	 data_out				// du lieu ra  
  );
  
			reg 	[1282:0] 	arr_filter ;		// 3 thanh ghi dich kich thuoc 3* so cot, kich thuoc 1 o 1 bit
													// 640*2 + 3 = 1283
													// su dung o cho median
													// 0		1		2
													// 640		641		642
													// 1280		1281	1282
			
			reg				data_or_none;			// tin hieu hi sinh du lieu
													// = 0 -> hi sinh
													// = 1 -> du lieu chay dung
													
			reg		[19:0]	count;					//dem 
													// chay tu 0 -> 640*480	
													// 20 bit
													
			reg 	[9:0]	count_cols;				//dem vi tri cot
													// chay tu 0 -> 639
													// 10 bit
													
			reg		[9:0]	count_rows;				//dem v tri hang
													// chay tu 0 -> 479	
													// 10 bit
			
													
			
/////////////////////////////////////////// dem cot va hang ////////////////////////////////////////			
always @(posedge clk )
	begin
	if(start_input == 0)
		begin
			count 		= 0;						//ko dem con chay cot khi chua co data
			count_cols  = 0;
			count_rows	= 0;
		end
	else 
		begin
			count		<= count + 1;				// co tin hieu vao thi bat dau dem	
			count_cols 	<= count % 640;
			count_rows 	<= count / 640;
		end
	end
/////////////////////////////////////////// ket thuc dem cot va hang ///////////////////////////////////////

/////////////////////////////////////////// xuat tin hieu out du lieu va hi sinh ///////////////////////////
always @(posedge clk)
	begin
	if(count_rows == 0)//////////////////// chua xuat du lieu //////////////////////////////////////////////
		begin
			start_out 		= 0;
			//start_input		= 0;
			data_or_none 	= 0;
		end
	else 
	if(count_rows== 1)//////////////////// hi sinh hang 1 /////////////////////////////////////////////////
		begin
			start_out 		= 1;
			//start_input		= 1;
			data_or_none 	= 0;
		end
	else
	if(count_rows== 2)//////////////////// hi sinh hang 2 /////////////////////////////////////////////////
		begin
			start_out 		= 1;
			//start_input		= 1;
			data_or_none 	= 0;
		end
	else
	if(count_rows== 640)////////////////// hi sinh hang 640////////////////////////////////////////////////
		begin
			start_out 		= 1;
			//start_input		= 1;
			data_or_none 	= 0;
		end
	else
	if(count_cols == 0)	/////////////////// hi sinh cot 1 //////////////////////////////////////////////////
		begin
			start_out		= 1;
			//start_input		= 1;
			data_or_none	= 0;
		end
	else
	if(count_cols == 1)//////////////////// hi sinh cot 2 //////////////////////////////////////////////////
		begin
			start_out		= 1;
			//start_input		= 1;
			data_or_none 	= 0;
		end
	else
		begin
			start_out		= 1;
			//start_input		= 1;
			data_or_none	= 1;
		end
	end	
/////////////////////////////////////////// ket thuc xuat tin hieu out//////////////////////////////		

	
/////////////////////////////////////////// thanh ghi dich nap du lieu ///////////////////////////// 
// neu ko dc dung for vs while thi viet het ra cung dc ?////////////////////////////////////////////

// toi uu //
reg nor_signal;
always @(posedge clk)
	begin	
		nor_signal = ~(rst_n | start_input);
	end
always @(posedge clk)
	
		begin 
			arr_filter[1282] <= arr_filter[1281];
			arr_filter[1281] <= arr_filter[1280];
			arr_filter[1280] <= arr_filter[1279];
			arr_filter[1279] <= arr_filter[1278];
			arr_filter[1278] <= arr_filter[1277];
			arr_filter[1277] <= arr_filter[1276];
			arr_filter[1276] <= arr_filter[1275];
			arr_filter[1275] <= arr_filter[1274];
			arr_filter[1274] <= arr_filter[1273];
			arr_filter[1273] <= arr_filter[1272];
			arr_filter[1272] <= arr_filter[1271];
			arr_filter[1271] <= arr_filter[1270];
			arr_filter[1270] <= arr_filter[1269];
			arr_filter[1269] <= arr_filter[1268];
			arr_filter[1268] <= arr_filter[1267];
			arr_filter[1267] <= arr_filter[1266];
			arr_filter[1266] <= arr_filter[1265];
			arr_filter[1265] <= arr_filter[1264];
			arr_filter[1264] <= arr_filter[1263];
			arr_filter[1263] <= arr_filter[1262];
			arr_filter[1262] <= arr_filter[1261];
			arr_filter[1261] <= arr_filter[1260];
			arr_filter[1260] <= arr_filter[1259];
			arr_filter[1259] <= arr_filter[1258];
			arr_filter[1258] <= arr_filter[1257];
			arr_filter[1257] <= arr_filter[1256];
			arr_filter[1256] <= arr_filter[1255];
			arr_filter[1255] <= arr_filter[1254];
			arr_filter[1254] <= arr_filter[1253];
			arr_filter[1253] <= arr_filter[1252];
			arr_filter[1252] <= arr_filter[1251];
			arr_filter[1251] <= arr_filter[1250];
			arr_filter[1250] <= arr_filter[1249];
			arr_filter[1249] <= arr_filter[1248];
			arr_filter[1248] <= arr_filter[1247];
			arr_filter[1247] <= arr_filter[1246];
			arr_filter[1246] <= arr_filter[1245];
			arr_filter[1245] <= arr_filter[1244];
			arr_filter[1244] <= arr_filter[1243];
			arr_filter[1243] <= arr_filter[1242];
			arr_filter[1242] <= arr_filter[1241];
			arr_filter[1241] <= arr_filter[1240];
			arr_filter[1240] <= arr_filter[1239];
			arr_filter[1239] <= arr_filter[1238];
			arr_filter[1238] <= arr_filter[1237];
			arr_filter[1237] <= arr_filter[1236];
			arr_filter[1236] <= arr_filter[1235];
			arr_filter[1235] <= arr_filter[1234];
			arr_filter[1234] <= arr_filter[1233];
			arr_filter[1233] <= arr_filter[1232];
			arr_filter[1232] <= arr_filter[1231];
			arr_filter[1231] <= arr_filter[1230];
			arr_filter[1230] <= arr_filter[1229];
			arr_filter[1229] <= arr_filter[1228];
			arr_filter[1228] <= arr_filter[1227];
			arr_filter[1227] <= arr_filter[1226];
			arr_filter[1226] <= arr_filter[1225];
			arr_filter[1225] <= arr_filter[1224];
			arr_filter[1224] <= arr_filter[1223];
			arr_filter[1223] <= arr_filter[1222];
			arr_filter[1222] <= arr_filter[1221];
			arr_filter[1221] <= arr_filter[1220];
			arr_filter[1220] <= arr_filter[1219];
			arr_filter[1219] <= arr_filter[1218];
			arr_filter[1218] <= arr_filter[1217];
			arr_filter[1217] <= arr_filter[1216];
			arr_filter[1216] <= arr_filter[1215];
			arr_filter[1215] <= arr_filter[1214];
			arr_filter[1214] <= arr_filter[1213];
			arr_filter[1213] <= arr_filter[1212];
			arr_filter[1212] <= arr_filter[1211];
			arr_filter[1211] <= arr_filter[1210];
			arr_filter[1210] <= arr_filter[1209];
			arr_filter[1209] <= arr_filter[1208];
			arr_filter[1208] <= arr_filter[1207];
			arr_filter[1207] <= arr_filter[1206];
			arr_filter[1206] <= arr_filter[1205];
			arr_filter[1205] <= arr_filter[1204];
			arr_filter[1204] <= arr_filter[1203];
			arr_filter[1203] <= arr_filter[1202];
			arr_filter[1202] <= arr_filter[1201];
			arr_filter[1201] <= arr_filter[1200];
			arr_filter[1200] <= arr_filter[1199];
			arr_filter[1199] <= arr_filter[1198];
			arr_filter[1198] <= arr_filter[1197];
			arr_filter[1197] <= arr_filter[1196];
			arr_filter[1196] <= arr_filter[1195];
			arr_filter[1195] <= arr_filter[1194];
			arr_filter[1194] <= arr_filter[1193];
			arr_filter[1193] <= arr_filter[1192];
			arr_filter[1192] <= arr_filter[1191];
			arr_filter[1191] <= arr_filter[1190];
			arr_filter[1190] <= arr_filter[1189];
			arr_filter[1189] <= arr_filter[1188];
			arr_filter[1188] <= arr_filter[1187];
			arr_filter[1187] <= arr_filter[1186];
			arr_filter[1186] <= arr_filter[1185];
			arr_filter[1185] <= arr_filter[1184];
			arr_filter[1184] <= arr_filter[1183];
			arr_filter[1183] <= arr_filter[1182];
			arr_filter[1182] <= arr_filter[1181];
			arr_filter[1181] <= arr_filter[1180];
			arr_filter[1180] <= arr_filter[1179];
			arr_filter[1179] <= arr_filter[1178];
			arr_filter[1178] <= arr_filter[1177];
			arr_filter[1177] <= arr_filter[1176];
			arr_filter[1176] <= arr_filter[1175];
			arr_filter[1175] <= arr_filter[1174];
			arr_filter[1174] <= arr_filter[1173];
			arr_filter[1173] <= arr_filter[1172];
			arr_filter[1172] <= arr_filter[1171];
			arr_filter[1171] <= arr_filter[1170];
			arr_filter[1170] <= arr_filter[1169];
			arr_filter[1169] <= arr_filter[1168];
			arr_filter[1168] <= arr_filter[1167];
			arr_filter[1167] <= arr_filter[1166];
			arr_filter[1166] <= arr_filter[1165];
			arr_filter[1165] <= arr_filter[1164];
			arr_filter[1164] <= arr_filter[1163];
			arr_filter[1163] <= arr_filter[1162];
			arr_filter[1162] <= arr_filter[1161];
			arr_filter[1161] <= arr_filter[1160];
			arr_filter[1160] <= arr_filter[1159];
			arr_filter[1159] <= arr_filter[1158];
			arr_filter[1158] <= arr_filter[1157];
			arr_filter[1157] <= arr_filter[1156];
			arr_filter[1156] <= arr_filter[1155];
			arr_filter[1155] <= arr_filter[1154];
			arr_filter[1154] <= arr_filter[1153];
			arr_filter[1153] <= arr_filter[1152];
			arr_filter[1152] <= arr_filter[1151];
			arr_filter[1151] <= arr_filter[1150];
			arr_filter[1150] <= arr_filter[1149];
			arr_filter[1149] <= arr_filter[1148];
			arr_filter[1148] <= arr_filter[1147];
			arr_filter[1147] <= arr_filter[1146];
			arr_filter[1146] <= arr_filter[1145];
			arr_filter[1145] <= arr_filter[1144];
			arr_filter[1144] <= arr_filter[1143];
			arr_filter[1143] <= arr_filter[1142];
			arr_filter[1142] <= arr_filter[1141];
			arr_filter[1141] <= arr_filter[1140];
			arr_filter[1140] <= arr_filter[1139];
			arr_filter[1139] <= arr_filter[1138];
			arr_filter[1138] <= arr_filter[1137];
			arr_filter[1137] <= arr_filter[1136];
			arr_filter[1136] <= arr_filter[1135];
			arr_filter[1135] <= arr_filter[1134];
			arr_filter[1134] <= arr_filter[1133];
			arr_filter[1133] <= arr_filter[1132];
			arr_filter[1132] <= arr_filter[1131];
			arr_filter[1131] <= arr_filter[1130];
			arr_filter[1130] <= arr_filter[1129];
			arr_filter[1129] <= arr_filter[1128];
			arr_filter[1128] <= arr_filter[1127];
			arr_filter[1127] <= arr_filter[1126];
			arr_filter[1126] <= arr_filter[1125];
			arr_filter[1125] <= arr_filter[1124];
			arr_filter[1124] <= arr_filter[1123];
			arr_filter[1123] <= arr_filter[1122];
			arr_filter[1122] <= arr_filter[1121];
			arr_filter[1121] <= arr_filter[1120];
			arr_filter[1120] <= arr_filter[1119];
			arr_filter[1119] <= arr_filter[1118];
			arr_filter[1118] <= arr_filter[1117];
			arr_filter[1117] <= arr_filter[1116];
			arr_filter[1116] <= arr_filter[1115];
			arr_filter[1115] <= arr_filter[1114];
			arr_filter[1114] <= arr_filter[1113];
			arr_filter[1113] <= arr_filter[1112];
			arr_filter[1112] <= arr_filter[1111];
			arr_filter[1111] <= arr_filter[1110];
			arr_filter[1110] <= arr_filter[1109];
			arr_filter[1109] <= arr_filter[1108];
			arr_filter[1108] <= arr_filter[1107];
			arr_filter[1107] <= arr_filter[1106];
			arr_filter[1106] <= arr_filter[1105];
			arr_filter[1105] <= arr_filter[1104];
			arr_filter[1104] <= arr_filter[1103];
			arr_filter[1103] <= arr_filter[1102];
			arr_filter[1102] <= arr_filter[1101];
			arr_filter[1101] <= arr_filter[1100];
			arr_filter[1100] <= arr_filter[1099];
			arr_filter[1099] <= arr_filter[1098];
			arr_filter[1098] <= arr_filter[1097];
			arr_filter[1097] <= arr_filter[1096];
			arr_filter[1096] <= arr_filter[1095];
			arr_filter[1095] <= arr_filter[1094];
			arr_filter[1094] <= arr_filter[1093];
			arr_filter[1093] <= arr_filter[1092];
			arr_filter[1092] <= arr_filter[1091];
			arr_filter[1091] <= arr_filter[1090];
			arr_filter[1090] <= arr_filter[1089];
			arr_filter[1089] <= arr_filter[1088];
			arr_filter[1088] <= arr_filter[1087];
			arr_filter[1087] <= arr_filter[1086];
			arr_filter[1086] <= arr_filter[1085];
			arr_filter[1085] <= arr_filter[1084];
			arr_filter[1084] <= arr_filter[1083];
			arr_filter[1083] <= arr_filter[1082];
			arr_filter[1082] <= arr_filter[1081];
			arr_filter[1081] <= arr_filter[1080];
			arr_filter[1080] <= arr_filter[1079];
			arr_filter[1079] <= arr_filter[1078];
			arr_filter[1078] <= arr_filter[1077];
			arr_filter[1077] <= arr_filter[1076];
			arr_filter[1076] <= arr_filter[1075];
			arr_filter[1075] <= arr_filter[1074];
			arr_filter[1074] <= arr_filter[1073];
			arr_filter[1073] <= arr_filter[1072];
			arr_filter[1072] <= arr_filter[1071];
			arr_filter[1071] <= arr_filter[1070];
			arr_filter[1070] <= arr_filter[1069];
			arr_filter[1069] <= arr_filter[1068];
			arr_filter[1068] <= arr_filter[1067];
			arr_filter[1067] <= arr_filter[1066];
			arr_filter[1066] <= arr_filter[1065];
			arr_filter[1065] <= arr_filter[1064];
			arr_filter[1064] <= arr_filter[1063];
			arr_filter[1063] <= arr_filter[1062];
			arr_filter[1062] <= arr_filter[1061];
			arr_filter[1061] <= arr_filter[1060];
			arr_filter[1060] <= arr_filter[1059];
			arr_filter[1059] <= arr_filter[1058];
			arr_filter[1058] <= arr_filter[1057];
			arr_filter[1057] <= arr_filter[1056];
			arr_filter[1056] <= arr_filter[1055];
			arr_filter[1055] <= arr_filter[1054];
			arr_filter[1054] <= arr_filter[1053];
			arr_filter[1053] <= arr_filter[1052];
			arr_filter[1052] <= arr_filter[1051];
			arr_filter[1051] <= arr_filter[1050];
			arr_filter[1050] <= arr_filter[1049];
			arr_filter[1049] <= arr_filter[1048];
			arr_filter[1048] <= arr_filter[1047];
			arr_filter[1047] <= arr_filter[1046];
			arr_filter[1046] <= arr_filter[1045];
			arr_filter[1045] <= arr_filter[1044];
			arr_filter[1044] <= arr_filter[1043];
			arr_filter[1043] <= arr_filter[1042];
			arr_filter[1042] <= arr_filter[1041];
			arr_filter[1041] <= arr_filter[1040];
			arr_filter[1040] <= arr_filter[1039];
			arr_filter[1039] <= arr_filter[1038];
			arr_filter[1038] <= arr_filter[1037];
			arr_filter[1037] <= arr_filter[1036];
			arr_filter[1036] <= arr_filter[1035];
			arr_filter[1035] <= arr_filter[1034];
			arr_filter[1034] <= arr_filter[1033];
			arr_filter[1033] <= arr_filter[1032];
			arr_filter[1032] <= arr_filter[1031];
			arr_filter[1031] <= arr_filter[1030];
			arr_filter[1030] <= arr_filter[1029];
			arr_filter[1029] <= arr_filter[1028];
			arr_filter[1028] <= arr_filter[1027];
			arr_filter[1027] <= arr_filter[1026];
			arr_filter[1026] <= arr_filter[1025];
			arr_filter[1025] <= arr_filter[1024];
			arr_filter[1024] <= arr_filter[1023];
			arr_filter[1023] <= arr_filter[1022];
			arr_filter[1022] <= arr_filter[1021];
			arr_filter[1021] <= arr_filter[1020];
			arr_filter[1020] <= arr_filter[1019];
			arr_filter[1019] <= arr_filter[1018];
			arr_filter[1018] <= arr_filter[1017];
			arr_filter[1017] <= arr_filter[1016];
			arr_filter[1016] <= arr_filter[1015];
			arr_filter[1015] <= arr_filter[1014];
			arr_filter[1014] <= arr_filter[1013];
			arr_filter[1013] <= arr_filter[1012];
			arr_filter[1012] <= arr_filter[1011];
			arr_filter[1011] <= arr_filter[1010];
			arr_filter[1010] <= arr_filter[1009];
			arr_filter[1009] <= arr_filter[1008];
			arr_filter[1008] <= arr_filter[1007];
			arr_filter[1007] <= arr_filter[1006];
			arr_filter[1006] <= arr_filter[1005];
			arr_filter[1005] <= arr_filter[1004];
			arr_filter[1004] <= arr_filter[1003];
			arr_filter[1003] <= arr_filter[1002];
			arr_filter[1002] <= arr_filter[1001];
			arr_filter[1001] <= arr_filter[1000];
			arr_filter[1000] <= arr_filter[999];
			arr_filter[999] <= arr_filter[998];
			arr_filter[998] <= arr_filter[997];
			arr_filter[997] <= arr_filter[996];
			arr_filter[996] <= arr_filter[995];
			arr_filter[995] <= arr_filter[994];
			arr_filter[994] <= arr_filter[993];
			arr_filter[993] <= arr_filter[992];
			arr_filter[992] <= arr_filter[991];
			arr_filter[991] <= arr_filter[990];
			arr_filter[990] <= arr_filter[989];
			arr_filter[989] <= arr_filter[988];
			arr_filter[988] <= arr_filter[987];
			arr_filter[987] <= arr_filter[986];
			arr_filter[986] <= arr_filter[985];
			arr_filter[985] <= arr_filter[984];
			arr_filter[984] <= arr_filter[983];
			arr_filter[983] <= arr_filter[982];
			arr_filter[982] <= arr_filter[981];
			arr_filter[981] <= arr_filter[980];
			arr_filter[980] <= arr_filter[979];
			arr_filter[979] <= arr_filter[978];
			arr_filter[978] <= arr_filter[977];
			arr_filter[977] <= arr_filter[976];
			arr_filter[976] <= arr_filter[975];
			arr_filter[975] <= arr_filter[974];
			arr_filter[974] <= arr_filter[973];
			arr_filter[973] <= arr_filter[972];
			arr_filter[972] <= arr_filter[971];
			arr_filter[971] <= arr_filter[970];
			arr_filter[970] <= arr_filter[969];
			arr_filter[969] <= arr_filter[968];
			arr_filter[968] <= arr_filter[967];
			arr_filter[967] <= arr_filter[966];
			arr_filter[966] <= arr_filter[965];
			arr_filter[965] <= arr_filter[964];
			arr_filter[964] <= arr_filter[963];
			arr_filter[963] <= arr_filter[962];
			arr_filter[962] <= arr_filter[961];
			arr_filter[961] <= arr_filter[960];
			arr_filter[960] <= arr_filter[959];
			arr_filter[959] <= arr_filter[958];
			arr_filter[958] <= arr_filter[957];
			arr_filter[957] <= arr_filter[956];
			arr_filter[956] <= arr_filter[955];
			arr_filter[955] <= arr_filter[954];
			arr_filter[954] <= arr_filter[953];
			arr_filter[953] <= arr_filter[952];
			arr_filter[952] <= arr_filter[951];
			arr_filter[951] <= arr_filter[950];
			arr_filter[950] <= arr_filter[949];
			arr_filter[949] <= arr_filter[948];
			arr_filter[948] <= arr_filter[947];
			arr_filter[947] <= arr_filter[946];
			arr_filter[946] <= arr_filter[945];
			arr_filter[945] <= arr_filter[944];
			arr_filter[944] <= arr_filter[943];
			arr_filter[943] <= arr_filter[942];
			arr_filter[942] <= arr_filter[941];
			arr_filter[941] <= arr_filter[940];
			arr_filter[940] <= arr_filter[939];
			arr_filter[939] <= arr_filter[938];
			arr_filter[938] <= arr_filter[937];
			arr_filter[937] <= arr_filter[936];
			arr_filter[936] <= arr_filter[935];
			arr_filter[935] <= arr_filter[934];
			arr_filter[934] <= arr_filter[933];
			arr_filter[933] <= arr_filter[932];
			arr_filter[932] <= arr_filter[931];
			arr_filter[931] <= arr_filter[930];
			arr_filter[930] <= arr_filter[929];
			arr_filter[929] <= arr_filter[928];
			arr_filter[928] <= arr_filter[927];
			arr_filter[927] <= arr_filter[926];
			arr_filter[926] <= arr_filter[925];
			arr_filter[925] <= arr_filter[924];
			arr_filter[924] <= arr_filter[923];
			arr_filter[923] <= arr_filter[922];
			arr_filter[922] <= arr_filter[921];
			arr_filter[921] <= arr_filter[920];
			arr_filter[920] <= arr_filter[919];
			arr_filter[919] <= arr_filter[918];
			arr_filter[918] <= arr_filter[917];
			arr_filter[917] <= arr_filter[916];
			arr_filter[916] <= arr_filter[915];
			arr_filter[915] <= arr_filter[914];
			arr_filter[914] <= arr_filter[913];
			arr_filter[913] <= arr_filter[912];
			arr_filter[912] <= arr_filter[911];
			arr_filter[911] <= arr_filter[910];
			arr_filter[910] <= arr_filter[909];
			arr_filter[909] <= arr_filter[908];
			arr_filter[908] <= arr_filter[907];
			arr_filter[907] <= arr_filter[906];
			arr_filter[906] <= arr_filter[905];
			arr_filter[905] <= arr_filter[904];
			arr_filter[904] <= arr_filter[903];
			arr_filter[903] <= arr_filter[902];
			arr_filter[902] <= arr_filter[901];
			arr_filter[901] <= arr_filter[900];
			arr_filter[900] <= arr_filter[899];
			arr_filter[899] <= arr_filter[898];
			arr_filter[898] <= arr_filter[897];
			arr_filter[897] <= arr_filter[896];
			arr_filter[896] <= arr_filter[895];
			arr_filter[895] <= arr_filter[894];
			arr_filter[894] <= arr_filter[893];
			arr_filter[893] <= arr_filter[892];
			arr_filter[892] <= arr_filter[891];
			arr_filter[891] <= arr_filter[890];
			arr_filter[890] <= arr_filter[889];
			arr_filter[889] <= arr_filter[888];
			arr_filter[888] <= arr_filter[887];
			arr_filter[887] <= arr_filter[886];
			arr_filter[886] <= arr_filter[885];
			arr_filter[885] <= arr_filter[884];
			arr_filter[884] <= arr_filter[883];
			arr_filter[883] <= arr_filter[882];
			arr_filter[882] <= arr_filter[881];
			arr_filter[881] <= arr_filter[880];
			arr_filter[880] <= arr_filter[879];
			arr_filter[879] <= arr_filter[878];
			arr_filter[878] <= arr_filter[877];
			arr_filter[877] <= arr_filter[876];
			arr_filter[876] <= arr_filter[875];
			arr_filter[875] <= arr_filter[874];
			arr_filter[874] <= arr_filter[873];
			arr_filter[873] <= arr_filter[872];
			arr_filter[872] <= arr_filter[871];
			arr_filter[871] <= arr_filter[870];
			arr_filter[870] <= arr_filter[869];
			arr_filter[869] <= arr_filter[868];
			arr_filter[868] <= arr_filter[867];
			arr_filter[867] <= arr_filter[866];
			arr_filter[866] <= arr_filter[865];
			arr_filter[865] <= arr_filter[864];
			arr_filter[864] <= arr_filter[863];
			arr_filter[863] <= arr_filter[862];
			arr_filter[862] <= arr_filter[861];
			arr_filter[861] <= arr_filter[860];
			arr_filter[860] <= arr_filter[859];
			arr_filter[859] <= arr_filter[858];
			arr_filter[858] <= arr_filter[857];
			arr_filter[857] <= arr_filter[856];
			arr_filter[856] <= arr_filter[855];
			arr_filter[855] <= arr_filter[854];
			arr_filter[854] <= arr_filter[853];
			arr_filter[853] <= arr_filter[852];
			arr_filter[852] <= arr_filter[851];
			arr_filter[851] <= arr_filter[850];
			arr_filter[850] <= arr_filter[849];
			arr_filter[849] <= arr_filter[848];
			arr_filter[848] <= arr_filter[847];
			arr_filter[847] <= arr_filter[846];
			arr_filter[846] <= arr_filter[845];
			arr_filter[845] <= arr_filter[844];
			arr_filter[844] <= arr_filter[843];
			arr_filter[843] <= arr_filter[842];
			arr_filter[842] <= arr_filter[841];
			arr_filter[841] <= arr_filter[840];
			arr_filter[840] <= arr_filter[839];
			arr_filter[839] <= arr_filter[838];
			arr_filter[838] <= arr_filter[837];
			arr_filter[837] <= arr_filter[836];
			arr_filter[836] <= arr_filter[835];
			arr_filter[835] <= arr_filter[834];
			arr_filter[834] <= arr_filter[833];
			arr_filter[833] <= arr_filter[832];
			arr_filter[832] <= arr_filter[831];
			arr_filter[831] <= arr_filter[830];
			arr_filter[830] <= arr_filter[829];
			arr_filter[829] <= arr_filter[828];
			arr_filter[828] <= arr_filter[827];
			arr_filter[827] <= arr_filter[826];
			arr_filter[826] <= arr_filter[825];
			arr_filter[825] <= arr_filter[824];
			arr_filter[824] <= arr_filter[823];
			arr_filter[823] <= arr_filter[822];
			arr_filter[822] <= arr_filter[821];
			arr_filter[821] <= arr_filter[820];
			arr_filter[820] <= arr_filter[819];
			arr_filter[819] <= arr_filter[818];
			arr_filter[818] <= arr_filter[817];
			arr_filter[817] <= arr_filter[816];
			arr_filter[816] <= arr_filter[815];
			arr_filter[815] <= arr_filter[814];
			arr_filter[814] <= arr_filter[813];
			arr_filter[813] <= arr_filter[812];
			arr_filter[812] <= arr_filter[811];
			arr_filter[811] <= arr_filter[810];
			arr_filter[810] <= arr_filter[809];
			arr_filter[809] <= arr_filter[808];
			arr_filter[808] <= arr_filter[807];
			arr_filter[807] <= arr_filter[806];
			arr_filter[806] <= arr_filter[805];
			arr_filter[805] <= arr_filter[804];
			arr_filter[804] <= arr_filter[803];
			arr_filter[803] <= arr_filter[802];
			arr_filter[802] <= arr_filter[801];
			arr_filter[801] <= arr_filter[800];
			arr_filter[800] <= arr_filter[799];
			arr_filter[799] <= arr_filter[798];
			arr_filter[798] <= arr_filter[797];
			arr_filter[797] <= arr_filter[796];
			arr_filter[796] <= arr_filter[795];
			arr_filter[795] <= arr_filter[794];
			arr_filter[794] <= arr_filter[793];
			arr_filter[793] <= arr_filter[792];
			arr_filter[792] <= arr_filter[791];
			arr_filter[791] <= arr_filter[790];
			arr_filter[790] <= arr_filter[789];
			arr_filter[789] <= arr_filter[788];
			arr_filter[788] <= arr_filter[787];
			arr_filter[787] <= arr_filter[786];
			arr_filter[786] <= arr_filter[785];
			arr_filter[785] <= arr_filter[784];
			arr_filter[784] <= arr_filter[783];
			arr_filter[783] <= arr_filter[782];
			arr_filter[782] <= arr_filter[781];
			arr_filter[781] <= arr_filter[780];
			arr_filter[780] <= arr_filter[779];
			arr_filter[779] <= arr_filter[778];
			arr_filter[778] <= arr_filter[777];
			arr_filter[777] <= arr_filter[776];
			arr_filter[776] <= arr_filter[775];
			arr_filter[775] <= arr_filter[774];
			arr_filter[774] <= arr_filter[773];
			arr_filter[773] <= arr_filter[772];
			arr_filter[772] <= arr_filter[771];
			arr_filter[771] <= arr_filter[770];
			arr_filter[770] <= arr_filter[769];
			arr_filter[769] <= arr_filter[768];
			arr_filter[768] <= arr_filter[767];
			arr_filter[767] <= arr_filter[766];
			arr_filter[766] <= arr_filter[765];
			arr_filter[765] <= arr_filter[764];
			arr_filter[764] <= arr_filter[763];
			arr_filter[763] <= arr_filter[762];
			arr_filter[762] <= arr_filter[761];
			arr_filter[761] <= arr_filter[760];
			arr_filter[760] <= arr_filter[759];
			arr_filter[759] <= arr_filter[758];
			arr_filter[758] <= arr_filter[757];
			arr_filter[757] <= arr_filter[756];
			arr_filter[756] <= arr_filter[755];
			arr_filter[755] <= arr_filter[754];
			arr_filter[754] <= arr_filter[753];
			arr_filter[753] <= arr_filter[752];
			arr_filter[752] <= arr_filter[751];
			arr_filter[751] <= arr_filter[750];
			arr_filter[750] <= arr_filter[749];
			arr_filter[749] <= arr_filter[748];
			arr_filter[748] <= arr_filter[747];
			arr_filter[747] <= arr_filter[746];
			arr_filter[746] <= arr_filter[745];
			arr_filter[745] <= arr_filter[744];
			arr_filter[744] <= arr_filter[743];
			arr_filter[743] <= arr_filter[742];
			arr_filter[742] <= arr_filter[741];
			arr_filter[741] <= arr_filter[740];
			arr_filter[740] <= arr_filter[739];
			arr_filter[739] <= arr_filter[738];
			arr_filter[738] <= arr_filter[737];
			arr_filter[737] <= arr_filter[736];
			arr_filter[736] <= arr_filter[735];
			arr_filter[735] <= arr_filter[734];
			arr_filter[734] <= arr_filter[733];
			arr_filter[733] <= arr_filter[732];
			arr_filter[732] <= arr_filter[731];
			arr_filter[731] <= arr_filter[730];
			arr_filter[730] <= arr_filter[729];
			arr_filter[729] <= arr_filter[728];
			arr_filter[728] <= arr_filter[727];
			arr_filter[727] <= arr_filter[726];
			arr_filter[726] <= arr_filter[725];
			arr_filter[725] <= arr_filter[724];
			arr_filter[724] <= arr_filter[723];
			arr_filter[723] <= arr_filter[722];
			arr_filter[722] <= arr_filter[721];
			arr_filter[721] <= arr_filter[720];
			arr_filter[720] <= arr_filter[719];
			arr_filter[719] <= arr_filter[718];
			arr_filter[718] <= arr_filter[717];
			arr_filter[717] <= arr_filter[716];
			arr_filter[716] <= arr_filter[715];
			arr_filter[715] <= arr_filter[714];
			arr_filter[714] <= arr_filter[713];
			arr_filter[713] <= arr_filter[712];
			arr_filter[712] <= arr_filter[711];
			arr_filter[711] <= arr_filter[710];
			arr_filter[710] <= arr_filter[709];
			arr_filter[709] <= arr_filter[708];
			arr_filter[708] <= arr_filter[707];
			arr_filter[707] <= arr_filter[706];
			arr_filter[706] <= arr_filter[705];
			arr_filter[705] <= arr_filter[704];
			arr_filter[704] <= arr_filter[703];
			arr_filter[703] <= arr_filter[702];
			arr_filter[702] <= arr_filter[701];
			arr_filter[701] <= arr_filter[700];
			arr_filter[700] <= arr_filter[699];
			arr_filter[699] <= arr_filter[698];
			arr_filter[698] <= arr_filter[697];
			arr_filter[697] <= arr_filter[696];
			arr_filter[696] <= arr_filter[695];
			arr_filter[695] <= arr_filter[694];
			arr_filter[694] <= arr_filter[693];
			arr_filter[693] <= arr_filter[692];
			arr_filter[692] <= arr_filter[691];
			arr_filter[691] <= arr_filter[690];
			arr_filter[690] <= arr_filter[689];
			arr_filter[689] <= arr_filter[688];
			arr_filter[688] <= arr_filter[687];
			arr_filter[687] <= arr_filter[686];
			arr_filter[686] <= arr_filter[685];
			arr_filter[685] <= arr_filter[684];
			arr_filter[684] <= arr_filter[683];
			arr_filter[683] <= arr_filter[682];
			arr_filter[682] <= arr_filter[681];
			arr_filter[681] <= arr_filter[680];
			arr_filter[680] <= arr_filter[679];
			arr_filter[679] <= arr_filter[678];
			arr_filter[678] <= arr_filter[677];
			arr_filter[677] <= arr_filter[676];
			arr_filter[676] <= arr_filter[675];
			arr_filter[675] <= arr_filter[674];
			arr_filter[674] <= arr_filter[673];
			arr_filter[673] <= arr_filter[672];
			arr_filter[672] <= arr_filter[671];
			arr_filter[671] <= arr_filter[670];
			arr_filter[670] <= arr_filter[669];
			arr_filter[669] <= arr_filter[668];
			arr_filter[668] <= arr_filter[667];
			arr_filter[667] <= arr_filter[666];
			arr_filter[666] <= arr_filter[665];
			arr_filter[665] <= arr_filter[664];
			arr_filter[664] <= arr_filter[663];
			arr_filter[663] <= arr_filter[662];
			arr_filter[662] <= arr_filter[661];
			arr_filter[661] <= arr_filter[660];
			arr_filter[660] <= arr_filter[659];
			arr_filter[659] <= arr_filter[658];
			arr_filter[658] <= arr_filter[657];
			arr_filter[657] <= arr_filter[656];
			arr_filter[656] <= arr_filter[655];
			arr_filter[655] <= arr_filter[654];
			arr_filter[654] <= arr_filter[653];
			arr_filter[653] <= arr_filter[652];
			arr_filter[652] <= arr_filter[651];
			arr_filter[651] <= arr_filter[650];
			arr_filter[650] <= arr_filter[649];
			arr_filter[649] <= arr_filter[648];
			arr_filter[648] <= arr_filter[647];
			arr_filter[647] <= arr_filter[646];
			arr_filter[646] <= arr_filter[645];
			arr_filter[645] <= arr_filter[644];
			arr_filter[644] <= arr_filter[643];
			arr_filter[643] <= arr_filter[642];
			arr_filter[642] <= arr_filter[641];
			arr_filter[641] <= arr_filter[640];
			arr_filter[640] <= arr_filter[639];
			arr_filter[639] <= arr_filter[638];
			arr_filter[638] <= arr_filter[637];
			arr_filter[637] <= arr_filter[636];
			arr_filter[636] <= arr_filter[635];
			arr_filter[635] <= arr_filter[634];
			arr_filter[634] <= arr_filter[633];
			arr_filter[633] <= arr_filter[632];
			arr_filter[632] <= arr_filter[631];
			arr_filter[631] <= arr_filter[630];
			arr_filter[630] <= arr_filter[629];
			arr_filter[629] <= arr_filter[628];
			arr_filter[628] <= arr_filter[627];
			arr_filter[627] <= arr_filter[626];
			arr_filter[626] <= arr_filter[625];
			arr_filter[625] <= arr_filter[624];
			arr_filter[624] <= arr_filter[623];
			arr_filter[623] <= arr_filter[622];
			arr_filter[622] <= arr_filter[621];
			arr_filter[621] <= arr_filter[620];
			arr_filter[620] <= arr_filter[619];
			arr_filter[619] <= arr_filter[618];
			arr_filter[618] <= arr_filter[617];
			arr_filter[617] <= arr_filter[616];
			arr_filter[616] <= arr_filter[615];
			arr_filter[615] <= arr_filter[614];
			arr_filter[614] <= arr_filter[613];
			arr_filter[613] <= arr_filter[612];
			arr_filter[612] <= arr_filter[611];
			arr_filter[611] <= arr_filter[610];
			arr_filter[610] <= arr_filter[609];
			arr_filter[609] <= arr_filter[608];
			arr_filter[608] <= arr_filter[607];
			arr_filter[607] <= arr_filter[606];
			arr_filter[606] <= arr_filter[605];
			arr_filter[605] <= arr_filter[604];
			arr_filter[604] <= arr_filter[603];
			arr_filter[603] <= arr_filter[602];
			arr_filter[602] <= arr_filter[601];
			arr_filter[601] <= arr_filter[600];
			arr_filter[600] <= arr_filter[599];
			arr_filter[599] <= arr_filter[598];
			arr_filter[598] <= arr_filter[597];
			arr_filter[597] <= arr_filter[596];
			arr_filter[596] <= arr_filter[595];
			arr_filter[595] <= arr_filter[594];
			arr_filter[594] <= arr_filter[593];
			arr_filter[593] <= arr_filter[592];
			arr_filter[592] <= arr_filter[591];
			arr_filter[591] <= arr_filter[590];
			arr_filter[590] <= arr_filter[589];
			arr_filter[589] <= arr_filter[588];
			arr_filter[588] <= arr_filter[587];
			arr_filter[587] <= arr_filter[586];
			arr_filter[586] <= arr_filter[585];
			arr_filter[585] <= arr_filter[584];
			arr_filter[584] <= arr_filter[583];
			arr_filter[583] <= arr_filter[582];
			arr_filter[582] <= arr_filter[581];
			arr_filter[581] <= arr_filter[580];
			arr_filter[580] <= arr_filter[579];
			arr_filter[579] <= arr_filter[578];
			arr_filter[578] <= arr_filter[577];
			arr_filter[577] <= arr_filter[576];
			arr_filter[576] <= arr_filter[575];
			arr_filter[575] <= arr_filter[574];
			arr_filter[574] <= arr_filter[573];
			arr_filter[573] <= arr_filter[572];
			arr_filter[572] <= arr_filter[571];
			arr_filter[571] <= arr_filter[570];
			arr_filter[570] <= arr_filter[569];
			arr_filter[569] <= arr_filter[568];
			arr_filter[568] <= arr_filter[567];
			arr_filter[567] <= arr_filter[566];
			arr_filter[566] <= arr_filter[565];
			arr_filter[565] <= arr_filter[564];
			arr_filter[564] <= arr_filter[563];
			arr_filter[563] <= arr_filter[562];
			arr_filter[562] <= arr_filter[561];
			arr_filter[561] <= arr_filter[560];
			arr_filter[560] <= arr_filter[559];
			arr_filter[559] <= arr_filter[558];
			arr_filter[558] <= arr_filter[557];
			arr_filter[557] <= arr_filter[556];
			arr_filter[556] <= arr_filter[555];
			arr_filter[555] <= arr_filter[554];
			arr_filter[554] <= arr_filter[553];
			arr_filter[553] <= arr_filter[552];
			arr_filter[552] <= arr_filter[551];
			arr_filter[551] <= arr_filter[550];
			arr_filter[550] <= arr_filter[549];
			arr_filter[549] <= arr_filter[548];
			arr_filter[548] <= arr_filter[547];
			arr_filter[547] <= arr_filter[546];
			arr_filter[546] <= arr_filter[545];
			arr_filter[545] <= arr_filter[544];
			arr_filter[544] <= arr_filter[543];
			arr_filter[543] <= arr_filter[542];
			arr_filter[542] <= arr_filter[541];
			arr_filter[541] <= arr_filter[540];
			arr_filter[540] <= arr_filter[539];
			arr_filter[539] <= arr_filter[538];
			arr_filter[538] <= arr_filter[537];
			arr_filter[537] <= arr_filter[536];
			arr_filter[536] <= arr_filter[535];
			arr_filter[535] <= arr_filter[534];
			arr_filter[534] <= arr_filter[533];
			arr_filter[533] <= arr_filter[532];
			arr_filter[532] <= arr_filter[531];
			arr_filter[531] <= arr_filter[530];
			arr_filter[530] <= arr_filter[529];
			arr_filter[529] <= arr_filter[528];
			arr_filter[528] <= arr_filter[527];
			arr_filter[527] <= arr_filter[526];
			arr_filter[526] <= arr_filter[525];
			arr_filter[525] <= arr_filter[524];
			arr_filter[524] <= arr_filter[523];
			arr_filter[523] <= arr_filter[522];
			arr_filter[522] <= arr_filter[521];
			arr_filter[521] <= arr_filter[520];
			arr_filter[520] <= arr_filter[519];
			arr_filter[519] <= arr_filter[518];
			arr_filter[518] <= arr_filter[517];
			arr_filter[517] <= arr_filter[516];
			arr_filter[516] <= arr_filter[515];
			arr_filter[515] <= arr_filter[514];
			arr_filter[514] <= arr_filter[513];
			arr_filter[513] <= arr_filter[512];
			arr_filter[512] <= arr_filter[511];
			arr_filter[511] <= arr_filter[510];
			arr_filter[510] <= arr_filter[509];
			arr_filter[509] <= arr_filter[508];
			arr_filter[508] <= arr_filter[507];
			arr_filter[507] <= arr_filter[506];
			arr_filter[506] <= arr_filter[505];
			arr_filter[505] <= arr_filter[504];
			arr_filter[504] <= arr_filter[503];
			arr_filter[503] <= arr_filter[502];
			arr_filter[502] <= arr_filter[501];
			arr_filter[501] <= arr_filter[500];
			arr_filter[500] <= arr_filter[499];
			arr_filter[499] <= arr_filter[498];
			arr_filter[498] <= arr_filter[497];
			arr_filter[497] <= arr_filter[496];
			arr_filter[496] <= arr_filter[495];
			arr_filter[495] <= arr_filter[494];
			arr_filter[494] <= arr_filter[493];
			arr_filter[493] <= arr_filter[492];
			arr_filter[492] <= arr_filter[491];
			arr_filter[491] <= arr_filter[490];
			arr_filter[490] <= arr_filter[489];
			arr_filter[489] <= arr_filter[488];
			arr_filter[488] <= arr_filter[487];
			arr_filter[487] <= arr_filter[486];
			arr_filter[486] <= arr_filter[485];
			arr_filter[485] <= arr_filter[484];
			arr_filter[484] <= arr_filter[483];
			arr_filter[483] <= arr_filter[482];
			arr_filter[482] <= arr_filter[481];
			arr_filter[481] <= arr_filter[480];
			arr_filter[480] <= arr_filter[479];
			arr_filter[479] <= arr_filter[478];
			arr_filter[478] <= arr_filter[477];
			arr_filter[477] <= arr_filter[476];
			arr_filter[476] <= arr_filter[475];
			arr_filter[475] <= arr_filter[474];
			arr_filter[474] <= arr_filter[473];
			arr_filter[473] <= arr_filter[472];
			arr_filter[472] <= arr_filter[471];
			arr_filter[471] <= arr_filter[470];
			arr_filter[470] <= arr_filter[469];
			arr_filter[469] <= arr_filter[468];
			arr_filter[468] <= arr_filter[467];
			arr_filter[467] <= arr_filter[466];
			arr_filter[466] <= arr_filter[465];
			arr_filter[465] <= arr_filter[464];
			arr_filter[464] <= arr_filter[463];
			arr_filter[463] <= arr_filter[462];
			arr_filter[462] <= arr_filter[461];
			arr_filter[461] <= arr_filter[460];
			arr_filter[460] <= arr_filter[459];
			arr_filter[459] <= arr_filter[458];
			arr_filter[458] <= arr_filter[457];
			arr_filter[457] <= arr_filter[456];
			arr_filter[456] <= arr_filter[455];
			arr_filter[455] <= arr_filter[454];
			arr_filter[454] <= arr_filter[453];
			arr_filter[453] <= arr_filter[452];
			arr_filter[452] <= arr_filter[451];
			arr_filter[451] <= arr_filter[450];
			arr_filter[450] <= arr_filter[449];
			arr_filter[449] <= arr_filter[448];
			arr_filter[448] <= arr_filter[447];
			arr_filter[447] <= arr_filter[446];
			arr_filter[446] <= arr_filter[445];
			arr_filter[445] <= arr_filter[444];
			arr_filter[444] <= arr_filter[443];
			arr_filter[443] <= arr_filter[442];
			arr_filter[442] <= arr_filter[441];
			arr_filter[441] <= arr_filter[440];
			arr_filter[440] <= arr_filter[439];
			arr_filter[439] <= arr_filter[438];
			arr_filter[438] <= arr_filter[437];
			arr_filter[437] <= arr_filter[436];
			arr_filter[436] <= arr_filter[435];
			arr_filter[435] <= arr_filter[434];
			arr_filter[434] <= arr_filter[433];
			arr_filter[433] <= arr_filter[432];
			arr_filter[432] <= arr_filter[431];
			arr_filter[431] <= arr_filter[430];
			arr_filter[430] <= arr_filter[429];
			arr_filter[429] <= arr_filter[428];
			arr_filter[428] <= arr_filter[427];
			arr_filter[427] <= arr_filter[426];
			arr_filter[426] <= arr_filter[425];
			arr_filter[425] <= arr_filter[424];
			arr_filter[424] <= arr_filter[423];
			arr_filter[423] <= arr_filter[422];
			arr_filter[422] <= arr_filter[421];
			arr_filter[421] <= arr_filter[420];
			arr_filter[420] <= arr_filter[419];
			arr_filter[419] <= arr_filter[418];
			arr_filter[418] <= arr_filter[417];
			arr_filter[417] <= arr_filter[416];
			arr_filter[416] <= arr_filter[415];
			arr_filter[415] <= arr_filter[414];
			arr_filter[414] <= arr_filter[413];
			arr_filter[413] <= arr_filter[412];
			arr_filter[412] <= arr_filter[411];
			arr_filter[411] <= arr_filter[410];
			arr_filter[410] <= arr_filter[409];
			arr_filter[409] <= arr_filter[408];
			arr_filter[408] <= arr_filter[407];
			arr_filter[407] <= arr_filter[406];
			arr_filter[406] <= arr_filter[405];
			arr_filter[405] <= arr_filter[404];
			arr_filter[404] <= arr_filter[403];
			arr_filter[403] <= arr_filter[402];
			arr_filter[402] <= arr_filter[401];
			arr_filter[401] <= arr_filter[400];
			arr_filter[400] <= arr_filter[399];
			arr_filter[399] <= arr_filter[398];
			arr_filter[398] <= arr_filter[397];
			arr_filter[397] <= arr_filter[396];
			arr_filter[396] <= arr_filter[395];
			arr_filter[395] <= arr_filter[394];
			arr_filter[394] <= arr_filter[393];
			arr_filter[393] <= arr_filter[392];
			arr_filter[392] <= arr_filter[391];
			arr_filter[391] <= arr_filter[390];
			arr_filter[390] <= arr_filter[389];
			arr_filter[389] <= arr_filter[388];
			arr_filter[388] <= arr_filter[387];
			arr_filter[387] <= arr_filter[386];
			arr_filter[386] <= arr_filter[385];
			arr_filter[385] <= arr_filter[384];
			arr_filter[384] <= arr_filter[383];
			arr_filter[383] <= arr_filter[382];
			arr_filter[382] <= arr_filter[381];
			arr_filter[381] <= arr_filter[380];
			arr_filter[380] <= arr_filter[379];
			arr_filter[379] <= arr_filter[378];
			arr_filter[378] <= arr_filter[377];
			arr_filter[377] <= arr_filter[376];
			arr_filter[376] <= arr_filter[375];
			arr_filter[375] <= arr_filter[374];
			arr_filter[374] <= arr_filter[373];
			arr_filter[373] <= arr_filter[372];
			arr_filter[372] <= arr_filter[371];
			arr_filter[371] <= arr_filter[370];
			arr_filter[370] <= arr_filter[369];
			arr_filter[369] <= arr_filter[368];
			arr_filter[368] <= arr_filter[367];
			arr_filter[367] <= arr_filter[366];
			arr_filter[366] <= arr_filter[365];
			arr_filter[365] <= arr_filter[364];
			arr_filter[364] <= arr_filter[363];
			arr_filter[363] <= arr_filter[362];
			arr_filter[362] <= arr_filter[361];
			arr_filter[361] <= arr_filter[360];
			arr_filter[360] <= arr_filter[359];
			arr_filter[359] <= arr_filter[358];
			arr_filter[358] <= arr_filter[357];
			arr_filter[357] <= arr_filter[356];
			arr_filter[356] <= arr_filter[355];
			arr_filter[355] <= arr_filter[354];
			arr_filter[354] <= arr_filter[353];
			arr_filter[353] <= arr_filter[352];
			arr_filter[352] <= arr_filter[351];
			arr_filter[351] <= arr_filter[350];
			arr_filter[350] <= arr_filter[349];
			arr_filter[349] <= arr_filter[348];
			arr_filter[348] <= arr_filter[347];
			arr_filter[347] <= arr_filter[346];
			arr_filter[346] <= arr_filter[345];
			arr_filter[345] <= arr_filter[344];
			arr_filter[344] <= arr_filter[343];
			arr_filter[343] <= arr_filter[342];
			arr_filter[342] <= arr_filter[341];
			arr_filter[341] <= arr_filter[340];
			arr_filter[340] <= arr_filter[339];
			arr_filter[339] <= arr_filter[338];
			arr_filter[338] <= arr_filter[337];
			arr_filter[337] <= arr_filter[336];
			arr_filter[336] <= arr_filter[335];
			arr_filter[335] <= arr_filter[334];
			arr_filter[334] <= arr_filter[333];
			arr_filter[333] <= arr_filter[332];
			arr_filter[332] <= arr_filter[331];
			arr_filter[331] <= arr_filter[330];
			arr_filter[330] <= arr_filter[329];
			arr_filter[329] <= arr_filter[328];
			arr_filter[328] <= arr_filter[327];
			arr_filter[327] <= arr_filter[326];
			arr_filter[326] <= arr_filter[325];
			arr_filter[325] <= arr_filter[324];
			arr_filter[324] <= arr_filter[323];
			arr_filter[323] <= arr_filter[322];
			arr_filter[322] <= arr_filter[321];
			arr_filter[321] <= arr_filter[320];
			arr_filter[320] <= arr_filter[319];
			arr_filter[319] <= arr_filter[318];
			arr_filter[318] <= arr_filter[317];
			arr_filter[317] <= arr_filter[316];
			arr_filter[316] <= arr_filter[315];
			arr_filter[315] <= arr_filter[314];
			arr_filter[314] <= arr_filter[313];
			arr_filter[313] <= arr_filter[312];
			arr_filter[312] <= arr_filter[311];
			arr_filter[311] <= arr_filter[310];
			arr_filter[310] <= arr_filter[309];
			arr_filter[309] <= arr_filter[308];
			arr_filter[308] <= arr_filter[307];
			arr_filter[307] <= arr_filter[306];
			arr_filter[306] <= arr_filter[305];
			arr_filter[305] <= arr_filter[304];
			arr_filter[304] <= arr_filter[303];
			arr_filter[303] <= arr_filter[302];
			arr_filter[302] <= arr_filter[301];
			arr_filter[301] <= arr_filter[300];
			arr_filter[300] <= arr_filter[299];
			arr_filter[299] <= arr_filter[298];
			arr_filter[298] <= arr_filter[297];
			arr_filter[297] <= arr_filter[296];
			arr_filter[296] <= arr_filter[295];
			arr_filter[295] <= arr_filter[294];
			arr_filter[294] <= arr_filter[293];
			arr_filter[293] <= arr_filter[292];
			arr_filter[292] <= arr_filter[291];
			arr_filter[291] <= arr_filter[290];
			arr_filter[290] <= arr_filter[289];
			arr_filter[289] <= arr_filter[288];
			arr_filter[288] <= arr_filter[287];
			arr_filter[287] <= arr_filter[286];
			arr_filter[286] <= arr_filter[285];
			arr_filter[285] <= arr_filter[284];
			arr_filter[284] <= arr_filter[283];
			arr_filter[283] <= arr_filter[282];
			arr_filter[282] <= arr_filter[281];
			arr_filter[281] <= arr_filter[280];
			arr_filter[280] <= arr_filter[279];
			arr_filter[279] <= arr_filter[278];
			arr_filter[278] <= arr_filter[277];
			arr_filter[277] <= arr_filter[276];
			arr_filter[276] <= arr_filter[275];
			arr_filter[275] <= arr_filter[274];
			arr_filter[274] <= arr_filter[273];
			arr_filter[273] <= arr_filter[272];
			arr_filter[272] <= arr_filter[271];
			arr_filter[271] <= arr_filter[270];
			arr_filter[270] <= arr_filter[269];
			arr_filter[269] <= arr_filter[268];
			arr_filter[268] <= arr_filter[267];
			arr_filter[267] <= arr_filter[266];
			arr_filter[266] <= arr_filter[265];
			arr_filter[265] <= arr_filter[264];
			arr_filter[264] <= arr_filter[263];
			arr_filter[263] <= arr_filter[262];
			arr_filter[262] <= arr_filter[261];
			arr_filter[261] <= arr_filter[260];
			arr_filter[260] <= arr_filter[259];
			arr_filter[259] <= arr_filter[258];
			arr_filter[258] <= arr_filter[257];
			arr_filter[257] <= arr_filter[256];
			arr_filter[256] <= arr_filter[255];
			arr_filter[255] <= arr_filter[254];
			arr_filter[254] <= arr_filter[253];
			arr_filter[253] <= arr_filter[252];
			arr_filter[252] <= arr_filter[251];
			arr_filter[251] <= arr_filter[250];
			arr_filter[250] <= arr_filter[249];
			arr_filter[249] <= arr_filter[248];
			arr_filter[248] <= arr_filter[247];
			arr_filter[247] <= arr_filter[246];
			arr_filter[246] <= arr_filter[245];
			arr_filter[245] <= arr_filter[244];
			arr_filter[244] <= arr_filter[243];
			arr_filter[243] <= arr_filter[242];
			arr_filter[242] <= arr_filter[241];
			arr_filter[241] <= arr_filter[240];
			arr_filter[240] <= arr_filter[239];
			arr_filter[239] <= arr_filter[238];
			arr_filter[238] <= arr_filter[237];
			arr_filter[237] <= arr_filter[236];
			arr_filter[236] <= arr_filter[235];
			arr_filter[235] <= arr_filter[234];
			arr_filter[234] <= arr_filter[233];
			arr_filter[233] <= arr_filter[232];
			arr_filter[232] <= arr_filter[231];
			arr_filter[231] <= arr_filter[230];
			arr_filter[230] <= arr_filter[229];
			arr_filter[229] <= arr_filter[228];
			arr_filter[228] <= arr_filter[227];
			arr_filter[227] <= arr_filter[226];
			arr_filter[226] <= arr_filter[225];
			arr_filter[225] <= arr_filter[224];
			arr_filter[224] <= arr_filter[223];
			arr_filter[223] <= arr_filter[222];
			arr_filter[222] <= arr_filter[221];
			arr_filter[221] <= arr_filter[220];
			arr_filter[220] <= arr_filter[219];
			arr_filter[219] <= arr_filter[218];
			arr_filter[218] <= arr_filter[217];
			arr_filter[217] <= arr_filter[216];
			arr_filter[216] <= arr_filter[215];
			arr_filter[215] <= arr_filter[214];
			arr_filter[214] <= arr_filter[213];
			arr_filter[213] <= arr_filter[212];
			arr_filter[212] <= arr_filter[211];
			arr_filter[211] <= arr_filter[210];
			arr_filter[210] <= arr_filter[209];
			arr_filter[209] <= arr_filter[208];
			arr_filter[208] <= arr_filter[207];
			arr_filter[207] <= arr_filter[206];
			arr_filter[206] <= arr_filter[205];
			arr_filter[205] <= arr_filter[204];
			arr_filter[204] <= arr_filter[203];
			arr_filter[203] <= arr_filter[202];
			arr_filter[202] <= arr_filter[201];
			arr_filter[201] <= arr_filter[200];
			arr_filter[200] <= arr_filter[199];
			arr_filter[199] <= arr_filter[198];
			arr_filter[198] <= arr_filter[197];
			arr_filter[197] <= arr_filter[196];
			arr_filter[196] <= arr_filter[195];
			arr_filter[195] <= arr_filter[194];
			arr_filter[194] <= arr_filter[193];
			arr_filter[193] <= arr_filter[192];
			arr_filter[192] <= arr_filter[191];
			arr_filter[191] <= arr_filter[190];
			arr_filter[190] <= arr_filter[189];
			arr_filter[189] <= arr_filter[188];
			arr_filter[188] <= arr_filter[187];
			arr_filter[187] <= arr_filter[186];
			arr_filter[186] <= arr_filter[185];
			arr_filter[185] <= arr_filter[184];
			arr_filter[184] <= arr_filter[183];
			arr_filter[183] <= arr_filter[182];
			arr_filter[182] <= arr_filter[181];
			arr_filter[181] <= arr_filter[180];
			arr_filter[180] <= arr_filter[179];
			arr_filter[179] <= arr_filter[178];
			arr_filter[178] <= arr_filter[177];
			arr_filter[177] <= arr_filter[176];
			arr_filter[176] <= arr_filter[175];
			arr_filter[175] <= arr_filter[174];
			arr_filter[174] <= arr_filter[173];
			arr_filter[173] <= arr_filter[172];
			arr_filter[172] <= arr_filter[171];
			arr_filter[171] <= arr_filter[170];
			arr_filter[170] <= arr_filter[169];
			arr_filter[169] <= arr_filter[168];
			arr_filter[168] <= arr_filter[167];
			arr_filter[167] <= arr_filter[166];
			arr_filter[166] <= arr_filter[165];
			arr_filter[165] <= arr_filter[164];
			arr_filter[164] <= arr_filter[163];
			arr_filter[163] <= arr_filter[162];
			arr_filter[162] <= arr_filter[161];
			arr_filter[161] <= arr_filter[160];
			arr_filter[160] <= arr_filter[159];
			arr_filter[159] <= arr_filter[158];
			arr_filter[158] <= arr_filter[157];
			arr_filter[157] <= arr_filter[156];
			arr_filter[156] <= arr_filter[155];
			arr_filter[155] <= arr_filter[154];
			arr_filter[154] <= arr_filter[153];
			arr_filter[153] <= arr_filter[152];
			arr_filter[152] <= arr_filter[151];
			arr_filter[151] <= arr_filter[150];
			arr_filter[150] <= arr_filter[149];
			arr_filter[149] <= arr_filter[148];
			arr_filter[148] <= arr_filter[147];
			arr_filter[147] <= arr_filter[146];
			arr_filter[146] <= arr_filter[145];
			arr_filter[145] <= arr_filter[144];
			arr_filter[144] <= arr_filter[143];
			arr_filter[143] <= arr_filter[142];
			arr_filter[142] <= arr_filter[141];
			arr_filter[141] <= arr_filter[140];
			arr_filter[140] <= arr_filter[139];
			arr_filter[139] <= arr_filter[138];
			arr_filter[138] <= arr_filter[137];
			arr_filter[137] <= arr_filter[136];
			arr_filter[136] <= arr_filter[135];
			arr_filter[135] <= arr_filter[134];
			arr_filter[134] <= arr_filter[133];
			arr_filter[133] <= arr_filter[132];
			arr_filter[132] <= arr_filter[131];
			arr_filter[131] <= arr_filter[130];
			arr_filter[130] <= arr_filter[129];
			arr_filter[129] <= arr_filter[128];
			arr_filter[128] <= arr_filter[127];
			arr_filter[127] <= arr_filter[126];
			arr_filter[126] <= arr_filter[125];
			arr_filter[125] <= arr_filter[124];
			arr_filter[124] <= arr_filter[123];
			arr_filter[123] <= arr_filter[122];
			arr_filter[122] <= arr_filter[121];
			arr_filter[121] <= arr_filter[120];
			arr_filter[120] <= arr_filter[119];
			arr_filter[119] <= arr_filter[118];
			arr_filter[118] <= arr_filter[117];
			arr_filter[117] <= arr_filter[116];
			arr_filter[116] <= arr_filter[115];
			arr_filter[115] <= arr_filter[114];
			arr_filter[114] <= arr_filter[113];
			arr_filter[113] <= arr_filter[112];
			arr_filter[112] <= arr_filter[111];
			arr_filter[111] <= arr_filter[110];
			arr_filter[110] <= arr_filter[109];
			arr_filter[109] <= arr_filter[108];
			arr_filter[108] <= arr_filter[107];
			arr_filter[107] <= arr_filter[106];
			arr_filter[106] <= arr_filter[105];
			arr_filter[105] <= arr_filter[104];
			arr_filter[104] <= arr_filter[103];
			arr_filter[103] <= arr_filter[102];
			arr_filter[102] <= arr_filter[101];
			arr_filter[101] <= arr_filter[100];
			arr_filter[100] <= arr_filter[99];
			arr_filter[99] <= arr_filter[98];
			arr_filter[98] <= arr_filter[97];
			arr_filter[97] <= arr_filter[96];
			arr_filter[96] <= arr_filter[95];
			arr_filter[95] <= arr_filter[94];
			arr_filter[94] <= arr_filter[93];
			arr_filter[93] <= arr_filter[92];
			arr_filter[92] <= arr_filter[91];
			arr_filter[91] <= arr_filter[90];
			arr_filter[90] <= arr_filter[89];
			arr_filter[89] <= arr_filter[88];
			arr_filter[88] <= arr_filter[87];
			arr_filter[87] <= arr_filter[86];
			arr_filter[86] <= arr_filter[85];
			arr_filter[85] <= arr_filter[84];
			arr_filter[84] <= arr_filter[83];
			arr_filter[83] <= arr_filter[82];
			arr_filter[82] <= arr_filter[81];
			arr_filter[81] <= arr_filter[80];
			arr_filter[80] <= arr_filter[79];
			arr_filter[79] <= arr_filter[78];
			arr_filter[78] <= arr_filter[77];
			arr_filter[77] <= arr_filter[76];
			arr_filter[76] <= arr_filter[75];
			arr_filter[75] <= arr_filter[74];
			arr_filter[74] <= arr_filter[73];
			arr_filter[73] <= arr_filter[72];
			arr_filter[72] <= arr_filter[71];
			arr_filter[71] <= arr_filter[70];
			arr_filter[70] <= arr_filter[69];
			arr_filter[69] <= arr_filter[68];
			arr_filter[68] <= arr_filter[67];
			arr_filter[67] <= arr_filter[66];
			arr_filter[66] <= arr_filter[65];
			arr_filter[65] <= arr_filter[64];
			arr_filter[64] <= arr_filter[63];
			arr_filter[63] <= arr_filter[62];
			arr_filter[62] <= arr_filter[61];
			arr_filter[61] <= arr_filter[60];
			arr_filter[60] <= arr_filter[59];
			arr_filter[59] <= arr_filter[58];
			arr_filter[58] <= arr_filter[57];
			arr_filter[57] <= arr_filter[56];
			arr_filter[56] <= arr_filter[55];
			arr_filter[55] <= arr_filter[54];
			arr_filter[54] <= arr_filter[53];
			arr_filter[53] <= arr_filter[52];
			arr_filter[52] <= arr_filter[51];
			arr_filter[51] <= arr_filter[50];
			arr_filter[50] <= arr_filter[49];
			arr_filter[49] <= arr_filter[48];
			arr_filter[48] <= arr_filter[47];
			arr_filter[47] <= arr_filter[46];
			arr_filter[46] <= arr_filter[45];
			arr_filter[45] <= arr_filter[44];
			arr_filter[44] <= arr_filter[43];
			arr_filter[43] <= arr_filter[42];
			arr_filter[42] <= arr_filter[41];
			arr_filter[41] <= arr_filter[40];
			arr_filter[40] <= arr_filter[39];
			arr_filter[39] <= arr_filter[38];
			arr_filter[38] <= arr_filter[37];
			arr_filter[37] <= arr_filter[36];
			arr_filter[36] <= arr_filter[35];
			arr_filter[35] <= arr_filter[34];
			arr_filter[34] <= arr_filter[33];
			arr_filter[33] <= arr_filter[32];
			arr_filter[32] <= arr_filter[31];
			arr_filter[31] <= arr_filter[30];
			arr_filter[30] <= arr_filter[29];
			arr_filter[29] <= arr_filter[28];
			arr_filter[28] <= arr_filter[27];
			arr_filter[27] <= arr_filter[26];
			arr_filter[26] <= arr_filter[25];
			arr_filter[25] <= arr_filter[24];
			arr_filter[24] <= arr_filter[23];
			arr_filter[23] <= arr_filter[22];
			arr_filter[22] <= arr_filter[21];
			arr_filter[21] <= arr_filter[20];
			arr_filter[20] <= arr_filter[19];
			arr_filter[19] <= arr_filter[18];
			arr_filter[18] <= arr_filter[17];
			arr_filter[17] <= arr_filter[16];
			arr_filter[16] <= arr_filter[15];
			arr_filter[15] <= arr_filter[14];
			arr_filter[14] <= arr_filter[13];
			arr_filter[13] <= arr_filter[12];
			arr_filter[12] <= arr_filter[11];
			arr_filter[11] <= arr_filter[10];
			arr_filter[10] <= arr_filter[9];
			arr_filter[9] <= arr_filter[8];
			arr_filter[8] <= arr_filter[7];
			arr_filter[7] <= arr_filter[6];
			arr_filter[6] <= arr_filter[5];
			arr_filter[5] <= arr_filter[4];
			arr_filter[4] <= arr_filter[3];
			arr_filter[3] <= arr_filter[2];
			arr_filter[2] <= arr_filter[1];
			arr_filter[1] <= arr_filter[0];	
			arr_filter[0] <= data_in[0];	
		end		
	
		/////////////////////// chua toi uu ///////////////////////////
/*
always@(posedge clk or posedge rst_n)
	begin	
	if(rst_n == 0) 
		begin
			for(I=1919;I>=0;I=I-1)
				begin
				arr_filter[I] <= 0;
				end
		end
	else 
	if(start_input == 0)
		begin 
			for(I=1919;I>0;I=I-1)
				begin
				arr_filter[I] <= arr_filter[I-1];
				end
				arr_filter[0] <= data_in[0];	
		end
	else 
		begin
			for(I=1919;I>=0;I=I-1)
				begin
				arr_filter[I] <= 0;
				end
		end
		
	end
*/	
	
/////////////////////////////////////////// ket thuc day thanh ghi //////////////////////////////////  
 
 
 
/////////////////////////////////////////// dem so bit = 1 trong 3 hang /////////////////////////////
/////////////////////////////////////////// su dung mach to hop /////////////////////////////////////
reg 	n0,n1,n2,n3;
reg  	m0,m1,m2,m3;
reg	l0,l1,l2,l3;

/*
	...0 = 0 -> ko co bit nao 			= 0
		 = 1 -> 000
		 
	...1 = 0 -> ko phai 1 trong 3 bit 	= 1
		 = 1 -> 001 010 101
		 
	...2 = 0 -> ko phai 2 trong 3 bit 	= 1
		 = 1 -> 110 101 011
	
	...3 = 0 -> ko phai ca 3 bit	 	= 1
		 = 1 -> 111
*/
always@(posedge clk)
	begin
  m0 = arr_filter[0] 		|	arr_filter[1]		|	arr_filter[2]  	;
  n0 = arr_filter[641] 		|	arr_filter[642] 	|	arr_filter[640]	;
  l0 = arr_filter[1280] 	|	arr_filter[1281] 	|	arr_filter[1282];

  m1 = arr_filter[0]&(~arr_filter[1])&(~arr_filter[2])				|	arr_filter[1]&(~arr_filter[2])&(~arr_filter[0])				|	arr_filter[2]&(~arr_filter[1])&(~arr_filter[0]);
  n1 = arr_filter[640]&(~arr_filter[641])&(~arr_filter[642])		|	arr_filter[641]&(~arr_filter[642])&(~arr_filter[640])		|	arr_filter[642]&(~arr_filter[641])&(~arr_filter[640]);
  l1 = arr_filter[1280]&(~arr_filter[1281])&(~arr_filter[1282])	|	arr_filter[1281]&(~arr_filter[1282])&(~arr_filter[1280])	|	arr_filter[1282]&(~arr_filter[1281])&(~arr_filter[1280]);

  m2 = arr_filter[0]&arr_filter[1]&(~arr_filter[2])				|	arr_filter[1]&arr_filter[2]&(~arr_filter[0])				|	arr_filter[2]&arr_filter[1]&(~arr_filter[0]);
  n2 = arr_filter[640]&arr_filter[641]&(~arr_filter[642])			|	arr_filter[641]&arr_filter[642]&(~arr_filter[640])			|	arr_filter[642]&arr_filter[641]&(~arr_filter[640]);
  l2 = arr_filter[1280]&arr_filter[1281]&(~arr_filter[1282])		|	arr_filter[1281]&arr_filter[1282]&(~arr_filter[1280])		|	arr_filter[1282]&arr_filter[1281]&(~arr_filter[1280]);

  m3 = arr_filter[0] 		&	arr_filter[1]		&	arr_filter[2]  	;
  n3 = arr_filter[641] 	&	arr_filter[642] 	&	arr_filter[640]	;
  l3 = arr_filter[1280] 	&	arr_filter[1281] 	&	arr_filter[1282];
	end
/* cac truong hop median ra 1
333 (9)		-> M3 N3 L3		

332 (8)		-> M3 N3 L2			M3 N2 L3 		M2 N3 L3

331 (7)		-> M3 N3 L1			M3 N1 L3 		M1 N3 L3
223 (7)		-> M3 N2 L2			M2 N3 L2 		M2 N2 L3

330 (6)		-> M3 N3 L0			M3 N0 L3 		M0 N3 L3
222 (6)		-> M2 N2 L2			

221	(5)		-> M1 N2 L2			M2 N1 L2 		M2 N2 L1
113 (5)		-> M3 N1 L1			M1 N3 L1 		M1 N1 L3
*/
reg d333,d332,d331,d330;
reg d223,d222,d221;
reg d113;
always@(posedge clk)
	begin
  d333 = m3&n3&l3;							//9

  d332 = m3&n3&l2 | m3&n2&l3 | m2&n3&l3;	//8

  d331 = m3&n3&l1 | m3&n1&l3 | m1&n3&l3;	//7
  d223 = m3&n2&l2 | m2&n3&l2 | m2&n2&l3;

  d330 = m3&n3&l0 | m3&n0&l3 | m0&n3&l3;	//6
  d222 = m2&n2&l2;

  d221 = m1&n2&l2 | m2&n1&l2 | m2&n2&l1;	//5
  d113 = m3&n1&l1 | m1&n3&l1 | m1&n1&l3;
	end
reg choose;
always@(posedge clk)
	begin
  choose = d333 | d332 | d331 | d223 | d330 | d222 | d221 | d113;
	end
////////////////////////////////// ket thuc tin hieu chon trong median //////////////////////////////

/////////////////////////////////////////// median///////////////////////////////////////////////////

reg nor_signal_2;
always@(posedge clk)
	begin
  nor_signal_2 = ~(rst_n | data_or_none);
	end
always@(posedge clk or posedge nor_signal_2)
	begin
	if(nor_signal_2 == 0) 	
		begin 
			data_out 	= 8'd0;
		end
	else 	 
	if(choose == 0)
		begin 
			data_out	= 8'd0;
		end
	else
		begin
			data_out 	= 8'd255;
		end
	end

//////////////// chua toi uu /////////////
/*
always@(posedge clk or posedge rst_n)
	begin
	if(rst_n == 0) 	
		begin 
			result 		<= 0;
		end
	else 
	if(data_or_none == 0)
		begin
			result 		<= 0;
		end
	else 
	if(data_or_none == 1)
		begin 
		
		... 
		end
*/		
  
/////////////////////////////////////////// end median ///////////////////////////////////////////////
 
endmodule
