local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local textChatService = game:GetService("TextChatService")
local parent = script:FindFirstAncestor("ExpChatServer").Parent
local list = require(parent.llama).List
local var1 = require(parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)

local function _(p1, p2)
	-- upvalues: textChatService (ref), var1 (ref)
	if p1 == p2 then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: textChatService (copy), p1 (ref), p2 (ref)
		return textChatService:CanUsersWhisperAsync(p1, p2)
	end)
	local status_1 = ok and status
	var1:debug("CanUsersChat: {}", tostring(status_1))
	
	return status_1
end

local _ = function(p1, p2)
	-- upvalues: textChatService (ref)
	return (textChatService:FindFirstChild("TextChannels") or textChatService):FindFirstChild(string.format("RBXWhisper:%d_%d", if p1 < p2 then p1 else p2, if p2 < p1 then p1 else p2))
end

local function createWhisperChannel(p1, p2)
	-- upvalues: textChatService (ref), list (ref)
	local formattedText = string.format("RBXWhisper:%d_%d", if p1 < p2 then p1 else p2, if p2 < p1 then p1 else p2)
	local textChannels = textChatService:FindFirstChild("TextChannels") or textChatService
	local textChannel = Instance.new("TextChannel")
	textChannel.Name = formattedText
	textChannel.Parent = textChannels
	textChannel:AddUserAsync(p1)
	textChannel:AddUserAsync(p2)
	textChannel.ChildRemoved:Connect(function(_)
		-- upvalues: list (copy), textChannel (ref)
		if list.count(textChannel:GetChildren(), function(p3)
			return p3:IsA("TextSource")
		end) < 2 then
			textChannel:Destroy()
		end
	end)
	
	return textChannel
end

local _ = function(p1, p2, p3)
	local var2 = Instance.new(p1)
	var2.Name = p2
	var2.Parent = p3
	
	return var2
end

return function()
	-- upvalues: robloxReplicatedStorageService (ref), var1 (ref), textChatService (ref), createWhisperChannel (ref)
	local experienceChat = robloxReplicatedStorageService:FindFirstChild("ExperienceChat")
	
	if not experienceChat then
		local var2 = robloxReplicatedStorageService
		local experienceChat_1 = Instance.new("Folder")
		experienceChat_1.Name = "ExperienceChat"
		experienceChat_1.Parent = var2
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
		function whisperChat.OnServerInvoke(p1, p2)
			-- upvalues: var1 (copy), textChatService (copy), createWhisperChannel (copy)
			var1:trace("WhisperChat remote invoked with: {}", tostring(p2))
			local var3 = tonumber(p2)
			local userId = p1.UserId
			
			if var3 then
				local var4
				local var5 = (textChatService:FindFirstChild("TextChannels") or textChatService):FindFirstChild(string.format("RBXWhisper:%d_%d", if userId < var3 then userId else var3, if var3 < userId then userId else var3))
				
				if var5 then
					var1:trace("Whisper TextChannel already exists")
					
					return var5
				elseif userId == var3 then
					var4 = false
				else
					local ok, status = pcall(function()
						-- upvalues: textChatService (copy), userId (ref), var3 (ref)
						return textChatService:CanUsersWhisperAsync(userId, var3)
					end)
					local status_1 = ok and status
					var1:debug("CanUsersChat: {}", tostring(status_1))
					var4 = status_1
				end
				if var4 then
					var1:trace("Creating whisper TextChannel")
					
					return createWhisperChannel(userId, var3)
				end
			end
			return nil
		end
	end
	return whisperChat
end