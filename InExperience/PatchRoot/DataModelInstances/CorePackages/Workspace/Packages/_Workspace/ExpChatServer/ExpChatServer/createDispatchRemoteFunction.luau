local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local textChatService = game:GetService("TextChatService")
local parent = script:FindFirstAncestor("ExpChatServer").Parent
local list = require(parent.llama).List
local var2 = require(parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)

local function _(p0, p1) --[[ line: 11 | named "canUsersTalkToEachOther" ]]
	-- upvalues: textChatService (ref), var2 (ref)
	if p0 == p1 then
		return false
	end
	local ok, status = pcall(function() --[[ line: 15 ]]
		-- upvalues: textChatService (copy), p0 (ref), p1 (ref)
		return textChatService:CanUsersWhisperAsync(p0, p1)
	end)
	local status_1 = ok and status
	var2:debug("CanUsersChat: {}", tostring(status_1))
	
	return status_1
end

local _ = function(p2, p3) --[[ line: 25 | named "whisperChannelAlreadyExists" ]]
	-- upvalues: textChatService (ref)
	return (textChatService:FindFirstChild("TextChannels") or textChatService):FindFirstChild(string.format("RBXWhisper:%d_%d", if p2 < p3 then p2 else p3, if p3 < p2 then p2 else p3))
end

local function createWhisperChannel(p4, p5) --[[ line: 32 ]]
	-- upvalues: textChatService (ref), list (ref)
	local formattedText = string.format("RBXWhisper:%d_%d", if p4 < p5 then p4 else p5, if p5 < p4 then p4 else p5)
	local textChannels = textChatService:FindFirstChild("TextChannels") or textChatService
	local textChannel = Instance.new("TextChannel")
	textChannel.Name = formattedText
	textChannel.Parent = textChannels
	textChannel:AddUserAsync(p4)
	textChannel:AddUserAsync(p5)
	textChannel.ChildRemoved:Connect(function(_) --[[ line: 44 ]]
		-- upvalues: list (copy), textChannel (ref)
		if list.count(textChannel:GetChildren(), function(p6) --[[ line: 45 ]]
			return p6:IsA("TextSource")
		end) < 2 then
			textChannel:Destroy()
		end
	end)
	
	return textChannel
end

local _ = function(p7, p8, p9) --[[ line: 57 | named "createInstance" ]]
	local var8 = Instance.new(p7)
	var8.Name = p8
	var8.Parent = p9
	
	return var8
end

return function() --[[ line: 64 | named "createDispatchRemoteFunction" ]]
	-- upvalues: robloxReplicatedStorageService (ref), var2 (ref), textChatService (ref), createWhisperChannel (ref)
	local experienceChat = robloxReplicatedStorageService:FindFirstChild("ExperienceChat")
	
	if not experienceChat then
		local var10 = robloxReplicatedStorageService
		local experienceChat_1 = Instance.new("Folder")
		experienceChat_1.Name = "ExperienceChat"
		experienceChat_1.Parent = var10
		experienceChat = experienceChat_1
	end
	local whisperChat = experienceChat:FindFirstChild("WhisperChat")
	
	if not whisperChat then
		local whisperChat_1 = Instance.new("RemoteFunction")
		whisperChat_1.Name = "WhisperChat"
		whisperChat_1.Parent = experienceChat
		whisperChat = whisperChat_1
	end
	if whisperChat:IsA("RemoteFunction") then
		function whisperChat.OnServerInvoke(p10, p11) --[[ line: 73 ]]
			-- upvalues: var2 (copy), textChatService (copy), createWhisperChannel (copy)
			var2:trace("WhisperChat remote invoked with: {}", tostring(p11))
			local var14 = tonumber(p11)
			local userId = p10.UserId
			
			if var14 then
				local var16
				local var15 = (textChatService:FindFirstChild("TextChannels") or textChatService):FindFirstChild(string.format("RBXWhisper:%d_%d", if userId < var14 then userId else var14, if var14 < userId then userId else var14))
				
				if var15 then
					var2:trace("Whisper TextChannel already exists")
					
					return var15
				elseif userId == var14 then
					var16 = false
				else
					local ok, status = pcall(function() --[[ line: 15 ]]
						-- upvalues: textChatService (copy), userId (ref), var14 (ref)
						return textChatService:CanUsersWhisperAsync(userId, var14)
					end)
					local status_1 = ok and status
					var2:debug("CanUsersChat: {}", tostring(status_1))
					var16 = status_1
				end
				if var16 then
					var2:trace("Creating whisper TextChannel")
					
					return createWhisperChannel(userId, var14)
				end
			end
			return nil
		end
	end
	return whisperChat
end