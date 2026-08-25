local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local chatLandingTelemetryLayerModule = require(parent.AppChat.ChatLandingTelemetryLayer)
local chatLandingTelemetryStateModule = require(parent.AppChat.ChatLandingTelemetryState)
local useGetAndSetRefModule = require(parent.AppChat.useGetAndSetRef)

return function(p0)
	-- upvalues: useGetAndSetRefModule (ref), reactModule (ref), chatLandingTelemetryStateModule (ref), chatLandingTelemetryLayerModule (ref)
	local var4, var5 = useGetAndSetRefModule({})
	
	return reactModule.createElement(chatLandingTelemetryStateModule.Provider, { value = { get = var4, set = var5 } }, {
		Layer = reactModule.createElement(chatLandingTelemetryLayerModule.Provider, {
			value = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				local var6 = var4()
				
				return {
					chatLandingListCount = var6.chatLandingListCount,
					pendingConversationCount = var6.pendingConversationCount,
					unfilteredConversationCount = var6.unfilteredConversationCount
				}
			end, { var4 })
		}, p0.children)
	})
end