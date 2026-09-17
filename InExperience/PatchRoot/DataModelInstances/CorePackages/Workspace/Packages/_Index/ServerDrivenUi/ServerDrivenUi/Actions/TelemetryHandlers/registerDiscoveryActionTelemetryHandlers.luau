local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local getSduiTelemetryHandlerNameRegistry = require(parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiOpenSearchResultsWithQueryAction = sharedFlagsModule.FFlagLuaAppSduiOpenSearchResultsWithQueryAction
local fFlagLuaAppSduiQuerySuggestionClickedTelemetry = sharedFlagsModule.FFlagLuaAppSduiQuerySuggestionClickedTelemetry
local fFlagLuaAppSduiGameTileFeedback = sharedFlagsModule.FFlagLuaAppSduiGameTileFeedback

return function()
	-- upvalues: getSduiTelemetryHandlerNameRegistry (ref), fFlagLuaAppSduiGameTileFeedback (ref), fFlagLuaAppSduiOpenSearchResultsWithQueryAction (ref), fFlagLuaAppSduiQuerySuggestionClickedTelemetry (ref)
	getSduiTelemetryHandlerNameRegistry().registerTelemetryHandlers({
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
		GameTileOverflowMenu = if fFlagLuaAppSduiGameTileFeedback then {
			lazyHandler = function()
				return require(script.Parent.SduiGameTileOverflowMenuTelemetryHandler)
			end
		} else nil,
		OpenSearchResultsWithQueryEdp = if fFlagLuaAppSduiOpenSearchResultsWithQueryAction then {
			lazyHandler = function()
				return require(script.Parent.SduiOpenSearchResultsWithQueryEdpTelemetryHandler)
			end
		} else nil,
		QuerySuggestionClicked = if fFlagLuaAppSduiQuerySuggestionClickedTelemetry then {
			lazyHandler = function()
				return require(script.Parent.SduiQuerySuggestionClickedTelemetryHandler)
			end
		} else nil
	})
end