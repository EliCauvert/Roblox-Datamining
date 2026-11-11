local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local CryoModule = require(CorePackages.Packages.Cryo)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseAXAnimateScrollFrameFunction = AvatarExperienceCommonModule.Components.AnimatedScrollingFrame.useAXAnimateScrollFrame
local SelectTryOnsLookId = AvatarExperienceCommonModule.State.Selectors.selectTryOnsLookId
local PeekView = require(CorePackages.Workspace.Packages.PeekView).PeekView
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local _ = require(Modules.AvatarExperience.Common.Types)
local GetShouldShowPeekViewShadowModule = require(Modules.AvatarExperience.Common.Util.getShouldShowPeekViewShadow)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule1 = require(Modules.LuaApp.Constants)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local RemoveLookItemsFromTryOnFunction = AvatarExperienceRoduxModule.Actions.RemoveLookItemsFromTryOn
local RemoveUnselectedItemsFromTryOnFunction = AvatarExperienceRoduxModule.Actions.RemoveUnselectedItemsFromTryOn
local SetTryOnManagerPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetTryOnManagerPeekViewState
local SetLookDetailsPeekViewSelectedTabFunction = AvatarExperienceRoduxModule.Actions.SetLookDetailsPeekViewSelectedTab
local LookDetailsTryOnElementModule = require(Modules.AvatarExperience.Catalog.Components.LookDetails.LookDetailsTryOnElement)
local LookDetailsBottomBarModule = require(Modules.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBar)
local DraftLookBottomBarModule = require(Modules.AvatarExperience.Catalog.Components.LookDetails.DraftLookBottomBar)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local WithNamedRefsModule = require(Modules.AvatarExperience.Common.Context.withNamedRefs)
local WithLastInputGroupModule = require(Modules.AvatarExperience.Common.Components.withLastInputGroup)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local TabBarUnderlinedModule = require(Modules.AvatarExperience.Common.Components.NavBar.TabBar.TabBarUnderlined)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local LookDetailsContainerInnardsModule = require(Modules.AvatarExperience.Catalog.Components.LookDetails.LookDetails.LookDetailsContainerInnards)
local CloseFocusedScreenModule = require(Modules.AvatarExperience.Common.Thunks.CloseFocusedScreen)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local GetFFlagLooksAvatarPDPImageDimensionsModule = require(Modules.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions)
local GetFFlagAXLooksTranslationAuditModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit)
local AXDisableNonFullviewAnimation = game:DefineFastFlag("AXDisableNonFullviewAnimation", false)
local FFlagAXMigrateLookDetailsPeekViewToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateLookDetailsPeekViewToFocusNavigation
local FFlagAXScrollingFramesShouldAnimateOnFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local FFlagStackedBottomNavMarketplaceCTA = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStackedBottomNavMarketplaceCTA
local VisibilityControl = require(CorePackages.Workspace.Packages.AppNavBar).VisibilityControl
local FFlagAXCatalogMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local ActionBarHeight = CatalogConstantsModule.ActionBar.ActionBarHeight
local ActionBarGradientHeight = CatalogConstantsModule.ActionBar.ActionBarGradientHeight
local IconsNavigationClose = Images["icons/navigation/close"]
local IconsActionsTruncationExpand = Images["icons/actions/truncationExpand"]
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local LookDetailsTryOnTopContentModule = require(Modules.AvatarExperience.Catalog.Components.LookDetails.LookDetailsTryOnTopContent)
local LookDetailsPeekView = RoactModule.PureComponent:extend("LookDetailsPeekView")
local Callback = if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport then function(p1)
	-- upvalues: ConstantsModule (copy)
	return if p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledLookType == ConstantsModule.LookType.Makeup then p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId else p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end else nil

local function v63(p1)
	return p1.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState
end

local function v64(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end

local function v65(p1)
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogMakeupSupport (copy), Callback (copy)
	local CallbackResult = if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport then Callback(p1) else p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
	local Looks = p1.AvatarExperience.AvatarScene.Looks
	
	return if Looks and CallbackResult and Looks[CallbackResult] then Looks[CallbackResult] else nil
end

local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.ToggleTryOnManager
}

local function useFocusNavigationBindings(NamedRef, Callback, UseResult)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy), UseResult (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1)
					-- upvalues: Callback (upval)
					p1.cancelled = true
					Callback()
				end)
			},
			[FocusNavigationEventNameEnum.ToggleTryOnManager] = { handler = InputHandlersModule.onRelease(UseResult) }
		}
	end, { Callback, UseResult }), (ReactFocusNavigationModule.useEventMap(config, NamedRef)))
end

LookDetailsPeekView.validateProps = TModule.interface({
	focusGuiObject = TModule.optional(TModule.callback),
	isTryOn = TModule.optional(TModule.boolean),
	is10ftUI = TModule.boolean,
	initialPeekViewState = TModule.optional(TModule.valueOf(PeekViewState)),
	showPeekViewInSuperBrief = TModule.optional(TModule.boolean),
	resolvedFocusNavigationRef = if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation then TModule.table else nil,
	resolvedActionBarRef = if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation then TModule.table else nil,
	scrollingFrameRef = if FFlagAXScrollingFramesShouldAnimateOnFocus then TModule.table else nil,
	navigation = TModule.table,
	avatarRoute = TModule.table,
	isPortrait = TModule.boolean,
	topBarHeight = TModule.number,
	tryOnItems = TModule.optional(TModule.table),
	lookId = TModule.optional(TModule.string),
	lookDetails = TModule.optional(TModule.table),
	globalGuiInset = TModule.table,
	screenSize = TModule.Vector2,
	fullView = TModule.optional(TModule.userdata),
	boundInputs = TModule.optional(TModule.table),
	peekViewState = TModule.optional(TModule.valueOf(PeekViewState)),
	selectedTab = TModule.optional(TModule.number),
	removeUnselectedItemsFromTryOn = TModule.callback,
	removeLookItemsFromTryOn = TModule.callback,
	setTryOnManagerPeekViewState = TModule.callback,
	setSelectedTab = TModule.callback,
	closeFocusedScreen = TModule.callback,
	catalogAnalytics = TModule.table,
	namedRefs = TModule.table,
	lastInputGroup = TModule.string
})

local function _(p1): boolean
	-- upvalues: ConstantsModule1 (copy)
	return ConstantsModule1.InputTypeMap[p1] == ConstantsModule1.InputType.MouseAndKeyboard
end

function LookDetailsPeekView.init(p1)
	-- upvalues: UserInputService (copy), ConstantsModule1 (copy), AvatarScreen (copy), FFlagAXMigrateLookDetailsPeekViewToFocusNavigation (copy), RoactModule (copy), RoactGamepadModule (copy), FFlagStackedBottomNavMarketplaceCTA (copy), VisibilityControl (copy), PeekViewState (copy), FFlagAXMISEnableMultiShopping (copy), ConstantsModule (copy)
	p1:setState({
		isMouseAndKeyboard = ConstantsModule1.InputTypeMap[UserInputService:GetLastInputType()] == ConstantsModule1.InputType.MouseAndKeyboard
	})
	p1.frameRef = p1.props.namedRefs[AvatarScreen.LookDetails]
	p1.actionBarRef = if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation then nil else RoactModule.createRef()
	p1.itemsListRef = RoactModule.createRef()
	p1.closeButtonRef = RoactModule.createRef()
	p1.tryOnElementRefCache = RoactGamepadModule.createRefCache()
	p1.contentFrameRef = RoactModule.createRef()
	p1.robuxBalanceRef = RoactModule.createRef()
	
	if FFlagStackedBottomNavMarketplaceCTA then
		p1.footerVisibilityBinding = VisibilityControl.getFooterBinding()
	end
	function p1.onPeekViewClosed()
		-- upvalues: p1 (copy)
		if p1.props.lookId == nil then
			p1.props.removeUnselectedItemsFromTryOn()
			
			return
		else
			p1.props.removeLookItemsFromTryOn(p1.props.lookId, p1.props.lookDetails)
		end
	end
	
	function p1.navigateBack()
		-- upvalues: p1 (copy)
		p1.onPeekViewClosed()
		p1.props.closeFocusedScreen(p1.props.navigation)
	end
	
	function p1.viewStateChanged(Brief, Brief1)
		-- upvalues: p1 (copy), PeekViewState (upval), FFlagAXMISEnableMultiShopping (upval), AvatarScreen (upval)
		p1.props.setTryOnManagerPeekViewState(Brief)
		local CatalogAnalytics = p1.props.catalogAnalytics
		
		if Brief == PeekViewState.Closed then
			if FFlagAXMISEnableMultiShopping then
				p1.props.closeFocusedScreen(p1.props.navigation)
			else
				p1.onPeekViewClosed()
			end
		end
		local IsNameMatch = p1.props.avatarRoute.opaque.name == AvatarScreen.MySharedAvatars
		
		if FFlagAXMISEnableMultiShopping and Brief == PeekViewState.SuperBrief and not p1.props.isTryOn and not IsNameMatch then
			p1.props.closeFocusedScreen(p1.props.navigation)
		end
		if Brief == PeekViewState.Brief then
			if Brief1 == PeekViewState.Full or Brief1 == PeekViewState.Extended then
				CatalogAnalytics.resizeOutfitScreen("minimize")
				
				return
			end
		elseif Brief == PeekViewState.Full and Brief1 == PeekViewState.Brief then
			CatalogAnalytics.resizeOutfitScreen("expand")
		end
	end
	
	function p1.onCloseButtonPressed()
		-- upvalues: p1 (copy), ConstantsModule (upval), FFlagAXMISEnableMultiShopping (upval), PeekViewState (upval)
		if p1.props.lookId == ConstantsModule.DraftLookId then
			p1.onPeekViewClosed()
			p1.props.setTryOnManagerPeekViewState(PeekViewState.Closed)
			
			return
		end
		if FFlagAXMISEnableMultiShopping then
			p1.props.closeFocusedScreen(p1.props.navigation)
			p1.props.setTryOnManagerPeekViewState(PeekViewState.SuperBrief)
			
			return
		else
			p1.props.setTryOnManagerPeekViewState(PeekViewState.SuperBrief)
		end
	end
end

function LookDetailsPeekView.getActionBarTotalHeight(p1, StylePalette): number
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy), ActionBarHeight (copy), ConstantsModule1 (copy), CryoModule (copy), PeekViewState (copy)
	local Size500 = if StylePalette then if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_500 else StylePalette.Tokens.Global.Size_250 else 20
	local GAMEPADBOTTOMBARSIZE = 0
	local v1 = 0
	
	if p1.props.is10ftUI and p1.props.lastInputGroup == ConstantsModule1.InputType.Gamepad and not CryoModule.isEmpty(p1.props.boundInputs) then
		GAMEPADBOTTOMBARSIZE = ConstantsModule1.GAMEPAD_BOTTOM_BAR_SIZE
	elseif p1.props.lookId ~= nil then
		v1 = Size500
	end
	return ActionBarHeight + GAMEPADBOTTOMBARSIZE + v1 - (if p1.props.peekViewState == PeekViewState.SuperBrief then if p1.props.showPeekViewInSuperBrief then 0 elseif FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_400 else StylePalette.Tokens.Global.Space_200 elseif p1.props.showPeekViewInSuperBrief then 0 else -(if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_200 else StylePalette.Tokens.Global.Space_100))
end

function LookDetailsPeekView.getBriefViewHeight(p1, StylePalette)
	-- upvalues: GetSafeAreaSizeFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ConstantsModule (copy)
	local Offset = GetSafeAreaSizeFunction(p1.props.screenSize, p1.props.globalGuiInset).Y.Offset
	local Size600 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_600 else StylePalette.Tokens.Global.Size_300
	
	return if p1.props.isPortrait then Offset - p1.props.topBarHeight - Offset * ConstantsModule.PortraitSceneHeight - Size600 else (Offset - p1.props.topBarHeight - Size600) * 0.5
end

function LookDetailsPeekView.renderActionBar(p1, StylePalette)
	-- upvalues: PeekViewState (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ConstantsModule (copy), RoactModule (copy), FFlagAXMigrateLookDetailsPeekViewToFocusNavigation (copy), DraftLookBottomBarModule (copy), LookDetailsBottomBarModule (copy), FFlagAXMISEnableMultiShopping (copy), ActionBarGradientHeight (copy)
	local Theme = StylePalette.Theme
	local ActionBarTotalHeight = p1:getActionBarTotalHeight(StylePalette)
	local IsPeekViewStateMatch = p1.props.peekViewState == PeekViewState.SuperBrief
	local Size100 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_100 else StylePalette.Tokens.Global.Size_50
	local IsLookIdMatch = p1.props.lookId == ConstantsModule.DraftLookId
	
	return RoactModule.createFragment({
		BottomContainer = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			ZIndex = 2,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			Size = UDim2.new(1, 0, 0, ActionBarTotalHeight),
			Position = UDim2.fromScale(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			ref = if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation then p1.props.resolvedActionBarRef else p1.actionBarRef
		}, {
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10),
				PaddingTop = if IsPeekViewStateMatch and not p1.props.showPeekViewInSuperBrief then UDim.new(0, -(if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_350 else StylePalette.Tokens.Global.Space_175)) else UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_250 else StylePalette.Tokens.Global.Space_125)
			}),
			DraftLookBottomBar = IsLookIdMatch and RoactModule.createElement(DraftLookBottomBarModule),
			LookDetailsBottomBar = not IsLookIdMatch and RoactModule.createElement(LookDetailsBottomBarModule, {
				hideDescriptor = true,
				centered = if p1.props.isTryOn then true else nil,
				isTryOnFromOutsideAX = p1.props.isTryOn,
				alwaysBuyAll = FFlagAXMISEnableMultiShopping and not p1.props.isTryOn or false
			})
		}),
		TopFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, Size100),
			Position = UDim2.new(0, 0, 1, -ActionBarTotalHeight),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = Theme.BackgroundDefault.Color
		}),
		Gradient = if IsPeekViewStateMatch and p1.props.showPeekViewInSuperBrief then nil else RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png",
			Size = UDim2.new(1, 0, 0, ActionBarGradientHeight),
			Position = UDim2.new(0, 0, 1, -ActionBarTotalHeight - Size100),
			AnchorPoint = Vector2.new(0, 1),
			ImageColor3 = Theme.BackgroundDefault.Color
		})
	})
end

function LookDetailsPeekView.renderTopContent(p1, StylePalette, p2, Callback)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy), ConstantsModule (copy), RoactModule (copy), IconButton (copy), IconSize (copy), Images (copy), ImageSetButton (copy), IconsNavigationClose (copy), CursorKind (copy), GetFFlagAXLooksTranslationAuditModule (copy)
	local Theme = StylePalette.Theme
	local StylePaletteFont = StylePalette.Font
	local Size900 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_900 else StylePalette.Tokens.Global.Size_450
	local Size350 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_350 else StylePalette.Tokens.Global.Space_175
	local Size100 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_100 else StylePalette.Tokens.Global.Space_50
	local IsLookIdMatch = p1.props.lookId == ConstantsModule.DraftLookId
	local Element = if IsLookIdMatch then RoactModule.createElement(IconButton, {
		size = UDim2.fromOffset(0, 0),
		iconSize = IconSize.Medium,
		icon = Images["icons/navigation/close"],
		position = UDim2.new(0, if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_600 else StylePalette.Tokens.Global.Space_300, 0.5, 0),
		onActivated = p1.onCloseButtonPressed,
		anchorPoint = Vector2.new(0, 0.5)
	}) else nil
	
	return RoactModule.createFragment({
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, if IsLookIdMatch and p1.props.isPortrait then if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_1000 else StylePalette.Tokens.Global.Space_500 elseif FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_600 else StylePalette.Tokens.Global.Space_300)
		}),
		CloseButton = if IsLookIdMatch then Element else RoactModule.createElement(ImageSetButton, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, Size350, 0.5, 0),
			Size = UDim2.fromOffset(Size900 + Size100, Size900 + Size100),
			Image = IconsNavigationClose,
			ImageColor3 = Theme.SystemPrimaryDefault.Color,
			ImageTransparency = Theme.SystemPrimaryDefault.Transparency,
			[RoactModule.Event.Activated] = p1.onCloseButtonPressed,
			ref = p1.closeButtonRef,
			SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
		}),
		Title = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, Size900),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Text = if IsLookIdMatch then if GetFFlagAXLooksTranslationAuditModule() then p2.previewHeader else "Preview" else "",
			TextSize = StylePaletteFont.BaseSize * StylePaletteFont.Header1.RelativeSize,
			Font = StylePaletteFont.Header1.Font,
			TextColor3 = Theme.IconEmphasis.Color,
			TextTransparency = Theme.IconEmphasis.Transparency,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end

function LookDetailsPeekView.orderTryOns(p1, TryOnItems)
	-- upvalues: ConstantsModule (copy), FFlagAXCatalogMakeupSupport (copy)
	local List = {}
	
	for _, tryOnItem in TryOnItems do
		table.insert(List, tryOnItem)
	end
	if p1.props.lookId and p1.props.lookDetails then
		local LookDetails = p1.props.lookDetails
		
		if LookDetails and (LookDetails.lookType == ConstantsModule.LookType.Avatar or FFlagAXCatalogMakeupSupport and LookDetails.lookType == ConstantsModule.LookType.Makeup) then
			table.sort(List, function(A, B): boolean
				return if A.itemRecency and B.itemRecency then A.itemRecency < B.itemRecency else false
			end)
		end
	end
	return List
end

function LookDetailsPeekView.renderTryOnManagerContents(p2, StylePalette, _, IsRegular)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy), ConstantsModule (copy), RoactModule (copy), FFlagAXMigrateLookDetailsPeekViewToFocusNavigation (copy), UtilsModule (copy), LookDetailsTryOnElementModule (copy)
	local Theme = StylePalette.Theme
	local Size400 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_400 else StylePalette.Tokens.Global.Space_200
	local IsLookIdMatch = p2.props.lookId == ConstantsModule.DraftLookId
	local config = {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, 20)
		})
	}
	
	if p2.props.lookDetails == nil then
		return config
	end
	local LayoutOrder = 1
	config["list-header-padding"] = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 5),
		LayoutOrder = LayoutOrder
	})
	local NewLayoutOrder = LayoutOrder + 1
	local OrderTryOnsResult = p2:orderTryOns(p2.props.tryOnItems)
	local IsItemSelectable = false
	local LayoutOrder1: number = NewLayoutOrder
	
	for i, TryOnItem in OrderTryOnsResult do
		local TryOnElementRef = if LayoutOrder1 < NewLayoutOrder then p2.tryOnElementRefCache[OrderTryOnsResult[i - 1].itemId] elseif IsRegular then p2.closeButtonRef else nil
		local OrderTryOnsResultEntry = NewLayoutOrder < #OrderTryOnsResult and OrderTryOnsResult[i + 1]
		local TryOnElementRef1 = if OrderTryOnsResultEntry then p2.tryOnElementRefCache[OrderTryOnsResult[i + 1].itemId] elseif FFlagAXMigrateLookDetailsPeekViewToFocusNavigation then p2.props.resolvedActionBarRef else p2.actionBarRef
		local LookAssetInfo = nil
		
		if TryOnItem.itemType == ConstantsModule.ItemType.Asset then
			LookAssetInfo = p2.props.lookDetails.lookAssetInfos[TryOnItem.itemId]
		else
			if TryOnItem.itemType == ConstantsModule.ItemType.Bundle then
				LookAssetInfo = p2.props.lookDetails.lookBundleInfos[TryOnItem.itemId]
			else
				continue
			end
		end
		local IsItemSelectable1 = UtilsModule.isItemSelectable(LookAssetInfo)
		
		if i > 1 and IsItemSelectable ~= IsItemSelectable1 then
			config["divider-" .. NewLayoutOrder] = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = Theme.Divider.Color,
				BackgroundTransparency = Theme.Divider.Transparency,
				Size = UDim2.new(1, -(Size400 * 2), 0, 1),
				Position = UDim2.new(0, 0, 1, -1),
				LayoutOrder = NewLayoutOrder
			})
			NewLayoutOrder += 1
		end
		if LookAssetInfo then
			config[TryOnItem.itemId] = RoactModule.createElement(LookDetailsTryOnElementModule, {
				tryOnItem = TryOnItem,
				itemInfo = LookAssetInfo,
				layoutOrder = NewLayoutOrder,
				allowAutomaticPeekViewStateChanges = p2.props.lookId == nil,
				disableInteractions = IsLookIdMatch,
				forceShowPrice = IsLookIdMatch,
				horizontalPadding = Size400,
				elementRef = p2.tryOnElementRefCache[TryOnItem.itemId],
				NextSelectionUp = TryOnElementRef,
				NextSelectionDown = TryOnElementRef1
			})
			NewLayoutOrder += 1
		end
		IsItemSelectable = UtilsModule.isItemSelectable(LookAssetInfo)
	end
	return config
end

function LookDetailsPeekView.renderDetailsContents(p3)
	-- upvalues: RoactModule (copy), LookDetailsContainerInnardsModule (copy), GetFFlagLooksAvatarPDPImageDimensionsModule (copy)
	return {
		LookDetails = RoactModule.createElement(LookDetailsContainerInnardsModule, {
			lookId = p3.props.lookId,
			width = if GetFFlagLooksAvatarPDPImageDimensionsModule() then nil else 500,
			listPadding = p3.props.listPadding,
			lookDetails = p3.props.lookDetails,
			isTryOn = p3.props.isTryOn
		})
	}
end

function LookDetailsPeekView.renderWithProviders(p3, StylePalette, p4, p5)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy), ConstantsModule (copy), FFlagStackedBottomNavMarketplaceCTA (copy), ConstantsModule1 (copy), PeekViewState (copy), AvatarScreen (copy), AXDisableNonFullviewAnimation (copy), FFlagAXMigrateLookDetailsPeekViewToFocusNavigation (copy), RoactModule (copy), FullView (copy), LookDetailsTryOnTopContentModule (copy), ImageSetButton (copy), IconsActionsTruncationExpand (copy), IconsNavigationClose (copy), PeekView (copy), FFlagAXScrollingFramesShouldAnimateOnFocus (copy), GetShouldShowPeekViewShadowModule (copy), FFlagAXMISEnableMultiShopping (copy), TabBarUnderlinedModule (copy), ExternalEventConnection (copy), UserInputService (copy)
	local Theme = StylePalette.Theme
	local Size900 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_900 else StylePalette.Tokens.Global.Size_450
	local Size350 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_350 else StylePalette.Tokens.Global.Space_175
	local Size6000 = StylePalette.Tokens.Global.Size_6000
	local Size1200 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_1200 else StylePalette.Tokens.Global.Size_600
	local Size800 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_800 else StylePalette.Tokens.Global.Space_400
	local IsTryOn = p3.props.isTryOn
	local _UDim2: UDim2 = if IsTryOn then UDim2.new(0.5, 0, 0, p3.props.topBarHeight) else UDim2.fromOffset(0, p3.props.topBarHeight)
	local _UDim2_1 = UDim2.new(1, 0, 1, -p3.props.topBarHeight)
	
	if not p3.props.isPortrait then
		if not IsTryOn then
			_UDim2 = UDim2.new(ConstantsModule.LandscapeNavWidth, 0, 0, p3.props.topBarHeight)
		end
		_UDim2_1 = UDim2.new(ConstantsModule.LandscapeSceneWidth, 0, 1, -p3.props.topBarHeight)
	end
	local MapResult = if FFlagStackedBottomNavMarketplaceCTA and p3.footerVisibilityBinding then p3.footerVisibilityBinding:map(function(p6): UDim2
		-- upvalues: _UDim2_1 (ref), ConstantsModule1 (upval)
		return _UDim2_1 + UDim2.new(0, 0, 0, -(ConstantsModule1.BOTTOM_BAR_SIZE - 8) * p6)
	end) else _UDim2_1
	local BriefViewHeight = p3:getBriefViewHeight(StylePalette)
	local ActionBarTotalHeight = if p3.props.lookId == nil then nil else p3:getActionBarTotalHeight(StylePalette)
	local ActionBarTotalHeight1 = p3:getActionBarTotalHeight(StylePalette)
	local YDelta = p3.props.screenSize.Y - p3.props.topBarHeight - p3.props.globalGuiInset.bottom
	local Regular: string = if p3.props.peekViewState == PeekViewState.Full or p3.props.peekViewState == PeekViewState.Extended then "regular" else "none"
	local IsPeekViewStateMatch: boolean = p3.state.isMouseAndKeyboard and p3.props.peekViewState == PeekViewState.Brief
	local IsScrollingEnabled = true
	local IsPeekViewStateMatch1 = p3.props.peekViewState == PeekViewState.SuperBrief
	local IsLookIdMatch = p3.props.lookId == ConstantsModule.DraftLookId
	local IsNameMatch = p3.props.avatarRoute.opaque.name == AvatarScreen.MySharedAvatars
	
	if IsLookIdMatch and p3.props.peekViewState ~= PeekViewState.Closed then
		Regular = "regular"
	end
	local IsPeekViewStateMatch2: boolean = p3.props.peekViewState == PeekViewState.Full or p3.props.peekViewState == PeekViewState.Extended
	
	if p3.props.isTryOn then
		Regular = "tryOn"
	end
	if IsScrollingEnabled and not p3.props.showPeekViewInSuperBrief then
		IsScrollingEnabled = not IsPeekViewStateMatch1
	end
	if IsLookIdMatch then
		IsPeekViewStateMatch = false
	end
	local IsPeekViewStateMatch3: boolean = if AXDisableNonFullviewAnimation then if IsLookIdMatch then not p3.props.isTryOn and false else not p3.props.isTryOn and p3.props.peekViewState == PeekViewState.Full elseif IsLookIdMatch then not p3.props.isTryOn and false else not p3.props.isTryOn
	
	local function SelectTab(p6)
		-- upvalues: p3 (copy)
		p3.props.setSelectedTab(p6)
	end
	
	local DetailsTabTitle = p4.detailsTabTitle
	local Count = 0
	
	if p3.props.tryOnItems then
		for _, _ in pairs(p3.props.tryOnItems) do
			Count += 1
		end
	end
	local Tabs = {
		{ Name = "Details", Title = DetailsTabTitle },
		{
			Name = "TryOns",
			Title = p4.tryOnTabTitle:gsub("{numItems}", Count)
		}
	}
	
	return if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		SelectionGroup = true,
		Size = MapResult,
		Position = _UDim2,
		AnchorPoint = if IsTryOn then Vector2.new(0.5, 0) else nil,
		Visible = p3.props.fullView ~= FullView.SceneFullView,
		ref = p3.frameRef
	}, {
		LookDetailsTryOnTopBar = Regular == "tryOn" and RoactModule.createElement("Frame", {
			ZIndex = 3,
			BorderSizePixel = 0,
			BackgroundTransparency = if IsPeekViewStateMatch2 then 0 else 1,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			Size = UDim2.new(1, 0, 0, p3.props.topBarHeight),
			Position = UDim2.fromOffset(0, -p3.props.topBarHeight)
		}, {
			TopContent = RoactModule.createElement(LookDetailsTryOnTopContentModule, {
				stylePalette = StylePalette,
				showDropDownButton = IsPeekViewStateMatch2,
				navigateBack = p3.navigateBack,
				onCloseButtonPressed = p3.onCloseButtonPressed,
				robuxBalanceRef = p3.robuxBalanceRef
			})
		}),
		LookDetailsTopBar = Regular == "regular" and RoactModule.createElement("Frame", {
			ZIndex = 3,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Active = true,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			Size = UDim2.new(1, 0, 0, p3.props.topBarHeight),
			Position = UDim2.fromOffset(0, -p3.props.topBarHeight)
		}, {
			TopContent = p3:renderTopContent(StylePalette, p4, p5)
		}),
		CloseButton = IsPeekViewStateMatch and RoactModule.createElement(ImageSetButton, {
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = 1,
			Position = UDim2.new(0, Size350, 1, -p3:getBriefViewHeight(StylePalette) - (if p3.props.isTryOn then Size800 else Size900)),
			Size = UDim2.new(0, if p3.props.isTryOn then Size6000 else Size900, 0, if p3.props.isTryOn then Size1200 else Size900),
			Image = if p3.props.isTryOn then IconsActionsTruncationExpand else IconsNavigationClose,
			ImageColor3 = Theme.SystemPrimaryDefault.Color,
			[RoactModule.Event.Activated] = p3.onCloseButtonPressed
		}),
		PeekViewContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1)
		}, {
			PeekView = RoactModule.createElement(PeekView, {
				shouldCaptureFocus = false,
				mountAsFullView = false,
				canDragFullViewToBrief = true,
				showDraggerInClosedState = false,
				returnToFullView = true,
				thumbstickScrollEnabled = true,
				peekHeaderClose = false,
				scrollingFrameRef = if FFlagAXScrollingFramesShouldAnimateOnFocus then p3.props.scrollingFrameRef else nil,
				briefViewContentHeight = UDim.new(0, BriefViewHeight),
				mountAnimation = IsPeekViewStateMatch3,
				viewStateChanged = p3.viewStateChanged,
				showDropShadow = not p3.props.isTryOn and GetShouldShowPeekViewShadowModule(p3.props.peekViewState),
				superBriefViewContentHeight = if p3.props.lookId == nil then nil else UDim.new(0, ActionBarTotalHeight),
				stateOnMount = if p3.props.initialPeekViewState then p3.props.initialPeekViewState elseif p3.props.lookId then p3.props.peekViewState else nil,
				bottomDockedContainerHeight = ActionBarTotalHeight1,
				bottomDockedContainerContent = p3:renderActionBar(StylePalette),
				backgroundColor3 = Theme.BackgroundDefault.Color,
				backgroundTransparency = Theme.BackgroundUIDefault.Transparency,
				isScrollingEnabled = IsScrollingEnabled,
				peekViewState = p3.props.peekViewState,
				hideDraggerInSuperBrief = not p3.props.showPeekViewInSuperBrief,
				customBackground = Theme.BackgroundDefault.Color,
				minimizeToSuperBrief = p3.props.lookId ~= ConstantsModule.DraftLookId
			}, RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ClipsDescendants = true,
				[RoactModule.Ref] = p3.props.resolvedFocusNavigationRef
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, 0)
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 0),
					PaddingBottom = UDim.new(0, 8)
				}),
				NavBar = if FFlagAXMISEnableMultiShopping and not IsLookIdMatch and not IsNameMatch and not p3.props.isTryOn then nil else RoactModule.createElement(TabBarUnderlinedModule, {
					layoutOrderMain = 1,
					navHeightMain = ConstantsModule.LooksDetailsTabBarHeight,
					tabs = Tabs,
					selectedTabIndex = p3.props.selectedTab,
					selectTab = SelectTab,
					NextSelectionUp = p3.props.NextSelectionUp,
					NextSelectionDown = p3.props.NextSelectionDown
				}),
				DetailsContainer = if p3.props.selectedTab == 1 then RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, YDelta),
					AutomaticSize = Enum.AutomaticSize.Y
				}, p3:renderDetailsContents()) else nil,
				TryOnManagerContainer = if p3.props.selectedTab == 2 then RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, YDelta),
					AutomaticSize = Enum.AutomaticSize.Y,
					ref = p3.itemsListRef
				}, p3:renderTryOnManagerContents(StylePalette, p4, Regular == "regular")) else nil
			}))
		}),
		LastInputTypeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = function(p6)
				-- upvalues: ConstantsModule1 (upval), p3 (copy)
				if p6 then
					local IsInputTypeMatch = ConstantsModule1.InputTypeMap[p6] == ConstantsModule1.InputType.MouseAndKeyboard
					
					if IsInputTypeMatch ~= p3.state.isMouseAndKeyboard then
						p3:setState({ isMouseAndKeyboard = IsInputTypeMatch })
					end
				end
			end
		})
	}) else RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = MapResult,
		Position = _UDim2,
		AnchorPoint = if IsTryOn then Vector2.new(0.5, 0) else nil,
		Visible = p3.props.fullView ~= FullView.SceneFullView,
		ref = p3.frameRef
	}, {
		LookDetailsTryOnTopBar = Regular == "tryOn" and RoactModule.createElement("Frame", {
			ZIndex = 3,
			BorderSizePixel = 0,
			BackgroundTransparency = if IsPeekViewStateMatch2 then 0 else 1,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			Size = UDim2.new(1, 0, 0, p3.props.topBarHeight),
			Position = UDim2.fromOffset(0, -p3.props.topBarHeight)
		}, {
			TopContent = RoactModule.createElement(LookDetailsTryOnTopContentModule, {
				stylePalette = StylePalette,
				showDropDownButton = IsPeekViewStateMatch2,
				navigateBack = p3.navigateBack,
				onCloseButtonPressed = p3.onCloseButtonPressed,
				robuxBalanceRef = p3.robuxBalanceRef
			})
		}),
		LookDetailsTopBar = Regular == "regular" and RoactModule.createElement("Frame", {
			ZIndex = 3,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Active = true,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			Size = UDim2.new(1, 0, 0, p3.props.topBarHeight),
			Position = UDim2.fromOffset(0, -p3.props.topBarHeight)
		}, {
			TopContent = p3:renderTopContent(StylePalette, p4, p5)
		}),
		CloseButton = IsPeekViewStateMatch and RoactModule.createElement(ImageSetButton, {
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = 1,
			Position = UDim2.new(0, Size350, 1, -p3:getBriefViewHeight(StylePalette) - (if p3.props.isTryOn then Size800 else Size900)),
			Size = UDim2.new(0, if p3.props.isTryOn then Size6000 else Size900, 0, if p3.props.isTryOn then Size1200 else Size900),
			Image = if p3.props.isTryOn then IconsActionsTruncationExpand else IconsNavigationClose,
			ImageColor3 = Theme.SystemPrimaryDefault.Color,
			[RoactModule.Event.Activated] = p3.onCloseButtonPressed
		}),
		PeekViewContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1)
		}, {
			PeekView = RoactModule.createElement(PeekView, {
				mountAsFullView = false,
				canDragFullViewToBrief = true,
				showDraggerInClosedState = false,
				returnToFullView = true,
				thumbstickScrollEnabled = true,
				shouldCaptureFocus = false,
				peekHeaderClose = false,
				scrollingFrameRef = if FFlagAXScrollingFramesShouldAnimateOnFocus then p3.props.scrollingFrameRef else nil,
				briefViewContentHeight = UDim.new(0, BriefViewHeight),
				mountAnimation = IsPeekViewStateMatch3,
				viewStateChanged = p3.viewStateChanged,
				showDropShadow = not p3.props.isTryOn and GetShouldShowPeekViewShadowModule(p3.props.peekViewState),
				superBriefViewContentHeight = if p3.props.lookId == nil then nil else UDim.new(0, ActionBarTotalHeight),
				stateOnMount = if p3.props.initialPeekViewState then p3.props.initialPeekViewState elseif p3.props.lookId then p3.props.peekViewState else nil,
				bottomDockedContainerHeight = ActionBarTotalHeight1,
				bottomDockedContainerContent = p3:renderActionBar(StylePalette),
				backgroundColor3 = Theme.BackgroundDefault.Color,
				backgroundTransparency = Theme.BackgroundUIDefault.Transparency,
				isScrollingEnabled = IsScrollingEnabled,
				peekViewState = p3.props.peekViewState,
				hideDraggerInSuperBrief = not p3.props.showPeekViewInSuperBrief,
				customBackground = Theme.BackgroundDefault.Color,
				minimizeToSuperBrief = p3.props.lookId ~= ConstantsModule.DraftLookId
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, 0)
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 0),
					PaddingBottom = UDim.new(0, 8)
				}),
				NavBar = if FFlagAXMISEnableMultiShopping and (not IsLookIdMatch and not IsNameMatch and not p3.props.isTryOn) then nil else RoactModule.createElement(TabBarUnderlinedModule, {
					layoutOrderMain = 1,
					navHeightMain = ConstantsModule.LooksDetailsTabBarHeight,
					tabs = Tabs,
					selectedTabIndex = p3.props.selectedTab,
					selectTab = SelectTab,
					NextSelectionUp = p3.props.NextSelectionUp,
					NextSelectionDown = p3.props.NextSelectionDown
				}),
				DetailsContainer = if p3.props.selectedTab == 1 then RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, YDelta),
					AutomaticSize = Enum.AutomaticSize.Y
				}, p3:renderDetailsContents()) else nil,
				TryOnManagerContainer = if p3.props.selectedTab == 2 then RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, YDelta),
					AutomaticSize = Enum.AutomaticSize.Y,
					ref = p3.itemsListRef
				}, p3:renderTryOnManagerContents(StylePalette, p4, Regular == "regular")) else nil
			})
		}),
		LastInputTypeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = function(p6)
				-- upvalues: ConstantsModule1 (upval), p3 (copy)
				if p6 then
					local IsInputTypeMatch = ConstantsModule1.InputTypeMap[p6] == ConstantsModule1.InputType.MouseAndKeyboard
					
					if IsInputTypeMatch ~= p3.state.isMouseAndKeyboard then
						p3:setState({ isMouseAndKeyboard = IsInputTypeMatch })
					end
				end
			end
		})
	})
end

function LookDetailsPeekView.render(p6)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), GetFFlagAXLooksTranslationAuditModule (copy), WithSelectionCursorProviderFunction (copy)
	return WithStyleFunction(function(StylePalette)
		-- upvalues: WithLocalizationFunction (upval), GetFFlagAXLooksTranslationAuditModule (upval), WithSelectionCursorProviderFunction (upval), p6 (copy)
		return WithLocalizationFunction({
			detailsTabTitle = "Feature.Catalog.Label.Details",
			tryOnTabTitle = "Feature.Catalog.Label.TryOnsMultiple",
			previewHeader = if GetFFlagAXLooksTranslationAuditModule() then "Feature.Avatar.Title.Preview" else nil
		})(function(p7)
			-- upvalues: WithSelectionCursorProviderFunction (upval), p6 (upval), StylePalette (copy)
			return WithSelectionCursorProviderFunction(function(p8)
				-- upvalues: p6 (upval), StylePalette (upval), p7 (copy)
				return p6:renderWithProviders(StylePalette, p7, p8)
			end)
		end)
	end)
end

function LookDetailsPeekView.didUpdate(p6, p7, _)
	-- upvalues: PeekViewState (copy), WasLastInputGamepadFunction (copy), FFlagAXMigrateLookDetailsPeekViewToFocusNavigation (copy)
	if p7.lookId and not p6.props.lookId then
		p6.onPeekViewClosed()
		p6.props.setTryOnManagerPeekViewState(PeekViewState.Closed)
	end
	if not WasLastInputGamepadFunction() then return end
	if p6.props.peekViewState ~= p7.peekViewState and p6.props.peekViewState ~= PeekViewState.Closed and p6.props.peekViewState == PeekViewState.Brief then
		local Current = if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation then p6.props.resolvedActionBarRef.current else p6.actionBarRef.current
		
		if p6.props.focusGuiObject and Current then
			p6.props.focusGuiObject(Current)
		end
	end
end

local v1 = RoactRoduxModule.connect(function(p6, p7)
	-- upvalues: SelectIsPortraitModule (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogMakeupSupport (copy), Callback (copy), SelectIsFullViewModule (copy)
	local CallbackResult = if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport then Callback(p6) else p6.AvatarExperience.AvatarScene.OutfitTryOn.LookId
	local Looks = p6.AvatarExperience.AvatarScene.Looks
	
	return {
		isPortrait = SelectIsPortraitModule(p6),
		topBarHeight = p6.TopBar.topBarHeight,
		tryOnItems = p6.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems,
		lookId = CallbackResult,
		lookDetails = Looks and (CallbackResult and Looks[CallbackResult]),
		globalGuiInset = p6.GlobalGuiInset,
		screenSize = p6.ScreenSize,
		fullView = SelectIsFullViewModule(p6, p7.avatarRoute.opaque.name),
		boundInputs = p6.GamepadBottomBar.boundInputs,
		peekViewState = p6.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState,
		selectedTab = p6.AvatarExperience.Common.ItemDetailsPeekView.lookDetailsSelectedTab
	}
end, function(Callback)
	-- upvalues: RemoveUnselectedItemsFromTryOnFunction (copy), RemoveLookItemsFromTryOnFunction (copy), SetTryOnManagerPeekViewStateFunction (copy), SetLookDetailsPeekViewSelectedTabFunction (copy), CloseFocusedScreenModule (copy)
	return {
		removeUnselectedItemsFromTryOn = function()
			-- upvalues: Callback (copy), RemoveUnselectedItemsFromTryOnFunction (upval)
			return Callback(RemoveUnselectedItemsFromTryOnFunction())
		end,
		removeLookItemsFromTryOn = function(p6, p7)
			-- upvalues: Callback (copy), RemoveLookItemsFromTryOnFunction (upval)
			if not p6 or not p7 then return end
			local List = {}
			
			for lookAssetInfo in p7.lookAssetInfos do
				table.insert(List, lookAssetInfo)
			end
			local List1 = {}
			
			for lookBundleInfo in p7.lookBundleInfos do
				table.insert(List1, lookBundleInfo)
			end
			return Callback(RemoveLookItemsFromTryOnFunction(p6, List, List1))
		end,
		setTryOnManagerPeekViewState = function(p8)
			-- upvalues: Callback (copy), SetTryOnManagerPeekViewStateFunction (upval)
			Callback(SetTryOnManagerPeekViewStateFunction(p8))
		end,
		setSelectedTab = function(p8)
			-- upvalues: Callback (copy), SetLookDetailsPeekViewSelectedTabFunction (upval)
			return Callback(SetLookDetailsPeekViewSelectedTabFunction(p8))
		end,
		closeFocusedScreen = function(p8)
			-- upvalues: Callback (copy), CloseFocusedScreenModule (upval)
			Callback(CloseFocusedScreenModule(p8))
		end
	}
end)((WithLastInputGroupModule((WithNamedRefsModule((RoactServices.connect({ catalogAnalytics = AnalyticsModule })(LookDetailsPeekView)))))))

local function LookDetailsPeekViewContainer(p8)
	-- upvalues: UseUiModeInfoFunction (copy), UiMode (copy), FFlagAXMigrateLookDetailsPeekViewToFocusNavigation (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), FFlagAXCatalogMakeupSupport (copy), FFlagAXMISEnableMultiShopping (copy), SelectTryOnsLookId (copy), v64 (copy), v65 (copy), v63 (copy), ReactModule (copy), RemoveLookItemsFromTryOnFunction (copy), RemoveUnselectedItemsFromTryOnFunction (copy), PeekViewState (copy), SetTryOnManagerPeekViewStateFunction (copy), useFocusNavigationBindings (copy), AvatarScreen (copy), UseTableWrappedCallbackRefFunction (copy), UseFocusGuiObjectFunction (copy), FFlagAXScrollingFramesShouldAnimateOnFocus (copy), UseAXAnimateScrollFrameFunction (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	local ResolvedFocusNavigationRef = nil
	local ResolvedActionBarRef = nil
	
	if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation then
		local UseDispatchResult = UseDispatchFunction()
		local UseSelectorResult = UseSelectorFunction(if FFlagAXCatalogMakeupSupport and FFlagAXMISEnableMultiShopping then SelectTryOnsLookId else v64)
		local UseSelectorResult1 = UseSelectorFunction(v65)
		local UseSelectorResult2 = UseSelectorFunction(v63)
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: FFlagAXMISEnableMultiShopping (upval), p8 (copy), UseSelectorResult (copy), UseSelectorResult1 (copy), UseDispatchResult (copy), RemoveLookItemsFromTryOnFunction (upval), RemoveUnselectedItemsFromTryOnFunction (upval)
			if not FFlagAXMISEnableMultiShopping or p8.isTryOn then
				if UseSelectorResult == nil or not UseSelectorResult1 then
					UseDispatchResult(RemoveUnselectedItemsFromTryOnFunction())
				else
					local List = {}
					
					for lookAssetInfo in UseSelectorResult1.lookAssetInfos do
						table.insert(List, lookAssetInfo)
					end
					local List1 = {}
					
					if UseSelectorResult1.lookBundleInfos then
						for lookBundleInfo in UseSelectorResult1.lookBundleInfos do
							table.insert(List1, lookBundleInfo)
						end
					end
					UseDispatchResult(RemoveLookItemsFromTryOnFunction(UseSelectorResult, List, List1))
				end
			end
			p8.navigation.goBack()
		end, {
			p8.navigation,
			UseDispatchResult,
			UseSelectorResult,
			UseSelectorResult1
		})
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseSelectorResult2 (copy), PeekViewState (upval), UseDispatchResult (copy), SetTryOnManagerPeekViewStateFunction (upval)
			if UseSelectorResult2 == PeekViewState.Full or UseSelectorResult2 == PeekViewState.Extended then
				UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Brief))
				
				return
			else
				UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Full))
			end
		end, { UseSelectorResult2, UseDispatchResult })
		ResolvedFocusNavigationRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(p8.namedRefs[AvatarScreen.LookDetails], UseResult, UseResult1)))
		ResolvedActionBarRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(nil, UseResult, UseResult1)))
	end
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseRefResult = nil
	
	if FFlagAXScrollingFramesShouldAnimateOnFocus then
		UseRefResult = ReactModule.useRef(nil)
		UseAXAnimateScrollFrameFunction(UseRefResult)
	end
	return RoactModule.createElement(v1, CryoModule.Dictionary.join({
		is10ftUI = IsUiModeMatch,
		resolvedFocusNavigationRef = ResolvedFocusNavigationRef,
		resolvedActionBarRef = ResolvedActionBarRef,
		focusGuiObject = UseFocusGuiObjectResult,
		scrollingFrameRef = if FFlagAXScrollingFramesShouldAnimateOnFocus then UseRefResult else nil
	}, p8))
end

return if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation then WithNamedRefsModule(LookDetailsPeekViewContainer) else LookDetailsPeekViewContainer