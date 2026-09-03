local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local getSduiTelemetryHandlerNameRegistry = require(parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppSduiOpenSearchResultsWithQueryAction = sharedFlagsModule.FFlagLuaAppSduiOpenSearchResultsWithQueryAction
local fFlagLuaAppSduiQuerySuggestionClickedTelemetry = sharedFlagsModule.FFlagLuaAppSduiQuerySuggestionClickedTelemetry
local fFlagLuaAppSduiGameTileFeedback = sharedFlagsModule.FFlagLuaAppSduiGameTileFeedback

return function()
	-- upvalues: getSduiTelemetryHandlerNameRegistry (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppSduiGameTileFeedback (ref), fFlagLuaAppSduiOpenSearchResultsWithQueryAction (ref), fFlagLuaAppSduiQuerySuggestionClickedTelemetry (ref)
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
		RequestRefundClick = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiRequestRefundClickTelemetryHandler)
			end
		} else nil,
		EdpStoreItemClick = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiEdpStoreItemClickTelemetryHandler)
			end
		} else nil,
		ExperienceDetailsJoinFriends = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiExperienceDetailsJoinFriendsTelemetryHandler)
			end
		} else nil,
		ExperienceDetailsCreatePrivateServer = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiExperienceDetailsCreatePrivateServerTelemetryHandler)
			end
		} else nil,
		EdpStorePurchaseAttempt = {
			lazyHandler = function()
				return require(script.Parent.SduiEdpStorePurchaseAttemptTelemetryHandler)
			end
		},
		GameDetailsSubpage = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiGameDetailsSubpageTelemetryHandler)
			end
		} else nil,
		GameTileOverflowMenuNotInterested = if fFlagLuaAppSduiGameTileFeedback then {
			lazyHandler = function()
				return require(script.Parent.SduiGameTileOverflowMenuNotInterestedTelemetryHandler)
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