local Parent = script:FindFirstAncestor("AppChat").Parent
local Immutable = require(Parent.AppCommonLib).Immutable
local UpdateUsersFunction = require(Parent.UserLib).Thunks.UpdateUsers
local GetConversationMetadata = require(Parent.AppChatNetworking).rodux.GetConversationMetadata

return function(p1) --[[ Line: 14 ]]
	-- upvalues: Immutable (copy), UpdateUsersFunction (copy), GetConversationMetadata (copy)
	return function(p2) --[[ Line: 15 ]]
		-- upvalues: p1 (copy), Immutable (upval), UpdateUsersFunction (upval), GetConversationMetadata (upval)
		local User = p2:getState().Users[p1]
		
		if User then
			p2:dispatch(UpdateUsersFunction({ (Immutable.Set(User, "isFriend", false)) }))
			p2:dispatch(GetConversationMetadata.API())
		end
	end
end