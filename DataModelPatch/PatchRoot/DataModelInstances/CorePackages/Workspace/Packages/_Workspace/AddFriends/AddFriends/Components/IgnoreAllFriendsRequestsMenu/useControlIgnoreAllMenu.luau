local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local FoundationModule = require(Parent.Foundation)
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local FFlagAddFriendsUserListEnabled = require(Parent.SharedFlags).FFlagAddFriendsUserListEnabled

return function()
	-- upvalues: ReactModule (copy), FFlagAddFriendsUserListEnabled (copy), IconName (copy), IconVariant (copy), Images (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return {
		isMenuOpen = UseStateResult,
		menuIcon = if FFlagAddFriendsUserListEnabled then {
			name = IconName.ThreeDotsHorizontal,
			variant = if UseStateResult then IconVariant.Filled else IconVariant.Regular
		} elseif UseStateResult then Images["icons/menu/more_on"] else Images["icons/menu/more_off"],
		onIconClick = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p1): boolean
				return not p1
			end)
		end, {}),
		closeMenu = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {})
	}
end