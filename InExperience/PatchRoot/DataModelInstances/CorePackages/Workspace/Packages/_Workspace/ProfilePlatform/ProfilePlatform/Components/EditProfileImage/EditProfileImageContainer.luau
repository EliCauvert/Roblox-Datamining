local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local NavigationRoduxModule = require(Parent.NavigationRodux)
local AvatarExperienceProfilePictureEditorModule = require(Parent.AvatarExperienceProfilePictureEditor)
local EditProfileImage = AvatarExperienceProfilePictureEditorModule.EditProfileImage
local Enums = AvatarExperienceProfilePictureEditorModule.Enums
local CloseProfilePictureEditorFunction = AvatarExperienceProfilePictureEditorModule.closeProfilePictureEditor
local ShowEditProfileImageToast = AvatarExperienceProfilePictureEditorModule.showEditProfileImageToast
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FFlagEditProfileImageR15UpgradePrompt = require(Parent.SharedFlags).FFlagEditProfileImageR15UpgradePrompt
local FFlagEditProfileFramesEnabled = require(Parent.SharedFlags).FFlagEditProfileFramesEnabled
local FFlagEditProfileFramesImpression = require(Parent.EditProfile).Flags.FFlagEditProfileFramesImpression
local FFlagSignalsNavP3hMisc = require(Parent.SharedFlags).FFlagSignalsNavP3hMisc
local FFlagSplitPaneProfileEditFillPane = require(Parent.SharedFlags).FFlagSplitPaneProfileEditFillPane
local SplitPaneModule = if FFlagSplitPaneProfileEditFillPane then require(Parent.SplitPane) else nil
local UseReportFramesImpressionModule = require(ProfilePlatform.Hooks.useReportFramesImpression)
local View = require(Parent.Foundation).View
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local SignalsModule = require(Parent.Signals)
local Selectors = NavigationRoduxModule.Selectors
local GetLegacyNavigationStoreFunction = NavigationRoduxModule.GetLegacyNavigationStore
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AXEditProfileImageFillCardHeight = game:DefineFastFlag("AXEditProfileImageFillCardHeight", false)

local function _(AvatarExperienceWrapper): boolean
	-- upvalues: AppPage (copy)
	return AvatarExperienceWrapper == AppPage.AvatarExperienceWrapper or AvatarExperienceWrapper == AppPage.AvatarExperienceWrapperTransparent
end

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseScreenSizeFunction (copy), UseSelectorFunction (copy), FFlagSignalsNavP3hMisc (copy), ReactModule (copy), SignalsModule (copy), GetLegacyNavigationStoreFunction (copy), AppPage (copy), UseSignalStateFunction (copy), Selectors (copy), UseDispatchFunction (copy), FFlagSplitPaneProfileEditFillPane (copy), SplitPaneModule (copy), CloseProfilePictureEditorFunction (copy), ShowEditProfileImageToast (copy), EnumsModule (copy), FFlagEditProfileImageR15UpgradePrompt (copy), FFlagEditProfileFramesImpression (copy), FFlagEditProfileFramesEnabled (copy), UseReportFramesImpressionModule (copy), Enums (copy), View (copy), AXEditProfileImageFillCardHeight (copy), EditProfileImage (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local RenderRecommendedEmotePurchaseFooter = UseProfileWrapperContextModuleResult.renderRecommendedEmotePurchaseFooter
	assert(RenderRecommendedEmotePurchaseFooter, "Edit Profile Image requires a host purchase-footer renderer")
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.GlobalGuiInset
	end)
	local UseSignalStateResult = nil
	
	if FFlagSignalsNavP3hMisc then
		UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), GetLegacyNavigationStoreFunction (upval), AppPage (upval)
			return SignalsModule.createComputed(function(p2): boolean
				-- upvalues: GetLegacyNavigationStoreFunction (upval), AppPage (upval)
				local CurrentPageName = GetLegacyNavigationStoreFunction(false).getCurrentPageName(p2)
				
				return CurrentPageName == AppPage.AvatarExperienceWrapper or CurrentPageName == AppPage.AvatarExperienceWrapperTransparent
			end)
		end, {})))
	else
		local UseSelectorResult1 = UseSelectorFunction(Selectors.selectCurrentPageName)
		UseSignalStateResult = UseSelectorResult1 == AppPage.AvatarExperienceWrapper or UseSelectorResult1 == AppPage.AvatarExperienceWrapperTransparent
	end
	local UseDispatchResult = UseDispatchFunction()
	local Largest = math.max(0, UseScreenSizeResult.X - UseSelectorResult.left - UseSelectorResult.right)
	local HasProfileSplitPaneEligibility = false
	local v1: Vector2? = nil
	
	if FFlagSplitPaneProfileEditFillPane then
		local Store = SplitPaneModule.SplitPaneStore.getStore()
		local UseSignalStateResult1 = UseSignalStateFunction(Store.getSupportPaneModeIfActive)
		local UseSignalStateResult2 = UseSignalStateFunction(Store.getSupportWidthFraction)
		HasProfileSplitPaneEligibility = UseSignalStateResult1 ~= nil and SplitPaneModule.SplitPaneVariant.getProfileSplitPaneEligibility(UseSignalStateResult1) ~= nil
		
		if HasProfileSplitPaneEligibility then
			v1 = Vector2.new(if UseSignalStateResult1 == SplitPaneModule.SupportPaneMode.Expanded then Largest else UseScreenSizeResult.X * UseSignalStateResult2, UseScreenSizeResult.Y)
		end
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CloseProfilePictureEditorFunction (upval), p1 (copy)
		CloseProfilePictureEditorFunction(p1.navigation)
	end, { p1.navigation })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ShowEditProfileImageToast (upval), UseDispatchResult (copy), CloseProfilePictureEditorFunction (upval), p1 (copy)
		ShowEditProfileImageToast.showSaveSuccessToast(UseDispatchResult)
		CloseProfilePictureEditorFunction(p1.navigation)
	end, { UseDispatchResult, p1.navigation })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseProfileWrapperContextModuleResult (copy), EnumsModule (upval)
		local NavigateTo = UseProfileWrapperContextModuleResult.navigateTo
		local config = { mountAnimation = true }
		
		if NavigateTo.itemOrBundleDetails then
			NavigateTo.itemOrBundleDetails(p2, EnumsModule.ItemTypes.Asset, config)
			
			return
		else
			NavigateTo.itemDetails(p2, config)
		end
	end, { UseProfileWrapperContextModuleResult.navigateTo })
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseProfileWrapperContextModuleResult (copy), EnumsModule (upval)
		local PreparePurchaseItemFunction: (any, any) -> () = UseProfileWrapperContextModuleResult.navigateTo.preparePurchaseItem
		
		if PreparePurchaseItemFunction then
			PreparePurchaseItemFunction(p2, EnumsModule.ItemTypes.Asset)
		end
	end, { UseProfileWrapperContextModuleResult.navigateTo })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseProfileWrapperContextModuleResult (copy)
		local ShopForMoreEmotesFunction: () -> () = UseProfileWrapperContextModuleResult.navigateTo.shopForMoreEmotes
		
		if ShopForMoreEmotesFunction then
			ShopForMoreEmotesFunction()
		end
	end, { UseProfileWrapperContextModuleResult.navigateTo })
	local UseResult5 = if FFlagEditProfileImageR15UpgradePrompt then ReactModule.useCallback(function(p2)
		-- upvalues: UseProfileWrapperContextModuleResult (copy)
		local PromptR15UpgradeFunction: (any) -> () = UseProfileWrapperContextModuleResult.navigateTo.promptR15Upgrade
		
		if PromptR15UpgradeFunction then
			PromptR15UpgradeFunction(p2)
		end
	end, { UseProfileWrapperContextModuleResult.navigateTo }) else nil
	
	if FFlagEditProfileFramesImpression and FFlagEditProfileFramesEnabled then
		UseReportFramesImpressionModule()
	end
	return ReactModule.createElement(View, {
		tag = "bg-surface-0",
		Size = if FFlagSplitPaneProfileEditFillPane and HasProfileSplitPaneEligibility then UDim2.fromScale(1, 1) elseif AXEditProfileImageFillCardHeight then UDim2.new(0, Largest, 1, 0) else UDim2.fromOffset(Largest, UseScreenSizeResult.Y),
		padding = { bottom = UDim.new(0, UseSelectorResult.bottom) }
	}, {
		Content = ReactModule.createElement(View, { tag = "size-full-full" }, {
			EditProfileImage = ReactModule.createElement(EditProfileImage, {
				mode = if p1.navigation.getParam then p1.navigation.getParam("mode", Enums.EditProfileImageMode.Default) else Enums.EditProfileImageMode.Default,
				onClose = UseResult,
				onSaveSuccess = UseResult1,
				onOpenEmoteDetails = UseResult2,
				onPrepareRecommendedEmotePurchase = UseResult3,
				onShopForMoreEmotes = UseResult4,
				onPromptR15Upgrade = UseResult5,
				accountRigType = if FFlagEditProfileImageR15UpgradePrompt then UseProfileWrapperContextModuleResult.accountRigType else nil,
				renderRecommendedEmotePurchaseFooter = RenderRecommendedEmotePurchaseFooter,
				containerSize = if FFlagSplitPaneProfileEditFillPane and HasProfileSplitPaneEligibility then v1 else nil
			})
		}),
		DetailsInputBlocker = if UseSignalStateResult then ReactModule.createElement(View, {
			tag = "position-top-left size-full",
			ZIndex = 10,
			Active = true
		}) else nil
	})
end