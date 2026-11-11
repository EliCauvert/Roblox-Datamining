local Parent = script:FindFirstAncestor("TenFootUiShell").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local TenFootUiCommonModule = require(Parent.TenFootUiCommon)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local NavigationModule = require(Parent.Navigation)
local UseNavigationFunction = NavigationModule.useNavigation
local DashModule = require(Parent.Dash)
local UseGlobalNavDisplayOptionsFunction = require(Parent.TenFootUiGlobalNav).useGlobalNavDisplayOptions
local GetActiveChildNavigationOptionsRecursively = NavigationModule.getActiveChildNavigationOptionsRecursively
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local TenFootUiContext = TenFootUiCommonModule.TenFootUiContext
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local UseFocusRegistryEntryFunction = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useFocusRegistryEntry
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseDescendantHasFocusFunction = FocusNavigationUtilsModule.useDescendantHasFocus
local UseRegistryEntryFunction = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry
local GetCurrentTabNameFunction = require(Parent.NavigationRodux).Utils.getCurrentTabName

local function _(Callback: (any) -> (), Current)
	if type(Callback) == "function" then
		Callback(Current)
		
		return
	end
	if type(Callback) == "table" then
		Callback.current = Current
	end
end

local _ = function(Page, List)
	local Entry = nil
	for i, value in List do
		if value.page == Page then
			Entry = List[i + 1]
			
			if Entry ~= nil then
				return Entry.page
			end
		end
	end
	return nil
end

local _ = function(Page, List)
	local Entry = nil
	for i, value in List do
		if value.page == Page then
			Entry = List[i - 1]
			
			if Entry ~= nil then
				return Entry.page
			end
		end
	end
	return nil
end

local _ = function(p1): string
	return `TenFootUiNavBinding{p1}`
end

local TenFootUiNavBindingName: string = `TenFootUiNavBinding{FocusNavigationEventNameEnum.Search}`
local TenFootUiNavBindingName1: string = `TenFootUiNavBinding{FocusNavigationEventNameEnum.TabForward}`
local TenFootUiNavBindingName2: string = `TenFootUiNavBinding{FocusNavigationEventNameEnum.TabBackward}`
local TenFootUiNavBindingName3: string = `TenFootUiNavBinding{FocusNavigationEventNameEnum.NavigateBack}`

function useRootFocusNavigationBindings(Callback)
	-- upvalues: ReactModule (copy), TenFootUiContext (copy), UseNavigationFunction (copy), UseFocusRegistryEntryFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseRegistryEntryFunction (copy), UseDescendantHasFocusFunction (copy), UseGlobalNavDisplayOptionsFunction (copy), GetActiveChildNavigationOptionsRecursively (copy), GlobalNavDisplayOption (copy), DashModule (copy), GetCurrentTabNameFunction (copy), FocusNavigationEventNameEnum (copy), ReactFocusNavigationModule (copy), InputHandlersModule (copy), TenFootUiNavBindingName (copy), TenFootUiNavBindingName1 (copy), TenFootUiNavBindingName2 (copy), TenFootUiNavBindingName3 (copy)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: Callback (copy)
		if Callback then
			if type(Callback) == "function" then
				Callback(Current)
				
				return
			end
			if type(Callback) == "table" then
				Callback.current = Current
			end
		end
	end, { Callback })
	local UseContextResult = ReactModule.useContext(TenFootUiContext)
	local UseNavigationResult = UseNavigationFunction()
	local UseFocusRegistryEntryResult = UseFocusRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnum.NavBar)
	local UseDescendantHasFocusResult = UseDescendantHasFocusFunction((UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnum.NavBar)))
	local UseGlobalNavDisplayOptionsResult = UseGlobalNavDisplayOptionsFunction(UseNavigationResult, GetActiveChildNavigationOptionsRecursively)
	local IsUseGlobalNavDisplayOptionsResultMatch: boolean = UseGlobalNavDisplayOptionsResult == GlobalNavDisplayOption.TabGroupOnly or UseGlobalNavDisplayOptionsResult == GlobalNavDisplayOption.ShowAll
	local Key = UseNavigationResult.state.key or UseNavigationResult.state.routes[UseNavigationResult.state.index].key
	local Tabs = if UseContextResult then UseContextResult.globalNavConfig.tabs else {}
	local EventStream = if UseContextResult then UseContextResult.useRoactService(UseContextResult.RoactAnalytics).EventStream else nil
	local ButtonClick = if UseContextResult then UseContextResult.buttonClick else DashModule.noop
	local CurrentTabName = GetCurrentTabNameFunction(UseNavigationResult.state)
	local Page = nil
	local Tab = nil
	
	for i, tab in Tabs do
		if tab.page == CurrentTabName then
			Tab = Tabs[i - 1]
			
			if Tab ~= nil then
				Page = Tab.page
				break
			end
		end
	end
	local Page1 = nil
	local Tab1 = nil
	
	for i1, tab1 in Tabs do
		if tab1.page == CurrentTabName then
			Tab1 = Tabs[i1 + 1]
			
			if Tab1 ~= nil then
				Page1 = Tab1.page
				break
			end
		end
	end
	return (ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: IsUseGlobalNavDisplayOptionsResultMatch (copy), FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseNavigationResult (copy), ButtonClick (copy), EventStream (copy), TenFootUiNavBindingName (upval), Key (copy), Page1 (copy), TenFootUiNavBindingName1 (upval), Page (copy), TenFootUiNavBindingName2 (upval), UseDescendantHasFocusResult (copy), UseFocusRegistryEntryResult (copy), TenFootUiNavBindingName3 (upval)
		local t = {}
		
		if IsUseGlobalNavDisplayOptionsResultMatch then
			t[FocusNavigationEventNameEnum.Search] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: UseNavigationResult (upval), ButtonClick (upval), EventStream (upval), TenFootUiNavBindingName (upval), Key (upval)
					UseNavigationResult.navigate("SearchPage")
					ButtonClick(EventStream, TenFootUiNavBindingName, "SearchPage", Key)
				end)
			}
			t[FocusNavigationEventNameEnum.TabForward] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Page1 (upval), UseNavigationResult (upval), ButtonClick (upval), EventStream (upval), TenFootUiNavBindingName1 (upval), Key (upval)
					if Page1 then
						UseNavigationResult.navigate(Page1)
						ButtonClick(EventStream, TenFootUiNavBindingName1, Page1, Key)
					end
				end)
			}
			t[FocusNavigationEventNameEnum.TabBackward] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Page (upval), UseNavigationResult (upval), ButtonClick (upval), EventStream (upval), TenFootUiNavBindingName2 (upval), Key (upval)
					if Page then
						UseNavigationResult.navigate(Page)
						ButtonClick(EventStream, TenFootUiNavBindingName2, Page, Key)
					end
				end)
			}
			t[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: UseDescendantHasFocusResult (upval), UseFocusRegistryEntryResult (upval)
					if not UseDescendantHasFocusResult then
						UseFocusRegistryEntryResult()
					end
				end)
			}
			
			return t
		else
			t[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function()
					-- upvalues: UseNavigationResult (upval), ButtonClick (upval), EventStream (upval), TenFootUiNavBindingName3 (upval), Key (upval)
					if UseNavigationResult.pop == nil then
						UseNavigationResult.goBack()
					else
						UseNavigationResult.pop()
					end
					ButtonClick(EventStream, TenFootUiNavBindingName3, "unknown", Key)
				end)
			}
			
			return t
		end
	end, {
		UseNavigationResult, EventStream, ButtonClick, Page1, Page, Key,
		UseFocusRegistryEntryResult, UseDescendantHasFocusResult,
		IsUseGlobalNavDisplayOptionsResultMatch
	}), (ReactFocusNavigationModule.useEventMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval)
		return {
			[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
			[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
			[Enum.KeyCode.ButtonR1] = FocusNavigationEventNameEnum.TabForward,
			[Enum.KeyCode.ButtonL1] = FocusNavigationEventNameEnum.TabBackward,
			[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.Search
		}
	end, {}), UseResult))))
end

return useRootFocusNavigationBindings