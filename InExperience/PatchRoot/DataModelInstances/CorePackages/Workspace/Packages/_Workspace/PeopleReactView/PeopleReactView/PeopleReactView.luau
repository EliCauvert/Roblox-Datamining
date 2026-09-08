local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local robloxAppEnumsModule = require(parent_1.RobloxAppEnums)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local foundationModule = require(parent_1.Foundation)
local peopleServiceModule = require(parent_1.PeopleService)
local switchServerModule = require(parent_1.SwitchServer)
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
local switchServerConfirmation = switchServerModule.SwitchServerConfirmation
local switchServerTelemetry = switchServerModule.SwitchServerTelemetry
local isSideSheetEnabledModule = require(parent_1.InExperienceSideSheetUtils.isSideSheetEnabled)
local fFlagShowSwitchServerButton = require(parent_1.SharedFlags).FFlagShowSwitchServerButton
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

return function(p1)
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), useGetPeopleServiceModule (ref), reactModule (ref), peopleServiceModule (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), gameSettings (ref), getFFlagPeoplePagePostponeInitialRender (ref), getFFlagPeoplePageLazyRenderCards (ref), fFlagEnablePeopleListLazyRender (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (ref), fFlagPeoplePageFlipVolumePopoverToFitViewport (ref), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (ref), useScrollingFrameStoreModule (ref), fFlagFixVirtualizedGridNumItems (ref), fFlagPeoplePageRemoveUseMemoElements (ref), peopleCardsModule (ref), peopleListModule (ref), fFlagShowSwitchServerButton (ref), isSideSheetEnabledModule (ref), menuButtonsWrapperModule (ref), coreButtonRowModule (ref), constantsModule (ref), switchServerTelemetry (ref), titleBarModule (ref), view (ref), switchServerConfirmation (ref)
	local var1 = if getFFlagAddPeoplePageCardLayout() then useGetPeopleServiceModule("PeopleAnalyticsManager") else nil
	local var2 = if getFFlagAddPeoplePageCardLayout() then useGetPeopleServiceModule("PeopleBlockingModalManager") else reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleBlockingModalManager")
	end, {})
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (write), p1 (ref)
		return var2.getModalManager(p1.blockingModalScreen, p1.blockingFlags)
	end, { var2, p1.blockingModalScreen, p1.blockingFlags })
	local var4 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var5 = nil
	local var6 = nil
	
	if getFFlagAddPeoplePageCardLayout() then
		local var7, var8 = reactModule.useState(gameSettings.PeoplePageLayout)
		var5 = var7
		var6 = var8
	end
	local var9 = nil
	local var10 = nil
	
	if getFFlagPeoplePagePostponeInitialRender() then
		local var11, var12 = reactModule.useState(false)
		var9 = var11
		var10 = var12
	end
	local var13 = if getFFlagPeoplePageLazyRenderCards() or fFlagEnablePeopleListLazyRender or (fFlagPeopleCardsEnableVirtualizedGrid or fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView) or (fFlagPeoplePageFlipVolumePopoverToFitViewport or fFlagPeoplePageDismissCardMenuOnScrollOutOfView) then useScrollingFrameStoreModule(p1.scrollingFrame) else nil
	local var14 = if fFlagFixVirtualizedGridNumItems then reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref)
		if var13 then
			var13.setCanvasPositionYOffset(-p2.AbsoluteSize.Y)
		end
	end, { var13 }) else nil
	local var15 = if getFFlagAddPeoplePageCardLayout() then reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var6 (write)
		var1:trackPeoplePageLayoutChanged(p2)
		var6(p2)
	end, {}) else nil
	local _ = nil
	local var16 = if not fFlagPeoplePageRemoveUseMemoElements then if var5 == Enum.PeoplePageLayout.Card then reactModule.createElement(peopleCardsModule, {
		LayoutOrder = 3,
		getUniversesExposedTo = p1.getUniversesExposedTo,
		addUniverseToExposureList = p1.addUniverseToExposureList,
		scrollingFrameStore = if p1.scrollingFrame then var13 else nil
	}) else reactModule.createElement(peopleListModule, {
		LayoutOrder = 3,
		scrollingFrameStore = if fFlagEnablePeopleListLazyRender and p1.scrollingFrame then var13 else nil
	}) elseif getFFlagAddPeoplePageCardLayout() then reactModule.useMemo(function()
		-- upvalues: var5 (write), reactModule (copy), peopleCardsModule (copy), p1 (ref), var13 (ref), peopleListModule (copy), fFlagEnablePeopleListLazyRender (copy)
		return if var5 == Enum.PeoplePageLayout.Card then reactModule.createElement(peopleCardsModule, {
			LayoutOrder = 3,
			getUniversesExposedTo = p1.getUniversesExposedTo,
			addUniverseToExposureList = p1.addUniverseToExposureList,
			scrollingFrameStore = if p1.scrollingFrame then var13 else nil
		}) else reactModule.createElement(peopleListModule, {
			LayoutOrder = 3,
			scrollingFrameStore = if fFlagEnablePeopleListLazyRender and p1.scrollingFrame then var13 else nil
		})
	end, {
		var5,
		var13,
		p1.scrollingFrame,
		p1.getUniversesExposedTo,
		p1.addUniverseToExposureList
	}) else nil
	
	if getFFlagPeoplePagePostponeInitialRender() then
		reactModule.useEffect(function()
			-- upvalues: var10 (write)
			var10(true)
		end, {})
	end
	local var17 = nil
	local var18 = nil
	
	if fFlagShowSwitchServerButton then
		local var19, var20 = reactModule.useState(false)
		var17 = var19
		var18 = var20
	end
	local var21 = reactModule.createElement(reactModule.Fragment, {}, {
		MenuButtonsWrapper = if isSideSheetEnabledModule then nil else reactModule.createElement(menuButtonsWrapperModule),
		CoreButtonRow = reactModule.createElement(coreButtonRowModule, {
			chromeEnabled = p1.chromeEnabled,
			LayoutOrder = if getFFlagAddPeoplePageCardLayout() then 1 else nil,
			buttonActivatedTable = if fFlagShowSwitchServerButton then {
				[constantsModule.PEOPLEPAGE.BUTTON_ACTIVATED_TABLE_KEYS.SWITCH_SERVER] = function()
					-- upvalues: switchServerTelemetry (copy), var18 (write)
					switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "click" })
					var18(true)
				end
			} else nil
		}),
		TitleBar = if getFFlagAddPeoplePageCardLayout() then reactModule.createElement(titleBarModule, { LayoutOrder = 2, layout = var5, setLayout = var15 }) else nil
	})
	
	if fFlagFixVirtualizedGridNumItems then
		var21 = reactModule.createElement(view, {
			tag = "size-full-0 auto-y col gap-large padding-bottom-large",
			LayoutOrder = 1,
			onAbsoluteSizeChanged = var14
		}, var21)
	end
	local var22
	local createElement = reactModule.createElement
	local t = {
		testId = "mainView",
		tag = {
			["size-full col padding-bottom-small"] = fFlagFixVirtualizedGridNumItems,
			["size-full col gap-large padding-bottom-small"] = not fFlagFixVirtualizedGridNumItems,
			["padding-x-medium"] = not var4
		}
	}
	local t_1 = { PeopleHeader = var21 }
	
	if getFFlagPeoplePagePostponeInitialRender() and not var9 then
		var22 = nil
	elseif getFFlagAddPeoplePageCardLayout() then
		var22 = var16
	else
		var22 = reactModule.createElement
		var22 = var22(peopleListModule, {
			scrollingFrameStore = if fFlagEnablePeopleListLazyRender and p1.scrollingFrame then var13 else nil
		})
	end
	t_1.People = var22
	t_1.BlockingModalManager = reactModule.createElement(var3)
	t_1.SwitchServerConfirmation = if fFlagShowSwitchServerButton and var17 then reactModule.createElement(switchServerConfirmation, { setSwitchServerConfirmationOpen = var18 }) else nil
	
	return createElement(view, t, t_1)
end