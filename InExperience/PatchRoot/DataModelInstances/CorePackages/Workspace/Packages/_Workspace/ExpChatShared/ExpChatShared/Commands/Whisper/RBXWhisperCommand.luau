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
	clientRun = function(p1, p2, p3)
		-- upvalues: getNameFromWhisperModule (ref), dictionary (ref), getAutocompletePlayersFromStringModule (ref), whisper (ref), textChatService (ref), robloxReplicatedStorageService (ref), chatInputBarActivatedWhisperModeModule (ref)
		local var1 = getNameFromWhisperModule(p3, p1:getState().AutoCastCommands[script.Name])
		
		if var1 then
			local var2
			local players = p1:getState().Players
			local var3 = getAutocompletePlayersFromStringModule(dictionary.join(players, {
				byUserId = dictionary.removeKey(players.byUserId, tostring(p2))
			}), var1)
			
			if #var3 == 0 then
				whisper:debug("Autocomplete: No matches!")
				var2 = players.byUserId[tostring(p2)]
				
				return if var2 and (var1 == var2.displayName or var1 == "@" .. var10.username) then {
					key = "InGame.UnknownNamespace.GameChat_PrivateMessaging_CannotWhisperToSelf",
					args = nil,
					metadata = "Roblox.Whisper.Error.CannotWhisperToSelf"
				} else {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Whisper.Error.TargetDoesNotExist",
					args = { RBX_NAME = var1 or "" }
				}
			elseif #var3 ~= 1 then
				whisper:debug("Autocomplete: Too many matches!")
				
				return {
					key = "CoreScripts.TextChat.Whisper.Error.CannotChat",
					metadata = "Roblox.Whisper.Error.TooManyMatches"
				}
			end
			var2 = var3[1]
			local var4 = tonumber(var2.userId)
			
			if not var4 then
				return { key = "", metadata = "Roblox.Whisper.Error.Unknown" }
			end
			local var5 = textChatService:FindFirstChild(string.format("RBXWhisper:%d_%d", if p2 < var4 then p2 else var4, if var4 < p2 then p2 else var4), true)
			
			if not var5 then
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
				var5 = whisperChat:InvokeServer(var2.userId)
				
				if var5 then
					p1:dispatch(chatInputBarActivatedWhisperModeModule(nil, var5))
					
					return {
						key = "CoreScripts.TextChat.Notification.WhisperChat.Created",
						metadata = "Roblox.Whisper.Info.Success",
						args = { RBX_NAME = var1 }
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