local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local ChatLandingTelemetryLayerModule = require(Parent.AppChat.ChatLandingTelemetryLayer)
local ChatLandingTelemetryStateModule = require(Parent.AppChat.ChatLandingTelemetryState)
local UseGetAndSetRefModule = require(Parent.AppChat.useGetAndSetRef)

return function(p1) --[[ Line: 20 | Named "FriendsChatLandingTelemetryProviders" ]]
	-- upvalues: UseGetAndSetRefModule (copy), ReactModule (copy), ChatLandingTelemetryStateModule (copy), ChatLandingTelemetryLayerModule (copy)
	local UseGetAndSetRefModuleResult, UseGetAndSetRefModuleResult2 = UseGetAndSetRefModule({})
	
	return ReactModule.createElement(ChatLandingTelemetryStateModule.Provider, {
		value = {
			get = UseGetAndSetRefModuleResult,
			set = UseGetAndSetRefModuleResult2
		}
	}, {
		Layer = ReactModule.createElement(ChatLandingTelemetryLayerModule.Provider, {
			value = ReactModule.useCallback(function() --[[ Line: 22 ]]
				-- upvalues: UseGetAndSetRefModuleResult (copy)
				local UseGetAndSetRefModuleResultResult = UseGetAndSetRefModuleResult()
				
				return {
					chatLandingListCount = UseGetAndSetRefModuleResultResult.chatLandingListCount,
					pendingConversationCount = UseGetAndSetRefModuleResultResult.pendingConversationCount,
					unfilteredConversationCount = UseGetAndSetRefModuleResultResult.unfilteredConversationCount,
					searchSessionId = UseGetAndSetRefModuleResultResult.searchSessionId,
					activeFilters = UseGetAndSetRefModuleResultResult.activeFilters
				}
			end, { UseGetAndSetRefModuleResult })
		}, p1.children)
	})
end