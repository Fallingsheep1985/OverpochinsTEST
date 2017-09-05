class MyRscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	sizeEx = 0.02;
	text = "";
};
class RscDisplayTravel
{
   idd = TRAVEL_DIALOG;
   movingenable = 0;

   class Controls
   {	
		class RscBackground_5000: RscBackground
		{
		idc = 5000;
		colorBackground[] = {0,0,0,1};
		colorText[] = {1,1,1,1};
		x = 0.32375 * safezoneW + safezoneX;
		y = 0.3355 * safezoneH + safezoneY;
		w = 0.367188 * safezoneW;
		h = 0.3055 * safezoneH;
		};
		class RscFrame_1800: MyRscFrame
		{
		idc = 1800;
		colorBackground[] = {0,0,0,1};
		colorText[] = {1,1,1,1};
		x = 0.32375 * safezoneW + safezoneX;
		y = 0.3355 * safezoneH + safezoneY;
		w = 0.367188 * safezoneW;
		h = 0.3055 * safezoneH;
		};
		
		
		class travel_BTN1: RscButton
		{
		idc = 1600;
		text = "Sabina";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.5705 * safezoneH + safezoneY;
		w = 0.05875 * safezoneW;
		h = 0.0235 * safezoneH;
		action = "_nil=[]Spawn fnc_travel_Sabina";
		};
		class travel_BTN2: RscButton
		{
		idc = 1601;
		text = "Martin";
		x = 0.4 * safezoneW + safezoneX;
		y = 0.5705 * safezoneH + safezoneY;
		w = 0.05875 * safezoneW;
		h = 0.0235 * safezoneH;
		action = "_nil=[]Spawn fnc_travel_Martin";
		};
		class travel_BTN3: RscButton
		{
		idc = 1602;
		text = "Dalnogorsk";
		x = 0.5 * safezoneW + safezoneX;
		y = 0.5705 * safezoneH + safezoneY;
		w = 0.05875 * safezoneW;
		h = 0.0235 * safezoneH;
		action = "_nil=[]Spawn fnc_travel_Dalnogorsk";
		};
		class travel_BTN4: RscButton
		{
		idc = 1603;
		text = "Yaroslav";
		x = 0.6 * safezoneW + safezoneX;
		y = 0.5705 * safezoneH + safezoneY;
		w = 0.05875 * safezoneW;
		h = 0.0235 * safezoneH;
		action = "_nil=[]Spawn fnc_travel_Yaroslav";
		};
   };
};