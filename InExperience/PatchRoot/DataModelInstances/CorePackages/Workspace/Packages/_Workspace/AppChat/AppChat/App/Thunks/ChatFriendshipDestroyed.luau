local parent = script:FindFirstAncestor("AppChat").Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local immutable = require(parent.AppCommonLib).Immutable
local updateUsers = require(parent.UserLib).Thunks.UpdateUsers
local getConversationMetadata = appChatNetworkingModule.rodux.GetConversationMetadata

return function(p0) --[[ line: 14 ]]
	-- upvalues: immutable (ref), updateUsers (ref), getConversationMetadata (ref)
	return function(p1) --[[ line: 15 ]]
		-- upvalues: p0 (ref), immutable (copy), updateUsers (copy), getConversationMetadata (copy)
		local var1 = p1:getState().Users[p0]
		
		if var1 then
			p1:dispatch(updateUsers({ immutable.Set(var1, "isFriend", false) }))
			p1:dispatch(getConversationMetadata.API())
		end
	end
end