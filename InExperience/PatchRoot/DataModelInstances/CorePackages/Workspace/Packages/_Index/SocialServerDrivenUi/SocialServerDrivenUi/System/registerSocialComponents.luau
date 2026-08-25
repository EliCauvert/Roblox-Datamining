local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getSduiComponentRegistry = sduiCoreSystemModule.getSduiComponentRegistry
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiRequestFriendshipAction = sharedFlagsModule.FFlagSduiRequestFriendshipAction
local fFlagLuaAppSduiHomeFriendCarousel = sharedFlagsModule.FFlagLuaAppSduiHomeFriendCarousel

return function()
	-- upvalues: sduiComponentType (ref), fFlagLuaAppSduiHomeFriendCarousel (ref), socialServerDrivenUi (ref), fFlagSduiRequestFriendshipAction (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions({
		[sduiComponentType.FriendCarousel] = if fFlagLuaAppSduiHomeFriendCarousel then {
			getLazyComponent = function()
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Components.SduiFriendCarousel)
			end
		} else nil,
		[sduiComponentType.FriendRequestButton] = if fFlagSduiRequestFriendshipAction then {
			getLazyComponent = function()
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Components.SduiFriendRequestButton)
			end
		} else nil
	})
end