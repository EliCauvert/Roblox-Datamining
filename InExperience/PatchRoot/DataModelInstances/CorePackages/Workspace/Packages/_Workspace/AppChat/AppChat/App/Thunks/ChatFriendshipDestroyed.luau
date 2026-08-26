local parent = script:FindFirstAncestor("AppChat").Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local immutable = require(parent.AppCommonLib).Immutable
local updateUsers = require(parent.UserLib).Thunks.UpdateUsers
local getConversationMetadata = appChatNetworkingModule.rodux.GetConversationMetadata

return function(p1)
	-- upvalues: immutable (ref), updateUsers (ref), getConversationMetadata (ref)
	return function(p2)
		-- upvalues: p1 (ref), immutable (copy), updateUsers (copy), getConversationMetadata (copy)
		local var1 = p2:getState().Users[p1]
		
		if var1 then
			p2:dispatch(updateUsers({ immutable.Set(var1, "isFriend", false) }))
			p2:dispatch(getConversationMetadata.API())
		end
	end
end