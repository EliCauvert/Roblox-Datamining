local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local getSduiTelemetryHandlerNameRegistry = require(parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppSduiOpenSearchResultsWithQueryAction = sharedFlagsModule.FFlagLuaAppSduiOpenSearchResultsWithQueryAction

return function() --[[ line: 11 | named "registerDiscoveryActionTelemetryHandlers" ]]
	-- upvalues: getSduiTelemetryHandlerNameRegistry (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppSduiOpenSearchResultsWithQueryAction (ref)
	getSduiTelemetryHandlerNameRegistry().registerTelemetryHandlers({
		LeavingRoblox = {
			lazyHandler = function() --[[ line: 14 ]]
				return require(script.Parent.SduiLeavingRobloxTelemetryHandler)
			end
		},
		SocialLinkClick = {
			lazyHandler = function() --[[ line: 19 ]]
				return require(script.Parent.SduiOpenSocialLinkProfileTelemetryHandler)
			end
		},
		EventJoined = {
			lazyHandler = function() --[[ line: 24 ]]
				return require(script.Parent.SduiEventJoinedTelemetryHandler)
			end
		},
		ShareEventIconClicked = {
			lazyHandler = function() --[[ line: 29 ]]
				return require(script.Parent.SduiShareEventTelemetryHandler)
			end
		},
		RequestRefundClick = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 35 ]]
				return require(script.Parent.SduiRequestRefundClickTelemetryHandler)
			end
		} else nil,
		EdpStoreItemClick = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 42 ]]
				return require(script.Parent.SduiEdpStoreItemClickTelemetryHandler)
			end
		} else nil,
		ExperienceDetailsJoinFriends = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 49 ]]
				return require(script.Parent.SduiExperienceDetailsJoinFriendsTelemetryHandler)
			end
		} else nil,
		ExperienceDetailsCreatePrivateServer = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 56 ]]
				return require(script.Parent.SduiExperienceDetailsCreatePrivateServerTelemetryHandler)
			end
		} else nil,
		EdpStorePurchaseAttempt = {
			lazyHandler = function() --[[ line: 62 ]]
				return require(script.Parent.SduiEdpStorePurchaseAttemptTelemetryHandler)
			end
		},
		GameDetailsSubpage = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 68 ]]
				return require(script.Parent.SduiGameDetailsSubpageTelemetryHandler)
			end
		} else nil,
		OpenSearchResultsWithQueryEdp = if fFlagLuaAppSduiOpenSearchResultsWithQueryAction then {
			lazyHandler = function() --[[ line: 75 ]]
				return require(script.Parent.SduiOpenSearchResultsWithQueryEdpTelemetryHandler)
			end
		} else nil
	})
end