local chatService = game:GetService("Chat")
local playersService = game:GetService("Players")
local _ = game:GetService("FriendService")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local _ = require(clientChatModules:WaitForChild("ChatConstants"))
local var4 = false
local ok, status = pcall(function() --[[ line: 16 ]]
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient")
end)

if ok then
	var4 = status
end
local t = nil
pcall(function() --[[ line: 26 ]]
	-- upvalues: t (write)
	t = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {}
end
if not t.FormatMessageToSend or not t.LocalizeFormattedMessage then
	function t.FormatMessageToSend(_, _, p0) --[[ line: 29 ]]
		return p0
	end
end
local t_1 = { ChatColor = Color3.fromRGB(255, 255, 255) }

return function(p1) --[[ line: 35 | named "Run" ]]
	-- upvalues: var4 (write), chatSettingsModule (ref), t (write), t_1 (ref), playersService (ref)
	local function _() --[[ line: 37 | named "ShowFriendJoinNotification" ]]
		-- upvalues: var4 (copy), chatSettingsModule (copy)
		return var4 == false and chatSettingsModule.ShowFriendJoinNotification ~= nil and chatSettingsModule.ShowFriendJoinNotification
	end
	
	local function SendFriendJoinNotification(p2, p3) --[[ line: 46 ]]
		-- upvalues: p1 (ref), chatSettingsModule (copy), t (copy), t_1 (copy)
		local nameSpeaker = p1:GetSpeaker(p2.Name)
		
		if nameSpeaker then
			local var9 = if chatSettingsModule.PlayerDisplayNamesEnabled then p3.DisplayName else p3.Name
			nameSpeaker:SendSystemMessage(t:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", var9), "RBX_NAME", var9), "System", t_1)
		end
	end
	
	local _ = function(p4, p5) --[[ line: 62 | named "TrySendFriendNotification" ]]
		-- upvalues: SendFriendJoinNotification (ref)
		if p4 ~= p5 then
			coroutine.wrap(function() --[[ line: 64 ]]
				-- upvalues: p4 (ref), p5 (ref), SendFriendJoinNotification (copy)
				if p4:IsFriendsWith(p5.UserId) then
					SendFriendJoinNotification(p4, p5)
				end
			end)()
		end
	end
	
	if var4 == false and chatSettingsModule.ShowFriendJoinNotification ~= nil and chatSettingsModule.ShowFriendJoinNotification then
		playersService.PlayerAdded:connect(function(p6) --[[ line: 73 ]]
			-- upvalues: playersService (copy), SendFriendJoinNotification (ref)
			local players = playersService:GetPlayers()
			
			for i = 1, #players do
				local var11 = players[i]
				
				if var11 ~= p6 then
					coroutine.wrap(function() --[[ line: 64 ]]
						-- upvalues: var11 (ref), p6 (ref), SendFriendJoinNotification (copy)
						if var11:IsFriendsWith(p6.UserId) then
							SendFriendJoinNotification(var11, p6)
						end
					end)()
				end
			end
		end)
	end
end