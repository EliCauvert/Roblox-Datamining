local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local GetSduiTelemetryHandlerNameRegistryFunction = require(Parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppSduiQuerySuggestionClickedTelemetry = SharedFlagsModule.FFlagLuaAppSduiQuerySuggestionClickedTelemetry
local FFlagLuaAppSduiGameTileFeedback = SharedFlagsModule.FFlagLuaAppSduiGameTileFeedback

return function()
	-- upvalues: GetSduiTelemetryHandlerNameRegistryFunction (copy), FFlagLuaAppSduiGameTileFeedback (copy), FFlagLuaAppSduiQuerySuggestionClickedTelemetry (copy)
	GetSduiTelemetryHandlerNameRegistryFunction().registerTelemetryHandlers({
		LeavingRoblox = {
			lazyHandler = function()
				return require(script.Parent.SduiLeavingRobloxTelemetryHandler)
			end
		},
		SocialLinkClick = {
			lazyHandler = function()
				return require(script.Parent.SduiOpenSocialLinkProfileTelemetryHandler)
			end
		},
		EventJoined = {
			lazyHandler = function()
				return require(script.Parent.SduiEventJoinedTelemetryHandler)
			end
		},
		ShareEventIconClicked = {
			lazyHandler = function()
				return require(script.Parent.SduiShareEventTelemetryHandler)
			end
		},
		RequestRefundClick = {
			lazyHandler = function()
				return require(script.Parent.SduiRequestRefundClickTelemetryHandler)
			end
		},
		EdpStoreItemClick = {
			lazyHandler = function()
				return require(script.Parent.SduiEdpStoreItemClickTelemetryHandler)
			end
		},
		ExperienceDetailsJoinFriends = {
			lazyHandler = function()
				return require(script.Parent.SduiExperienceDetailsJoinFriendsTelemetryHandler)
			end
		},
		ExperienceDetailsCreatePrivateServer = {
			lazyHandler = function()
				return require(script.Parent.SduiExperienceDetailsCreatePrivateServerTelemetryHandler)
			end
		},
		EdpStorePurchaseAttempt = {
			lazyHandler = function()
				return require(script.Parent.SduiEdpStorePurchaseAttemptTelemetryHandler)
			end
		},
		GameDetailsSubpage = {
			lazyHandler = function()
				return require(script.Parent.SduiGameDetailsSubpageTelemetryHandler)
			end
		},
		GameTileOverflowMenu = if FFlagLuaAppSduiGameTileFeedback then {
			lazyHandler = function()
				return require(script.Parent.SduiGameTileOverflowMenuTelemetryHandler)
			end
		} else nil,
		OpenSearchResultsWithQueryEdp = {
			lazyHandler = function()
				return require(script.Parent.SduiOpenSearchResultsWithQueryEdpTelemetryHandler)
			end
		},
		QuerySuggestionClicked = if FFlagLuaAppSduiQuerySuggestionClickedTelemetry then {
			lazyHandler = function()
				return require(script.Parent.SduiQuerySuggestionClickedTelemetryHandler)
			end
		} else nil
	})
end