local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local AppBloxModule = require(Parent.AppBlox)
local _ = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local NavigateBack = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum.NavigateBack
local config = {
	[Enum.KeyCode.ButtonB] = NavigateBack,
	[Enum.KeyCode.Escape] = NavigateBack
}

local function _()
	-- upvalues: ReactModule (copy), HttpService (copy)
	return (ReactModule.useState(function(): string
		-- upvalues: HttpService (upval)
		return `collection-header-menu-{HttpService:GenerateGUID(false)}`
	end))
end

local function useMenuFocusNavigation(UseStateResult)
	-- upvalues: ReactModule (copy), ResponsiveModule (copy), AppBloxModule (copy), ReactFocusNavigationModule (copy), config (copy), NavigateBack (copy), InputHandlersModule (copy), GuiService (copy)
	local UseStateResult1, UseStateResult2 = ReactModule.useState(nil)
	local UseLastInputResult = ResponsiveModule.useLastInput()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AppBloxModule (upval), UseStateResult (copy)
		AppBloxModule.getOverflowMenuSignalStore().closeMenu(UseStateResult)
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return UseResult
	end, { UseResult })
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: NavigateBack (upval), InputHandlersModule (upval), UseResult (copy)
		return {
			[NavigateBack] = { handler = InputHandlersModule.onRelease(UseResult) }
		}
	end, { UseResult }), (ReactFocusNavigationModule.useEventMap(config)))
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseLastInputResult (copy), ResponsiveModule (upval), GuiService (upval)
		if UseStateResult1 and UseLastInputResult == ResponsiveModule.Input.Directional then
			GuiService:Select(UseStateResult1)
		end
	end, { UseStateResult1, UseLastInputResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), GuiService (upval), UseResult (copy)
		if not UseStateResult1 then
			return nil
		end
		local Flag = false
		
		local function onSelectionChanged()
			-- upvalues: GuiService (upval), UseStateResult1 (upval), Flag (ref), UseResult (upval)
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if SelectedCoreObject and SelectedCoreObject:IsDescendantOf(UseStateResult1) then
				Flag = true
				
				return
			end
			if Flag then
				UseResult()
			end
		end
		
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if SelectedCoreObject and SelectedCoreObject:IsDescendantOf(UseStateResult1) then
			Flag = true
		elseif Flag then
			UseResult()
		end
		local Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(onSelectionChanged)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseStateResult1, UseResult })
	
	return ReactModule.useCallback(function(p1)
		-- upvalues: UseEventHandlerMapResult (copy), UseStateResult2 (copy)
		if type(UseEventHandlerMapResult) == "function" then
			UseEventHandlerMapResult(p1)
		end
		UseStateResult2(p1)
	end, { UseEventHandlerMapResult })
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), HttpService (copy), useMenuFocusNavigation (copy), AppBloxModule (copy)
	local UseStateResult = ReactModule.useState(function(): string
		-- upvalues: HttpService (upval)
		return `collection-header-menu-{HttpService:GenerateGUID(false)}`
	end)
	
	return ReactModule.createElement(AppBloxModule.OverflowMenu, {
		hasOverflowButton = true,
		shouldShowAnchor = true,
		buttonTag = "auto-xy",
		anchorPoint = p1.anchorPoint,
		menuKey = UseStateResult,
		menuItems = p1.menuItems,
		setFocusRef = useMenuFocusNavigation(UseStateResult)
	})
end)