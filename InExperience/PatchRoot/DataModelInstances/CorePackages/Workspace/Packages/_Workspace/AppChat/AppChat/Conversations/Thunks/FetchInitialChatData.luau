local appChat = script:FindFirstAncestor("AppChat")
local setAppLoadedModule = require(appChat.Actions.SetAppLoaded)
local fetchChatSettingsModule = require(appChat.Conversations.Thunks.FetchChatSettings)
local networkingUsersModule = require(appChat.Http.NetworkingUsers)

return function(p1)
	-- upvalues: networkingUsersModule (ref), fetchChatSettingsModule (ref), setAppLoadedModule (ref)
	p1:dispatch(function(p2)
		-- upvalues: networkingUsersModule (copy)
		return p2:dispatch(networkingUsersModule.GetUserV2FromUserId.API(p2:getState().LocalUserId))
	end)
	
	return p1:dispatch(fetchChatSettingsModule.API()):andThen(function()
		-- upvalues: p1 (ref), setAppLoadedModule (copy)
		p1:dispatch(setAppLoadedModule(true))
	end):catch(function(p2)
		warn("AppChat.Conversations.Thunks.FetchInitialChatData with error: ", tostring(p2))
	end)
end