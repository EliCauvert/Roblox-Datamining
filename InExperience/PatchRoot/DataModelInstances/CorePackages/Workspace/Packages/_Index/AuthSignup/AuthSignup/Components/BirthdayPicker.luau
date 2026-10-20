local Parent = script:FindFirstAncestor("AuthSignup").Parent
local LocalizationService = game:GetService("LocalizationService")
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local FitChildren = require(Parent.AuthCommon).Components.FitChildren
local ArgCheckModule = require(Parent.ArgCheck)
local TimeUnit = require(Parent.Time).TimeUnit
local _DateTime = require(Parent.Time).DateTime
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local ScrollingPicker = require(Parent.AuthCommon).Components.ScrollingPicker
local DateHelper = require(Parent.Time).DateHelper
local GetFFlagSignUpBirthdayRefactorNestedDefinitionFunction = require(Parent.SharedFlags).GetFFlagSignUpBirthdayRefactorNestedDefinition
local GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction = require(Parent.SharedFlags).GetFFlagSignUpBirthdayPickerRequireManualSelection
local List = {}

for i = 1, 31 do
	table.insert(List, i)
end
local config = {
	[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.Confirm,
	[Enum.KeyCode.Return] = FocusNavigationEventNameEnum.Confirm
}
local ReasonDateInvalid = DateHelper.ReasonDateInvalid
local MonthsLocalizationKeys = DateHelper.MonthsLocalizationKeys
local DateTypeOrder = DateHelper.DateTypeOrder

local function renderWheelContainer(p1, ShouldExpandTapTarget, FocusNavigationRef)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, 200),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = not ShouldExpandTapTarget,
		[RoactModule.Ref] = FocusNavigationRef
	}, p1)
end

local function _(p1, p2, p3)
	-- upvalues: CryoModule (copy)
	return if p2 then CryoModule.List.join({ p3 }, p1) else p1
end

local BirthdayPicker = RoactModule.PureComponent:extend("BirthdayPicker")
BirthdayPicker.defaultProps = {
	minAgeAllowed = 0,
	maxAgeAllowed = 99,
	NextSelectionUp = nil,
	NextSelectionDown = nil,
	skipUpdateOnMount = false,
	shouldExpandTapTarget = false,
	tapTargetExpansionSize = 0,
	requireManualSelection = false,
	placeholderTextMonth = "----",
	placeholderTextDay = "--",
	placeholderTextYear = "----"
}

local function useFocusNavigationBindings(p1)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval)
		return {
			[FocusNavigationEventNameEnum.Confirm] = {
				handler = InputHandlersModule.onRelease(function() end)
			}
		}
	end, {}), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

function BirthdayPicker.init(p1)
	-- upvalues: _DateTime (copy), TimeUnit (copy), ArgCheckModule (copy), GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction (copy), RoactModule (copy), WithStyleFunction (copy), GetFFlagSignUpBirthdayRefactorNestedDefinitionFunction (copy), renderWheelContainer (copy)
	p1.isMounted = false
	local Values = _DateTime.now():GetValues()
	p1.currentDate = {
		[TimeUnit.Months] = ArgCheckModule.isNonNegativeNumber(Values.Month, "current month in BirthdayPicker"),
		[TimeUnit.Days] = ArgCheckModule.isNonNegativeNumber(Values.Day, "current day in BirthdayPicker"),
		[TimeUnit.Years] = ArgCheckModule.isNonNegativeNumber(Values.Year, "current year in BirthdayPicker")
	}
	local CurrentDateEntry = p1.currentDate[TimeUnit.Years]
	local MinValue = CurrentDateEntry - p1.props.maxAgeAllowed
	local MaxValue = CurrentDateEntry - p1.props.minAgeAllowed
	local FFlagSignUpBirthdayPickerRequireManualSelection = p1.props.requireManualSelection and GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction()
	p1.dummyYears = {}
	
	if FFlagSignUpBirthdayPickerRequireManualSelection then
		for i = MaxValue, MinValue, -1 do
			table.insert(p1.dummyYears, i)
		end
	else
		for i1 = MinValue, MaxValue do
			table.insert(p1.dummyYears, i1)
		end
	end
	p1.minYear = MinValue
	p1.maxYear = MaxValue
	p1.placeholderOffset = if FFlagSignUpBirthdayPickerRequireManualSelection then 1 else 0
	local InitialMonth = p1.props.initialMonth
	local InitialDay = p1.props.initialDay
	local InitialYear: number = p1.props.initialYear
	local NoFFlagSignUpBirthdayPickerRequireManualSelection: boolean = not FFlagSignUpBirthdayPickerRequireManualSelection or InitialMonth ~= nil and (InitialDay ~= nil and InitialYear ~= nil)
	local v1: number = if FFlagSignUpBirthdayPickerRequireManualSelection then 2 else #p1.dummyYears + -1
	local NewPlaceholderOffset: number = if NoFFlagSignUpBirthdayPickerRequireManualSelection then 1 + p1.placeholderOffset else 1
	local NewPlaceholderOffset1: number = if NoFFlagSignUpBirthdayPickerRequireManualSelection then 1 + p1.placeholderOffset else 1
	local NewPlaceholderOffset2: number = if NoFFlagSignUpBirthdayPickerRequireManualSelection then v1 + p1.placeholderOffset else 1
	local NewInitialMonth = if InitialMonth then InitialMonth + p1.placeholderOffset else nil
	local NewInitialDay = if InitialDay then InitialDay + p1.placeholderOffset else nil
	local NewPlaceholderOffset3 = nil
	
	if InitialYear then
		local ClampedValue = math.clamp(InitialYear, MinValue, MaxValue)
		NewPlaceholderOffset3 = (if FFlagSignUpBirthdayPickerRequireManualSelection then MaxValue - ClampedValue + 1 else ClampedValue - MinValue + 1) + p1.placeholderOffset
	end
	p1.state = {
		selectedMonthIndex = NewInitialMonth or NewPlaceholderOffset,
		selectedDayIndex = NewInitialDay or NewPlaceholderOffset1,
		selectedYearIndex = NewPlaceholderOffset3 or NewPlaceholderOffset2,
		continueButtonEnabled = NoFFlagSignUpBirthdayPickerRequireManualSelection,
		hasUserPickedMonth = NoFFlagSignUpBirthdayPickerRequireManualSelection,
		hasUserPickedDay = NoFFlagSignUpBirthdayPickerRequireManualSelection,
		hasUserPickedYear = NoFFlagSignUpBirthdayPickerRequireManualSelection
	}
	p1.datePickerRef = RoactModule.createRef()
	p1.defaultRef = RoactModule.createRef()
	p1.shouldExpandTapTarget = p1.props.shouldExpandTapTarget
	p1.tapTargetExpansionSize = p1.props.tapTargetExpansionSize
	
	function p1.renderEntryTextfunction(FormattedDayString, Emphasized)
		-- upvalues: WithStyleFunction (upval), RoactModule (upval)
		return WithStyleFunction(function(p2)
			-- upvalues: Emphasized (copy), RoactModule (upval), FormattedDayString (copy)
			local BodyFont = p2.Font.Body.Font
			local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize
			local Color = p2.Theme.TextDefault.Color
			local Transparency = p2.Theme.TextDefault.Transparency
			
			if Emphasized == "Muted" then
				Color = p2.Theme.TextMuted.Color
				Transparency = p2.Theme.TextMuted.Transparency
			elseif Emphasized == "Emphasized" then
				BodyFont = p2.Font.Header1.Font
				ScaledBaseSize = p2.Font.BaseSize * p2.Font.Header1.RelativeSize
				Color = p2.Theme.TextEmphasis.Color
				Transparency = p2.Theme.TextEmphasis.Transparency
			end
			return RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Text = tostring(FormattedDayString),
				Font = BodyFont,
				TextSize = ScaledBaseSize,
				TextColor3 = Color,
				TextTransparency = Transparency
			})
		end)
	end
	
	function p1.renderWheelContainerFunction(p2)
		-- upvalues: RoactModule (upval), p1 (copy)
		return RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 200),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ClipsDescendants = not p1.shouldExpandTapTarget,
			[RoactModule.Ref] = p1.props.focusNavigationRef
		}, p2)
	end
	
	if GetFFlagSignUpBirthdayRefactorNestedDefinitionFunction() then
		function p1.renderWheelContainerFunction(p2)
			-- upvalues: renderWheelContainer (upval), p1 (copy)
			return renderWheelContainer(p2, p1.shouldExpandTapTarget, p1.props.focusNavigationRef)
		end
	end
	local function _(p2, p3)
		-- upvalues: p1 (copy)
		return function(StateEntry, p4)
			-- upvalues: p1 (upval), p2 (copy), p3 (copy)
			local IsStateEntryAbove: boolean = p4 and (not p1.state[p3] and StateEntry > p1.placeholderOffset)
			
			if p1.state[p2] ~= StateEntry or IsStateEntryAbove then
				spawn(function()
					-- upvalues: p1 (upval), p2 (upval), StateEntry (copy), p4 (copy), p3 (upval)
					if not p1.isMounted then return end
					local StateEntries = {}
					
					if p1.state[p2] ~= StateEntry then
						StateEntries[p2] = StateEntry
					end
					if p4 and not p1.state[p3] and p1.placeholderOffset < StateEntry then
						StateEntries[p3] = true
					end
					if next(StateEntries) ~= nil then
						p1:setState(StateEntries)
					end
				end)
				
				return
			end
		end
	end
	
	local v2 = "selectedMonthIndex"
	local v3 = "hasUserPickedMonth"
	
	function p1.onSelectedIndexChangedForMonth(StateEntry, p2)
		-- upvalues: p1 (copy), v2 (copy), v3 (copy)
		local IsStateEntryAbove: boolean = p2 and (not p1.state[v3] and StateEntry > p1.placeholderOffset)
		
		if p1.state[v2] ~= StateEntry or IsStateEntryAbove then
			spawn(function()
				-- upvalues: p1 (upval), v2 (upval), StateEntry (copy), p2 (copy), v3 (upval)
				if not p1.isMounted then return end
				local StateEntries = {}
				
				if p1.state[v2] ~= StateEntry then
					StateEntries[v2] = StateEntry
				end
				if p2 and not p1.state[v3] and p1.placeholderOffset < StateEntry then
					StateEntries[v3] = true
				end
				if next(StateEntries) ~= nil then
					p1:setState(StateEntries)
				end
			end)
			
			return
		end
	end
	
	local v4 = "selectedDayIndex"
	local v5 = "hasUserPickedDay"
	
	function p1.onSelectedIndexChangedForDay(StateEntry, p2)
		-- upvalues: p1 (copy), v4 (copy), v5 (copy)
		local IsStateEntryAbove: boolean = p2 and (not p1.state[v5] and StateEntry > p1.placeholderOffset)
		
		if p1.state[v4] ~= StateEntry or IsStateEntryAbove then
			spawn(function()
				-- upvalues: p1 (upval), v4 (upval), StateEntry (copy), p2 (copy), v5 (upval)
				if not p1.isMounted then return end
				local StateEntries = {}
				
				if p1.state[v4] ~= StateEntry then
					StateEntries[v4] = StateEntry
				end
				if p2 and not p1.state[v5] and p1.placeholderOffset < StateEntry then
					StateEntries[v5] = true
				end
				if next(StateEntries) ~= nil then
					p1:setState(StateEntries)
				end
			end)
			
			return
		end
	end
	
	local v6 = "selectedYearIndex"
	local v7 = "hasUserPickedYear"
	
	function p1.onSelectedIndexChangedForYear(StateEntry, p2)
		-- upvalues: p1 (copy), v6 (copy), v7 (copy)
		local IsStateEntryAbove: boolean = p2 and (not p1.state[v7] and StateEntry > p1.placeholderOffset)
		
		if p1.state[v6] ~= StateEntry or IsStateEntryAbove then
			spawn(function()
				-- upvalues: p1 (upval), v6 (upval), StateEntry (copy), p2 (copy), v7 (upval)
				if not p1.isMounted then return end
				local StateEntries = {}
				
				if p1.state[v6] ~= StateEntry then
					StateEntries[v6] = StateEntry
				end
				if p2 and not p1.state[v7] and p1.placeholderOffset < StateEntry then
					StateEntries[v7] = true
				end
				if next(StateEntries) ~= nil then
					p1:setState(StateEntries)
				end
			end)
			
			return
		end
	end
	
	function p1:onActivated()
		-- upvalues: p1 (copy)
		if p1.props.focusedGuiObject and p1.datePickerRef and p1.defaultRef.current then
			p1.props.focusGuiObject(p1.defaultRef.current, true)
		end
	end
	
	function p1.onEntryActivated()
		-- upvalues: p1 (copy)
		if p1.props.focusedGuiObject and p1.datePickerRef and p1.datePickerRef.current then
			p1.props.focusGuiObject(p1.datePickerRef.current, true)
		end
	end
end

function BirthdayPicker.getActualIndex(p2, p3, p4, Count)
	if p2.state[p3] then
		local StateEntryDelta = p2.state[p4] - p2.placeholderOffset
		
		return if StateEntryDelta < 1 or Count < StateEntryDelta then nil else StateEntryDelta
	else
		return nil
	end
end

function BirthdayPicker.getActualMonth(p2)
	-- upvalues: MonthsLocalizationKeys (copy)
	return p2:getActualIndex("hasUserPickedMonth", "selectedMonthIndex", #MonthsLocalizationKeys)
end

function BirthdayPicker.getActualDay(p2)
	-- upvalues: List (copy)
	return p2:getActualIndex("hasUserPickedDay", "selectedDayIndex", #List)
end

function BirthdayPicker.getActualYear(p2)
	local HasUserPickedYearActualIndex = p2:getActualIndex("hasUserPickedYear", "selectedYearIndex", #p2.dummyYears)
	
	return if HasUserPickedYearActualIndex then p2.dummyYears[HasUserPickedYearActualIndex] else nil
end

function BirthdayPicker.didMount(p2)
	local UpdateBirthdayFunction: (any, any, any) -> () = p2.props.updateBirthday
	
	if UpdateBirthdayFunction and not p2.props.skipUpdateOnMount then
		UpdateBirthdayFunction(p2:getActualMonth(), p2:getActualDay(), p2:getActualYear())
	end
	if p2.props.focusedGuiObject and p2.datePickerRef and p2.datePickerRef.current then
		p2.props.focusGuiObject(p2.datePickerRef.current, true)
	end
	p2.isMounted = true
end

function BirthdayPicker.willUnmount(p2)
	p2.isMounted = false
end

function BirthdayPicker.updatePickerState(p2)
	-- upvalues: DateHelper (copy), ReasonDateInvalid (copy)
	local ActualMonth = p2:getActualMonth()
	local ActualDay = p2:getActualDay()
	local ActualYear = p2:getActualYear()
	local HasActualYear: boolean = ActualMonth ~= nil and (ActualDay ~= nil and ActualYear ~= nil)
	local Flag = false
	local NewLastDayOfTheMonthInYear = nil
	local v8 = false
	
	if HasActualYear then
		local IsValidDate2
		v8, IsValidDate2 = DateHelper:isValidDate(ActualMonth, ActualDay, ActualYear)
		
		if not v8 and IsValidDate2 == ReasonDateInvalid.IsInvalidDayOfMonth then
			Flag = true
			NewLastDayOfTheMonthInYear = DateHelper:getLastDayOfTheMonthInYear(ActualMonth, ActualYear) + p2.placeholderOffset
		end
	end
	spawn(function()
		-- upvalues: p2 (copy), Flag (ref), NewLastDayOfTheMonthInYear (ref), HasActualYear (copy), v8 (ref)
		if p2.isMounted then
			p2:setState({
				selectedDayIndex = Flag and NewLastDayOfTheMonthInYear or nil,
				continueButtonEnabled = HasActualYear and v8
			})
		end
	end)
end

function BirthdayPicker.didUpdate(p2)
	-- upvalues: DateHelper (copy), ReasonDateInvalid (copy)
	local UpdateBirthdayFunction: (any, any, any) -> () = p2.props.updateBirthday
	local ActualMonth = p2:getActualMonth()
	local ActualDay = p2:getActualDay()
	local ActualYear = p2:getActualYear()
	local ContinueButtonEnabled = p2.state.continueButtonEnabled
	local ContinueButtonEnabled1 = false
	local IsInvalidDayOfMonth = nil
	
	if ActualMonth ~= nil and (ActualDay ~= nil and ActualYear ~= nil) then
		ContinueButtonEnabled1, IsInvalidDayOfMonth = DateHelper:isValidDate(ActualMonth, ActualDay, ActualYear)
	end
	local IsIsInvalidDayOfMonthMatch: boolean = not ContinueButtonEnabled1 and IsInvalidDayOfMonth == ReasonDateInvalid.IsInvalidDayOfMonth
	
	if ContinueButtonEnabled1 ~= ContinueButtonEnabled or IsIsInvalidDayOfMonthMatch then
		p2:updatePickerState()
	end
	if UpdateBirthdayFunction then
		UpdateBirthdayFunction(ActualMonth, ActualDay, ActualYear)
	end
end

function BirthdayPicker.render(p2)
	-- upvalues: LocalizationService (copy), DateTypeOrder (copy), GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction (copy), MonthsLocalizationKeys (copy), CryoModule (copy), List (copy), WithStyleFunction (copy), WithLocalizationFunction (copy), RoactModule (copy), FitChildren (copy), ScrollingPicker (copy), TimeUnit (copy), DateHelper (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local DateTypeOrderEntry = DateTypeOrder[RobloxLocaleId]
	local NoShouldExpandTapTarget: boolean = not p2.shouldExpandTapTarget or p2.tapTargetExpansionSize <= 0
	local LayoutOrder = p2.props.layoutOrder
	local FFlagSignUpBirthdayPickerRequireManualSelection = p2.props.requireManualSelection and GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction()
	local PlaceholderTextMonth = p2.props.placeholderTextMonth
	local PlaceholderTextDay = p2.props.placeholderTextDay
	local PlaceholderTextYear = p2.props.placeholderTextYear
	local JoinResult = if FFlagSignUpBirthdayPickerRequireManualSelection then CryoModule.List.join({ PlaceholderTextMonth }, MonthsLocalizationKeys) else MonthsLocalizationKeys
	local JoinResult1 = if FFlagSignUpBirthdayPickerRequireManualSelection then CryoModule.List.join({ PlaceholderTextDay }, List) else List
	local DummyYears = p2.dummyYears
	local JoinResult2 = if FFlagSignUpBirthdayPickerRequireManualSelection then CryoModule.List.join({ PlaceholderTextYear }, DummyYears) else DummyYears
	local SelectedMonthIndex = p2.state.selectedMonthIndex
	local SelectedDayIndex = p2.state.selectedDayIndex
	local SelectedYearIndex = p2.state.selectedYearIndex
	local MinTargetIndex: number = if FFlagSignUpBirthdayPickerRequireManualSelection and p2.state.hasUserPickedMonth then 2 else 1
	local MinTargetIndex1: number = if FFlagSignUpBirthdayPickerRequireManualSelection and p2.state.hasUserPickedDay then 2 else 1
	local MinTargetIndex2: number = if FFlagSignUpBirthdayPickerRequireManualSelection and p2.state.hasUserPickedYear then 2 else 1
	local ActualMonth = p2:getActualMonth()
	local ActualYear = p2:getActualYear()
	local HasUserPickedMonth = p2.state.hasUserPickedMonth
	local HasUserPickedDay = p2.state.hasUserPickedDay
	local HasUserPickedYear = p2.state.hasUserPickedYear
	
	return WithStyleFunction(function(_)
		-- upvalues: WithLocalizationFunction (upval), RoactModule (upval), FitChildren (upval), LayoutOrder (copy), p2 (copy), NoShouldExpandTapTarget (copy), ScrollingPicker (upval), DateTypeOrderEntry (copy), TimeUnit (upval), PlaceholderTextMonth (copy), HasUserPickedMonth (copy), WithStyleFunction (upval), JoinResult (copy), SelectedMonthIndex (copy), MinTargetIndex (copy), HasUserPickedDay (copy), PlaceholderTextDay (copy), DateHelper (upval), JoinResult1 (copy), SelectedDayIndex (copy), RobloxLocaleId (copy), ActualMonth (copy), ActualYear (copy), MinTargetIndex1 (copy), HasUserPickedYear (copy), PlaceholderTextYear (copy), JoinResult2 (copy), SelectedYearIndex (copy), MinTargetIndex2 (copy)
		return WithLocalizationFunction({ continueText = "Authentication.SignUp.Label.Continue" })(function(_)
			-- upvalues: RoactModule (upval), FitChildren (upval), LayoutOrder (upval), p2 (upval), NoShouldExpandTapTarget (upval), ScrollingPicker (upval), DateTypeOrderEntry (upval), TimeUnit (upval), PlaceholderTextMonth (upval), HasUserPickedMonth (upval), WithStyleFunction (upval), WithLocalizationFunction (upval), JoinResult (upval), SelectedMonthIndex (upval), MinTargetIndex (upval), HasUserPickedDay (upval), PlaceholderTextDay (upval), DateHelper (upval), JoinResult1 (upval), SelectedDayIndex (upval), RobloxLocaleId (upval), ActualMonth (upval), ActualYear (upval), MinTargetIndex1 (upval), HasUserPickedYear (upval), PlaceholderTextYear (upval), JoinResult2 (upval), SelectedYearIndex (upval), MinTargetIndex2 (upval)
			return RoactModule.createElement(FitChildren.FitFrame, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildren.FitAxis.Height
			}, {
				ListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 14)
				}),
				DatePickerWrap = RoactModule.createElement(FitChildren.FitFrame, {
					LayoutOrder = 1,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildren.FitAxis.Height
				}, {
					CenterFrame = RoactModule.createElement("ImageLabel", {
						Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/DatePickerDivider.png",
						BackgroundTransparency = 1,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 0, 50),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(2, 2, 4, 4),
						Position = UDim2.new(0, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5)
					}),
					DatePicker = RoactModule.createElement(FitChildren.FitTextButton, {
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildren.FitAxis.Height,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						Selectable = true,
						NextSelectionUp = p2.props.NextSelectionUp,
						NextSelectionDown = p2.props.NextSelectionDown,
						NextSelectionLeft = p2.datePickerRef.current,
						NextSelectionRight = p2.datePickerRef.current,
						Text = "",
						[RoactModule.Ref] = p2.datePickerRef,
						[RoactModule.Event.Activated] = p2.onActivated
					}, {
						ListLayout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						WheelContainer = p2.renderWheelContainerFunction({
							ListLayout = RoactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Horizontal,
								SortOrder = Enum.SortOrder.LayoutOrder,
								VerticalAlignment = if NoShouldExpandTapTarget then Enum.VerticalAlignment.Center else nil
							}),
							Padding = RoactModule.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, 5),
								PaddingRight = UDim.new(0, 5),
								PaddingTop = UDim.new(0, 5),
								PaddingBottom = UDim.new(0, 5)
							}),
							MonthWheel = RoactModule.createElement(ScrollingPicker, {
								entrySizeOnScrollingAxis = 50,
								layoutOrder = DateTypeOrderEntry[TimeUnit.Months],
								size = UDim2.new(0.45, 0, 0, 200),
								renderEntry = function(MonthText)
									-- upvalues: PlaceholderTextMonth (upval), HasUserPickedMonth (upval), p2 (upval), WithStyleFunction (upval), WithLocalizationFunction (upval), JoinResult (upval), SelectedMonthIndex (upval)
									return if MonthText == PlaceholderTextMonth then if HasUserPickedMonth then p2.renderEntryTextfunction("", "Default") else p2.renderEntryTextfunction(PlaceholderTextMonth, "Muted") else WithStyleFunction(function(_)
										-- upvalues: WithLocalizationFunction (upval), MonthText (copy), JoinResult (upval), SelectedMonthIndex (upval), HasUserPickedMonth (upval), p2 (upval)
										return WithLocalizationFunction({ monthText = MonthText })(function(p3)
											-- upvalues: JoinResult (upval), SelectedMonthIndex (upval), MonthText (upval), HasUserPickedMonth (upval), p2 (upval)
											return p2.renderEntryTextfunction(p3.monthText, if MonthText == JoinResult[SelectedMonthIndex] and HasUserPickedMonth then "Emphasized" else "Default")
										end)
									end)
								end,
								getEntryWrapperProps = function(p3)
									-- upvalues: JoinResult (upval), SelectedMonthIndex (upval), RoactModule (upval), p2 (upval)
									return {
										[RoactModule.Ref] = if p3 == JoinResult[SelectedMonthIndex] then p2.defaultRef else nil
									}
								end,
								entries = JoinResult,
								onSelectedIndexChanged = p2.onSelectedIndexChangedForMonth,
								parentSpecifiedTarget = SelectedMonthIndex,
								minTargetIndex = MinTargetIndex,
								onEntryActivated = p2.onEntryActivated,
								shouldExpandTapTarget = p2.shouldExpandTapTarget,
								tapTargetExpansionSize = p2.tapTargetExpansionSize
							}),
							DayWheel = RoactModule.createElement(ScrollingPicker, {
								entrySizeOnScrollingAxis = 50,
								layoutOrder = DateTypeOrderEntry[TimeUnit.Days],
								size = UDim2.new(0.2, 0, 0, 200),
								renderEntry = function(p3)
									-- upvalues: HasUserPickedDay (upval), p2 (upval), PlaceholderTextDay (upval), WithLocalizationFunction (upval), DateHelper (upval), JoinResult1 (upval), SelectedDayIndex (upval), RobloxLocaleId (upval), ActualMonth (upval), ActualYear (upval)
									return if type(p3) == "number" then WithLocalizationFunction({ dayAffix = DateHelper.DayAffixLocalizationKey })(function(p4)
										-- upvalues: JoinResult1 (upval), SelectedDayIndex (upval), p3 (copy), DateHelper (upval), RobloxLocaleId (upval), ActualMonth (upval), ActualYear (upval), HasUserPickedDay (upval), p2 (upval)
										local IsJoinResultEntryMatch = p3 == JoinResult1[SelectedDayIndex]
										
										return p2.renderEntryTextfunction(DateHelper:GetFormattedDayString(p3, p4.dayAffix, RobloxLocaleId), if ActualMonth and ActualYear and DateHelper:isInvalidDayOfTheMonth(ActualMonth, p3, ActualYear) then "Muted" elseif IsJoinResultEntryMatch and HasUserPickedDay then "Emphasized" else "Default")
									end) elseif HasUserPickedDay then p2.renderEntryTextfunction("", "Default") else p2.renderEntryTextfunction(PlaceholderTextDay, "Muted")
								end,
								entries = JoinResult1,
								onSelectedIndexChanged = p2.onSelectedIndexChangedForDay,
								parentSpecifiedTarget = SelectedDayIndex,
								minTargetIndex = MinTargetIndex1,
								onEntryActivated = p2.onEntryActivated,
								shouldExpandTapTarget = p2.shouldExpandTapTarget,
								tapTargetExpansionSize = p2.tapTargetExpansionSize
							}),
							YearWheel = RoactModule.createElement(ScrollingPicker, {
								entrySizeOnScrollingAxis = 50,
								layoutOrder = DateTypeOrderEntry[TimeUnit.Years],
								size = UDim2.new(0.35, 0, 0, 200),
								renderEntry = function(p3)
									-- upvalues: HasUserPickedYear (upval), p2 (upval), PlaceholderTextYear (upval), WithLocalizationFunction (upval), DateHelper (upval), JoinResult2 (upval), SelectedYearIndex (upval), RobloxLocaleId (upval)
									return if type(p3) == "number" then WithLocalizationFunction({ yearAffix = DateHelper.YearAffixLocalizationKey })(function(p4)
										-- upvalues: JoinResult2 (upval), SelectedYearIndex (upval), p3 (copy), DateHelper (upval), RobloxLocaleId (upval), HasUserPickedYear (upval), p2 (upval)
										return p2.renderEntryTextfunction(DateHelper:GetFormattedYearString(p3, p4.yearAffix, RobloxLocaleId), if p3 == JoinResult2[SelectedYearIndex] and HasUserPickedYear then "Emphasized" else "Default")
									end) elseif HasUserPickedYear then p2.renderEntryTextfunction("", "Default") else p2.renderEntryTextfunction(PlaceholderTextYear, "Muted")
								end,
								entries = JoinResult2,
								onSelectedIndexChanged = p2.onSelectedIndexChangedForYear,
								parentSpecifiedTarget = SelectedYearIndex,
								minTargetIndex = MinTargetIndex2,
								onEntryActivated = p2.onEntryActivated,
								shouldExpandTapTarget = p2.shouldExpandTapTarget,
								tapTargetExpansionSize = p2.tapTargetExpansionSize
							})
						})
					})
				})
			})
		end)
	end)
end

return function(p2)
	-- upvalues: ReactFocusNavigationModule (copy), useFocusNavigationBindings (copy), RoactModule (copy), BirthdayPicker (copy), CryoModule (copy)
	return RoactModule.createElement(BirthdayPicker, CryoModule.Dictionary.join(p2, {
		focusedGuiObject = ReactFocusNavigationModule.useFocusedGuiObject(),
		focusGuiObject = ReactFocusNavigationModule.useFocusGuiObject(),
		focusNavigationRef = useFocusNavigationBindings(nil)
	}))
end