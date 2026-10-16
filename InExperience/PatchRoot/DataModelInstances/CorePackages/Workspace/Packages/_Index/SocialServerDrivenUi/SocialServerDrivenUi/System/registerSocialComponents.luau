local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetSduiComponentRegistryFunction = SduiCoreSystemModule.getSduiComponentRegistry
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiRequestFriendshipAction = SharedFlagsModule.FFlagSduiRequestFriendshipAction
local FFlagLuaAppSduiHomeFriendCarousel = SharedFlagsModule.FFlagLuaAppSduiHomeFriendCarousel
local FFlagLuaAppSduiHomePageSupport = SharedFlagsModule.FFlagLuaAppSduiHomePageSupport
local FFlagSduiUserSearchTile = SharedFlagsModule.FFlagSduiUserSearchTile

return function() --[[ Line: 21 | Named "registerSocialComponents" ]]
	-- upvalues: SduiComponentType (copy), FFlagLuaAppSduiHomeFriendCarousel (copy), SocialServerDrivenUi (copy), FFlagLuaAppSduiHomePageSupport (copy), FFlagSduiRequestFriendshipAction (copy), FFlagSduiUserSearchTile (copy), GetSduiComponentRegistryFunction (copy)
	GetSduiComponentRegistryFunction().registerComponentDefinitions({
		[SduiComponentType.FriendCarousel] = if FFlagLuaAppSduiHomeFriendCarousel then {
			getLazyComponent = function() --[[ Line: 25 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Components.SduiFriendCarousel)
			end
		} else nil,
		[SduiComponentType.PymkCarousel] = if FFlagLuaAppSduiHomePageSupport then {
			getLazyComponent = function() --[[ Line: 32 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Components.SduiPymkCarousel)
			end
		} else nil,
		[SduiComponentType.FriendRequestButton] = if FFlagSduiRequestFriendshipAction then {
			getLazyComponent = function() --[[ Line: 39 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Components.SduiFriendRequestButton)
			end
		} else nil,
		[SduiComponentType.UserSearchTile] = if FFlagSduiUserSearchTile then {
			getLazyComponent = function() --[[ Line: 46 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Components.SduiUserSearchTile)
			end
		} else nil
	})
end