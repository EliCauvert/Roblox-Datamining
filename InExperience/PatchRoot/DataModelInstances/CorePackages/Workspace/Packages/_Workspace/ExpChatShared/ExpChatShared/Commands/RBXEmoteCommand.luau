local StarterPlayer = game:GetService("StarterPlayer")
local _ = require(script.Parent.types)
local Emote = require(script:FindFirstAncestor("ExpChatShared").Logger):new("ExpChat/Command/Emote")
local config = {
	wave = true,
	point = true,
	dance = true,
	dance1 = true,
	dance2 = true,
	dance3 = true,
	laugh = true,
	cheer = true
}

local function _(Object): string
	local v1: string? = nil
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if Humanoid then
		if Humanoid.RigType == Enum.HumanoidRigType.R15 then
			v1 = "dance"
			
			return v1
		end
		if Humanoid.RigType == Enum.HumanoidRigType.R6 then
			v1 = "dance" .. math.random(1, 3)
		end
	end
	return v1
end

local function handleLegacyEmote(Lowered, Object)
	-- upvalues: Emote (copy)
	local Success, Result = pcall(function(): boolean
		-- upvalues: Object (copy), Lowered (ref), Emote (upval)
		local Animate = Object:FindFirstChild("Animate")
		
		if Animate then
			local PlayEmote = Animate:FindFirstChild("PlayEmote")
			
			if PlayEmote and PlayEmote:IsA("BindableFunction") then
				if Lowered == "dance" then
					local v1: string? = nil
					local Humanoid = Object:FindFirstChildOfClass("Humanoid")
					
					if Humanoid then
						if Humanoid.RigType == Enum.HumanoidRigType.R15 then
							v1 = "dance"
						elseif Humanoid.RigType == Enum.HumanoidRigType.R6 then
							v1 = "dance" .. math.random(1, 3)
						end
					end
					Lowered = v1
				end
				PlayEmote:Invoke(Lowered)
				
				return true
			else
				Emote:debug("PlayEmote BindableFunction does not exist.")
			end
		end
		return false
	end)
	
	if Success and Result then
		Emote:debug("Playing legacy emote successfully")
		
		return
	else
		return {
			key = "InGame.EmotesMenu.ErrorMessageNotSupported",
			metadata = "Roblox.Emote.Error.NotSupported"
		}
	end
end

local function getValidEmoteOrResponse(HumanoidDescription, Lowered)
	local Number: number? = tonumber(Lowered, 10)
	
	if Number then
		local EquippedEmotes = HumanoidDescription:GetEquippedEmotes()
		
		if EquippedEmotes[Number] then
			return EquippedEmotes[Number].Name, nil
		elseif Number >= 1 and Number <= 8 then
			return nil, {
				key = "CoreScripts.TextChat.Emote.Error.NotEquipped",
				metadata = "Roblox.Emote.Error.EmoteNotEquipped"
			}
		else
			return nil, {
				key = "CoreScripts.TextChat.Emote.Error.DoesNotExist",
				metadata = "Roblox.Emote.Error.DoesNotExist"
			}
		end
	else
		for i, _ in pairs((HumanoidDescription:GetEmotes())) do
			if string.lower(i) == Lowered then
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
	clientRun = function(p1, _, Text: string)
		-- upvalues: Emote (copy), config (copy), handleLegacyEmote (copy), StarterPlayer (copy), getValidEmoteOrResponse (copy)
		local Text1: string? = nil
		
		if string.sub(Text, 1, 3):lower() == "/e " then
			Text1 = string.sub(Text, 4)
		elseif string.sub(Text, 1, 7):lower() == "/emote " then
			Text1 = string.sub(Text, 8)
		end
		if not Text1 then
			Emote:debug("No emote string given")
			
			return {
				key = "CoreScripts.TextChat.Emote.Error.DoesNotExist",
				metadata = "Roblox.Emote.Error.DoesNotExist"
			}
		end
		local Lowered = string.lower(Text1)
		local LocalCharacter = p1:getState().LocalCharacter
		
		if config[Lowered] then
			Emote:trace("Legacy emote found")
			
			return handleLegacyEmote(Lowered, LocalCharacter)
		elseif not StarterPlayer.UserEmotesEnabled then
			Emote:debug("Experience does not have emotes enabled")
			
			return {
				key = "CoreScripts.TextChat.Emote.Error.NotEnabled",
				metadata = "Roblox.Emote.Error.UserEmotesNotEnabled"
			}
		elseif not LocalCharacter then
			Emote:debug("No character loaded")
			
			return {
				key = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable",
				metadata = "Roblox.Emote.Error.TemporarilyUnavailable"
			}
		elseif not LocalCharacter:FindFirstChild("Animate") then
			Emote:debug("Animate script missing")
			
			return {
				key = "InGame.EmotesMenu.ErrorMessageNotSupported",
				metadata = "Roblox.Emote.Error.NotSupported"
			}
		else
			local Humanoid = LocalCharacter:FindFirstChildOfClass("Humanoid")
			
			if not Humanoid then
				Emote:debug("Humanoid missing")
				
				return {
					key = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable",
					metadata = "Roblox.Emote.Error.TemporarilyUnavailable"
				}
			elseif Humanoid.RigType ~= Enum.HumanoidRigType.R15 then
				Emote:debug("Humanoid.RigType is not R15")
				
				return {
					key = "InGame.EmotesMenu.ErrorMessageSwitchToR15",
					metadata = "Roblox.Emote.Error.SwitchToR15"
				}
			else
				local HumanoidDescription = Humanoid:FindFirstChildOfClass("HumanoidDescription")
				
				if not HumanoidDescription then
					Emote:debug("HumanoidDescription missing")
					
					return {
						key = "InGame.EmotesMenu.ErrorMessageNotSupported",
						metadata = "Roblox.Emote.Error.NotSupported"
					}
				end
				local ValidEmoteOrResponse, ValidEmoteOrResponse2 = getValidEmoteOrResponse(HumanoidDescription, Lowered)
				
				if not ValidEmoteOrResponse then
					Emote:debug("Could not find a valid emote within HumanoidDescription")
					
					return ValidEmoteOrResponse2
				end
				local Success, Result = pcall(function()
					-- upvalues: Humanoid (copy), ValidEmoteOrResponse (copy)
					return Humanoid:PlayEmoteAsync(ValidEmoteOrResponse)
				end)
				
				if Success and Result then
					Emote:debug("Playing emote: {}", (tostring(ValidEmoteOrResponse)))
					
					return nil
				else
					Emote:debug("Humanoid:PlayEmote encountered an error: {}", Result)
					
					return {
						key = "InGame.EmotesMenu.ErrorMessageAnimationPlaying",
						metadata = "Roblox.Emote.Error.AnimationPlaying"
					}
				end
			end
		end
	end
}