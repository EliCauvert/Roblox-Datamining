local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local AppBloxModule = require(Parent.AppBlox)
local _ = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local FFlagLuaAppCollectionHeaderMenuFocusFix = require(Parent.SharedFlags).FFlagLuaAppCollectionHeaderMenuFocusFix
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
	-- upvalues: FFlagLuaAppCollectionHeaderMenuFocusFix (copy), ReactModule (copy), ResponsiveModule (copy), AppBloxModule (copy), ReactFocusNavigationModule (copy), config (copy), NavigateBack (copy), InputHandlersModule (copy), GuiService (copy)
	local Ancestor = nil
	local Callback = nil
	local UseLastInputResult = nil
	
	if not FFlagLuaAppCollectionHeaderMenuFocusFix then
		Ancestor, Callback = ReactModule.useState(nil)
		UseLastInputResult = ResponsiveModule.useLastInput()
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AppBloxModule (upval), UseStateResult (copy)
		AppBloxModule.getOverflowMenuSignalStore().closeMenu(UseStateResult)
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return UseResult
	end, { UseResult })
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: NavigateBack (upval), InputHandlersModule (upval), FFlagLuaAppCollectionHeaderMenuFocusFix (upval), UseResult (copy)
		return {
			[NavigateBack] = {
				handler = InputHandlersModule.onRelease(if FFlagLuaAppCollectionHeaderMenuFocusFix then function(p1)
					-- upvalues: UseResult (upval)
					p1:cancel()
					UseResult()
				end else UseResult)
			}
		}
	end, { UseResult }), (ReactFocusNavigationModule.useEventMap(config)))
	
	if not FFlagLuaAppCollectionHeaderMenuFocusFix then
		ReactModule.useEffect(function()
			-- upvalues: Ancestor (ref), UseLastInputResult (ref), ResponsiveModule (upval), GuiService (upval)
			if Ancestor and UseLastInputResult == ResponsiveModule.Input.Directional then
				GuiService:Select(Ancestor)
			end
		end, { Ancestor, UseLastInputResult })
		ReactModule.useEffect(function()
			-- upvalues: Ancestor (ref), GuiService (upval), UseResult (copy)
			if not Ancestor then
				return nil
			end
			local Flag = false
			
			local function onSelectionChanged()
				-- upvalues: GuiService (upval), Ancestor (upval), Flag (ref), UseResult (upval)
				local SelectedCoreObject = GuiService.SelectedCoreObject
				
				if SelectedCoreObject and SelectedCoreObject:IsDescendantOf(Ancestor) then
					Flag = true
					
					return
				end
				if Flag then
					UseResult()
				end
			end
			
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if SelectedCoreObject and SelectedCoreObject:IsDescendantOf(Ancestor) then
				Flag = true
			elseif Flag then
				UseResult()
			end
			local Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(onSelectionChanged)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, { Ancestor, UseResult })
	end
	return ReactModule.useCallback(function(p1)
		-- upvalues: UseEventHandlerMapResult (copy), FFlagLuaAppCollectionHeaderMenuFocusFix (upval), Callback (ref)
		if type(UseEventHandlerMapResult) == "function" then
			UseEventHandlerMapResult(p1)
		end
		if not FFlagLuaAppCollectionHeaderMenuFocusFix then
			Callback(p1)
		end
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