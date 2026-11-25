local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RobloxAppEnumsModule = require(Parent1.RobloxAppEnums)
local PeopleServiceModule = require(Parent1.PeopleService)
local SwitchServerModule = require(Parent1.SwitchServer)
local UseDeviceOrientationFunction = require(Parent1.RobloxAppHooks).useDeviceOrientation
local UseGetPeopleServiceModule = require(Parent.Hooks.useGetPeopleService)
local UseScrollingFrameStoreModule = require(Parent.Hooks.useScrollingFrameStore)
local UsePeopleWindowWidthModule = require(Parent.Hooks.usePeopleWindowWidth)
local View = require(Parent1.Foundation).View
local PeopleListModule = require(Parent.Components.PeopleList)
local PeopleCardsModule = require(Parent.Components.PeopleCards)
local CoreButtonRowModule = require(Parent.Components.CoreButtonRow)
local MenuButtonsWrapperModule = require(Parent.Components.MenuButtonsWrapper)
local TitleBarModule = require(Parent.Components.TitleBar)
local ConstantsModule = require(Parent.Constants)
local IsPeoplePageCompactModule = require(Parent.Utils.isPeoplePageCompact)
local PeoplePageLayoutContextModule = require(Parent.PeoplePageLayoutContext)
local GameSettings = UserSettings().GameSettings
local SwitchServerConfirmation = SwitchServerModule.SwitchServerConfirmation
local SwitchServerTelemetry = SwitchServerModule.SwitchServerTelemetry
local SharedFlagsModule = require(Parent1.SharedFlags)
local IsSideSheetEnabledModule = require(Parent1.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagShowSwitchServerButton = SharedFlagsModule.FFlagShowSwitchServerButton
local FFlagSideSheetOpenPeoplePage = SharedFlagsModule.FFlagSideSheetOpenPeoplePage
local FFlagPeopleListButtonOverflowModule = require(Parent.Flags.FFlagPeopleListButtonOverflow)
local FlagsService = PeopleServiceModule.getService("Flags")
local GetFFlagAddPeoplePageCardLayoutFunction = FlagsService.GetFFlagAddPeoplePageCardLayout
local GetFFlagPeoplePageLazyRenderCardsFunction = FlagsService.GetFFlagPeoplePageLazyRenderCards
local GetFFlagPeoplePagePostponeInitialRenderFunction = FlagsService.GetFFlagPeoplePagePostponeInitialRender
local FFlagEnablePeopleListLazyRender = FlagsService.FFlagEnablePeopleListLazyRender
local FFlagPeoplePageRemoveUseMemoElements = FlagsService.FFlagPeoplePageRemoveUseMemoElements
local FFlagPeopleCardsEnableVirtualizedGrid = FlagsService.FFlagPeopleCardsEnableVirtualizedGrid
local FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView = FlagsService.FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView
local FFlagPeoplePageFlipVolumePopoverToFitViewport = FlagsService.FFlagPeoplePageFlipVolumePopoverToFitViewport
local FFlagPeoplePageDismissCardMenuOnScrollOutOfView = FlagsService.FFlagPeoplePageDismissCardMenuOnScrollOutOfView
local FFlagFixVirtualizedGridNumItems = FlagsService.FFlagFixVirtualizedGridNumItems

return function(p1)
	-- upvalues: GetFFlagAddPeoplePageCardLayoutFunction (copy), UseGetPeopleServiceModule (copy), ReactModule (copy), PeopleServiceModule (copy), UseDeviceOrientationFunction (copy), RobloxAppEnumsModule (copy), FFlagPeopleListButtonOverflowModule (copy), UsePeopleWindowWidthModule (copy), IsPeoplePageCompactModule (copy), GameSettings (copy), GetFFlagPeoplePagePostponeInitialRenderFunction (copy), GetFFlagPeoplePageLazyRenderCardsFunction (copy), FFlagEnablePeopleListLazyRender (copy), FFlagPeopleCardsEnableVirtualizedGrid (copy), FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (copy), FFlagPeoplePageFlipVolumePopoverToFitViewport (copy), FFlagPeoplePageDismissCardMenuOnScrollOutOfView (copy), UseScrollingFrameStoreModule (copy), FFlagFixVirtualizedGridNumItems (copy), FFlagPeoplePageRemoveUseMemoElements (copy), PeopleCardsModule (copy), FFlagSideSheetOpenPeoplePage (copy), PeopleListModule (copy), FFlagShowSwitchServerButton (copy), IsSideSheetEnabledModule (copy), MenuButtonsWrapperModule (copy), CoreButtonRowModule (copy), ConstantsModule (copy), SwitchServerTelemetry (copy), TitleBarModule (copy), View (copy), SwitchServerConfirmation (copy), PeoplePageLayoutContextModule (copy)
	local PeopleAnalyticsManager = if GetFFlagAddPeoplePageCardLayoutFunction() then UseGetPeopleServiceModule("PeopleAnalyticsManager") else nil
	local PeopleBlockingModalManager = nil
	PeopleBlockingModalManager = if GetFFlagAddPeoplePageCardLayoutFunction() then UseGetPeopleServiceModule("PeopleBlockingModalManager") else ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("PeopleBlockingModalManager")
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PeopleBlockingModalManager (ref), p1 (copy)
		return PeopleBlockingModalManager.getModalManager(p1.blockingModalScreen, p1.blockingFlags)
	end, {
		PeopleBlockingModalManager,
		p1.blockingModalScreen,
		p1.blockingFlags
	})
	local IsUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() == RobloxAppEnumsModule.DeviceOrientationMode.Portrait
	local v1 = nil
	local IsCompact = false
	
	if FFlagPeopleListButtonOverflowModule then
		local UsePeopleWindowWidthModuleResult, UsePeopleWindowWidthModuleResult2 = UsePeopleWindowWidthModule()
		v1 = UsePeopleWindowWidthModuleResult2
		IsCompact = IsPeoplePageCompactModule(UsePeopleWindowWidthModuleResult)
	end
	local UseMemoResult1 = if FFlagPeopleListButtonOverflowModule then ReactModule.useMemo(function()
		-- upvalues: IsCompact (ref)
		return { isCompact = IsCompact }
	end, { IsCompact }) else nil
	local PeoplePageLayout = nil
	local Callback = nil
	
	if GetFFlagAddPeoplePageCardLayoutFunction() then
		PeoplePageLayout, Callback = ReactModule.useState(GameSettings.PeoplePageLayout)
	end
	local v2 = nil
	local Callback1 = nil
	
	if GetFFlagPeoplePagePostponeInitialRenderFunction() then
		v2, Callback1 = ReactModule.useState(false)
	end
	local UseScrollingFrameStoreModuleResult = if GetFFlagPeoplePageLazyRenderCardsFunction() or FFlagEnablePeopleListLazyRender or FFlagPeopleCardsEnableVirtualizedGrid or FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView or FFlagPeoplePageFlipVolumePopoverToFitViewport or FFlagPeoplePageDismissCardMenuOnScrollOutOfView then UseScrollingFrameStoreModule(p1.scrollingFrame) else nil
	local UseResult = if FFlagFixVirtualizedGridNumItems then ReactModule.useCallback(function(Frame)
		-- upvalues: UseScrollingFrameStoreModuleResult (copy)
		if UseScrollingFrameStoreModuleResult then
			UseScrollingFrameStoreModuleResult.setCanvasPositionYOffset(-Frame.AbsoluteSize.Y)
		end
	end, { UseScrollingFrameStoreModuleResult }) else nil
	local UseResult1 = if GetFFlagAddPeoplePageCardLayoutFunction() then ReactModule.useCallback(function(p2)
		-- upvalues: PeopleAnalyticsManager (copy), Callback (ref)
		PeopleAnalyticsManager:trackPeoplePageLayoutChanged(p2)
		Callback(p2)
	end, {}) else nil
	local Element = if FFlagPeoplePageRemoveUseMemoElements then if PeoplePageLayout == Enum.PeoplePageLayout.Card then ReactModule.createElement(PeopleCardsModule, {
		LayoutOrder = 3,
		getUniversesExposedTo = p1.getUniversesExposedTo,
		addUniverseToExposureList = p1.addUniverseToExposureList,
		minimumCardWidth = if FFlagSideSheetOpenPeoplePage then p1.minimumCardWidth else nil,
		scrollingFrameStore = if p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
	}) else ReactModule.createElement(PeopleListModule, {
		LayoutOrder = 3,
		scrollingFrameStore = if FFlagEnablePeopleListLazyRender and p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
	}) elseif GetFFlagAddPeoplePageCardLayoutFunction() then ReactModule.useMemo(function()
		-- upvalues: PeoplePageLayout (ref), ReactModule (upval), PeopleCardsModule (upval), p1 (copy), FFlagSideSheetOpenPeoplePage (upval), UseScrollingFrameStoreModuleResult (copy), PeopleListModule (upval), FFlagEnablePeopleListLazyRender (upval)
		return if PeoplePageLayout == Enum.PeoplePageLayout.Card then ReactModule.createElement(PeopleCardsModule, {
			LayoutOrder = 3,
			getUniversesExposedTo = p1.getUniversesExposedTo,
			addUniverseToExposureList = p1.addUniverseToExposureList,
			minimumCardWidth = if FFlagSideSheetOpenPeoplePage then p1.minimumCardWidth else nil,
			scrollingFrameStore = if p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
		}) else ReactModule.createElement(PeopleListModule, {
			LayoutOrder = 3,
			scrollingFrameStore = if FFlagEnablePeopleListLazyRender and p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
		})
	end, {
		PeoplePageLayout, UseScrollingFrameStoreModuleResult, p1.scrollingFrame,
		p1.getUniversesExposedTo, p1.addUniverseToExposureList,
		p1.minimumCardWidth or 0
	}) else nil
	
	if GetFFlagPeoplePagePostponeInitialRenderFunction() then
		ReactModule.useEffect(function()
			-- upvalues: Callback1 (ref)
			Callback1(true)
		end, {})
	end
	local UseStateResult = nil
	local Callback2 = nil
	
	if FFlagShowSwitchServerButton then
		UseStateResult, Callback2 = ReactModule.useState(false)
	end
	local Element1 = ReactModule.createElement(ReactModule.Fragment, {}, {
		MenuButtonsWrapper = if IsSideSheetEnabledModule then nil else ReactModule.createElement(MenuButtonsWrapperModule),
		CoreButtonRow = ReactModule.createElement(CoreButtonRowModule, {
			chromeEnabled = p1.chromeEnabled,
			LayoutOrder = if GetFFlagAddPeoplePageCardLayoutFunction() then 1 else nil,
			buttonActivatedTable = if FFlagShowSwitchServerButton then {
				[ConstantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER] = function()
					-- upvalues: SwitchServerTelemetry (upval), Callback2 (ref)
					SwitchServerTelemetry.sendSwitchServerButtonActions({ event_type = "click" })
					Callback2(true)
				end
			} else nil
		}),
		TitleBar = if GetFFlagAddPeoplePageCardLayoutFunction() then ReactModule.createElement(TitleBarModule, {
			LayoutOrder = 2,
			layout = PeoplePageLayout,
			setLayout = UseResult1
		}) else nil
	})
	
	if FFlagFixVirtualizedGridNumItems then
		Element1 = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-large padding-bottom-large",
			LayoutOrder = 1,
			onAbsoluteSizeChanged = UseResult
		}, Element1)
	end
	local Element2 = ReactModule.createElement(View, {
		testId = "mainView",
		tag = {
			["size-full col padding-bottom-small"] = FFlagFixVirtualizedGridNumItems,
			["size-full col gap-large padding-bottom-small"] = not FFlagFixVirtualizedGridNumItems,
			["padding-x-medium"] = not IsUseDeviceOrientationResultMatch
		},
		ref = if FFlagPeopleListButtonOverflowModule then v1 else nil
	}, {
		PeopleHeader = Element1,
		People = if GetFFlagPeoplePagePostponeInitialRenderFunction() and not v2 then nil elseif GetFFlagAddPeoplePageCardLayoutFunction() then Element else ReactModule.createElement(PeopleListModule, {
			scrollingFrameStore = if FFlagEnablePeopleListLazyRender and p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
		}),
		BlockingModalManager = ReactModule.createElement(UseMemoResult),
		SwitchServerConfirmation = if FFlagShowSwitchServerButton and UseStateResult then ReactModule.createElement(SwitchServerConfirmation, { setSwitchServerConfirmationOpen = Callback2 }) else nil
	})
	
	return if FFlagPeopleListButtonOverflowModule then ReactModule.createElement(PeoplePageLayoutContextModule.Provider, { value = UseMemoResult1 }, { Page = Element2 }) else Element2
end