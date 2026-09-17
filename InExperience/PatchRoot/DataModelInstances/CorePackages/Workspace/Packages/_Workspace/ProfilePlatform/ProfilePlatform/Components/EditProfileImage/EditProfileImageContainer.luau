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
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local fFlagEditProfileImageR15UpgradePrompt = require(parent.SharedFlags).FFlagEditProfileImageR15UpgradePrompt
local fFlagEditProfileFramesEnabled = require(parent.SharedFlags).FFlagEditProfileFramesEnabled
local fFlagEditProfileFramesImpression = require(parent.EditProfile).Flags.FFlagEditProfileFramesImpression
local fFlagSignalsNavP3hMisc = require(parent.SharedFlags).FFlagSignalsNavP3hMisc
local useReportFramesImpressionModule = require(profilePlatform.Hooks.useReportFramesImpression)
local view = foundationModule.View
local useScreenSize = robloxAppHooksModule.useScreenSize
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local signalsModule = require(parent.Signals)
local selectors = navigationRoduxModule.Selectors
local getLegacyNavigationStore = navigationRoduxModule.GetLegacyNavigationStore
local appPage = robloxAppEnumsModule.AppPage
local AXEditProfileImageFillCardHeight = game:DefineFastFlag("AXEditProfileImageFillCardHeight", false)
local editProfileImageSignalsNavCurrentPage = game:DefineFastFlag("EditProfileImageSignalsNavCurrentPage", false)

local function _(p1)
	-- upvalues: appPage (ref)
	return if p1 ~= appPage.AvatarExperienceWrapper then p1 == appPage.AvatarExperienceWrapperTransparent else true
end

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useScreenSize (ref), useSelector (ref), editProfileImageSignalsNavCurrentPage (ref), fFlagSignalsNavP3hMisc (ref), reactModule (ref), signalsModule (ref), getLegacyNavigationStore (ref), appPage (ref), useSignalState (ref), selectors (ref), useDispatch (ref), closeProfilePictureEditor (ref), showEditProfileImageToast (ref), enumsModule (ref), fFlagEditProfileImageR15UpgradePrompt (ref), fFlagEditProfileFramesImpression (ref), fFlagEditProfileFramesEnabled (ref), useReportFramesImpressionModule (ref), enums (ref), view (ref), AXEditProfileImageFillCardHeight (ref), editProfileImage (ref)
	local var1
	local var2 = useProfileWrapperContextModule()
	local renderRecommendedEmotePurchaseFooter = var2.renderRecommendedEmotePurchaseFooter
	assert(renderRecommendedEmotePurchaseFooter, "Edit Profile Image requires a host purchase-footer renderer")
	local var3 = useScreenSize()
	local var4 = useSelector(function(p2)
		return p2.GlobalGuiInset
	end)
	local _ = nil
	
	if editProfileImageSignalsNavCurrentPage and fFlagSignalsNavP3hMisc then
		var1 = useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), getLegacyNavigationStore (copy), appPage (copy)
			return signalsModule.createComputed(function(p2)
				-- upvalues: getLegacyNavigationStore (copy), appPage (copy)
				local currentPageName = getLegacyNavigationStore(false).getCurrentPageName(p2)
				
				return if currentPageName ~= appPage.AvatarExperienceWrapper then currentPageName == appPage.AvatarExperienceWrapperTransparent else true
			end)
		end, {}))
	else
		local var5 = useSelector(selectors.selectCurrentPageName)
		var1 = if var5 ~= appPage.AvatarExperienceWrapper then var5 == appPage.AvatarExperienceWrapperTransparent else true
	end
	local var6 = useDispatch()
	local var7 = reactModule.useCallback(function()
		-- upvalues: closeProfilePictureEditor (copy), p1 (ref)
		closeProfilePictureEditor(p1.navigation)
	end, { p1.navigation })
	local var8 = reactModule.useCallback(function()
		-- upvalues: showEditProfileImageToast (copy), var6 (ref), closeProfilePictureEditor (copy), p1 (ref)
		showEditProfileImageToast.showSaveSuccessToast(var6)
		closeProfilePictureEditor(p1.navigation)
	end, { var6, p1.navigation })
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), enumsModule (copy)
		local navigateTo = var2.navigateTo
		local t = { mountAnimation = true }
		
		if navigateTo.itemOrBundleDetails then
			navigateTo.itemOrBundleDetails(p2, enumsModule.ItemTypes.Asset, t)
			
			return
		end
		navigateTo.itemDetails(p2, t)
	end, { var2.navigateTo })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), enumsModule (copy)
		local preparePurchaseItem = var2.navigateTo.preparePurchaseItem
		
		if preparePurchaseItem then
			preparePurchaseItem(p2, enumsModule.ItemTypes.Asset)
		end
	end, { var2.navigateTo })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		local shopForMoreEmotes = var2.navigateTo.shopForMoreEmotes
		
		if shopForMoreEmotes then
			shopForMoreEmotes()
		end
	end, { var2.navigateTo })
	local var12 = if fFlagEditProfileImageR15UpgradePrompt then reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		local promptR15Upgrade = var2.navigateTo.promptR15Upgrade
		
		if promptR15Upgrade then
			promptR15Upgrade(p2)
		end
	end, { var2.navigateTo }) else nil
	
	if fFlagEditProfileFramesImpression and fFlagEditProfileFramesEnabled then
		useReportFramesImpressionModule()
	end
	local maxValue = math.max(0, var3.X - var4.left - var4.right)
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = if AXEditProfileImageFillCardHeight then UDim2.new(0, maxValue, 1, 0) else UDim2.fromOffset(maxValue, var3.Y),
		padding = { bottom = UDim.new(0, var4.bottom) }
	}, {
		Content = reactModule.createElement(view, { tag = "size-full-full" }, {
			EditProfileImage = reactModule.createElement(editProfileImage, {
				mode = if p1.navigation.getParam then p1.navigation.getParam("mode", enums.EditProfileImageMode.Default) else enums.EditProfileImageMode.Default,
				onClose = var7,
				onSaveSuccess = var8,
				onOpenEmoteDetails = var9,
				onPrepareRecommendedEmotePurchase = var10,
				onShopForMoreEmotes = var11,
				onPromptR15Upgrade = var12,
				accountRigType = if fFlagEditProfileImageR15UpgradePrompt then var2.accountRigType else nil,
				renderRecommendedEmotePurchaseFooter = renderRecommendedEmotePurchaseFooter
			})
		}),
		DetailsInputBlocker = if var1 then reactModule.createElement(view, {
			tag = "position-top-left size-full",
			ZIndex = 10,
			Active = true
		}) else nil
	})
end