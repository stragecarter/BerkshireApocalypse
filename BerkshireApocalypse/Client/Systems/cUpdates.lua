--[[

	Berkshire Apocalypse
	© Xendom Rayden

]]--

addEvent("Updates.createWindow",true)
addEventHandler("Updates.createWindow",root,function()
	if(isWindowOpen())then
        BerkshireApocalypse.window[1] = guiCreateWindow(655, 317, 334, 337, "Updates", false)

        BerkshireApocalypse.memo[1] = guiCreateMemo(10, 29, 314, 298, "Update v.1.0.6 Update (05.06.2019)\n- Teammitglieder koennen nun mit /o oeffentlich und mit /a intern schreiben.\n- Ist man in einem Team, können Mitglieder von diesem nun ebenfalls die Fahrzeuge von einem selbst fahren.\n- Mit dem Befehl /admincommands koennen Teammitglieder nun einsehen, welche Befehle sie nutzen koennen.\n\nv.1.0.5 (04.06.2019)\n- /park gefixt\n- Die Privatfahrzeuge eines Spielers werden nun erst erstellt, wenn dieser sich einloggt.\n- Haussystem (Infos im Hilfemenue)\n\nv.1.0.4 (02.06.2019)\n\n- Teammitglieder haben im Scoreboard nun das [BA] Clantag vor ihrem Namen\n- Das Team eines Spielers wird nun im Scoreboard angezeigt\n- Newssystem hinzugefuegt\n- Teamchat hinzugefuegt (per y oder /t [Text])\n- Die Waffenshops und das Wang Cars wird nun auf der Karte angezeigt\n- Es erscheint nun eine Infobox, wenn man eine Waffe kauft\n- Ab sofort findet taeglich von 20:00 - 21:00 Uhr eine Happy-Hour statt, in welcher alle Spieler doppelte Erfahrungspunkte und doppeltes Geld erhalten\n- Bei Spielern mit einem aktiven Premiumstatus besteht nun die Moeglichkeit, dass diese beim Einsammeln eines Bonuspunktes zwei bekommen (Chance 1:4)\n- Mit /pay kann nun Geld an andere Spieler weitergegeben werden\n\nv.1.0.2 (13.02.2019)\n\n- Neue Infobox.\n- Neue GUI-Klasse\n- Allgemeines Design von Fenstern verbessert.\n- Weitere Waffen im Waffenladen.\n- Das komplette Spendensystem wurde entfernt.\n-Die Sprache Deutsch wurde entfernt - Das Script ist nun komplett auf Englisch.\n- Gedroppte Sachen können nicht mehr in einem Fahrzeug eingesammelt werden.\n- Die Schutzzone 'Chicken Valley' wurde hinzugefügt.\n- Mit einem aktiven Premiumstatus kann man sich nun in andere Schutzzonen teleportieren.\nNeues Nametag für Peds.\n- Einige kleinere Fehler wurden behoben.\n- Spieler mit einem aktiven Premiumstatus werden im Scoreboard nun hervorgehoben.\n- Neues Scoreboard.\n- Neues Inventar - Nun mit Scrollfunktion, damit unbegrenzt neue Items hinzugefügt werden können.\n- Verbesserung des Achievementsystem und einige neue Achievements.\nMit /admins kann man nun alle Teammitglieder einsehen.", false, BerkshireApocalypse.window[1])
        guiMemoSetReadOnly(BerkshireApocalypse.memo[1], true)
		setWindowDatas("set");
	end
end)