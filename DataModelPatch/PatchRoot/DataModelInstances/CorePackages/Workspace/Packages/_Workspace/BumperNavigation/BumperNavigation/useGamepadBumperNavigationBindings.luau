local Parent = script:FindFirstAncestor("BumperNavigation").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local Selectors = require(Parent.NavigationRodux).Selectors
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactAnalytics = require(Parent.RoactServiceTags).RoactAnalytics
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local Input = ResponsiveModule.Input
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local AppNavBarModule = require(Parent.AppNavBar)
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local Placement = AppNavBarModule.Placement

local function selectTopLevelRouteName(p1)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	local SelectLegacyHistoryResult = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history
	local SelectLegacyHistoryResultEntry = SelectLegacyHistoryResult[#SelectLegacyHistoryResult][1]
	
	return SelectLegacyHistoryResultEntry and SelectLegacyHistoryResultEntry.name or "None"
end

local function getNextTabFromRouteName(Name, List)
	local Entry = nil
	for i, value in List do
		if value.page == Name then
			local NewI = i + 1
			
			if #List < NewI then
				NewI = 1
			end
			Entry = List[NewI]
			
			if Entry ~= nil then
				return Entry.page
			end
		end
	end
	return nil
end

local function getPrevTabFromRouteName(Name, List)
	local Entry = nil
	for i, value in List do
		if value.page == Name then
			local IDelta = i - 1
			
			if IDelta < 1 then
				IDelta = #List
			end
			Entry = List[IDelta]
			
			if Entry ~= nil then
				return Entry.page
			end
		end
	end
	return nil
end

local function buttonClick(EventStream, GamepadBumperNavBindingName, Btn, Key)
	assert(type(GamepadBumperNavBindingName) == "string", "Expected eventContext to be a string")
	assert(type(Btn) == "string", "Expected buttonName to be a string")
	local config = { btn = Btn }
	
	if Key ~= nil then
		assert(type(Key) == "string", "Expected extraData to be a string")
		config.cstm = Key
	end
	EventStream:setRBXEventStream(GamepadBumperNavBindingName, "buttonClick", config)
end

local function _(p1): string
	return `GamepadBumperNavBinding{p1}`
end

local GamepadBumperNavBindingName: string = `GamepadBumperNavBinding{FocusNavigationEventNameEnum.TabForward}`
local GamepadBumperNavBindingName1: string = `GamepadBumperNavBinding{FocusNavigationEventNameEnum.TabBackward}`
local t = {}

function useGamepadBumperNavigationBindings(p1)
	-- upvalues: UseNavigationFunction (copy), UseRoactServiceFunction (copy), RoactAnalytics (copy), FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), selectTopLevelRouteName (copy), getPrevTabFromRouteName (copy), getNextTabFromRouteName (copy), UsePreferredInputFunction (copy), Input (copy), UseNavBarPlacementFunction (copy), Placement (copy), UseIsSpatialFunction (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), buttonClick (copy), GamepadBumperNavBindingName (copy), GamepadBumperNavBindingName1 (copy), t (copy)
	local UseNavigationResult = UseNavigationFunction()
	local Key = UseNavigationResult.state.key or UseNavigationResult.state.routes[UseNavigationResult.state.index].key
	local EventStream = UseRoactServiceFunction(RoactAnalytics).EventStream
	local Name = nil
	
	if FFlagSignalsNavP3hMisc then
		local UseSignalStateResultEntry = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)[1]
		Name = UseSignalStateResultEntry and UseSignalStateResultEntry.name or "None"
	else
		Name = UseSelectorFunction(selectTopLevelRouteName)
	end
	local PrevTabFromRouteName = getPrevTabFromRouteName(Name, p1)
	local NextTabFromRouteName = getNextTabFromRouteName(Name, p1)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.TabBarVisible
	end)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == Input.Directional
	local IsUseNavBarPlacementResultMatch = UseNavBarPlacementFunction() == Placement.Left
	local UseIsSpatialResult = UseIsSpatialFunction()
	local NoUseIsSpatialResult: boolean = UseSelectorResult and (IsUsePreferredInputResultMatch and (IsUseNavBarPlacementResultMatch and not UseIsSpatialResult))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval)
		return {
			[Enum.KeyCode.ButtonR1] = FocusNavigationEventNameEnum.TabForward,
			[Enum.KeyCode.ButtonL1] = FocusNavigationEventNameEnum.TabBackward
		}
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), NextTabFromRouteName (copy), UseNavigationResult (copy), buttonClick (upval), EventStream (copy), GamepadBumperNavBindingName (upval), Key (copy), PrevTabFromRouteName (copy), GamepadBumperNavBindingName1 (upval)
		return {
			[FocusNavigationEventNameEnum.TabForward] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: NextTabFromRouteName (upval), UseNavigationResult (upval), buttonClick (upval), EventStream (upval), GamepadBumperNavBindingName (upval), Key (upval)
					if NextTabFromRouteName then
						UseNavigationResult.navigate(NextTabFromRouteName)
						buttonClick(EventStream, GamepadBumperNavBindingName, NextTabFromRouteName, Key)
					end
				end)
			},
			[FocusNavigationEventNameEnum.TabBackward] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: PrevTabFromRouteName (upval), UseNavigationResult (upval), buttonClick (upval), EventStream (upval), GamepadBumperNavBindingName1 (upval), Key (upval)
					if PrevTabFromRouteName then
						UseNavigationResult.navigate(PrevTabFromRouteName)
						buttonClick(EventStream, GamepadBumperNavBindingName1, PrevTabFromRouteName, Key)
					end
				end)
			}
		}
	end, {
		UseNavigationResult,
		EventStream,
		NextTabFromRouteName,
		PrevTabFromRouteName,
		Key
	})
	
	return {
		isBumperNavigationEnabled = NoUseIsSpatialResult,
		eventMap = if NoUseIsSpatialResult then UseMemoResult else t,
		eventHandlerMap = if NoUseIsSpatialResult then UseMemoResult1 else t
	}
end

return useGamepadBumperNavigationBindings