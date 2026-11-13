local Parent = script:FindFirstAncestor("AppChat").Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local UserLibModule = require(Parent.UserLib)
local Immutable = require(Parent.AppCommonLib).Immutable
local UpdateUsersFunction = UserLibModule.Thunks.UpdateUsers
local GetConversationMetadata = AppChatNetworkingModule.rodux.GetConversationMetadata

return function(p1)
	-- upvalues: Immutable (copy), UpdateUsersFunction (copy), GetConversationMetadata (copy)
	return function(p2)
		-- upvalues: p1 (copy), Immutable (upval), UpdateUsersFunction (upval), GetConversationMetadata (upval)
		local User = p2:getState().Users[p1]
		
		if User then
			p2:dispatch(UpdateUsersFunction({ (Immutable.Set(User, "isFriend", false)) }))
			p2:dispatch(GetConversationMetadata.API())
		end
	end
end