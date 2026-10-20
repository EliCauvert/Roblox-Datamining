local Chat = game:GetService("Chat")
local Players = game:GetService("Players")
local UtilModule = require(script.Parent:WaitForChild("Util"))
local ChatLocalizationModule = nil
pcall(function()
	-- upvalues: ChatLocalizationModule (ref), Chat (copy)
	ChatLocalizationModule = require(Chat.ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {
		Get = function(_, _, InGameChatResponseEmotesTemporarilyUnavailable)
			return InGameChatResponseEmotesTemporarilyUnavailable
		end
	}
end
local LocalPlayer = Players.LocalPlayer
local config = {
	wave = true,
	point = true,
	dance = true,
	dance2 = true,
	dance3 = true,
	laugh = true,
	cheer = true
}
local config1 = {
	["InGame.Chat.Response.EmotesNotSupported"] = "You can't use Emotes here.",
	["InGame.Chat.Response.EmotesWrongAvatarType"] = "Only R15 avatars can use Emotes.",
	["InGame.Chat.ErrorMessageSwitchToR15"] = "Switch to your R15 avatar to play Emote.",
	["InGame.Chat.Response.EmoteNotAvailable"] = "You can't use that Emote.",
	["InGame.Chat.Response.EmotesTemporarilyUnavailable"] = "You can't use Emotes right now.",
	["InGame.Chat.ErrorMessageAnimationPlaying"] = "You cannot play Emotes during this action."
}
local _Color3 = Color3.fromRGB(245, 50, 50)

local function _(Text: string)
	return if string.sub(Text, 1, 3) == "/e " then string.sub(Text, 4) elseif string.sub(Text, 1, 7) == "/emote " then string.sub(Text, 8) else nil
end

local _ = function(p1, p2)
	-- upvalues: ChatLocalizationModule (ref), config1 (copy), _Color3 (copy), UtilModule (copy)
	UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get(p2, config1[p2]), p1, { ChatColor = _Color3 })
end

return {
	[UtilModule.KEY_COMMAND_PROCESSOR_TYPE] = UtilModule.COMPLETED_MESSAGE_PROCESSOR,
	[UtilModule.KEY_PROCESSOR_FUNCTION] = function(Text: string, p1, _): boolean
		-- upvalues: config (copy), LocalPlayer (copy), ChatLocalizationModule (ref), config1 (copy), _Color3 (copy), UtilModule (copy)
		local Segment = if string.sub(Text, 1, 3) == "/e " then string.sub(Text, 4) elseif string.sub(Text, 1, 7) == "/emote " then string.sub(Text, 8) else nil
		
		if not Segment then
			return false
		end
		if config[Segment] then
			return true
		end
		local CurrentChannel = p1:GetCurrentChannel()
		
		if not CurrentChannel then
			return true
		end
		local Character = LocalPlayer.Character
		
		if not Character then
			UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", config1["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), CurrentChannel, { ChatColor = _Color3 })
			
			return true
		end
		local Animate = Character:FindFirstChild("Animate")
		
		if not Animate then
			UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("InGame.Chat.Response.EmotesNotSupported", config1["InGame.Chat.Response.EmotesNotSupported"]), CurrentChannel, { ChatColor = _Color3 })
			
			return true
		end
		if not Animate:FindFirstChild("PlayEmote") then
			UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("InGame.Chat.Response.EmotesNotSupported", config1["InGame.Chat.Response.EmotesNotSupported"]), CurrentChannel, { ChatColor = _Color3 })
			
			return true
		end
		local Humanoid = Character:FindFirstChildOfClass("Humanoid")
		
		if not Humanoid then
			UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", config1["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), CurrentChannel, { ChatColor = _Color3 })
			
			return true
		end
		if Humanoid.RigType ~= Enum.HumanoidRigType.R15 then
			UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("InGame.Chat.Response.EmotesWrongAvatarType", config1["InGame.Chat.Response.EmotesWrongAvatarType"]), CurrentChannel, { ChatColor = _Color3 })
			
			return true
		end
		local HumanoidDescription = Humanoid:FindFirstChildOfClass("HumanoidDescription")
		
		if not HumanoidDescription then
			UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", config1["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), CurrentChannel, { ChatColor = _Color3 })
			
			return true
		end
		local t = {}
		
		for i, _ in pairs((HumanoidDescription:GetEmotes())) do
			t[string.lower(i)] = i
		end
		local Number: number? = tonumber(Segment)
		
		if Number then
			for _, equippedEmote in pairs((HumanoidDescription:GetEquippedEmotes())) do
				if equippedEmote.Slot == Number then
					Segment = equippedEmote.Name
				end
			end
		end
		local Entry = t[string.lower(Segment)]
		
		if Entry then
			spawn(function()
				-- upvalues: Humanoid (copy), Entry (ref), CurrentChannel (copy), ChatLocalizationModule (upval), config1 (upval), _Color3 (upval), UtilModule (upval)
				local Success, Result = pcall(function()
					-- upvalues: Humanoid (upval), Entry (upval)
					return Humanoid:PlayEmote(Entry)
				end)
				
				if not Success then
					UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("InGame.Chat.Response.EmotesNotSupported", config1["InGame.Chat.Response.EmotesNotSupported"]), CurrentChannel, { ChatColor = _Color3 })
					
					return
				end
				if not Result then
					UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", config1["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), CurrentChannel, { ChatColor = _Color3 })
				end
			end)
			
			return true
		else
			UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("InGame.Chat.Response.EmoteNotAvailable", config1["InGame.Chat.Response.EmoteNotAvailable"]), CurrentChannel, { ChatColor = _Color3 })
			
			return true
		end
	end
}