local chatService = game:GetService("Chat")
local playersService = game:GetService("Players")
local utilModule = require(script.Parent:WaitForChild("Util"))
local t = nil
pcall(function() --[[ line: 13 ]]
	-- upvalues: t (write), chatService (ref)
	t = require(chatService.ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {
		Get = function(_, _, p0) --[[ line: 14 ]]
			return p0
		end
	}
end
local localPlayer = playersService.LocalPlayer
local t_1 = {
	wave = true,
	point = true,
	dance = true,
	dance2 = true,
	dance3 = true,
	laugh = true,
	cheer = true
}
local _ = {
	NotSupported = "InGame.Chat.Response.EmotesNotSupported",
	R15Only = "InGame.Chat.Response.EmotesWrongAvatarType",
	SwitchToR15 = "InGame.Chat.ErrorMessageSwitchToR15",
	NoMatchingEmote = "InGame.Chat.Response.EmoteNotAvailable",
	TemporarilyUnavailable = "InGame.Chat.Response.EmotesTemporarilyUnavailable",
	AnimationPlaying = "InGame.Chat.ErrorMessageAnimationPlaying"
}
local t_2 = {
	["InGame.Chat.Response.EmotesNotSupported"] = "You can't use Emotes here.",
	["InGame.Chat.Response.EmotesWrongAvatarType"] = "Only R15 avatars can use Emotes.",
	["InGame.Chat.ErrorMessageSwitchToR15"] = "Switch to your R15 avatar to play Emote.",
	["InGame.Chat.Response.EmoteNotAvailable"] = "You can't use that Emote.",
	["InGame.Chat.Response.EmotesTemporarilyUnavailable"] = "You can't use Emotes right now.",
	["InGame.Chat.ErrorMessageAnimationPlaying"] = "You cannot play Emotes during this action."
}
local color = Color3.fromRGB(245, 50, 50)

local function _(p1) --[[ line: 48 | named "getEmoteName" ]]
	return if string.sub(p1, 1, 3) == "/e " then string.sub(p1, 4) elseif string.sub(p1, 1, 7) == "/emote " then string.sub(p1, 8) else nil
end

local _ = function(p2, p3) --[[ line: 58 | named "sendErrorMessage" ]]
	-- upvalues: t (write), t_2 (ref), color (ref), utilModule (ref)
	utilModule:SendSystemMessageToSelf(t:Get(p3, t_2[p3]), p2, { ChatColor = color })
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.COMPLETED_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = function(p4, p5, _) --[[ line: 67 ]]
		-- upvalues: t_1 (ref), localPlayer (ref), t (write), t_2 (ref), color (ref), utilModule (ref)
		local var7 = if string.sub(p4, 1, 3) == "/e " then string.sub(p4, 4) elseif string.sub(p4, 1, 7) == "/emote " then string.sub(p4, 8) else nil
		
		if not var7 then
			return false
		elseif t_1[var7] then
			return true
		end
		local currentChannel = p5:GetCurrentChannel()
		
		if not currentChannel then
			return true
		end
		local character = localPlayer.Character
		
		if not character then
			utilModule:SendSystemMessageToSelf(t:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", t_2["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), currentChannel, { ChatColor = color })
			
			return true
		end
		local animate = character:FindFirstChild("Animate")
		
		if not animate then
			utilModule:SendSystemMessageToSelf(t:Get("InGame.Chat.Response.EmotesNotSupported", t_2["InGame.Chat.Response.EmotesNotSupported"]), currentChannel, { ChatColor = color })
			
			return true
		elseif not animate:FindFirstChild("PlayEmote") then
			utilModule:SendSystemMessageToSelf(t:Get("InGame.Chat.Response.EmotesNotSupported", t_2["InGame.Chat.Response.EmotesNotSupported"]), currentChannel, { ChatColor = color })
			
			return true
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		
		if not humanoid then
			utilModule:SendSystemMessageToSelf(t:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", t_2["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), currentChannel, { ChatColor = color })
			
			return true
		elseif humanoid.RigType ~= Enum.HumanoidRigType.R15 then
			utilModule:SendSystemMessageToSelf(t:Get("InGame.Chat.Response.EmotesWrongAvatarType", t_2["InGame.Chat.Response.EmotesWrongAvatarType"]), currentChannel, { ChatColor = color })
			
			return true
		end
		local humanoidDescription = humanoid:FindFirstChildOfClass("HumanoidDescription")
		
		if not humanoidDescription then
			utilModule:SendSystemMessageToSelf(t:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", t_2["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), currentChannel, { ChatColor = color })
			
			return true
		end
		local t_3 = {}
		
		for i, v in pairs(humanoidDescription:GetEmotes()) do
			t_3[string.lower(i)] = i
		end
		local var13 = tonumber(var7)
		
		if var13 then
			for i_1, v_1 in pairs(humanoidDescription:GetEquippedEmotes()) do
				if v_1.Slot == var13 then
					var7 = v_1.Name
				end
			end
		end
		var7 = t_3[string.lower(var7)]
		
		if var7 then
			spawn(function() --[[ line: 143 ]]
				-- upvalues: humanoid (ref), var7 (write), currentChannel (ref), t (copy), t_2 (copy), color (copy), utilModule (copy)
				local ok, status = pcall(function() --[[ line: 144 ]]
					-- upvalues: humanoid (copy), var7 (copy)
					return humanoid:PlayEmote(var7)
				end)
				
				if not ok then
					utilModule:SendSystemMessageToSelf(t:Get("InGame.Chat.Response.EmotesNotSupported", t_2["InGame.Chat.Response.EmotesNotSupported"]), currentChannel, { ChatColor = color })
					
					return
				elseif not status then
					utilModule:SendSystemMessageToSelf(t:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", t_2["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), currentChannel, { ChatColor = color })
				end
			end)
			
			return true
		end
		utilModule:SendSystemMessageToSelf(t:Get("InGame.Chat.Response.EmoteNotAvailable", t_2["InGame.Chat.Response.EmoteNotAvailable"]), currentChannel, { ChatColor = color })
		
		return true
	end
}