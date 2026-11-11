local Players = game:GetService("Players")
local _ = game:GetService("FriendService")
local ClientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))
local _ = require(ClientChatModules:WaitForChild("ChatConstants"))
local Enabled = false
local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient")
end)

if Success then
	Enabled = Result
end
local ChatLocalizationModule = nil
pcall(function()
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {}
end
if not ChatLocalizationModule.FormatMessageToSend or not ChatLocalizationModule.LocalizeFormattedMessage then
	function ChatLocalizationModule:FormatMessageToSend(_, Formatted)
		return Formatted
	end
end
local config = { ChatColor = Color3.fromRGB(255, 255, 255) }

return function(p1)
	-- upvalues: Enabled (ref), ChatSettingsModule (copy), ChatLocalizationModule (ref), config (copy), Players (copy)
	local function _()
		-- upvalues: Enabled (upval), ChatSettingsModule (upval)
		return Enabled == false and ChatSettingsModule.ShowFriendJoinNotification ~= nil and ChatSettingsModule.ShowFriendJoinNotification
	end
	
	local function SendFriendJoinNotification(Player, Player1)
		-- upvalues: p1 (copy), ChatSettingsModule (upval), ChatLocalizationModule (upval), config (upval)
		local Speaker = p1:GetSpeaker(Player.Name)
		
		if Speaker then
			local DisplayName = if ChatSettingsModule.PlayerDisplayNamesEnabled then Player1.DisplayName else Player1.Name
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", DisplayName), "RBX_NAME", DisplayName), "System", config)
		end
	end
	
	local _ = function(Player: Player, Player1: Player)
		-- upvalues: SendFriendJoinNotification (copy)
		if Player ~= Player1 then
			coroutine.wrap(function()
				-- upvalues: Player (copy), Player1 (copy), SendFriendJoinNotification (upval)
				if Player:IsFriendsWith(Player1.UserId) then
					SendFriendJoinNotification(Player, Player1)
				end
			end)()
		end
	end
	
	if Enabled == false and ChatSettingsModule.ShowFriendJoinNotification ~= nil and ChatSettingsModule.ShowFriendJoinNotification then
		Players.PlayerAdded:connect(function(Player: Player)
			-- upvalues: Players (upval), SendFriendJoinNotification (copy)
			local Players1 = Players:GetPlayers()
			
			for i = 1, #Players1 do
				local Player1 = Players1[i]
				
				if Player1 ~= Player then
					coroutine.wrap(function()
						-- upvalues: Player1 (copy), Player (copy), SendFriendJoinNotification (upval)
						if Player1:IsFriendsWith(Player.UserId) then
							SendFriendJoinNotification(Player1, Player)
						end
					end)()
				end
			end
		end)
	end
end