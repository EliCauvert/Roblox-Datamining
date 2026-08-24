local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getSduiComponentRegistry = sduiCoreSystemModule.getSduiComponentRegistry
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiRequestFriendshipAction = sharedFlagsModule.FFlagSduiRequestFriendshipAction
local fFlagLuaAppSduiHomeFriendCarousel = sharedFlagsModule.FFlagLuaAppSduiHomeFriendCarousel

return function() --[[ line: 19 | named "registerSocialComponents" ]]
	-- upvalues: sduiComponentType (ref), fFlagLuaAppSduiHomeFriendCarousel (ref), socialServerDrivenUi (ref), fFlagSduiRequestFriendshipAction (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions({
		[sduiComponentType.FriendCarousel] = if fFlagLuaAppSduiHomeFriendCarousel then {
			getLazyComponent = function() --[[ line: 23 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Components.SduiFriendCarousel)
			end
		} else nil,
		[sduiComponentType.FriendRequestButton] = if fFlagSduiRequestFriendshipAction then {
			getLazyComponent = function() --[[ line: 30 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Components.SduiFriendRequestButton)
			end
		} else nil
	})
end