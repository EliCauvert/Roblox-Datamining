local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getSduiComponentRegistry = sduiCoreSystemModule.getSduiComponentRegistry
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local fFlagSduiRequestFriendshipAction = require(parent.SharedFlags).FFlagSduiRequestFriendshipAction

return function() --[[ line: 17 | named "registerSocialComponents" ]]
	-- upvalues: sduiComponentType (ref), fFlagSduiRequestFriendshipAction (ref), socialServerDrivenUi (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions({
		[sduiComponentType.FriendRequestButton] = if fFlagSduiRequestFriendshipAction then {
			getLazyComponent = function() --[[ line: 21 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Components.SduiFriendRequestButton)
			end
		} else nil
	})
end