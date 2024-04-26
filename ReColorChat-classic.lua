--Local function to set the variables
local function loadSettings(self, event, ...)
	local function setChannels()
		-- API_GetChannelList
		local channels = { GetChannelList() }

		for i = 1, #channels, 3 do
			SetChatColorNameByClass("CHANNEL" .. channels[i], true)
		end
	end
    -- See API ChatTypeGroup
    for k, v in pairs(ChatTypeGroup) do
        SetChatColorNameByClass(k, true)
    end
	--waiting for chat to provide channel list
	C_Timer.After(15, setChannels)
end



--Create frame, needed for trigger & changing the variables.
local frame = CreateFrame("Frame")
--Trigger for event, entering the world in this case.
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
--Loads settings one the event is triggered.
frame:SetScript("OnEvent", loadSettings)
--Prints info (personal preference). If you check this code and don't want this, just remove it.
--print("Chat recolored")