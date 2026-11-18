local AppChat = script:FindFirstAncestor("AppChat")
local FFlagFriendsCallingClientGateDEV = require(AppChat.Parent.SharedFlags).FFlagFriendsCallingClientGate_DEV
local LoggerModule = require(AppChat.Logger)

return function(ConversationId)
	-- upvalues: FFlagFriendsCallingClientGateDEV (copy), LoggerModule (copy)
	if not FFlagFriendsCallingClientGateDEV then return end
	local FriendsCallingService = game:GetService("FriendsCallingService")
	local Success, Result = pcall(function()
		-- upvalues: FriendsCallingService (copy), ConversationId (copy)
		FriendsCallingService:StartCall({ conversationId = ConversationId })
	end)
	
	if not Success then
		LoggerModule:debug(`FriendsCallingService:StartCall failed: {tostring(Result)}`)
	end
end