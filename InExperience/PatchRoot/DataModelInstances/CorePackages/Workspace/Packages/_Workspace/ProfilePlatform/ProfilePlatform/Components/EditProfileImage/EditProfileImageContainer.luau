local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local roactUtilsModule = require(parent.RoactUtils)
local navigationRoduxModule = require(parent.NavigationRodux)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local avatarExperienceProfilePictureEditorModule = require(parent.AvatarExperienceProfilePictureEditor)
local editProfileImage = avatarExperienceProfilePictureEditorModule.EditProfileImage
local enums = avatarExperienceProfilePictureEditorModule.Enums
local closeProfilePictureEditor = avatarExperienceProfilePictureEditorModule.closeProfilePictureEditor
local showEditProfileImageToast = avatarExperienceProfilePictureEditorModule.showEditProfileImageToast
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local view = foundationModule.View
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local selectors = navigationRoduxModule.Selectors
local appPage = robloxAppEnumsModule.AppPage

local function _(p0) --[[ line: 29 | named "isAppItemDetailsPage" ]]
	-- upvalues: appPage (ref)
	return if p0 ~= appPage.AvatarExperienceWrapper then p0 == appPage.AvatarExperienceWrapperTransparent else true
end

return function(p1) --[[ line: 42 | named "EditProfileImageContainer" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useScreenSize (ref), useSelector (ref), selectors (ref), appPage (ref), useDispatch (ref), reactModule (ref), closeProfilePictureEditor (ref), showEditProfileImageToast (ref), enumsModule (ref), enums (ref), view (ref), editProfileImage (ref)
	local var9 = useProfileWrapperContextModule()
	local renderRecommendedEmotePurchaseFooter = var9.renderRecommendedEmotePurchaseFooter
	assert(renderRecommendedEmotePurchaseFooter, "Edit Profile Image requires a host purchase-footer renderer")
	local var10 = useScreenSize()
	local var11 = useSelector(function(p2) --[[ line: 47 ]]
		return p2.GlobalGuiInset
	end)
	local var12 = useSelector(selectors.selectCurrentPageName)
	local var13 = useDispatch()
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(math.max(0, var10.X - var11.left - var11.right), var10.Y),
		padding = { bottom = UDim.new(0, var11.bottom) }
	}, {
		Content = reactModule.createElement(view, { tag = "size-full-full" }, {
			EditProfileImage = reactModule.createElement(editProfileImage, {
				mode = if p1.navigation.getParam then p1.navigation.getParam("mode", enums.EditProfileImageMode.Default) else enums.EditProfileImageMode.Default,
				fullBleed = if p1.navigation.getParam then p1.navigation.getParam("fullBleed") else nil,
				onClose = reactModule.useCallback(function() --[[ line: 54 ]]
					-- upvalues: closeProfilePictureEditor (copy), p1 (ref)
					closeProfilePictureEditor(p1.navigation)
				end, { p1.navigation }),
				onSaveSuccess = reactModule.useCallback(function() --[[ line: 58 ]]
					-- upvalues: showEditProfileImageToast (copy), var13 (ref), closeProfilePictureEditor (copy), p1 (ref)
					showEditProfileImageToast.showSaveSuccessToast(var13)
					closeProfilePictureEditor(p1.navigation)
				end, { var13, p1.navigation }),
				onOpenEmoteDetails = reactModule.useCallback(function(p3) --[[ line: 63 ]]
					-- upvalues: var9 (ref), enumsModule (copy)
					local navigateTo = var9.navigateTo
					local t = { mountAnimation = true }
					
					if navigateTo.itemOrBundleDetails then
						navigateTo.itemOrBundleDetails(p3, enumsModule.ItemTypes.Asset, t)
						
						return
					end
					navigateTo.itemDetails(p3, t)
				end, { var9.navigateTo }),
				onPrepareRecommendedEmotePurchase = reactModule.useCallback(function(p4) --[[ line: 74 ]]
					-- upvalues: var9 (ref), enumsModule (copy)
					local preparePurchaseItem = var9.navigateTo.preparePurchaseItem
					
					if preparePurchaseItem then
						preparePurchaseItem(p4, enumsModule.ItemTypes.Asset)
					end
				end, { var9.navigateTo }),
				onShopForMoreEmotes = reactModule.useCallback(function() --[[ line: 81 ]]
					-- upvalues: var9 (ref)
					local shopForMoreEmotes = var9.navigateTo.shopForMoreEmotes
					
					if shopForMoreEmotes then
						shopForMoreEmotes()
					end
				end, { var9.navigateTo }),
				renderRecommendedEmotePurchaseFooter = renderRecommendedEmotePurchaseFooter
			})
		}),
		DetailsInputBlocker = if if var12 ~= appPage.AvatarExperienceWrapper then var12 == appPage.AvatarExperienceWrapperTransparent else true then reactModule.createElement(view, {
			tag = "position-top-left size-full",
			ZIndex = 10,
			Active = true
		}) else nil
	})
end