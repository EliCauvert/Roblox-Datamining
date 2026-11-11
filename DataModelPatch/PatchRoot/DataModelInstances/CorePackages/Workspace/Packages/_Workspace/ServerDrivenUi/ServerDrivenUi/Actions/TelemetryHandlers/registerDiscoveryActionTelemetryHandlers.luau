local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local GetSduiTelemetryHandlerNameRegistryFunction = require(Parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport
local FFlagLuaAppSduiOpenSearchResultsWithQueryAction = SharedFlagsModule.FFlagLuaAppSduiOpenSearchResultsWithQueryAction

return function()
	-- upvalues: GetSduiTelemetryHandlerNameRegistryFunction (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagLuaAppSduiOpenSearchResultsWithQueryAction (copy)
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
		RequestRefundClick = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiRequestRefundClickTelemetryHandler)
			end
		} else nil,
		EdpStoreItemClick = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiEdpStoreItemClickTelemetryHandler)
			end
		} else nil,
		ExperienceDetailsJoinFriends = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiExperienceDetailsJoinFriendsTelemetryHandler)
			end
		} else nil,
		ExperienceDetailsCreatePrivateServer = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiExperienceDetailsCreatePrivateServerTelemetryHandler)
			end
		} else nil,
		EdpStorePurchaseAttempt = {
			lazyHandler = function()
				return require(script.Parent.SduiEdpStorePurchaseAttemptTelemetryHandler)
			end
		},
		GameDetailsSubpage = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				return require(script.Parent.SduiGameDetailsSubpageTelemetryHandler)
			end
		} else nil,
		OpenSearchResultsWithQueryEdp = if FFlagLuaAppSduiOpenSearchResultsWithQueryAction then {
			lazyHandler = function()
				return require(script.Parent.SduiOpenSearchResultsWithQueryEdpTelemetryHandler)
			end
		} else nil
	})
end