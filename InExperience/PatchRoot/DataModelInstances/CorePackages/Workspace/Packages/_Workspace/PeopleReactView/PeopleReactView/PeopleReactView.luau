local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local robloxAppEnumsModule = require(parent_1.RobloxAppEnums)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local foundationModule = require(parent_1.Foundation)
local peopleServiceModule = require(parent_1.PeopleService)
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local useGetPeopleServiceModule = require(parent.Hooks.useGetPeopleService)
local useScrollingFrameStoreModule = require(parent.Hooks.useScrollingFrameStore)
local view = foundationModule.View
local peopleListModule = require(parent.Components.PeopleList)
local peopleCardsModule = require(parent.Components.PeopleCards)
local coreButtonRowModule = require(parent.Components.CoreButtonRow)
local menuButtonsWrapperModule = require(parent.Components.MenuButtonsWrapper)
local titleBarModule = require(parent.Components.TitleBar)
local switchServerConfirmationModule = require(parent.Components.SwitchServerConfirmation)
local switchServerTelemetryModule = require(parent.Telemetry.SwitchServerTelemetry)
local constantsModule = require(parent.Constants)
local gameSettings = UserSettings().GameSettings
local fFlagEnableSideSheet = require(parent_1.SharedFlags).FFlagEnableSideSheet
local flags = peopleServiceModule.getService("Flags")
local getFFlagAddPeoplePageCardLayout = flags.GetFFlagAddPeoplePageCardLayout
local getFFlagPeoplePageLazyRenderCards = flags.GetFFlagPeoplePageLazyRenderCards
local getFFlagPeoplePagePostponeInitialRender = flags.GetFFlagPeoplePagePostponeInitialRender
local fFlagEnablePeopleListLazyRender = flags.FFlagEnablePeopleListLazyRender
local fFlagPeoplePageRemoveUseMemoElements = flags.FFlagPeoplePageRemoveUseMemoElements
local fFlagPeopleCardsEnableVirtualizedGrid = flags.FFlagPeopleCardsEnableVirtualizedGrid
local fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView = flags.FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView
local fFlagPeoplePageFlipVolumePopoverToFitViewport = flags.FFlagPeoplePageFlipVolumePopoverToFitViewport
local fFlagPeoplePageDismissCardMenuOnScrollOutOfView = flags.FFlagPeoplePageDismissCardMenuOnScrollOutOfView
local fFlagFixVirtualizedGridNumItems = flags.FFlagFixVirtualizedGridNumItems
local fFlagShowSwitchServerButton = flags.FFlagShowSwitchServerButton

return function(p0)
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), useGetPeopleServiceModule (ref), reactModule (ref), peopleServiceModule (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), gameSettings (ref), getFFlagPeoplePagePostponeInitialRender (ref), getFFlagPeoplePageLazyRenderCards (ref), fFlagEnablePeopleListLazyRender (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (ref), fFlagPeoplePageFlipVolumePopoverToFitViewport (ref), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (ref), useScrollingFrameStoreModule (ref), fFlagFixVirtualizedGridNumItems (ref), fFlagPeoplePageRemoveUseMemoElements (ref), peopleCardsModule (ref), peopleListModule (ref), fFlagShowSwitchServerButton (ref), fFlagEnableSideSheet (ref), menuButtonsWrapperModule (ref), coreButtonRowModule (ref), constantsModule (ref), switchServerTelemetryModule (ref), titleBarModule (ref), view (ref), switchServerConfirmationModule (ref)
	local var16 = if getFFlagAddPeoplePageCardLayout() then useGetPeopleServiceModule("PeopleAnalyticsManager") else nil
	local var17 = if getFFlagAddPeoplePageCardLayout() then useGetPeopleServiceModule("PeopleBlockingModalManager") else reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleBlockingModalManager")
	end, {})
	local var18 = reactModule.useMemo(function()
		-- upvalues: var17 (write), p0 (ref)
		return var17.getModalManager(p0.blockingModalScreen, p0.blockingFlags)
	end, { var17, p0.blockingModalScreen, p0.blockingFlags })
	local var19 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var20 = nil
	local var21 = nil
	
	if getFFlagAddPeoplePageCardLayout() then
		local var22, var23 = reactModule.useState(gameSettings.PeoplePageLayout)
		var20 = var22
		var21 = var23
	end
	local var24 = nil
	local var25 = nil
	
	if getFFlagPeoplePagePostponeInitialRender() then
		local var26, var27 = reactModule.useState(false)
		var24 = var26
		var25 = var27
	end
	local var28 = if getFFlagPeoplePageLazyRenderCards() or fFlagEnablePeopleListLazyRender or (fFlagPeopleCardsEnableVirtualizedGrid or fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView) or (fFlagPeoplePageFlipVolumePopoverToFitViewport or fFlagPeoplePageDismissCardMenuOnScrollOutOfView) then useScrollingFrameStoreModule(p0.scrollingFrame) else nil
	local var29 = if fFlagFixVirtualizedGridNumItems then reactModule.useCallback(function(p1)
		-- upvalues: var28 (ref)
		if var28 then
			var28.setCanvasPositionYOffset(-p1.AbsoluteSize.Y)
		end
	end, { var28 }) else nil
	local var30 = if getFFlagAddPeoplePageCardLayout() then reactModule.useCallback(function(p2)
		-- upvalues: var16 (ref), var21 (write)
		var16:trackPeoplePageLayoutChanged(p2)
		var21(p2)
	end, {}) else nil
	local _ = nil
	local var31 = if not fFlagPeoplePageRemoveUseMemoElements then if var20 == Enum.PeoplePageLayout.Card then reactModule.createElement(peopleCardsModule, {
		LayoutOrder = 3,
		getUniversesExposedTo = p0.getUniversesExposedTo,
		addUniverseToExposureList = p0.addUniverseToExposureList,
		scrollingFrameStore = if p0.scrollingFrame then var28 else nil
	}) else reactModule.createElement(peopleListModule, {
		LayoutOrder = 3,
		scrollingFrameStore = if fFlagEnablePeopleListLazyRender and p0.scrollingFrame then var28 else nil
	}) elseif getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: var20 (write), reactModule (copy), peopleCardsModule (copy), p0 (ref), var28 (ref), peopleListModule (copy), fFlagEnablePeopleListLazyRender (copy)
		return if var20 == Enum.PeoplePageLayout.Card then reactModule.createElement(peopleCardsModule, {
			LayoutOrder = 3,
			getUniversesExposedTo = p0.getUniversesExposedTo,
			addUniverseToExposureList = p0.addUniverseToExposureList,
			scrollingFrameStore = if p0.scrollingFrame then var28 else nil
		}) else reactModule.createElement(peopleListModule, {
			LayoutOrder = 3,
			scrollingFrameStore = if fFlagEnablePeopleListLazyRender and p0.scrollingFrame then var28 else nil
		})
	end, {
		var20,
		var28,
		p0.scrollingFrame,
		p0.getUniversesExposedTo,
		p0.addUniverseToExposureList
	}) else nil
	
	if getFFlagPeoplePagePostponeInitialRender() then
		reactModule.useEffect(function()
			-- upvalues: var25 (write)
			var25(true)
		end, {})
	end
	local var32 = nil
	local var33 = nil
	
	if fFlagShowSwitchServerButton then
		local var34, var35 = reactModule.useState(false)
		var32 = var34
		var33 = var35
	end
	local var36 = reactModule.createElement(reactModule.Fragment, {}, {
		MenuButtonsWrapper = if fFlagEnableSideSheet then nil else reactModule.createElement(menuButtonsWrapperModule),
		CoreButtonRow = reactModule.createElement(coreButtonRowModule, {
			chromeEnabled = p0.chromeEnabled,
			LayoutOrder = if getFFlagAddPeoplePageCardLayout() then 1 else nil,
			buttonActivatedTable = if fFlagShowSwitchServerButton then {
				[constantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER] = function()
					-- upvalues: switchServerTelemetryModule (copy), var33 (write)
					switchServerTelemetryModule.sendSwitchServerButtonActions({ event_type = "click" })
					var33(true)
				end
			} else nil
		}),
		TitleBar = if getFFlagAddPeoplePageCardLayout() then reactModule.createElement(titleBarModule, { LayoutOrder = 2, layout = var20, setLayout = var30 }) else nil
	})
	
	if fFlagFixVirtualizedGridNumItems then
		var36 = reactModule.createElement(view, {
			tag = "size-full-0 auto-y col gap-large padding-bottom-large",
			LayoutOrder = 1,
			onAbsoluteSizeChanged = var29
		}, var36)
	end
	local var39
	local createElement = reactModule.createElement
	local t = {
		testId = "mainView",
		tag = {
			["size-full col padding-bottom-small"] = fFlagFixVirtualizedGridNumItems,
			["size-full col gap-large padding-bottom-small"] = not fFlagFixVirtualizedGridNumItems,
			["padding-x-medium"] = not var19
		}
	}
	local t_1 = { PeopleHeader = var36 }
	
	if getFFlagPeoplePagePostponeInitialRender() and not var24 then
		var39 = nil
	elseif getFFlagAddPeoplePageCardLayout() then
		var39 = var31
	else
		var39 = reactModule.createElement
		var39 = var39(peopleListModule, {
			scrollingFrameStore = if fFlagEnablePeopleListLazyRender and p0.scrollingFrame then var28 else nil
		})
	end
	t_1.People = var39
	t_1.BlockingModalManager = reactModule.createElement(var18)
	t_1.SwitchServerConfirmation = if fFlagShowSwitchServerButton and var32 then reactModule.createElement(switchServerConfirmationModule, { setSwitchServerConfirmationOpen = var33 }) else nil
	
	return createElement(view, t, t_1)
end