local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local Parent = script:FindFirstAncestor("ExpChatServer").Parent
local List = require(Parent.llama).List
local NewResult = require(Parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)

local function _(p1, p2)
	-- upvalues: TextChatService (copy), NewResult (copy)
	if p1 == p2 then
		return false
	else
		local Success, Result = pcall(function()
			-- upvalues: TextChatService (upval), p1 (copy), p2 (copy)
			return TextChatService:CanUsersWhisperAsync(p1, p2)
		end)
		local Result1 = Success and Result
		NewResult:debug("CanUsersChat: {}", (tostring(Result1)))
		
		return Result1
	end
end

local _ = function(p1, p2)
	-- upvalues: TextChatService (copy)
	return (TextChatService:FindFirstChild("TextChannels") or TextChatService):FindFirstChild((string.format("RBXWhisper:%d_%d", p1 < p2 and p1 or p2, p2 < p1 and p1 or p2)))
end

local function createWhisperChannel(UserId, Number)
	-- upvalues: TextChatService (copy), List (copy)
	local TextChannels = TextChatService:FindFirstChild("TextChannels") or TextChatService
	local TextChannel = Instance.new("TextChannel")
	TextChannel.Name = string.format("RBXWhisper:%d_%d", UserId < Number and UserId or Number, Number < UserId and UserId or Number)
	TextChannel.Parent = TextChannels
	TextChannel:AddUserAsync(UserId)
	TextChannel:AddUserAsync(Number)
	TextChannel.ChildRemoved:Connect(function(_)
		-- upvalues: List (upval), TextChannel (copy)
		if List.count(TextChannel:GetChildren(), function(TextSource)
			return TextSource:IsA("TextSource")
		end) < 2 then
			TextChannel:Destroy()
		end
	end)
	
	return TextChannel
end

local _ = function(p1, Name, Parent)
	local NewInstance = Instance.new(p1)
	NewInstance.Name = Name
	NewInstance.Parent = Parent
	
	return NewInstance
end

return function()
	-- upvalues: RobloxReplicatedStorage (copy), NewResult (copy), TextChatService (copy), createWhisperChannel (copy)
	local ExperienceChat = RobloxReplicatedStorage:FindFirstChild("ExperienceChat")
	
	if not ExperienceChat then
		local ExperienceChat1 = Instance.new("Folder")
		ExperienceChat1.Name = "ExperienceChat"
		ExperienceChat1.Parent = RobloxReplicatedStorage
		ExperienceChat = ExperienceChat1
	end
	local WhisperChat = ExperienceChat:FindFirstChild("WhisperChat")
	
	if not WhisperChat then
		local WhisperChat1 = Instance.new("RemoteFunction")
		WhisperChat1.Name = "WhisperChat"
		WhisperChat1.Parent = ExperienceChat
		WhisperChat = WhisperChat1
	end
	if WhisperChat:IsA("RemoteFunction") then
		function WhisperChat.OnServerInvoke(Player, p1)
			-- upvalues: NewResult (upval), TextChatService (upval), createWhisperChannel (upval)
			NewResult:trace("WhisperChat remote invoked with: {}", (tostring(p1)))
			local Number: number? = tonumber(p1)
			local UserId = Player.UserId
			
			if Number then
				local Child = (TextChatService:FindFirstChild("TextChannels") or TextChatService):FindFirstChild((string.format("RBXWhisper:%d_%d", UserId < Number and UserId or Number, Number < UserId and UserId or Number)))
				
				if Child then
					NewResult:trace("Whisper TextChannel already exists")
					
					return Child
				end
				local v1 = nil
				if UserId == Number then
					v1 = false
				else
					local Success, Result = pcall(function()
						-- upvalues: TextChatService (upval), UserId (copy), Number (copy)
						return TextChatService:CanUsersWhisperAsync(UserId, Number)
					end)
					local Result1 = Success and Result
					NewResult:debug("CanUsersChat: {}", (tostring(Result1)))
					v1 = Result1
				end
				if v1 then
					NewResult:trace("Creating whisper TextChannel")
					
					return (createWhisperChannel(UserId, Number))
				end
			end
			return nil
		end
	end
	return WhisperChat
end