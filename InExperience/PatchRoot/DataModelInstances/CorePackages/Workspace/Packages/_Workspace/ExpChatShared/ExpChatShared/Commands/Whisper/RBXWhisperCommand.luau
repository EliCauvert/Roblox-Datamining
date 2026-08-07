local textChatService = game:GetService("TextChatService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local expChatShared = script:FindFirstAncestor("ExpChatShared")
local dictionary = require(expChatShared.Parent.llama).Dictionary
local whisper = require(expChatShared.Logger):new("ExpChat/Command/Whisper")
local chatInputBarActivatedWhisperModeModule = require(expChatShared.Actions.ChatInputBarActivatedWhisperMode)
local commands = script:FindFirstAncestor("Commands")
local getAutocompletePlayersFromStringModule = require(commands.getAutocompletePlayersFromString)
local getNameFromWhisperModule = require(commands.Whisper.getNameFromWhisper)
local _ = require(commands.types)

return {
	name = script.Name,
	alias = { "/whisper", "/w" },
	clientRun = function(p0, p1, p2) --[[ line: 21 ]]
		-- upvalues: getNameFromWhisperModule (ref), dictionary (ref), getAutocompletePlayersFromStringModule (ref), whisper (ref), textChatService (ref), robloxReplicatedStorageService (ref), chatInputBarActivatedWhisperModeModule (ref)
		local var8 = getNameFromWhisperModule(p2, p0:getState().AutoCastCommands[script.Name])
		
		if var8 then
			local var10
			local players = p0:getState().Players
			local var9 = getAutocompletePlayersFromStringModule(dictionary.join(players, {
				byUserId = dictionary.removeKey(players.byUserId, tostring(p1))
			}), var8)
			
			if #var9 == 0 then
				whisper:debug("Autocomplete: No matches!")
				var10 = players.byUserId[tostring(p1)]
				
				return if var10 and (var8 == var10.displayName or var8 == "@" .. var10.username) then {
					key = "InGame.UnknownNamespace.GameChat_PrivateMessaging_CannotWhisperToSelf",
					args = nil,
					metadata = "Roblox.Whisper.Error.CannotWhisperToSelf"
				} else {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Whisper.Error.TargetDoesNotExist",
					args = { RBX_NAME = var8 or "" }
				}
			elseif #var9 ~= 1 then
				whisper:debug("Autocomplete: Too many matches!")
				
				return {
					key = "CoreScripts.TextChat.Whisper.Error.CannotChat",
					metadata = "Roblox.Whisper.Error.TooManyMatches"
				}
			end
			var10 = var9[1]
			local var11 = tonumber(var10.userId)
			
			if not var11 then
				return { key = "", metadata = "Roblox.Whisper.Error.Unknown" }
			end
			local var12 = textChatService:FindFirstChild(string.format("RBXWhisper:%d_%d", if p1 < var11 then p1 else var11, if var11 < p1 then p1 else var11), true)
			
			if not var12 then
				local experienceChat = robloxReplicatedStorageService:FindFirstChild("ExperienceChat")
				
				if not experienceChat then
					whisper:error("Could not create whisper channel because RobloxReplicatedStorage.ExperienceChat is missing.")
					
					return { key = "", metadata = "Roblox.Whisper.Error.Unknown" }
				end
				local whisperChat = experienceChat:FindFirstChild("WhisperChat")
				
				if not whisperChat or not whisperChat:IsA("RemoteFunction") then
					whisper:error("Could not create whisper channel because WhisperChat RemoteFunction is missing.")
					
					return { key = "", metadata = "Roblox.Whisper.Error.Unknown" }
				end
				var12 = whisperChat:InvokeServer(var10.userId)
				
				if var12 then
					p0:dispatch(chatInputBarActivatedWhisperModeModule(nil, var12))
					
					return {
						key = "CoreScripts.TextChat.Notification.WhisperChat.Created",
						metadata = "Roblox.Whisper.Info.Success",
						args = { RBX_NAME = var8 }
					}
				else
					whisper:error("Could not create whisper channel for some reason.")
					
					return {
						key = "CoreScripts.TextChat.Whisper.Error.CannotChat",
						args = nil,
						metadata = "Roblox.Whisper.Error.Unknown"
					}
				end
			end
		end
	end
}