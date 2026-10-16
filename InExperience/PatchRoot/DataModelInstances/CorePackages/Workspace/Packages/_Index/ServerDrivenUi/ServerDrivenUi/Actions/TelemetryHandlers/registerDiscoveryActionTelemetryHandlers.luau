local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local GetSduiTelemetryHandlerNameRegistryFunction = require(Parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppSduiQuerySuggestionClickedTelemetry = SharedFlagsModule.FFlagLuaAppSduiQuerySuggestionClickedTelemetry
local FFlagLuaAppSduiGameTileFeedback = SharedFlagsModule.FFlagLuaAppSduiGameTileFeedback

return function() --[[ Line: 11 | Named "registerDiscoveryActionTelemetryHandlers" ]]
	-- upvalues: GetSduiTelemetryHandlerNameRegistryFunction (copy), FFlagLuaAppSduiGameTileFeedback (copy), FFlagLuaAppSduiQuerySuggestionClickedTelemetry (copy)
	GetSduiTelemetryHandlerNameRegistryFunction().registerTelemetryHandlers({
		LeavingRoblox = {
			lazyHandler = function() --[[ Line: 14 ]]
				return require(script.Parent.SduiLeavingRobloxTelemetryHandler)
			end
		},
		SocialLinkClick = {
			lazyHandler = function() --[[ Line: 19 ]]
				return require(script.Parent.SduiOpenSocialLinkProfileTelemetryHandler)
			end
		},
		EventJoined = {
			lazyHandler = function() --[[ Line: 24 ]]
				return require(script.Parent.SduiEventJoinedTelemetryHandler)
			end
		},
		ShareEventIconClicked = {
			lazyHandler = function() --[[ Line: 29 ]]
				return require(script.Parent.SduiShareEventTelemetryHandler)
			end
		},
		RequestRefundClick = {
			lazyHandler = function() --[[ Line: 34 ]]
				return require(script.Parent.SduiRequestRefundClickTelemetryHandler)
			end
		},
		EdpStoreItemClick = {
			lazyHandler = function() --[[ Line: 39 ]]
				return require(script.Parent.SduiEdpStoreItemClickTelemetryHandler)
			end
		},
		ExperienceDetailsJoinFriends = {
			lazyHandler = function() --[[ Line: 44 ]]
				return require(script.Parent.SduiExperienceDetailsJoinFriendsTelemetryHandler)
			end
		},
		ExperienceDetailsCreatePrivateServer = {
			lazyHandler = function() --[[ Line: 49 ]]
				return require(script.Parent.SduiExperienceDetailsCreatePrivateServerTelemetryHandler)
			end
		},
		EdpStorePurchaseAttempt = {
			lazyHandler = function() --[[ Line: 54 ]]
				return require(script.Parent.SduiEdpStorePurchaseAttemptTelemetryHandler)
			end
		},
		GameDetailsSubpage = {
			lazyHandler = function() --[[ Line: 59 ]]
				return require(script.Parent.SduiGameDetailsSubpageTelemetryHandler)
			end
		},
		GameTileOverflowMenu = if FFlagLuaAppSduiGameTileFeedback then {
			lazyHandler = function() --[[ Line: 65 ]]
				return require(script.Parent.SduiGameTileOverflowMenuTelemetryHandler)
			end
		} else nil,
		OpenSearchResultsWithQueryEdp = {
			lazyHandler = function() --[[ Line: 71 ]]
				return require(script.Parent.SduiOpenSearchResultsWithQueryEdpTelemetryHandler)
			end
		},
		QuerySuggestionClicked = if FFlagLuaAppSduiQuerySuggestionClickedTelemetry then {
			lazyHandler = function() --[[ Line: 77 ]]
				return require(script.Parent.SduiQuerySuggestionClickedTelemetryHandler)
			end
		} else nil
	})
end