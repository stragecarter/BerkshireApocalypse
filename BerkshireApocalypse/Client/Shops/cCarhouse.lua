--[[

	Berkshire Apocalypse
	© Xendom Rayden

]]--

Carhouse = {};

--// Buy
addEvent("Carhouse.openWindow",true)
addEventHandler("Carhouse.openWindow",root,function(price)
	if(isWindowOpen())then
        BerkshireApocalypse.window[1] = guiCreateWindow(517, 328, 303, 118, "Carhouse", false)

        BerkshireApocalypse.label[1] = guiCreateLabel(10, 30, 283, 34, "This vehicle costs $"..price..", do you wanna buy it?", false, BerkshireApocalypse.window[1])
        guiSetFont(BerkshireApocalypse.label[1], "default-bold-small")
        guiLabelSetHorizontalAlign(BerkshireApocalypse.label[1], "center", true)
        guiLabelSetVerticalAlign(BerkshireApocalypse.label[1], "center")
        BerkshireApocalypse.button[1] = guiCreateButton(10, 74, 283, 34, "Buy", false, BerkshireApocalypse.window[1])
		setWindowDatas("set");
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
			triggerServerEvent("Carhouse.buy",localPlayer);
		end,false)
    end
end)

--// Wang Cars Ped
addEvent("Carhouse.showInfobox",true)
addEventHandler("Carhouse.showInfobox",root,function()
	infobox("Get in a vehicle to buy it.",0,255,0);
end)

--// Player vehicles
bindKey("f5","down",function()
	if(isWindowOpen())then
        BerkshireApocalypse.window[1] = guiCreateWindow(522, 318, 415, 249, "Vehicles", false)

        BerkshireApocalypse.gridlist[1] = guiCreateGridList(9, 24, 289, 215, false, BerkshireApocalypse.window[1])
        VehicleID = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "ID", 0.5)
        Vehicle = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Vehicle", 0.5)
        BerkshireApocalypse.button[1] = guiCreateButton(308, 28, 97, 28, "Sell", false, BerkshireApocalypse.window[1])
        BerkshireApocalypse.button[2] = guiCreateButton(308, 66, 97, 28, "Locate", false, BerkshireApocalypse.window[1])
        BerkshireApocalypse.label[1] = guiCreateLabel(308, 104, 97, 135, "You'll don't get your money back, if you sell a vehicle.", false, BerkshireApocalypse.window[1])
        guiSetFont(BerkshireApocalypse.label[1], "default-bold-small")
        guiLabelSetHorizontalAlign(BerkshireApocalypse.label[1], "center", true)
		triggerServerEvent("Carhouse.getPlayerVehicles",localPlayer,localPlayer);
		setWindowDatas("set");
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
			local clicked = guiGridListGetItemText(BerkshireApocalypse.gridlist[1],guiGridListGetSelectedItem(BerkshireApocalypse.gridlist[1]),1);
			if(clicked ~= "")then
				triggerServerEvent("Carhouse.sell",localPlayer,clicked);
			end
		end,false)
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[2],function()
			local clicked = guiGridListGetItemText(BerkshireApocalypse.gridlist[1],guiGridListGetSelectedItem(BerkshireApocalypse.gridlist[1]),1);
			if(clicked ~= "")then
				triggerServerEvent("Carhouse.locate",localPlayer,clicked);
			end
		end,false)
    end
end)

addEvent("Carhouse.setPlayerVehicles",true)
addEventHandler("Carhouse.setPlayerVehicles",root,function(vehicles)
	guiGridListClear(BerkshireApocalypse.gridlist[1]);
	if(#vehicles >= 1)then
		for _,v in pairs(vehicles)do
			local row = guiGridListAddRow(BerkshireApocalypse.gridlist[1]);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,VehicleID,v[1],false,false);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,Vehicle,v[2],false,false);
		end
	end
end)

--// Locate blip
addEvent("Carhouse.locateBlip",true)
addEventHandler("Carhouse.locateBlip",root,function(x,y,z)
	infobox("Your vehicle will be showing as a red blip on the map for five minutes.",0,255,0);
	if(isElement(Carhouse.locateBlip))then destroyElement(Carhouse.locateBlip)end
	if(isTimer(Carhouse.locateBlip))then killTimer(Carhouse.locateBlip)end
	Carhouse.locateBlip = createBlip(x,y,z,0,2,255,0,0);
	Carhouse.locateBlipTimer = setTimer(function()
		destroyElement(Carhouse.locateBlipTimer);
	end,300000,1)
end)