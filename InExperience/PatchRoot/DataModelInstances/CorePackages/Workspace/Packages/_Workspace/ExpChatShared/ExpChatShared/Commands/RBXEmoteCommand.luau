local starterPlayerService = game:GetService("StarterPlayer")
local _ = require(script.Parent.types)
local emote = require(script:FindFirstAncestor("ExpChatShared").Logger):new("ExpChat/Command/Emote")
local t = {
	wave = true,
	point = true,
	dance = true,
	dance1 = true,
	dance2 = true,
	dance3 = true,
	laugh = true,
	cheer = true
}

local function _(p1)
	local text = nil
	local humanoid = p1:FindFirstChildOfClass("Humanoid")
	
	if humanoid then
		if humanoid.RigType == Enum.HumanoidRigType.R15 then
			text = "dance"
			
			return text
		elseif humanoid.RigType == Enum.HumanoidRigType.R6 then
			text = "dance" .. math.random(1, 3)
		end
	end
	return text
end

local function handleLegacyEmote(p1, p2)
	-- upvalues: emote (ref)
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), p1 (write), emote (copy)
		local animate = p2:FindFirstChild("Animate")
		
		if animate then
			local playEmote = animate:FindFirstChild("PlayEmote")
			
			if playEmote and playEmote:IsA("BindableFunction") then
				if p1 == "dance" then
					local text = nil
					local humanoid = p2:FindFirstChildOfClass("Humanoid")
					
					if humanoid then
						if humanoid.RigType == Enum.HumanoidRigType.R15 then
							text = "dance"
						elseif humanoid.RigType == Enum.HumanoidRigType.R6 then
							text = "dance" .. math.random(1, 3)
						end
					end
					p1 = text
				end
				playEmote:Invoke(p1)
				
				return true
			else
				emote:debug("PlayEmote BindableFunction does not exist.")
			end
		end
		return false
	end)
	
	if ok and status then
		emote:debug("Playing legacy emote successfully")
		
		return
	end
	return {
		key = "InGame.EmotesMenu.ErrorMessageNotSupported",
		metadata = "Roblox.Emote.Error.NotSupported"
	}
end

local function getValidEmoteOrResponse(p1, p2)
	local var1 = tonumber(p2, 10)
	
	if var1 then
		local equippedEmotes = p1:GetEquippedEmotes()
		
		if equippedEmotes[var1] then
			return equippedEmotes[var1].Name, nil
		elseif var1 >= 1 and var1 <= 8 then
			return nil, {
				key = "CoreScripts.TextChat.Emote.Error.NotEquipped",
				metadata = "Roblox.Emote.Error.EmoteNotEquipped"
			}
		end
		return nil, {
			key = "CoreScripts.TextChat.Emote.Error.DoesNotExist",
			metadata = "Roblox.Emote.Error.DoesNotExist"
		}
	else
		for i, v in pairs(p1:GetEmotes()) do
			if string.lower(i) == p2 then
				return i, nil
			end
		end
		return nil, {
			key = "CoreScripts.TextChat.Emote.Error.NotOwnedGeneric",
			metadata = "Roblox.Emote.Error.NotOwnedGeneric"
		}
	end
end

return {
	name = script.Name,
	alias = { "/emote", "/e" },
	clientRun = function(p3, _, p4)
		-- upvalues: emote (ref), t (ref), handleLegacyEmote (ref), starterPlayerService (ref), getValidEmoteOrResponse (ref)
		local substring = nil
		
		if string.sub(p4, 1, 3):lower() == "/e " then
			substring = string.sub(p4, 4)
		elseif string.sub(p4, 1, 7):lower() == "/emote " then
			substring = string.sub(p4, 8)
		end
		if not substring then
			emote:debug("No emote string given")
			
			return {
				key = "CoreScripts.TextChat.Emote.Error.DoesNotExist",
				metadata = "Roblox.Emote.Error.DoesNotExist"
			}
		end
		local lowerText = string.lower(substring)
		local localCharacter = p3:getState().LocalCharacter
		
		if t[lowerText] then
			emote:trace("Legacy emote found")
			
			return handleLegacyEmote(lowerText, localCharacter)
		elseif not starterPlayerService.UserEmotesEnabled then
			emote:debug("Experience does not have emotes enabled")
			
			return {
				key = "CoreScripts.TextChat.Emote.Error.NotEnabled",
				metadata = "Roblox.Emote.Error.UserEmotesNotEnabled"
			}
		elseif not localCharacter then
			emote:debug("No character loaded")
			
			return {
				key = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable",
				metadata = "Roblox.Emote.Error.TemporarilyUnavailable"
			}
		elseif not localCharacter:FindFirstChild("Animate") then
			emote:debug("Animate script missing")
			
			return {
				key = "InGame.EmotesMenu.ErrorMessageNotSupported",
				metadata = "Roblox.Emote.Error.NotSupported"
			}
		end
		local humanoid = localCharacter:FindFirstChildOfClass("Humanoid")
		
		if not humanoid then
			emote:debug("Humanoid missing")
			
			return {
				key = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable",
				metadata = "Roblox.Emote.Error.TemporarilyUnavailable"
			}
		elseif humanoid.RigType ~= Enum.HumanoidRigType.R15 then
			emote:debug("Humanoid.RigType is not R15")
			
			return {
				key = "InGame.EmotesMenu.ErrorMessageSwitchToR15",
				metadata = "Roblox.Emote.Error.SwitchToR15"
			}
		end
		local humanoidDescription = humanoid:FindFirstChildOfClass("HumanoidDescription")
		
		if not humanoidDescription then
			emote:debug("HumanoidDescription missing")
			
			return {
				key = "InGame.EmotesMenu.ErrorMessageNotSupported",
				metadata = "Roblox.Emote.Error.NotSupported"
			}
		end
		local var2, var3 = getValidEmoteOrResponse(humanoidDescription, lowerText)
		
		if not var2 then
			emote:debug("Could not find a valid emote within HumanoidDescription")
			
			return var3
		end
		local ok, status = pcall(function()
			-- upvalues: humanoid (ref), var2 (ref)
			return humanoid:PlayEmoteAsync(var2)
		end)
		
		if ok and status then
			emote:debug("Playing emote: {}", tostring(var2))
			
			return nil
		end
		emote:debug("Humanoid:PlayEmote encountered an error: {}", status)
		
		return {
			key = "InGame.EmotesMenu.ErrorMessageAnimationPlaying",
			metadata = "Roblox.Emote.Error.AnimationPlaying"
		}
	end
}