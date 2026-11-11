local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RobloxAppEnumsModule = require(Parent1.RobloxAppEnums)
local PeopleServiceModule = require(Parent1.PeopleService)
local UseDeviceOrientationFunction = require(Parent1.RobloxAppHooks).useDeviceOrientation
local UseGetPeopleServiceModule = require(Parent.Hooks.useGetPeopleService)
local UseScrollingFrameStoreModule = require(Parent.Hooks.useScrollingFrameStore)
local View = require(Parent1.Foundation).View
local PeopleListModule = require(Parent.Components.PeopleList)
local PeopleCardsModule = require(Parent.Components.PeopleCards)
local CoreButtonRowModule = require(Parent.Components.CoreButtonRow)
local MenuButtonsWrapperModule = require(Parent.Components.MenuButtonsWrapper)
local TitleBarModule = require(Parent.Components.TitleBar)
local SwitchServerConfirmationModule = require(Parent.Components.SwitchServerConfirmation)
local ConstantsModule = require(Parent.Constants)
local GameSettings = UserSettings().GameSettings
local FFlagEnableSideSheet = require(Parent1.SharedFlags).FFlagEnableSideSheet
local FlagsService = PeopleServiceModule.getService("Flags")
local GetFFlagAddPeoplePageCardLayoutFunction = FlagsService.GetFFlagAddPeoplePageCardLayout
local GetFFlagPeoplePageLazyRenderCardsFunction = FlagsService.GetFFlagPeoplePageLazyRenderCards
local GetFFlagPeoplePagePostponeInitialRenderFunction = FlagsService.GetFFlagPeoplePagePostponeInitialRender
local FFlagEnablePeopleListLazyRender = FlagsService.FFlagEnablePeopleListLazyRender
local FFlagPeoplePageRemoveUseMemoElements = FlagsService.FFlagPeoplePageRemoveUseMemoElements
local FFlagPeopleCardsEnableVirtualizedGrid = FlagsService.FFlagPeopleCardsEnableVirtualizedGrid
local FFlagFixVirtualizedGridNumItems = FlagsService.FFlagFixVirtualizedGridNumItems
local FFlagShowSwitchServerButton = FlagsService.FFlagShowSwitchServerButton

return function(p1)
	-- upvalues: GetFFlagAddPeoplePageCardLayoutFunction (copy), UseGetPeopleServiceModule (copy), ReactModule (copy), PeopleServiceModule (copy), UseDeviceOrientationFunction (copy), RobloxAppEnumsModule (copy), GameSettings (copy), GetFFlagPeoplePagePostponeInitialRenderFunction (copy), GetFFlagPeoplePageLazyRenderCardsFunction (copy), FFlagEnablePeopleListLazyRender (copy), FFlagPeopleCardsEnableVirtualizedGrid (copy), UseScrollingFrameStoreModule (copy), FFlagFixVirtualizedGridNumItems (copy), FFlagPeoplePageRemoveUseMemoElements (copy), PeopleCardsModule (copy), PeopleListModule (copy), FFlagShowSwitchServerButton (copy), FFlagEnableSideSheet (copy), MenuButtonsWrapperModule (copy), CoreButtonRowModule (copy), ConstantsModule (copy), TitleBarModule (copy), View (copy), SwitchServerConfirmationModule (copy)
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
	local PeoplePageLayout = nil
	local Callback = nil
	
	if GetFFlagAddPeoplePageCardLayoutFunction() then
		PeoplePageLayout, Callback = ReactModule.useState(GameSettings.PeoplePageLayout)
	end
	local v1 = nil
	local Callback1 = nil
	
	if GetFFlagPeoplePagePostponeInitialRenderFunction() then
		v1, Callback1 = ReactModule.useState(false)
	end
	local UseScrollingFrameStoreModuleResult = if GetFFlagPeoplePageLazyRenderCardsFunction() or FFlagEnablePeopleListLazyRender or FFlagPeopleCardsEnableVirtualizedGrid then UseScrollingFrameStoreModule(p1.scrollingFrame) else nil
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
		scrollingFrameStore = if p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
	}) else ReactModule.createElement(PeopleListModule, {
		LayoutOrder = 3,
		scrollingFrameStore = if FFlagEnablePeopleListLazyRender and p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
	}) elseif GetFFlagAddPeoplePageCardLayoutFunction() then ReactModule.useMemo(function()
		-- upvalues: PeoplePageLayout (ref), ReactModule (upval), PeopleCardsModule (upval), p1 (copy), UseScrollingFrameStoreModuleResult (copy), PeopleListModule (upval), FFlagEnablePeopleListLazyRender (upval)
		return if PeoplePageLayout == Enum.PeoplePageLayout.Card then ReactModule.createElement(PeopleCardsModule, {
			LayoutOrder = 3,
			getUniversesExposedTo = p1.getUniversesExposedTo,
			addUniverseToExposureList = p1.addUniverseToExposureList,
			scrollingFrameStore = if p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
		}) else ReactModule.createElement(PeopleListModule, {
			LayoutOrder = 3,
			scrollingFrameStore = if FFlagEnablePeopleListLazyRender and p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
		})
	end, {
		PeoplePageLayout,
		UseScrollingFrameStoreModuleResult,
		p1.scrollingFrame,
		p1.getUniversesExposedTo,
		p1.addUniverseToExposureList
	}) else nil
	
	if GetFFlagPeoplePagePostponeInitialRenderFunction() then
		ReactModule.useEffect(function()
			-- upvalues: Callback1 (ref)
			Callback1(true)
		end, {})
	end
	local v2 = nil
	local Callback2 = nil
	
	if FFlagShowSwitchServerButton then
		v2, Callback2 = ReactModule.useState(false)
	end
	local Element1 = ReactModule.createElement(ReactModule.Fragment, {}, {
		MenuButtonsWrapper = if FFlagEnableSideSheet then nil else ReactModule.createElement(MenuButtonsWrapperModule),
		CoreButtonRow = ReactModule.createElement(CoreButtonRowModule, {
			chromeEnabled = p1.chromeEnabled,
			LayoutOrder = if GetFFlagAddPeoplePageCardLayoutFunction() then 1 else nil,
			buttonActivatedTable = if FFlagShowSwitchServerButton then {
				[ConstantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER] = function()
					-- upvalues: Callback2 (ref)
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
	return ReactModule.createElement(View, {
		testId = "mainView",
		tag = {
			["size-full col padding-bottom-small"] = FFlagFixVirtualizedGridNumItems,
			["size-full col gap-large padding-bottom-small"] = not FFlagFixVirtualizedGridNumItems,
			["padding-x-medium"] = not IsUseDeviceOrientationResultMatch
		}
	}, {
		PeopleHeader = Element1,
		People = if GetFFlagPeoplePagePostponeInitialRenderFunction() and not v1 then nil elseif GetFFlagAddPeoplePageCardLayoutFunction() then Element else ReactModule.createElement(PeopleListModule, {
			scrollingFrameStore = if FFlagEnablePeopleListLazyRender and p1.scrollingFrame then UseScrollingFrameStoreModuleResult else nil
		}),
		BlockingModalManager = ReactModule.createElement(UseMemoResult),
		SwitchServerConfirmation = if FFlagShowSwitchServerButton and v2 then ReactModule.createElement(SwitchServerConfirmationModule, {
			onClose = function()
				-- upvalues: Callback2 (ref)
				Callback2(false)
			end
		}) else nil
	})
end