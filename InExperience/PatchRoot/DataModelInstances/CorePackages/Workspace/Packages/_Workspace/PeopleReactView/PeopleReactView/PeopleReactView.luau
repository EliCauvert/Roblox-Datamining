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
local constantsModule = require(parent.Constants)
local gameSettings = UserSettings().GameSettings
local switchServerModule = require(parent_1.SwitchServer)
local switchServerConfirmation = switchServerModule.SwitchServerConfirmation
local switchServerTelemetry = switchServerModule.SwitchServerTelemetry
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
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), useGetPeopleServiceModule (ref), reactModule (ref), peopleServiceModule (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), gameSettings (ref), getFFlagPeoplePagePostponeInitialRender (ref), getFFlagPeoplePageLazyRenderCards (ref), fFlagEnablePeopleListLazyRender (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (ref), fFlagPeoplePageFlipVolumePopoverToFitViewport (ref), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (ref), useScrollingFrameStoreModule (ref), fFlagFixVirtualizedGridNumItems (ref), fFlagPeoplePageRemoveUseMemoElements (ref), peopleCardsModule (ref), peopleListModule (ref), fFlagShowSwitchServerButton (ref), fFlagEnableSideSheet (ref), menuButtonsWrapperModule (ref), coreButtonRowModule (ref), constantsModule (ref), switchServerTelemetry (ref), titleBarModule (ref), view (ref), switchServerConfirmation (ref)
	local var15 = if getFFlagAddPeoplePageCardLayout() then useGetPeopleServiceModule("PeopleAnalyticsManager") else nil
	local var16 = if getFFlagAddPeoplePageCardLayout() then useGetPeopleServiceModule("PeopleBlockingModalManager") else reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleBlockingModalManager")
	end, {})
	local var17 = reactModule.useMemo(function()
		-- upvalues: var16 (write), p0 (ref)
		return var16.getModalManager(p0.blockingModalScreen, p0.blockingFlags)
	end, { var16, p0.blockingModalScreen, p0.blockingFlags })
	local var18 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var19 = nil
	local var20 = nil
	
	if getFFlagAddPeoplePageCardLayout() then
		local var21, var22 = reactModule.useState(gameSettings.PeoplePageLayout)
		var19 = var21
		var20 = var22
	end
	local var23 = nil
	local var24 = nil
	
	if getFFlagPeoplePagePostponeInitialRender() then
		local var25, var26 = reactModule.useState(false)
		var23 = var25
		var24 = var26
	end
	local var27 = if getFFlagPeoplePageLazyRenderCards() or fFlagEnablePeopleListLazyRender or (fFlagPeopleCardsEnableVirtualizedGrid or fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView) or (fFlagPeoplePageFlipVolumePopoverToFitViewport or fFlagPeoplePageDismissCardMenuOnScrollOutOfView) then useScrollingFrameStoreModule(p0.scrollingFrame) else nil
	local var28 = if fFlagFixVirtualizedGridNumItems then reactModule.useCallback(function(p1)
		-- upvalues: var27 (ref)
		if var27 then
			var27.setCanvasPositionYOffset(-p1.AbsoluteSize.Y)
		end
	end, { var27 }) else nil
	local var29 = if getFFlagAddPeoplePageCardLayout() then reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), var20 (write)
		var15:trackPeoplePageLayoutChanged(p2)
		var20(p2)
	end, {}) else nil
	local _ = nil
	local var30 = if not fFlagPeoplePageRemoveUseMemoElements then if var19 == Enum.PeoplePageLayout.Card then reactModule.createElement(peopleCardsModule, {
		LayoutOrder = 3,
		getUniversesExposedTo = p0.getUniversesExposedTo,
		addUniverseToExposureList = p0.addUniverseToExposureList,
		scrollingFrameStore = if p0.scrollingFrame then var27 else nil
	}) else reactModule.createElement(peopleListModule, {
		LayoutOrder = 3,
		scrollingFrameStore = if fFlagEnablePeopleListLazyRender and p0.scrollingFrame then var27 else nil
	}) elseif getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: var19 (write), reactModule (copy), peopleCardsModule (copy), p0 (ref), var27 (ref), peopleListModule (copy), fFlagEnablePeopleListLazyRender (copy)
		return if var19 == Enum.PeoplePageLayout.Card then reactModule.createElement(peopleCardsModule, {
			LayoutOrder = 3,
			getUniversesExposedTo = p0.getUniversesExposedTo,
			addUniverseToExposureList = p0.addUniverseToExposureList,
			scrollingFrameStore = if p0.scrollingFrame then var27 else nil
		}) else reactModule.createElement(peopleListModule, {
			LayoutOrder = 3,
			scrollingFrameStore = if fFlagEnablePeopleListLazyRender and p0.scrollingFrame then var27 else nil
		})
	end, {
		var19,
		var27,
		p0.scrollingFrame,
		p0.getUniversesExposedTo,
		p0.addUniverseToExposureList
	}) else nil
	
	if getFFlagPeoplePagePostponeInitialRender() then
		reactModule.useEffect(function()
			-- upvalues: var24 (write)
			var24(true)
		end, {})
	end
	local var31 = nil
	local var32 = nil
	
	if fFlagShowSwitchServerButton then
		local var33, var34 = reactModule.useState(false)
		var31 = var33
		var32 = var34
	end
	local var35 = reactModule.createElement(reactModule.Fragment, {}, {
		MenuButtonsWrapper = if fFlagEnableSideSheet then nil else reactModule.createElement(menuButtonsWrapperModule),
		CoreButtonRow = reactModule.createElement(coreButtonRowModule, {
			chromeEnabled = p0.chromeEnabled,
			LayoutOrder = if getFFlagAddPeoplePageCardLayout() then 1 else nil,
			buttonActivatedTable = if fFlagShowSwitchServerButton then {
				[constantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER] = function()
					-- upvalues: switchServerTelemetry (copy), var32 (write)
					switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "click" })
					var32(true)
				end
			} else nil
		}),
		TitleBar = if getFFlagAddPeoplePageCardLayout() then reactModule.createElement(titleBarModule, { LayoutOrder = 2, layout = var19, setLayout = var29 }) else nil
	})
	
	if fFlagFixVirtualizedGridNumItems then
		var35 = reactModule.createElement(view, {
			tag = "size-full-0 auto-y col gap-large padding-bottom-large",
			LayoutOrder = 1,
			onAbsoluteSizeChanged = var28
		}, var35)
	end
	local var38
	local createElement = reactModule.createElement
	local t = {
		testId = "mainView",
		tag = {
			["size-full col padding-bottom-small"] = fFlagFixVirtualizedGridNumItems,
			["size-full col gap-large padding-bottom-small"] = not fFlagFixVirtualizedGridNumItems,
			["padding-x-medium"] = not var18
		}
	}
	local t_1 = { PeopleHeader = var35 }
	
	if getFFlagPeoplePagePostponeInitialRender() and not var23 then
		var38 = nil
	elseif getFFlagAddPeoplePageCardLayout() then
		var38 = var30
	else
		var38 = reactModule.createElement
		var38 = var38(peopleListModule, {
			scrollingFrameStore = if fFlagEnablePeopleListLazyRender and p0.scrollingFrame then var27 else nil
		})
	end
	t_1.People = var38
	t_1.BlockingModalManager = reactModule.createElement(var17)
	t_1.SwitchServerConfirmation = if fFlagShowSwitchServerButton and var31 then reactModule.createElement(switchServerConfirmation, { setSwitchServerConfirmationOpen = var32 }) else nil
	
	return createElement(view, t, t_1)
end