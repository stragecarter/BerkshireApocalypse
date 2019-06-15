--[[

	Berkshire Apocalypse
	© Xendom Rayden

]]--

addEvent("Houses.openWindow",true)
addEventHandler("Houses.openWindow",root,function(owner,price)
	if(isWindowOpen())then
		if(owner == "Niemand")then text = "Buy" else text = "Sell" end
        BerkshireApocalypse.window[1] = guiCreateWindow(373, 336, 219, 126, "House", false)

        BerkshireApocalypse.label[1] = guiCreateLabel(10, 29, 199, 52, "Owner: "..owner.."\nPrice: "..price.."$", false, BerkshireApocalypse.window[1])
		guiSetFont(BerkshireApocalypse.label[1], "default-bold-small")
		guiLabelSetHorizontalAlign(BerkshireApocalypse.label[1], "center", false)
		guiLabelSetVerticalAlign(BerkshireApocalypse.label[1], "center")
        BerkshireApocalypse.button[1] = guiCreateButton(10, 91, 199, 25, text, false, BerkshireApocalypse.window[1])
		setWindowDatas("set");
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
			triggerServerEvent("Houses.buyOrSellHouse",localPlayer,guiGetText(source));
		end,false)
    end
end)