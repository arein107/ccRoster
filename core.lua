



-- Contains the entire UI initialization of frames (no logic details yet)
WGE_UI = {};
WGE = {};
WGE_UI.IsLoaded = false;


clubID = "356932331"
clubInfo = C_Club.GetClubInfo(clubID)

--slash commands
SLASH_WGE1= "/wge"

members = {};
levels = {};
meminfo = {};



--is now just a test function

function getRoster()

	for _, member in pairs(C_Club.GetClubMembers(clubID)) do
		local memberInfo = C_Club.GetMemberInfo(clubID, member)


		local name = memberInfo.name
		local test = memberInfo.zone

		local strTest = tostring(test)
		
		local strName = tostring(name)

		print(strName)
		print(strTest)

	
	end	

end



-- gets the name and level of memberInfo

function getNameLevel()

	for _, member in pairs(C_Club.GetClubMembers(clubID)) do
		local memberInfo = C_Club.GetMemberInfo(clubID, member)


		local name = memberInfo.name
		local nameStr = tostring(name)


		table.insert(members, nameStr)

		local memberLevel = memberInfo.level
	
		local levelStr = tostring(memberLevel)
		
		table.insert(levels, levelStr)
		print(levelStr)

		table.insert(meminfo, {members, levels})

	end
end	



-----------------------------------------------------------------------------------------

									--WINDOWs --
-----------------------------------------------------------------------------------------
--Core Window Frame

frame = CreateFrame("Frame", nil, UIParent, "TooltipBorderedFrameTemplate")
frame:SetPoint("CENTER",UIParent)
frame:SetSize(230, 300)
frame:SetMovable(true)
frame:EnableMouse(true)--   Receive mouse events (Buttons automatically have this set)
frame:RegisterForDrag("LeftButton")--   Register left button for dragging1
frame:SetScript("OnDragStart",frame.StartMoving)--  Set script for drag start
frame:SetScript("OnDragStop",frame.StopMovingOrSizing)--    Set script for drag stop

----------------------------------------------------------------------------------------
--Title Window Frame

titleFrame = CreateFrame("Frame", nil, frame, "TooltipBorderedFrameTemplate")
titleFrame:SetPoint("TOP", frame, "TOP", 0, 35)
titleFrame:SetSize(230, 40)
-- titleFrame:SetMovable(true)
-- titleFrame:EnableMouse(true)--   Receive mouse events (Buttons automatically have this set)
-- titleFrame:RegisterForDrag("LeftButton")--   Register left button for dragging
-- titleFrame:SetScript("OnDragStart",frame.StartMoving)--  Set script for drag start
-- titleFrame:SetScript("OnDragStop",frame.StopMovingOrSizing)--    Set script for drag stop

----------------------------------------------------------------------------------------

--"Editbox" window frames

local coreFrame = CreateFrame("Frame", nil, frame,"TooltipBorderedFrameTemplate" )
	coreFrame:SetSize(420, 405)
	coreFrame:SetPoint("LEFT", frame, "CENTER",200,0)
	coreFrame:SetMovable(true)
	coreFrame:EnableMouse(true)--   Receive mouse events (Buttons automatically have this set)
	coreFrame:RegisterForDrag("LeftButton")--   Register left button for dragging
	coreFrame:SetScript("OnDragStart",frame.StartMoving)--  Set script for drag start
	coreFrame:SetScript("OnDragStop",frame.StopMovingOrSizing)--    Set script for drag stop


local coreFrameBackground = CreateFrame("Frame", nil, frame)
	coreFrameBackground:SetSize(410, 410)
	coreFrameBackground:SetPoint("CENTER", coreFrame, "CENTER",0,0)


local rosterTitleFrame = CreateFrame("Frame", nil, coreFrame, "TooltipBorderedFrameTemplate")
	rosterTitleFrame:SetPoint("TOP", coreFrame, "TOP", 0, 70)
	rosterTitleFrame:SetSize(420, 40)	


local memberBorder = CreateFrame("frame", nil, coreFrame, "TooltipBorderedFrameTemplate")
	memberBorder:SetPoint("CENTER", coreFrame, "TOP", 0, 15)
	memberBorder:SetSize(420, 40)	


local memberCountFrame = CreateFrame("Editbox", nil, memberBorder, "AnimatedShineTemplate")
	memberCountFrame:SetPoint("RIGHT", memberBorder, "CENTER", 0, 0)
	memberCountFrame:SetSize(210, 40)	
	memberCountFrame:SetAutoFocus(false)

local memberCountTitleFrame = CreateFrame("Editbox", nil, memberBorder, "AnimatedShineTemplate")
	memberCountTitleFrame:SetPoint("LEFT", memberBorder, "CENTER", 0, 0)
	memberCountTitleFrame:SetSize(210, 40)	
	memberCountTitleFrame:SetAutoFocus(false)

local scrollFrame = CreateFrame("ScrollFrame", nil, coreFrame, "UIPanelScrollFrameTemplate")
	scrollFrame:SetSize(390, 390)

	--this is dumb positioning, but it just looks weikrd otherwise idk
	scrollFrame:SetPoint("RIGHT", coreFrame, "RIGHT", -28, -2)


local editBoxFrame = CreateFrame("Editbox", nil, coreFrame)
		
		editBoxFrame:SetPoint("BOTTOM")
		editBoxFrame:SetSize(400,400)
		editBoxFrame:SetFontObject(Number18Font)
		editBoxFrame:SetAutoFocus(false)
		editBoxFrame:SetMultiLine(true)
		editBoxFrame:SetMaxLetters(1000001)
		editBoxFrame:SetTextInsets(20,20,20,20)
		-- editBoxFrame:SetJustifyV("CENTER")
		-- editBoxFrame:SetJustifyH("LEFT")
		scrollFrame:SetScrollChild(editBoxFrame)




	--this is a texture i may want to implement
	-- local t = editBoxFrame:CreateTexture(nil,"BACKGROUND")	
	-- 	t:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble")

	-- 	t:SetAllPoints(coreFrameBackground)
		
	-- 	-- t:SetPoint("CENTER", coreFrame, "CENTER", 0, 0)
	-- 	-- t:SetSize(400,400)
	-- 	editBoxFrame.texture = t





----------------------------------------------------------------------------------------
--										FONT STRINGS
----------------------------------------------------------------------------------------


coreFrameText = coreFrame:CreateFontString ( "coreFrameText" , "OVERLAY" , "GameFontNormalLarge" );
coreFrameText:SetPoint("CENTER", coreFrame, "CENTER", 0, 0)


titleFrameText = titleFrame:CreateFontString ( "titleFrameText" , "OVERLAY" , "GameFontNormalLarge" );
titleFrameText:SetPoint("CENTER", titleFrame, "CENTER", 0, 0)
titleFrameText:SetText("WGE Roster Manager")


rosterTitleFrameText = rosterTitleFrame:CreateFontString ( "rosterTitleFrameText" , "OVERLAY" , "GameFontNormalLarge" );
rosterTitleFrameText:SetPoint("CENTER", rosterTitleFrame, "CENTER", 0, 0)
rosterTitleFrameText:SetText("WINTERGRASP ENTHUSIASTS")

editBoxFrameText = editBoxFrame:CreateFontString("editBoxFrameText", "OVERLAY", "ChatFontNormal")
editBoxFrameText:SetPoint("CENTER", coreFrame, "CENTER", 20,0)
--editBoxFrameText:SetText("EDIT BOX")

memberCountFrameText = memberCountFrame:CreateFontString ( "memberCountFrameText" , "OVERLAY" , "GameFontNormal" );
memberCountFrameText:SetPoint("LEFT", memberCountFrame, "LEFT", 15, 0)
memberCountFrameText:SetText(date())

memberCountTitleFrameText = memberCountTitleFrame:CreateFontString ( "memberCountTitleFrameText" , "OVERLAY" , "GameFontNormal" );
memberCountTitleFrameText:SetPoint("RIGHT", memberCountTitleFrame, "RIGHT", -15, 0)
memberCountTitleFrameText:SetText("")







-----------------------------------------------------------------------------------------

									--BUTTONS! -- (no mraaaaz :( )
-----------------------------------------------------------------------------------------

--get roster button

local getButton = CreateFrame("Button", "getButton", frame, "SharedGoldRedButtonLargeTemplate")

getButton:SetSize(200 ,45) -- width, height
getButton:SetText("Get Roster")
getButton:SetPoint("TOP", frame, "TOP", 0,-20)
getButton:SetAttribute("type","macro")


getButton:SetScript("OnClick", function()

	clubInfo = C_Club.GetClubInfo(clubID)

	getRoster()


	local memberCount = clubInfo.memberCount


	memberCountTitleFrameText:SetText(memberCount)

	getNameLevel()



	local testString = ""

	for i, line in ipairs(meminfo) do 

		if members[i] == "nil"

			then testString = testString

		else

		 testString = testString.."\n" .. "[ " .. levels[i] .. " ]" .. " " ..members[i]

		end
	end


	editBoxFrame:SetText(tostring(testString))

end)



--export roster button


local exportButton = CreateFrame("Button", "exportButton", frame, "SharedGoldRedButtonLargeTemplate")

exportButton:SetSize(200 ,45) -- width, height
exportButton:SetText("Export Roster")
exportButton:SetPoint("CENTER", frame, "CENTER", 0, 0)
exportButton:SetAttribute("type","macro")
exportButton:SetScript("OnClick", function()


	getNameLevel()

	local rosterString = ""

	for j, line in ipairs(members) do 

		if members[j] == "nil"

			then rosterString = rosterString

		else

		 rosterString = rosterString.."\n" ..members[j]

		end
	end


	editBoxFrame:SetText(tostring(rosterString))
	editBoxFrame:HighlightText(1)
	
end)



--exit button


local exitButton = CreateFrame("Button", "exitButton", frame, "SharedGoldRedButtonLargeTemplate")

exitButton:SetSize(200 ,45) -- width, height
exitButton:SetText("Exit")
exitButton:SetPoint("BOTTOM", frame, "BOTTOM", 0, 20)
exitButton:SetAttribute("type","macro")
exitButton:SetScript("OnClick", function()

	frame:Hide()
	titleFrame:Hide()

end)



-----------------------------------------------------------------------------------------

									--SLASH COMMANDS --
-----------------------------------------------------------------------------------------

SlashCmdList["WGE"] = function (input)

	if input == "" then
		titleFrame:Show()
		frame:Show()
	end

	if input == "hide" then
		titleFrame:Hide()
		frame:Hide()
	end

	if input == "test" then
		print("just a test :)")
		
	end

	if input == "list" then
			for _, member in pairs(C_Club.GetClubMembers(clubID)) do
		local memberInfo = C_Club.GetMemberInfo(clubID, member)
		print(memberInfo.name)
end
	
	end

end
-----------------------------------------------------------------------------------------

					-- MAY NEED TO IMPLEMENT
-----------------------------------------------------------------------------------------


--exportButtonLogic = function()


