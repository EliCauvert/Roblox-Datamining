local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiFocusTags = SduiSharedUtilitiesModule.SduiFocusTags
local UseInitialFocusOnTagFunction = SduiSharedUtilitiesModule.useInitialFocusOnTag
local UseSelectionOrderTrackingFunction = SduiSharedUtilitiesModule.useSelectionOrderTracking
local UsePageButtonBindingsFunction = SduiSharedUtilitiesModule.usePageButtonBindings
local UseOnNavigateBackFunction = SduiSharedUtilitiesModule.useOnNavigateBack
local GetSduiFocusActivationStoreFunction = SduiSharedUtilitiesModule.getSduiFocusActivationStore
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local FFlagLuaAppMediaGalleryGamepadSupport = require(Parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport
local CollectionService = game:GetService("CollectionService")
local config = {
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.Play,
	[Enum.KeyCode.ButtonY] = if FFlagLuaAppMediaGalleryGamepadSupport then nil else FocusNavigationEventNameEnum.DisplayStatsAndInfo,
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function findTaggedDescendant(Tag, UseRefResult)
	-- upvalues: CollectionService (copy)
	local Current = UseRefResult.current
	
	if not Current then
		return nil
	end
	for _, value in CollectionService:GetTagged(Tag) do
		if value:IsDescendantOf(Current) then
			return value
		end
	end
	return nil
end

return function(p1)
	-- upvalues: ReactModule (copy), UseInitialFocusOnTagFunction (copy), SduiFocusTags (copy), UseSelectionOrderTrackingFunction (copy), ReactFocusNavigationModule (copy), GetSduiFocusActivationStoreFunction (copy), findTaggedDescendant (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), UsePageButtonBindingsFunction (copy), config (copy), UseOnNavigateBackFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	UseInitialFocusOnTagFunction(SduiFocusTags.PrimaryAction, UseRefResult)
	UseSelectionOrderTrackingFunction(UseRefResult)
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetSduiFocusActivationStoreFunction (upval), SduiFocusTags (upval)
		GetSduiFocusActivationStoreFunction().activate(SduiFocusTags.PrimaryAction)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: findTaggedDescendant (upval), SduiFocusTags (upval), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		local TaggedDescendant = findTaggedDescendant(SduiFocusTags.StatsSection, UseRefResult)
		
		if TaggedDescendant then
			UseFocusGuiObjectResult(TaggedDescendant)
		end
	end, { UseFocusGuiObjectResult, UseRefResult })
	local UseOnNavigateBackResult = UseOnNavigateBackFunction(p1, (UsePageButtonBindingsFunction(UseRefResult, config, (ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy), FFlagLuaAppMediaGalleryGamepadSupport (upval), UseResult1 (copy)
		return {
			[FocusNavigationEventNameEnum.Play] = { handler = InputHandlersModule.onRelease(UseResult) },
			[FocusNavigationEventNameEnum.DisplayStatsAndInfo] = if FFlagLuaAppMediaGalleryGamepadSupport then nil else { handler = InputHandlersModule.onRelease(UseResult1) }
		}
	end, { UseResult, UseResult1 })))))
	
	return (ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseOnNavigateBackResult (copy)
		UseRefResult.current = Current
		
		if type(UseOnNavigateBackResult) == "function" then
			UseOnNavigateBackResult(Current)
			
			return
		end
		if UseOnNavigateBackResult ~= nil then
			UseOnNavigateBackResult.current = Current
		end
	end, { UseOnNavigateBackResult }))
end