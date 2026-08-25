local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local appTelemetryLayerModule = require(parent.AppChat.AppTelemetryLayer)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local useTelemetryModule = require(parent.AppChat.useTelemetry)
local appLevelTelemetryEventsModule = require(script.Parent.AppLevelTelemetryEvents)

local function _()
	-- upvalues: getFriendsChatSettingsStoreModule (ref)
	return getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
end

return function()
	-- upvalues: useTelemetryModule (ref), appTelemetryLayerModule (ref), reactModule (ref), appLevelTelemetryEventsModule (ref), getFriendsChatSettingsStoreModule (ref)
	local emit = useTelemetryModule(appTelemetryLayerModule.Context).emit
	reactModule.useEffect(function()
		-- upvalues: emit (ref), appLevelTelemetryEventsModule (copy), getFriendsChatSettingsStoreModule (copy)
		emit(appLevelTelemetryEventsModule.AppChatVisible, {
			isChatEnabled = getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
		})
		
		return function()
			-- upvalues: emit (copy), appLevelTelemetryEventsModule (copy), getFriendsChatSettingsStoreModule (copy)
			emit(appLevelTelemetryEventsModule.AppChatClosed, {
				isChatEnabled = getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
			})
		end
	end, {})
end