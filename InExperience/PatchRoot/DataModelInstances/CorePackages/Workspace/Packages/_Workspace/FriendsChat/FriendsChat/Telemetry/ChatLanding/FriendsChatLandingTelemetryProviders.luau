local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local chatLandingTelemetryLayerModule = require(parent.AppChat.ChatLandingTelemetryLayer)
local chatLandingTelemetryStateModule = require(parent.AppChat.ChatLandingTelemetryState)
local useGetAndSetRefModule = require(parent.AppChat.useGetAndSetRef)

return function(p1)
	-- upvalues: useGetAndSetRefModule (ref), reactModule (ref), chatLandingTelemetryStateModule (ref), chatLandingTelemetryLayerModule (ref)
	local var1, var2 = useGetAndSetRefModule({})
	
	return reactModule.createElement(chatLandingTelemetryStateModule.Provider, { value = { get = var1, set = var2 } }, {
		Layer = reactModule.createElement(chatLandingTelemetryLayerModule.Provider, {
			value = reactModule.useCallback(function()
				-- upvalues: var1 (ref)
				local var3 = var1()
				
				return {
					chatLandingListCount = var3.chatLandingListCount,
					pendingConversationCount = var3.pendingConversationCount,
					unfilteredConversationCount = var3.unfilteredConversationCount
				}
			end, { var1 })
		}, p1.children)
	})
end