local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = game:GetService("CorePackages")
local Players = game:GetService("Players")
local StatsService = game:GetService("Stats")
local CoreGui = game:GetService("CoreGui")
local ConstantsModule = require(CoreGui.RobloxGui.Modules.EmotesMenu.Constants)
local MaybeSendEmoteFailureAnalyticsFromPlayerModule = require(CoreGui.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer)
while Players.LocalPlayer == nil do
	wait()
end
local LocalPlayer = Players.LocalPlayer

local function reportEmoteUsed(EmoteFromEquippedEmote) --[[ Line: 30 ]]
	-- upvalues: RbxAnalyticsService (copy), LocalPlayer (copy), StatsService (copy)
	RbxAnalyticsService:SetRBXEventStream("client", "chat", "emoteTriggered", {
		pid = tostring(game.PlaceId),
		uid = tostring(LocalPlayer.UserId),
		btid = StatsService:GetBrowserTrackerId(),
		assetID = if EmoteFromEquippedEmote.AssetId then tostring(EmoteFromEquippedEmote.AssetId) else nil,
		slotNumber = if EmoteFromEquippedEmote.Slot then tostring(EmoteFromEquippedEmote.Slot) else nil
	})
end

local function reportEmoteFailed(ErrorType, EmoteFromEquippedEmote) --[[ Line: 40 ]]
	-- upvalues: RbxAnalyticsService (copy), LocalPlayer (copy), StatsService (copy)
	RbxAnalyticsService:SendEventDeferred("client", "chat", "emoteTriggerFailed", {
		invokedByCoreGui = false,
		pid = tostring(game.PlaceId),
		uid = tostring(LocalPlayer.UserId),
		btid = StatsService:GetBrowserTrackerId(),
		assetID = if EmoteFromEquippedEmote and EmoteFromEquippedEmote.AssetId then tostring(EmoteFromEquippedEmote.AssetId) else nil,
		slotNumber = if EmoteFromEquippedEmote and EmoteFromEquippedEmote.Slot then tostring(EmoteFromEquippedEmote.Slot) else nil,
		errorType = ErrorType
	})
end

local function _(Player) --[[ Line: 52 | Named "getHumanoidFromPlayer" ]]
	local Character = Player.Character
	
	return if Character then Character:FindFirstChildOfClass("Humanoid") else nil
end

local _ = function(Player) --[[ Line: 61 | Named "getHumanoidDescriptionFromPlayer" ]]
	local Character = Player.Character
	local Humanoid = if Character then Character:FindFirstChildOfClass("Humanoid") else nil
	
	return if Humanoid then Humanoid:FindFirstChildOfClass("HumanoidDescription") else nil
end

local _ = function(Text: string) --[[ Line: 70 | Named "getEmoteFromMessage" ]]
	return if string.sub(Text, 1, 3) == "/e " then string.sub(Text, 4):lower() elseif string.sub(Text, 1, 7) == "/emote " then string.sub(Text, 8):lower() else nil
end

local _ = function(HumanoidDescription, Slot) --[[ Line: 80 | Named "getEquippedEmoteFromSlot" ]]
	for _, equippedEmote in ipairs((HumanoidDescription:GetEquippedEmotes())) do
		if equippedEmote.Slot == Slot then
			return equippedEmote
		end
	end
	return nil
end

local function getEmoteFromEquippedEmote(HumanoidDescription, EmoteFromEquippedEmote) --[[ Line: 91 ]]
	for Name, emote in pairs((HumanoidDescription:GetEmotes())) do
		if string.lower(EmoteFromEquippedEmote.Name) == string.lower(Name) then
			return {
				Name = Name,
				Slot = EmoteFromEquippedEmote.Slot,
				AssetId = emote[1]
			}
		end
	end
	return nil
end

local function getEmoteFromName(HumanoidDescription, Text: string) --[[ Line: 106 ]]
	for Name, emote in pairs((HumanoidDescription:GetEmotes())) do
		if string.lower(Text) == string.lower(Name) then
			return { Slot = nil, Name = Name, AssetId = emote[1] }
		end
	end
	return nil
end

local _ = function(HumanoidDescription, p1) --[[ Line: 121 | Named "getEmoteUsed" ]]
	-- upvalues: getEmoteFromEquippedEmote (copy), getEmoteFromName (copy)
	local Number: number? = tonumber(p1)
	
	if not Number then
		return (getEmoteFromName(HumanoidDescription, p1))
	end
	local v1 = nil
	
	for _, equippedEmote in ipairs((HumanoidDescription:GetEquippedEmotes())) do
		if equippedEmote.Slot == Number then
			v1 = equippedEmote
			break
		end
	end
	if v1 then
		return (getEmoteFromEquippedEmote(HumanoidDescription, v1))
	else
		return nil
	end
end

local config = {
	wave = { R6 = 128777973, R15 = 507770239 },
	point = { R6 = 128853357, R15 = 507770453 },
	dance = { R6 = 182435998, R15 = 507771019 },
	dance2 = { R6 = 182436842, R15 = 507776043 },
	dance3 = { R6 = 182436935, R15 = 507777268 },
	laugh = { R6 = 129423131, R15 = 507770818 },
	cheer = { R6 = 129423030, R15 = 507770677 }
}

local _ = function(Humanoid, Name, p2) --[[ Line: 166 | Named "getLegacyEmoteUsed" ]]
	local IsRigTypeMatch = Humanoid.RigType == Enum.HumanoidRigType.R15
	
	return {
		Slot = nil,
		Name = Name,
		AssetId = if IsRigTypeMatch then p2.R15 else p2.R6
	}
end

LocalPlayer.Chatted:Connect(function(Text: string, _) --[[ Line: 175 ]]
	-- upvalues: config (copy), LocalPlayer (copy), getEmoteFromEquippedEmote (copy), getEmoteFromName (copy), reportEmoteUsed (copy), MaybeSendEmoteFailureAnalyticsFromPlayerModule (copy), reportEmoteFailed (copy), ConstantsModule (copy), RbxAnalyticsService (copy), StatsService (copy)
	local Lowered = if string.sub(Text, 1, 3) == "/e " then string.sub(Text, 4):lower() elseif string.sub(Text, 1, 7) == "/emote " then string.sub(Text, 8):lower() else nil
	
	if Lowered then
		local v2 = nil
		local Entry = config[Lowered]
		
		if Entry then
			local Character = LocalPlayer.Character
			local Humanoid = if Character then Character:FindFirstChildOfClass("Humanoid") else nil
			
			if Humanoid then
				local IsRigTypeMatch = Humanoid.RigType == Enum.HumanoidRigType.R15
				v2 = {
					Slot = nil,
					Name = Lowered,
					AssetId = if IsRigTypeMatch then Entry.R15 else Entry.R6
				}
			end
		else
			local Character = LocalPlayer.Character
			local Humanoid1 = if Character then Character:FindFirstChildOfClass("Humanoid") else nil
			local HumanoidDescription = if Humanoid1 then Humanoid1:FindFirstChildOfClass("HumanoidDescription") else nil
			
			if HumanoidDescription then
				local Number: number? = tonumber(Lowered)
				
				if Number then
					local v3 = nil
					
					for _, equippedEmote in ipairs((HumanoidDescription:GetEquippedEmotes())) do
						if equippedEmote.Slot == Number then
							v3 = equippedEmote
							break
						end
					end
					v2 = if v3 then getEmoteFromEquippedEmote(HumanoidDescription, v3) else nil
				else
					v2 = getEmoteFromName(HumanoidDescription, Lowered)
				end
			end
		end
		if v2 then
			reportEmoteUsed(v2)
			MaybeSendEmoteFailureAnalyticsFromPlayerModule(LocalPlayer, function(ErrorType) --[[ Line: 195 ]]
				-- upvalues: reportEmoteFailed (upval), v2 (ref)
				reportEmoteFailed(ErrorType, v2)
			end)
		else
			RbxAnalyticsService:SendEventDeferred("client", "chat", "emoteTriggerFailed", {
				assetID = nil,
				slotNumber = nil,
				invokedByCoreGui = false,
				pid = tostring(game.PlaceId),
				uid = tostring(LocalPlayer.UserId),
				btid = StatsService:GetBrowserTrackerId(),
				errorType = ConstantsModule.ErrorTypes.NoMatchingEmote
			})
		end
	end
end)