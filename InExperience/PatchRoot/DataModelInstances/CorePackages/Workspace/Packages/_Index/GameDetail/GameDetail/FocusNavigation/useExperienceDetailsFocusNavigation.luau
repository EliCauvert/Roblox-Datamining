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
local fFlagLuaAppMediaGalleryGamepadSupport = require(parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport
local collectionService = game:GetService("CollectionService")
local t = {
	[Enum.KeyCode.ButtonX] = focusNavigationEventNameEnum.Play,
	[Enum.KeyCode.ButtonY] = if fFlagLuaAppMediaGalleryGamepadSupport then nil else focusNavigationEventNameEnum.DisplayStatsAndInfo,
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

local function findTaggedDescendant(p1, p2)
	-- upvalues: collectionService (ref)
	local current = p2.current
	
	if not current then
		return nil
	end
	for i, v in collectionService:GetTagged(p1) do
		if v:IsDescendantOf(current) then
			return v
		end
	end
	return nil
end

return function(p3)
	-- upvalues: reactModule (ref), useInitialFocusOnTag (ref), sduiFocusTags (ref), useSelectionOrderTracking (ref), reactFocusNavigationModule (ref), getSduiFocusActivationStore (ref), findTaggedDescendant (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), usePageButtonBindings (ref), t (ref), useOnNavigateBack (ref)
	local var1 = reactModule.useRef(nil)
	useInitialFocusOnTag(sduiFocusTags.PrimaryAction, var1)
	useSelectionOrderTracking(var1)
	local var2 = reactFocusNavigationModule.useFocusGuiObject()
	local var3 = reactModule.useCallback(function()
		-- upvalues: getSduiFocusActivationStore (copy), sduiFocusTags (copy)
		getSduiFocusActivationStore().activate(sduiFocusTags.PrimaryAction)
	end, {})
	local var4 = reactModule.useCallback(function()
		-- upvalues: findTaggedDescendant (copy), sduiFocusTags (copy), var1 (ref), var2 (ref)
		local var5 = findTaggedDescendant(sduiFocusTags.StatsSection, var1)
		
		if var5 then
			var2(var5)
		end
	end, { var2, var1 })
	local var5 = useOnNavigateBack(p3, usePageButtonBindings(var1, t, reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var3 (ref), fFlagLuaAppMediaGalleryGamepadSupport (copy), var4 (ref)
		return {
			[focusNavigationEventNameEnum.Play] = { handler = inputHandlersModule.onRelease(var3) },
			[focusNavigationEventNameEnum.DisplayStatsAndInfo] = if fFlagLuaAppMediaGalleryGamepadSupport then nil else { handler = inputHandlersModule.onRelease(var4) }
		}
	end, { var3, var4 })))
	
	return reactModule.useCallback(function(p4)
		-- upvalues: var1 (ref), var5 (ref)
		var1.current = p4
		
		if type(var5) == "function" then
			var5(p4)
			
			return
		elseif var5 ~= nil then
			var5.current = p4
		end
	end, { var5 })
end