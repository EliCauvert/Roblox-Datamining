local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local AddFriendsSectionHeaderFrameModule = require(AddFriends.Components.AddFriendsSectionHeaderFrame)
local UserListHeader = require(Parent.UserList).UserListHeader
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AccessResponseEnum = require(Parent.AmpUpsell).AmpEnums.AccessResponseEnum
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SharedFlagsModule = require(Parent.SharedFlags)
local FStringCanAccessTrustedContactsAmpFeature = SharedFlagsModule.FStringCanAccessTrustedContactsAmpFeature
local FStringCanAccessTrustedContactsAmpNameSpace = SharedFlagsModule.FStringCanAccessTrustedContactsAmpNameSpace
local FFlagAddFriendsUserListEnabled = SharedFlagsModule.FFlagAddFriendsUserListEnabled

return function(p1)
	-- upvalues: ReactModule (copy), AmpApiProvider (copy), FStringCanAccessTrustedContactsAmpFeature (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), AccessResponseEnum (copy), UseLocalizationFunction (copy), FFlagAddFriendsUserListEnabled (copy), UserListHeader (copy), AddFriendsSectionHeaderFrameModule (copy)
	local LayoutOrder = p1.layoutOrder or 1
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: AmpApiProvider (upval), FStringCanAccessTrustedContactsAmpFeature (upval), FStringCanAccessTrustedContactsAmpNameSpace (upval), AccessResponseEnum (upval), UseStateResult2 (copy)
		if AmpApiProvider.upsellFeatureAccess(FStringCanAccessTrustedContactsAmpFeature, {}, FStringCanAccessTrustedContactsAmpNameSpace).access == AccessResponseEnum.Granted then
			UseStateResult2(true)
		end
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.Friends.TrustedFriend.Label.AddTrustedFriends"
	})
	
	return if UseStateResult then if FFlagAddFriendsUserListEnabled then ReactModule.createElement(UserListHeader, {
		title = UseLocalizationResult.title,
		layoutOrder = LayoutOrder
	}) else ReactModule.createElement(AddFriendsSectionHeaderFrameModule, {
		title = UseLocalizationResult.title,
		layoutOrder = LayoutOrder
	}) else nil
end