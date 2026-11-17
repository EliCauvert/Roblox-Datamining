local AppChat = script:FindFirstAncestor("AppChat")
local SharedFlagsModule = require(AppChat.Parent.SharedFlags)
local FFlagFriendsCallingClientGateDEV = SharedFlagsModule.FFlagFriendsCallingClientGate_DEV
local FFlagFriendsCallingServiceLuaMigration = SharedFlagsModule.FFlagFriendsCallingServiceLuaMigration
local LoggerModule = require(AppChat.Logger)

return function(ConversationId)
	-- upvalues: FFlagFriendsCallingClientGateDEV (copy), FFlagFriendsCallingServiceLuaMigration (copy), LoggerModule (copy)
	if not FFlagFriendsCallingClientGateDEV then return end
	if FFlagFriendsCallingServiceLuaMigration then
		local FriendsCallingService = game:GetService("FriendsCallingService")
		local Success, Result = pcall(function()
			-- upvalues: FriendsCallingService (copy), ConversationId (copy)
			FriendsCallingService:StartCall({ conversationId = ConversationId })
		end)
		
		if not Success then
			LoggerModule:debug(`FriendsCallingService:StartCall failed: {tostring(Result)}`)
			
			return
		end
	else
		local CallingService = game:GetService("CallingService")
		task.spawn(function()
			-- upvalues: CallingService (copy), ConversationId (copy)
			pcall(function()
				-- upvalues: CallingService (upval), ConversationId (upval)
				CallingService:CreateCallAsync({}, ConversationId)
			end)
		end)
	end
end