local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetSduiComponentRegistryFunction = SduiCoreSystemModule.getSduiComponentRegistry
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local FFlagSduiRequestFriendshipAction = require(Parent.SharedFlags).FFlagSduiRequestFriendshipAction

return function()
	-- upvalues: SduiComponentType (copy), FFlagSduiRequestFriendshipAction (copy), SocialServerDrivenUi (copy), GetSduiComponentRegistryFunction (copy)
	GetSduiComponentRegistryFunction().registerComponentDefinitions({
		[SduiComponentType.FriendRequestButton] = if FFlagSduiRequestFriendshipAction then {
			getLazyComponent = function()
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Components.SduiFriendRequestButton)
			end
		} else nil
	})
end