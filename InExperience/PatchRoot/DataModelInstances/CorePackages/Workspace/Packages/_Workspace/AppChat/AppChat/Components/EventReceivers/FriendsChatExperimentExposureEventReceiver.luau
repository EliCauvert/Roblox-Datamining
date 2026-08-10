local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getFriendsChatSettingsStoreModule = require(appChat.Stores.GetFriendsChatSettingsStore)
local var5 = require(appChat.Utils.IXPNavigationUtils).createExposureHandler(require(appChat.Flags.FStringAppChatFriendsTabIxpLayer))

return function() --[[ line: 14 | named "FriendsChatExperimentExposureEventReceiver" ]]
	-- upvalues: getFriendsChatSettingsStoreModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref), var5 (ref)
	local var6 = getFriendsChatSettingsStoreModule(false)
	local var7 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 16 ]]
		-- upvalues: signalsModule (copy), var6 (ref)
		return signalsModule.createComputed(function(p0) --[[ line: 17 ]]
			-- upvalues: var6 (copy)
			return var6.getChatEnabled(p0) and var6.getChatUserMessagesEnabled(p0) ~= false
		end)
	end, { var6 }))
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: var7 (ref), var5 (copy)
		if var7 then
			var5()
		end
	end, { var7 })
	
	return nil
end