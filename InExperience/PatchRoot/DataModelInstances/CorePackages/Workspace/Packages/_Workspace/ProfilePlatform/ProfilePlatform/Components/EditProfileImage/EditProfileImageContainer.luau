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
local AXEditProfileImageFillCardHeight = game:DefineFastFlag("AXEditProfileImageFillCardHeight", false)

local function _(p1)
	-- upvalues: appPage (ref)
	return if p1 ~= appPage.AvatarExperienceWrapper then p1 == appPage.AvatarExperienceWrapperTransparent else true
end

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useScreenSize (ref), useSelector (ref), selectors (ref), appPage (ref), useDispatch (ref), reactModule (ref), closeProfilePictureEditor (ref), showEditProfileImageToast (ref), enumsModule (ref), enums (ref), view (ref), AXEditProfileImageFillCardHeight (ref), editProfileImage (ref)
	local var1 = useProfileWrapperContextModule()
	local renderRecommendedEmotePurchaseFooter = var1.renderRecommendedEmotePurchaseFooter
	assert(renderRecommendedEmotePurchaseFooter, "Edit Profile Image requires a host purchase-footer renderer")
	local var2 = useScreenSize()
	local var3 = useSelector(function(p2)
		return p2.GlobalGuiInset
	end)
	local var4 = useSelector(selectors.selectCurrentPageName)
	local var5 = if var4 ~= appPage.AvatarExperienceWrapper then var4 == appPage.AvatarExperienceWrapperTransparent else true
	local var6 = useDispatch()
	local maxValue = math.max(0, var2.X - var3.left - var3.right)
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = if AXEditProfileImageFillCardHeight then UDim2.new(0, maxValue, 1, 0) else UDim2.fromOffset(maxValue, var2.Y),
		padding = { bottom = UDim.new(0, var3.bottom) }
	}, {
		Content = reactModule.createElement(view, { tag = "size-full-full" }, {
			EditProfileImage = reactModule.createElement(editProfileImage, {
				mode = if p1.navigation.getParam then p1.navigation.getParam("mode", enums.EditProfileImageMode.Default) else enums.EditProfileImageMode.Default,
				onClose = reactModule.useCallback(function()
					-- upvalues: closeProfilePictureEditor (copy), p1 (ref)
					closeProfilePictureEditor(p1.navigation)
				end, { p1.navigation }),
				onSaveSuccess = reactModule.useCallback(function()
					-- upvalues: showEditProfileImageToast (copy), var6 (ref), closeProfilePictureEditor (copy), p1 (ref)
					showEditProfileImageToast.showSaveSuccessToast(var6)
					closeProfilePictureEditor(p1.navigation)
				end, { var6, p1.navigation }),
				onOpenEmoteDetails = reactModule.useCallback(function(p2)
					-- upvalues: var1 (ref), enumsModule (copy)
					local navigateTo = var1.navigateTo
					local t = { mountAnimation = true }
					
					if navigateTo.itemOrBundleDetails then
						navigateTo.itemOrBundleDetails(p2, enumsModule.ItemTypes.Asset, t)
						
						return
					end
					navigateTo.itemDetails(p2, t)
				end, { var1.navigateTo }),
				onPrepareRecommendedEmotePurchase = reactModule.useCallback(function(p2)
					-- upvalues: var1 (ref), enumsModule (copy)
					local preparePurchaseItem = var1.navigateTo.preparePurchaseItem
					
					if preparePurchaseItem then
						preparePurchaseItem(p2, enumsModule.ItemTypes.Asset)
					end
				end, { var1.navigateTo }),
				onShopForMoreEmotes = reactModule.useCallback(function()
					-- upvalues: var1 (ref)
					local shopForMoreEmotes = var1.navigateTo.shopForMoreEmotes
					
					if shopForMoreEmotes then
						shopForMoreEmotes()
					end
				end, { var1.navigateTo }),
				renderRecommendedEmotePurchaseFooter = renderRecommendedEmotePurchaseFooter
			})
		}),
		DetailsInputBlocker = if var5 then reactModule.createElement(view, {
			tag = "position-top-left size-full",
			ZIndex = 10,
			Active = true
		}) else nil
	})
end