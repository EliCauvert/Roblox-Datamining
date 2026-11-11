local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local FindValueKeyInRefCacheFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.findValueKeyInRefCache
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local TabBarButtonModule = require(Modules.AvatarExperience.Common.Components.NavBar.TabBar.TabBarButton)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AXMigrateTabBarMainNavigationToFocusNavigation2 = game:DefineFastFlag("AXMigrateTabBarMainNavigationToFocusNavigation2", false)
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonL1] = FocusNavigationEventNameEnum.TabBackward,
	[Enum.KeyCode.ButtonR1] = FocusNavigationEventNameEnum.TabForward
}

local function useFocusNavigationBindings(p1, UseResult, UseResult1, UseResult2)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy), UseResult1 (copy), UseResult2 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(UseResult) },
			[FocusNavigationEventNameEnum.TabBackward] = { handler = InputHandlersModule.onRelease(UseResult1) },
			[FocusNavigationEventNameEnum.TabForward] = { handler = InputHandlersModule.onRelease(UseResult2) }
		}
	end, { UseResult, UseResult2, UseResult1 }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

return function(p1)
	-- upvalues: RoactGamepadModule (copy), ReactModule (copy), CryoModule (copy), UseStyleFunction (copy), UseFocusGuiObjectFunction (copy), AXMigrateTabBarMainNavigationToFocusNavigation2 (copy), FindValueKeyInRefCacheFunction (copy), GuiService (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), TabBarButtonModule (copy)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), CryoModule (upval), ReactModule (upval)
		if not UseStateResult[p2] then
			UseStateResult2(CryoModule.Dictionary.join(UseStateResult, { [p2] = ReactModule.createRef() }))
		end
		return UseStateResult[p2]
	end, { UseStateResult })
	local LayoutOrder = p1.layoutOrder
	local NavHeight = p1.navHeight
	local ZIndex = p1.zIndex
	local SelectedTabIndex = p1.selectedTabIndex
	local Theme = UseStyleFunction().Theme
	local MainNavigationRef = p1.mainNavigationRef
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseTableWrappedCallbackRefResult = if AXMigrateTabBarMainNavigationToFocusNavigation2 then UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(nil, ReactModule.useCallback(function(p2)
		-- upvalues: UseFocusGuiObjectResult (copy), p1 (copy)
		p2.cancelled = true
		
		if UseFocusGuiObjectResult and p1.NextSelectionUp and p1.NextSelectionUp.current then
			UseFocusGuiObjectResult(p1.NextSelectionUp.current)
		end
	end, { UseFocusGuiObjectResult, p1.NextSelectionUp }), ReactModule.useCallback(function(p2)
		-- upvalues: FindValueKeyInRefCacheFunction (upval), GuiService (upval), UseRefCacheResult (copy), UseFocusGuiObjectResult (copy)
		p2.cancelled = true
		local ValueKeyInRefCache: number = FindValueKeyInRefCacheFunction(GuiService.SelectedCoreObject, UseRefCacheResult)
		
		if ValueKeyInRefCache and ValueKeyInRefCache > 1 and UseFocusGuiObjectResult then
			UseFocusGuiObjectResult(UseRefCacheResult[ValueKeyInRefCache - 1].current)
		end
	end, { UseFocusGuiObjectResult }), (ReactModule.useCallback(function(p2)
		-- upvalues: FindValueKeyInRefCacheFunction (upval), GuiService (upval), UseRefCacheResult (copy), UseFocusGuiObjectResult (copy)
		p2.cancelled = true
		local ValueKeyInRefCache: number = FindValueKeyInRefCacheFunction(GuiService.SelectedCoreObject, UseRefCacheResult)
		
		if ValueKeyInRefCache and ValueKeyInRefCache < #UseRefCacheResult and UseFocusGuiObjectResult then
			UseFocusGuiObjectResult(UseRefCacheResult[ValueKeyInRefCache + 1].current)
		end
	end, { UseFocusGuiObjectResult }))))) else nil
	local UseResult1 = ReactModule.useCallback(function(LayoutOrder, p2)
		-- upvalues: SelectedTabIndex (copy), p1 (copy), ReactModule (upval), TabBarButtonModule (upval), UseResult (copy), UseRefCacheResult (copy)
		local SelectTabFunction = p1.selectTab
		
		return ReactModule.createElement(TabBarButtonModule, {
			tabIndex = LayoutOrder,
			tabsLength = #p1.tabs,
			tabTitle = p2.Title,
			layoutOrder = LayoutOrder,
			isSelected = SelectedTabIndex == LayoutOrder,
			frameRef = UseResult(LayoutOrder),
			onActivate = function()
				-- upvalues: SelectTabFunction (copy), LayoutOrder (copy)
				SelectTabFunction(LayoutOrder)
			end,
			ref = UseRefCacheResult[LayoutOrder]
		})
	end, {
		SelectedTabIndex,
		p1.selectTab,
		p1.tabs,
		UseRefCacheResult,
		UseResult
	})
	
	return ReactModule.createElement("Frame", {
		ClipsDescendants = true,
		BorderSizePixel = 0,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency,
		LayoutOrder = LayoutOrder,
		Size = UDim2.new(1, 0, 0, NavHeight),
		ZIndex = ZIndex,
		ref = MainNavigationRef
	}, {
		NavFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = if AXMigrateTabBarMainNavigationToFocusNavigation2 then UseTableWrappedCallbackRefResult else nil
		}, ReactModule.useCallback(function()
			-- upvalues: p1 (copy), ReactModule (upval), UseResult1 (copy)
			local config = {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top
				})
			}
			
			for i, tab in p1.tabs do
				config[tab.Name] = UseResult1(i, tab)
			end
			return config
		end, { p1.tabs, UseResult1 })())
	})
end