local TextChatService = game:GetService("TextChatService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Dictionary = require(ExpChatShared.Parent.llama).Dictionary
local Whisper = require(ExpChatShared.Logger):new("ExpChat/Command/Whisper")
local ChatInputBarActivatedWhisperModeModule = require(ExpChatShared.Actions.ChatInputBarActivatedWhisperMode)
local Commands = script:FindFirstAncestor("Commands")
local GetAutocompletePlayersFromStringModule = require(Commands.getAutocompletePlayersFromString)
local GetNameFromWhisperModule = require(Commands.Whisper.getNameFromWhisper)
local _ = require(Commands.types)

return {
	name = script.Name,
	alias = { "/whisper", "/w" },
	clientRun = function(p1, p2, p3)
		-- upvalues: GetNameFromWhisperModule (copy), Dictionary (copy), GetAutocompletePlayersFromStringModule (copy), Whisper (copy), TextChatService (copy), RobloxReplicatedStorage (copy), ChatInputBarActivatedWhisperModeModule (copy)
		local NameFromWhisperModule = GetNameFromWhisperModule(p3, p1:getState().AutoCastCommands[script.Name])
		
		if NameFromWhisperModule then
			local Players = p1:getState().Players
			local AutocompletePlayersFromStringModule = GetAutocompletePlayersFromStringModule(Dictionary.join(Players, {
				byUserId = Dictionary.removeKey(Players.byUserId, (tostring(p2)))
			}), NameFromWhisperModule)
			
			if #AutocompletePlayersFromStringModule == 0 then
				Whisper:debug("Autocomplete: No matches!")
				local ByUserIdEntry = Players.byUserId[tostring(p2)]
				
				return if ByUserIdEntry and (NameFromWhisperModule == ByUserIdEntry.displayName or NameFromWhisperModule == "@" .. ByUserIdEntry.username) then {
					key = "InGame.UnknownNamespace.GameChat_PrivateMessaging_CannotWhisperToSelf",
					args = nil,
					metadata = "Roblox.Whisper.Error.CannotWhisperToSelf"
				} else {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Whisper.Error.TargetDoesNotExist",
					args = { RBX_NAME = NameFromWhisperModule or "" }
				}
			end
			if #AutocompletePlayersFromStringModule ~= 1 then
				Whisper:debug("Autocomplete: Too many matches!")
				
				return {
					key = "CoreScripts.TextChat.Whisper.Error.CannotChat",
					metadata = "Roblox.Whisper.Error.TooManyMatches"
				}
			end
			local AutocompletePlayersFromStringModuleEntry = AutocompletePlayersFromStringModule[1]
			local Number: number? = tonumber(AutocompletePlayersFromStringModuleEntry.userId)
			
			if Number then
				local Child = TextChatService:FindFirstChild(string.format("RBXWhisper:%d_%d", p2 < Number and p2 or Number, Number < p2 and p2 or Number), true)
				
				if not Child then
					local ExperienceChat = RobloxReplicatedStorage:FindFirstChild("ExperienceChat")
					
					if not ExperienceChat then
						Whisper:error("Could not create whisper channel because RobloxReplicatedStorage.ExperienceChat is missing.")
						
						return { key = "", metadata = "Roblox.Whisper.Error.Unknown" }
					end
					local WhisperChat = ExperienceChat:FindFirstChild("WhisperChat")
					
					if not WhisperChat or not WhisperChat:IsA("RemoteFunction") then
						Whisper:error("Could not create whisper channel because WhisperChat RemoteFunction is missing.")
						
						return { key = "", metadata = "Roblox.Whisper.Error.Unknown" }
					end
					Child = WhisperChat:InvokeServer(AutocompletePlayersFromStringModuleEntry.userId)
					
					if not Child then
						Whisper:error("Could not create whisper channel for some reason.")
						
						return {
							key = "CoreScripts.TextChat.Whisper.Error.CannotChat",
							args = nil,
							metadata = "Roblox.Whisper.Error.Unknown"
						}
					end
				end
				p1:dispatch(ChatInputBarActivatedWhisperModeModule(nil, Child))
				
				return {
					key = "CoreScripts.TextChat.Notification.WhisperChat.Created",
					metadata = "Roblox.Whisper.Info.Success",
					args = { RBX_NAME = NameFromWhisperModule }
				}
			end
		end
		return { key = "", metadata = "Roblox.Whisper.Error.Unknown" }
	end
}