local TextChatService = game:GetService("TextChatService")
local ReactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)

return function(Callback)
	-- upvalues: ReactModule (copy), TextChatService (copy)
	return ReactModule.useCallback(function(p1)
		-- upvalues: TextChatService (upval), Callback (copy)
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if ChatWindowConfiguration and Callback then
			Callback(p1, ChatWindowConfiguration)
		end
	end, { Callback })
end