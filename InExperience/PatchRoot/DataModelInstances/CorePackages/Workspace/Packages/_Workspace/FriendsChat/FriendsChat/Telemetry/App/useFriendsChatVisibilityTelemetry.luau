local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local appTelemetryLayerModule = require(parent.AppChat.AppTelemetryLayer)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local useTelemetryModule = require(parent.AppChat.useTelemetry)
local appLevelTelemetryEventsModule = require(script.Parent.AppLevelTelemetryEvents)

local function _() --[[ line: 19 | named "getIsChatEnabled" ]]
	-- upvalues: getFriendsChatSettingsStoreModule (ref)
	return getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
end

return function() --[[ line: 23 | named "useFriendsChatVisibilityTelemetry" ]]
	-- upvalues: useTelemetryModule (ref), appTelemetryLayerModule (ref), reactModule (ref), appLevelTelemetryEventsModule (ref), getFriendsChatSettingsStoreModule (ref)
	local emit = useTelemetryModule(appTelemetryLayerModule.Context).emit
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: emit (ref), appLevelTelemetryEventsModule (copy), getFriendsChatSettingsStoreModule (copy)
		emit(appLevelTelemetryEventsModule.AppChatVisible, {
			isChatEnabled = getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
		})
		
		return function() --[[ line: 35 ]]
			-- upvalues: emit (copy), appLevelTelemetryEventsModule (copy), getFriendsChatSettingsStoreModule (copy)
			emit(appLevelTelemetryEventsModule.AppChatClosed, {
				isChatEnabled = getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
			})
		end
	end, {})
end