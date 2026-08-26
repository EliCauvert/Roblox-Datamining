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

local function reportEmoteUsed(p1)
	-- upvalues: rbxAnalyticsService (ref), localPlayer (ref), statsService (ref)
	rbxAnalyticsService:SetRBXEventStream("client", "chat", "emoteTriggered", {
		pid = tostring(game.PlaceId),
		uid = tostring(localPlayer.UserId),
		btid = statsService:GetBrowserTrackerId(),
		assetID = if p1.AssetId then tostring(p1.AssetId) else nil,
		slotNumber = if p1.Slot then tostring(p1.Slot) else nil
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

local function _(p1)
	local character = p1.Character
	
	return if character then character:FindFirstChildOfClass("Humanoid") else nil
end

local _ = function(p1)
	local character = p1.Character
	local var1 = if character then character:FindFirstChildOfClass("Humanoid") else nil
	
	return if var1 then var1:FindFirstChildOfClass("HumanoidDescription") else nil
end

local _ = function(p1)
	return if string.sub(p1, 1, 3) == "/e " then string.sub(p1, 4):lower() elseif string.sub(p1, 1, 7) == "/emote " then string.sub(p1, 8):lower() else nil
end

local _ = function(p1, p2)
	for i, v in ipairs(p1:GetEquippedEmotes()) do
		if v.Slot == p2 then
			return v
		end
	end
	return nil
end

local function getEmoteFromEquippedEmote(p3, p4)
	for i, v in pairs(p3:GetEmotes()) do
		if string.lower(p4.Name) == string.lower(i) then
			return { Name = i, Slot = p4.Slot, AssetId = v[1] }
		end
	end
	return nil
end

local function getEmoteFromName(p5, p6)
	for i, v in pairs(p5:GetEmotes()) do
		if string.lower(p6) == string.lower(i) then
			return { Slot = nil, Name = i, AssetId = v[1] }
		end
	end
	return nil
end

local _ = function(p7, p8)
	-- upvalues: getEmoteFromEquippedEmote (ref), getEmoteFromName (ref)
	local var1 = tonumber(p8)
	
	if not var1 then
		return getEmoteFromName(p7, p8)
	end
	local var2
	for i, v in ipairs(p7:GetEquippedEmotes()) do
		if v.Slot == var1 then
			var2 = v
			return if var2 then getEmoteFromEquippedEmote(p7, var2) else nil
		end
	end
	var2 = nil
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

local _ = function(p9, p10, p11)
	return {
		Slot = nil,
		Name = p10,
		AssetId = if p9.RigType == Enum.HumanoidRigType.R15 then p11.R15 else p11.R6
	}
end

localPlayer.Chatted:Connect(function(p9, _)
	-- upvalues: t (ref), localPlayer (ref), getEmoteFromEquippedEmote (ref), getEmoteFromName (ref), reportEmoteUsed (ref), maybeSendEmoteFailureAnalyticsFromPlayerModule (ref), reportEmoteFailed (ref), constantsModule (ref), rbxAnalyticsService (ref), statsService (ref)
	local var3 = if string.sub(p9, 1, 3) == "/e " then string.sub(p9, 4):lower() elseif string.sub(p9, 1, 7) == "/emote " then string.sub(p9, 8):lower() else nil
	
	if var3 then
		local var4 = nil
		local var5 = t[var3]
		
		if var5 then
			local character = localPlayer.Character
			local var6 = if character then character:FindFirstChildOfClass("Humanoid") else nil
			
			if var6 then
				var4 = {
					Slot = nil,
					Name = var3,
					AssetId = if var6.RigType == Enum.HumanoidRigType.R15 then var5.R15 else var5.R6
				}
			end
		else
			local character = localPlayer.Character
			local var7 = if character then character:FindFirstChildOfClass("Humanoid") else nil
			local var8 = if var7 then var7:FindFirstChildOfClass("HumanoidDescription") else nil
			
			if var8 then
				local var9 = tonumber(var3)
				
				if var9 then
					local var10
					for i, v in ipairs(var8:GetEquippedEmotes()) do
						if v.Slot == var9 then
							var10 = v
							var4 = if var10 then getEmoteFromEquippedEmote(var8, var10) else nil
						end
					end
					var10 = nil
				else
					var4 = getEmoteFromName(var8, var3)
				end
			end
		end
		if var4 then
			reportEmoteUsed(var4)
			maybeSendEmoteFailureAnalyticsFromPlayerModule(localPlayer, function(p10)
				-- upvalues: reportEmoteFailed (copy), var4 (write)
				reportEmoteFailed(p10, var4)
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