local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local statsService = game:GetService("Stats")
local coreGuiService = game:GetService("CoreGui")
local constantsModule = require(coreGuiService.RobloxGui.Modules.EmotesMenu.Constants)
local maybeSendEmoteFailureAnalyticsFromPlayerModule = require(coreGuiService.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer)
while playersService.LocalPlayer == nil do
	wait()
end
local localPlayer = playersService.LocalPlayer

local function reportEmoteUsed(p0)
	-- upvalues: rbxAnalyticsService (ref), localPlayer (ref), statsService (ref)
	rbxAnalyticsService:SetRBXEventStream("client", "chat", "emoteTriggered", {
		pid = tostring(game.PlaceId),
		uid = tostring(localPlayer.UserId),
		btid = statsService:GetBrowserTrackerId(),
		assetID = if p0.AssetId then tostring(p0.AssetId) else nil,
		slotNumber = if p0.Slot then tostring(p0.Slot) else nil
	})
end

local function reportEmoteFailed(p1, p2)
	-- upvalues: rbxAnalyticsService (ref), localPlayer (ref), statsService (ref)
	rbxAnalyticsService:SendEventDeferred("client", "chat", "emoteTriggerFailed", {
		invokedByCoreGui = false,
		pid = tostring(game.PlaceId),
		uid = tostring(localPlayer.UserId),
		btid = statsService:GetBrowserTrackerId(),
		assetID = if p2 and p2.AssetId then tostring(p2.AssetId) else nil,
		slotNumber = if p2 and p2.Slot then tostring(p2.Slot) else nil,
		errorType = p1
	})
end

local function _(p3)
	local character = p3.Character
	
	return if character then character:FindFirstChildOfClass("Humanoid") else nil
end

local _ = function(p4)
	local character = p4.Character
	local var11 = if character then character:FindFirstChildOfClass("Humanoid") else nil
	
	return if var11 then var11:FindFirstChildOfClass("HumanoidDescription") else nil
end

local _ = function(p5)
	return if string.sub(p5, 1, 3) == "/e " then string.sub(p5, 4):lower() elseif string.sub(p5, 1, 7) == "/emote " then string.sub(p5, 8):lower() else nil
end

local _ = function(p6, p7)
	for i, v in ipairs(p6:GetEquippedEmotes()) do
		if v.Slot == p7 then
			return v
		end
	end
	return nil
end

local function getEmoteFromEquippedEmote(p8, p9)
	for i, v in pairs(p8:GetEmotes()) do
		if string.lower(p9.Name) == string.lower(i) then
			return { Name = i, Slot = p9.Slot, AssetId = v[1] }
		end
	end
	return nil
end

local function getEmoteFromName(p10, p11)
	for i, v in pairs(p10:GetEmotes()) do
		if string.lower(p11) == string.lower(i) then
			return { Slot = nil, Name = i, AssetId = v[1] }
		end
	end
	return nil
end

local _ = function(p12, p13)
	-- upvalues: getEmoteFromEquippedEmote (ref), getEmoteFromName (ref)
	local var12 = tonumber(p13)
	
	if not var12 then
		return getEmoteFromName(p12, p13)
	end
	local var13
	for i, v in ipairs(p12:GetEquippedEmotes()) do
		if v.Slot == var12 then
			var13 = v
			return if var13 then getEmoteFromEquippedEmote(p12, var13) else nil
		end
	end
	var13 = nil
end

local t = {
	wave = { R6 = 128777973, R15 = 507770239 },
	point = { R6 = 128853357, R15 = 507770453 },
	dance = { R6 = 182435998, R15 = 507771019 },
	dance2 = { R6 = 182436842, R15 = 507776043 },
	dance3 = { R6 = 182436935, R15 = 507777268 },
	laugh = { R6 = 129423131, R15 = 507770818 },
	cheer = { R6 = 129423030, R15 = 507770677 }
}

local _ = function(p14, p15, p16)
	return {
		Slot = nil,
		Name = p15,
		AssetId = if p14.RigType == Enum.HumanoidRigType.R15 then p16.R15 else p16.R6
	}
end

localPlayer.Chatted:Connect(function(p17, _)
	-- upvalues: t (ref), localPlayer (ref), getEmoteFromEquippedEmote (ref), getEmoteFromName (ref), reportEmoteUsed (ref), maybeSendEmoteFailureAnalyticsFromPlayerModule (ref), reportEmoteFailed (ref), constantsModule (ref), rbxAnalyticsService (ref), statsService (ref)
	local var14 = if string.sub(p17, 1, 3) == "/e " then string.sub(p17, 4):lower() elseif string.sub(p17, 1, 7) == "/emote " then string.sub(p17, 8):lower() else nil
	
	if var14 then
		local var15 = nil
		local var16 = t[var14]
		
		if var16 then
			local character = localPlayer.Character
			local var17 = if character then character:FindFirstChildOfClass("Humanoid") else nil
			
			if var17 then
				var15 = {
					Slot = nil,
					Name = var14,
					AssetId = if var17.RigType == Enum.HumanoidRigType.R15 then var16.R15 else var16.R6
				}
			end
		else
			local character = localPlayer.Character
			local var18 = if character then character:FindFirstChildOfClass("Humanoid") else nil
			local var19 = if var18 then var18:FindFirstChildOfClass("HumanoidDescription") else nil
			
			if var19 then
				local var20 = tonumber(var14)
				
				if var20 then
					local var21
					for i, v in ipairs(var19:GetEquippedEmotes()) do
						if v.Slot == var20 then
							var21 = v
							var15 = if var21 then getEmoteFromEquippedEmote(var19, var21) else nil
						end
					end
					var21 = nil
				else
					var15 = getEmoteFromName(var19, var14)
				end
			end
		end
		if var15 then
			reportEmoteUsed(var15)
			maybeSendEmoteFailureAnalyticsFromPlayerModule(localPlayer, function(p18)
				-- upvalues: reportEmoteFailed (copy), var15 (write)
				reportEmoteFailed(p18, var15)
			end)
		else
			rbxAnalyticsService:SendEventDeferred("client", "chat", "emoteTriggerFailed", {
				assetID = nil,
				slotNumber = nil,
				invokedByCoreGui = false,
				pid = tostring(game.PlaceId),
				uid = tostring(localPlayer.UserId),
				btid = statsService:GetBrowserTrackerId(),
				errorType = constantsModule.ErrorTypes.NoMatchingEmote
			})
		end
	end
end)