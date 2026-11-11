local AppChat = script:FindFirstAncestor("AppChat")
local SetAppLoadedModule = require(AppChat.Actions.SetAppLoaded)
local FetchChatSettingsModule = require(AppChat.Conversations.Thunks.FetchChatSettings)
local NetworkingUsersModule = require(AppChat.Http.NetworkingUsers)

return function(p1)
	-- upvalues: NetworkingUsersModule (copy), FetchChatSettingsModule (copy), SetAppLoadedModule (copy)
	p1:dispatch(function(p2)
		-- upvalues: NetworkingUsersModule (upval)
		return p2:dispatch(NetworkingUsersModule.GetUserV2FromUserId.API(p2:getState().LocalUserId))
	end)
	
	return p1:dispatch(FetchChatSettingsModule.API()):andThen(function()
		-- upvalues: p1 (copy), SetAppLoadedModule (upval)
		p1:dispatch(SetAppLoadedModule(true))
	end):catch(function(Err)
		warn("AppChat.Conversations.Thunks.FetchInitialChatData with error: ", (tostring(Err)))
	end)
end