local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local getSduiTelemetryHandlerNameRegistry = require(parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppSduiOpenSearchResultsWithQueryAction = sharedFlagsModule.FFlagLuaAppSduiOpenSearchResultsWithQueryAction
local fFlagLuaAppSduiQuerySuggestionClickedTelemetry = sharedFlagsModule.FFlagLuaAppSduiQuerySuggestionClickedTelemetry

return function() --[[ line: 12 | named "registerDiscoveryActionTelemetryHandlers" ]]
	-- upvalues: getSduiTelemetryHandlerNameRegistry (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppSduiOpenSearchResultsWithQueryAction (ref), fFlagLuaAppSduiQuerySuggestionClickedTelemetry (ref)
	getSduiTelemetryHandlerNameRegistry().registerTelemetryHandlers({
		LeavingRoblox = {
			lazyHandler = function() --[[ line: 15 ]]
				return require(script.Parent.SduiLeavingRobloxTelemetryHandler)
			end
		},
		SocialLinkClick = {
			lazyHandler = function() --[[ line: 20 ]]
				return require(script.Parent.SduiOpenSocialLinkProfileTelemetryHandler)
			end
		},
		EventJoined = {
			lazyHandler = function() --[[ line: 25 ]]
				return require(script.Parent.SduiEventJoinedTelemetryHandler)
			end
		},
		ShareEventIconClicked = {
			lazyHandler = function() --[[ line: 30 ]]
				return require(script.Parent.SduiShareEventTelemetryHandler)
			end
		},
		RequestRefundClick = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 36 ]]
				return require(script.Parent.SduiRequestRefundClickTelemetryHandler)
			end
		} else nil,
		EdpStoreItemClick = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 43 ]]
				return require(script.Parent.SduiEdpStoreItemClickTelemetryHandler)
			end
		} else nil,
		ExperienceDetailsJoinFriends = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 50 ]]
				return require(script.Parent.SduiExperienceDetailsJoinFriendsTelemetryHandler)
			end
		} else nil,
		ExperienceDetailsCreatePrivateServer = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 57 ]]
				return require(script.Parent.SduiExperienceDetailsCreatePrivateServerTelemetryHandler)
			end
		} else nil,
		EdpStorePurchaseAttempt = {
			lazyHandler = function() --[[ line: 63 ]]
				return require(script.Parent.SduiEdpStorePurchaseAttemptTelemetryHandler)
			end
		},
		GameDetailsSubpage = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 69 ]]
				return require(script.Parent.SduiGameDetailsSubpageTelemetryHandler)
			end
		} else nil,
		OpenSearchResultsWithQueryEdp = if fFlagLuaAppSduiOpenSearchResultsWithQueryAction then {
			lazyHandler = function() --[[ line: 76 ]]
				return require(script.Parent.SduiOpenSearchResultsWithQueryEdpTelemetryHandler)
			end
		} else nil,
		QuerySuggestionClicked = if fFlagLuaAppSduiQuerySuggestionClickedTelemetry then {
			lazyHandler = function() --[[ line: 83 ]]
				return require(script.Parent.SduiQuerySuggestionClickedTelemetryHandler)
			end
		} else nil
	})
end