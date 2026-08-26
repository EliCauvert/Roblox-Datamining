local chatService = game:GetService("Chat")
local playersService = game:GetService("Players")
local _ = game:GetService("FriendService")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local _ = require(clientChatModules:WaitForChild("ChatConstants"))
local var1 = false
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient")
end)

if ok then
	var1 = status
end
local t = nil
pcall(function()
	-- upvalues: t (write)
	t = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {}
end
if not t.FormatMessageToSend or not t.LocalizeFormattedMessage then
	function t.FormatMessageToSend(_, _, p1)
		return p1
	end
end
local t_1 = { ChatColor = Color3.fromRGB(255, 255, 255) }

return function(p1)
	-- upvalues: var1 (write), chatSettingsModule (ref), t (write), t_1 (ref), playersService (ref)
	local function _()
		-- upvalues: var1 (copy), chatSettingsModule (copy)
		return var1 == false and chatSettingsModule.ShowFriendJoinNotification ~= nil and chatSettingsModule.ShowFriendJoinNotification
	end
	
	local function SendFriendJoinNotification(p2, p3)
		-- upvalues: p1 (ref), chatSettingsModule (copy), t (copy), t_1 (copy)
		local nameSpeaker = p1:GetSpeaker(p2.Name)
		
		if nameSpeaker then
			local var2 = if chatSettingsModule.PlayerDisplayNamesEnabled then p3.DisplayName else p3.Name
			nameSpeaker:SendSystemMessage(t:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", var2), "RBX_NAME", var2), "System", t_1)
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: SendFriendJoinNotification (ref)
		if p2 ~= p3 then
			coroutine.wrap(function()
				-- upvalues: p2 (ref), p3 (ref), SendFriendJoinNotification (copy)
				if p2:IsFriendsWith(p3.UserId) then
					SendFriendJoinNotification(p2, p3)
				end
			end)()
		end
	end
	
	if var1 == false and chatSettingsModule.ShowFriendJoinNotification ~= nil and chatSettingsModule.ShowFriendJoinNotification then
		playersService.PlayerAdded:connect(function(p2)
			-- upvalues: playersService (copy), SendFriendJoinNotification (ref)
			local players = playersService:GetPlayers()
			
			for i = 1, #players do
				local var2 = players[i]
				
				if var2 ~= p2 then
					coroutine.wrap(function()
						-- upvalues: var2 (ref), p2 (ref), SendFriendJoinNotification (copy)
						if var2:IsFriendsWith(p2.UserId) then
							SendFriendJoinNotification(var2, p2)
						end
					end)()
				end
			end
		end)
	end
end