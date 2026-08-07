local appChat = script:FindFirstAncestor("AppChat")
local setAppLoadedModule = require(appChat.Actions.SetAppLoaded)
local fetchChatSettingsModule = require(appChat.Conversations.Thunks.FetchChatSettings)
local networkingUsersModule = require(appChat.Http.NetworkingUsers)

return function(p0) --[[ line: 11 ]]
	-- upvalues: networkingUsersModule (ref), fetchChatSettingsModule (ref), setAppLoadedModule (ref)
	p0:dispatch(function(p1) --[[ line: 12 ]]
		-- upvalues: networkingUsersModule (copy)
		return p1:dispatch(networkingUsersModule.GetUserV2FromUserId.API(p1:getState().LocalUserId))
	end)
	
	return p0:dispatch(fetchChatSettingsModule.API()):andThen(function() --[[ line: 18 ]]
		-- upvalues: p0 (ref), setAppLoadedModule (copy)
		p0:dispatch(setAppLoadedModule(true))
	end):catch(function(p2) --[[ line: 21 ]]
		warn("AppChat.Conversations.Thunks.FetchInitialChatData with error: ", tostring(p2))
	end)
end