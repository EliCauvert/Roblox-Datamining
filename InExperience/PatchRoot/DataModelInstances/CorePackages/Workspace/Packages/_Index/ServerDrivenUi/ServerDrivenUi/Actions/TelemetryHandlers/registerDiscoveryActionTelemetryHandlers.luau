local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local GetSduiTelemetryHandlerNameRegistryFunction = require(Parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppSduiOpenSearchResultsWithQueryAction = SharedFlagsModule.FFlagLuaAppSduiOpenSearchResultsWithQueryAction
local FFlagLuaAppSduiQuerySuggestionClickedTelemetry = SharedFlagsModule.FFlagLuaAppSduiQuerySuggestionClickedTelemetry
local FFlagLuaAppSduiGameTileFeedback = SharedFlagsModule.FFlagLuaAppSduiGameTileFeedback

return function() --[[ Line: 12 | Named "registerDiscoveryActionTelemetryHandlers" ]]
	-- upvalues: GetSduiTelemetryHandlerNameRegistryFunction (copy), FFlagLuaAppSduiGameTileFeedback (copy), FFlagLuaAppSduiOpenSearchResultsWithQueryAction (copy), FFlagLuaAppSduiQuerySuggestionClickedTelemetry (copy)
	GetSduiTelemetryHandlerNameRegistryFunction().registerTelemetryHandlers({
		LeavingRoblox = {
			lazyHandler = function() --[[ Line: 15 ]]
				return require(script.Parent.SduiLeavingRobloxTelemetryHandler)
			end
		},
		SocialLinkClick = {
			lazyHandler = function() --[[ Line: 20 ]]
				return require(script.Parent.SduiOpenSocialLinkProfileTelemetryHandler)
			end
		},
		EventJoined = {
			lazyHandler = function() --[[ Line: 25 ]]
				return require(script.Parent.SduiEventJoinedTelemetryHandler)
			end
		},
		ShareEventIconClicked = {
			lazyHandler = function() --[[ Line: 30 ]]
				return require(script.Parent.SduiShareEventTelemetryHandler)
			end
		},
		RequestRefundClick = {
			lazyHandler = function() --[[ Line: 35 ]]
				return require(script.Parent.SduiRequestRefundClickTelemetryHandler)
			end
		},
		EdpStoreItemClick = {
			lazyHandler = function() --[[ Line: 40 ]]
				return require(script.Parent.SduiEdpStoreItemClickTelemetryHandler)
			end
		},
		ExperienceDetailsJoinFriends = {
			lazyHandler = function() --[[ Line: 45 ]]
				return require(script.Parent.SduiExperienceDetailsJoinFriendsTelemetryHandler)
			end
		},
		ExperienceDetailsCreatePrivateServer = {
			lazyHandler = function() --[[ Line: 50 ]]
				return require(script.Parent.SduiExperienceDetailsCreatePrivateServerTelemetryHandler)
			end
		},
		EdpStorePurchaseAttempt = {
			lazyHandler = function() --[[ Line: 55 ]]
				return require(script.Parent.SduiEdpStorePurchaseAttemptTelemetryHandler)
			end
		},
		GameDetailsSubpage = {
			lazyHandler = function() --[[ Line: 60 ]]
				return require(script.Parent.SduiGameDetailsSubpageTelemetryHandler)
			end
		},
		GameTileOverflowMenu = if FFlagLuaAppSduiGameTileFeedback then {
			lazyHandler = function() --[[ Line: 66 ]]
				return require(script.Parent.SduiGameTileOverflowMenuTelemetryHandler)
			end
		} else nil,
		OpenSearchResultsWithQueryEdp = if FFlagLuaAppSduiOpenSearchResultsWithQueryAction then {
			lazyHandler = function() --[[ Line: 73 ]]
				return require(script.Parent.SduiOpenSearchResultsWithQueryEdpTelemetryHandler)
			end
		} else nil,
		QuerySuggestionClicked = if FFlagLuaAppSduiQuerySuggestionClickedTelemetry then {
			lazyHandler = function() --[[ Line: 80 ]]
				return require(script.Parent.SduiQuerySuggestionClickedTelemetryHandler)
			end
		} else nil
	})
end