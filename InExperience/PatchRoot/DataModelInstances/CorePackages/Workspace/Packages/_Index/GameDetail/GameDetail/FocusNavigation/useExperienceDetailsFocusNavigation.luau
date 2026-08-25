local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiFocusTags = sduiSharedUtilitiesModule.SduiFocusTags
local useInitialFocusOnTag = sduiSharedUtilitiesModule.useInitialFocusOnTag
local useSelectionOrderTracking = sduiSharedUtilitiesModule.useSelectionOrderTracking
local usePageButtonBindings = sduiSharedUtilitiesModule.usePageButtonBindings
local useOnNavigateBack = sduiSharedUtilitiesModule.useOnNavigateBack
local getSduiFocusActivationStore = sduiSharedUtilitiesModule.getSduiFocusActivationStore
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local collectionService = game:GetService("CollectionService")
local t = {
	[Enum.KeyCode.ButtonX] = focusNavigationEventNameEnum.Play,
	[Enum.KeyCode.ButtonY] = focusNavigationEventNameEnum.DisplayStatsAndInfo,
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

local function findTaggedDescendant(p0, p1)
	-- upvalues: collectionService (ref)
	local current = p1.current
	
	if not current then
		return nil
	end
	for i, v in collectionService:GetTagged(p0) do
		if v:IsDescendantOf(current) then
			return v
		end
	end
	return nil
end

return function(p2)
	-- upvalues: reactModule (ref), useInitialFocusOnTag (ref), sduiFocusTags (ref), useSelectionOrderTracking (ref), reactFocusNavigationModule (ref), getSduiFocusActivationStore (ref), findTaggedDescendant (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), usePageButtonBindings (ref), t (ref), useOnNavigateBack (ref)
	local var8 = reactModule.useRef(nil)
	useInitialFocusOnTag(sduiFocusTags.PrimaryAction, var8)
	useSelectionOrderTracking(var8)
	local var9 = reactFocusNavigationModule.useFocusGuiObject()
	local var10 = reactModule.useCallback(function()
		-- upvalues: getSduiFocusActivationStore (copy), sduiFocusTags (copy)
		getSduiFocusActivationStore().activate(sduiFocusTags.PrimaryAction)
	end, {})
	local var11 = reactModule.useCallback(function()
		-- upvalues: findTaggedDescendant (copy), sduiFocusTags (copy), var8 (ref), var9 (ref)
		local var13 = findTaggedDescendant(sduiFocusTags.StatsSection, var8)
		
		if var13 then
			var9(var13)
		end
	end, { var9, var8 })
	local var12 = useOnNavigateBack(p2, usePageButtonBindings(var8, t, reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var10 (ref), var11 (ref)
		return {
			[focusNavigationEventNameEnum.Play] = { handler = inputHandlersModule.onRelease(var10) },
			[focusNavigationEventNameEnum.DisplayStatsAndInfo] = { handler = inputHandlersModule.onRelease(var11) }
		}
	end, { var10, var11 })))
	
	return reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref), var12 (ref)
		var8.current = p3
		
		if type(var12) == "function" then
			var12(p3)
			
			return
		elseif var12 ~= nil then
			var12.current = p3
		end
	end, { var12 })
end