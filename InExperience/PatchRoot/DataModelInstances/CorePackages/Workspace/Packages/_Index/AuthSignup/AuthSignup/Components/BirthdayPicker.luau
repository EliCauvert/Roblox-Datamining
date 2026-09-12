local parent = script:FindFirstAncestor("AuthSignup").Parent
local localizationService = game:GetService("LocalizationService")
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local fitChildren = require(parent.AuthCommon).Components.FitChildren
local argCheckModule = require(parent.ArgCheck)
local timeUnit = require(parent.Time).TimeUnit
local dateTime = require(parent.Time).DateTime
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local withStyle = require(parent.UIBlox).Style.withStyle
local withLocalization = require(parent.Localization).withLocalization
local scrollingPicker = require(parent.AuthCommon).Components.ScrollingPicker
local dateHelper = require(parent.Time).DateHelper
local getFFlagSignUpBirthdayRefactorNestedDefinition = require(parent.SharedFlags).GetFFlagSignUpBirthdayRefactorNestedDefinition
local getFFlagSignUpBirthdayPickerRequireManualSelection = require(parent.SharedFlags).GetFFlagSignUpBirthdayPickerRequireManualSelection
local _ = {
	Default = "Default",
	Emphasized = "Emphasized",
	Muted = "Muted"
}
local t = {}

for i = 1, 31 do
	table.insert(t, i)
end
local t_1 = {
	[Enum.KeyCode.ButtonA] = focusNavigationEventNameEnum.Confirm,
	[Enum.KeyCode.Return] = focusNavigationEventNameEnum.Confirm
}
local reasonDateInvalid = dateHelper.ReasonDateInvalid
local monthsLocalizationKeys = dateHelper.MonthsLocalizationKeys
local dateTypeOrder = dateHelper.DateTypeOrder

local function renderWheelContainer(p1, p2, p3)
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", {
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, 200),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = not p2,
		[roactModule.Ref] = p3
	}, p1)
end

local function _(p1, p2, p3)
	-- upvalues: cryoModule (ref)
	return if p2 then cryoModule.List.join({ p3 }, p1) else p1
end

local birthdayPicker = roactModule.PureComponent:extend("BirthdayPicker")
birthdayPicker.defaultProps = {
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
	-- upvalues: reactFocusNavigationModule (ref), t_1 (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy)
		return {
			[focusNavigationEventNameEnum.Confirm] = {
				handler = inputHandlersModule.onRelease(function() end)
			}
		}
	end, {}), reactFocusNavigationModule.useEventMap(t_1, p1))
end

function birthdayPicker.init(p1)
	-- upvalues: dateTime (ref), timeUnit (ref), argCheckModule (ref), getFFlagSignUpBirthdayPickerRequireManualSelection (ref), roactModule (ref), withStyle (ref), getFFlagSignUpBirthdayRefactorNestedDefinition (ref), renderWheelContainer (ref)
	p1.isMounted = false
	local values = dateTime.now():GetValues()
	p1.currentDate = {
		[timeUnit.Months] = argCheckModule.isNonNegativeNumber(values.Month, "current month in BirthdayPicker"),
		[timeUnit.Days] = argCheckModule.isNonNegativeNumber(values.Day, "current day in BirthdayPicker"),
		[timeUnit.Years] = argCheckModule.isNonNegativeNumber(values.Year, "current year in BirthdayPicker")
	}
	local years = p1.currentDate[timeUnit.Years]
	local var1 = years - p1.props.maxAgeAllowed
	local var2 = years - p1.props.minAgeAllowed
	local var3 = p1.props.requireManualSelection and getFFlagSignUpBirthdayPickerRequireManualSelection()
	p1.dummyYears = {}
	
	if var3 then
		for i_1 = var2, var1, -1 do
			table.insert(p1.dummyYears, i_1)
		end
	else
		for i = var1, var2 do
			table.insert(p1.dummyYears, i)
		end
	end
	p1.minYear = var1
	p1.maxYear = var2
	p1.placeholderOffset = if var3 then 1 else 0
	local initialMonth = p1.props.initialMonth
	local initialDay = p1.props.initialDay
	local initialYear = p1.props.initialYear
	local var4 = not var3 or (initialMonth ~= nil and (initialDay ~= nil and initialYear ~= nil))
	local var5 = if var3 then 2 else #p1.dummyYears + -1
	local var6 = if var4 then 1 + p1.placeholderOffset else 1
	local var7 = if var4 then 1 + p1.placeholderOffset else 1
	local var8 = if var4 then var5 + p1.placeholderOffset else 1
	local var9 = if initialMonth then initialMonth + p1.placeholderOffset else nil
	local var10 = if initialDay then initialDay + p1.placeholderOffset else nil
	local var11 = nil
	
	if initialYear then
		local clampedValue = math.clamp(initialYear, var1, var2)
		var11 = (if var3 then var2 - clampedValue + 1 else clampedValue - var1 + 1) + p1.placeholderOffset
	end
	p1.state = {
		selectedMonthIndex = var9 or var6,
		selectedDayIndex = var10 or var7,
		selectedYearIndex = var11 or var8,
		continueButtonEnabled = var4,
		hasUserPickedMonth = var4,
		hasUserPickedDay = var4,
		hasUserPickedYear = var4
	}
	p1.datePickerRef = roactModule.createRef()
	p1.defaultRef = roactModule.createRef()
	p1.shouldExpandTapTarget = p1.props.shouldExpandTapTarget
	p1.tapTargetExpansionSize = p1.props.tapTargetExpansionSize
	
	function p7.renderEntryTextfunction(p2, p3)
		-- upvalues: withStyle (copy), roactModule (copy)
		return withStyle(function(p4)
			-- upvalues: p3 (ref), roactModule (copy), p2 (ref)
			local font = p4.Font.Body.Font
			local var12 = p4.Font.BaseSize * p4.Font.Body.RelativeSize
			local color = p4.Theme.TextDefault.Color
			local transparency = p4.Theme.TextDefault.Transparency
			
			if p3 == "Muted" then
				color = p4.Theme.TextMuted.Color
				transparency = p4.Theme.TextMuted.Transparency
			elseif p3 == "Emphasized" then
				font = p4.Font.Header1.Font
				var12 = p4.Font.BaseSize * p4.Font.Header1.RelativeSize
				color = p4.Theme.TextEmphasis.Color
				transparency = p4.Theme.TextEmphasis.Transparency
			end
			return roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Text = tostring(p2),
				Font = font,
				TextSize = var12,
				TextColor3 = color,
				TextTransparency = transparency
			})
		end)
	end
	
	function p7.renderWheelContainerFunction(p2)
		-- upvalues: roactModule (copy), p1 (ref)
		return roactModule.createElement("Frame", {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 200),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ClipsDescendants = not p1.shouldExpandTapTarget,
			[roactModule.Ref] = p1.props.focusNavigationRef
		}, p2)
	end
	
	if getFFlagSignUpBirthdayRefactorNestedDefinition() then
		function p7.renderWheelContainerFunction(p2)
			-- upvalues: renderWheelContainer (copy), p1 (ref)
			return renderWheelContainer(p2, p1.shouldExpandTapTarget, p1.props.focusNavigationRef)
		end
	end
	local function _(p2, p3)
		-- upvalues: p1 (ref)
		return function(p4, p5)
			-- upvalues: p1 (copy), p2 (ref), p3 (ref)
			if p1.state[p2] ~= p4 or p5 and (not p1.state[p3] and p1.placeholderOffset < p4) then
				spawn(function()
					-- upvalues: p1 (copy), p2 (copy), p4 (ref), p5 (ref), p3 (copy)
					if not p1.isMounted then return end
					local t = {}
					
					if p1.state[p2] ~= p4 then
						t[p2] = p4
					end
					if p5 and not p1.state[p3] and p1.placeholderOffset < p4 then
						t[p3] = true
					end
					if next(t) ~= nil then
						p1:setState(t)
					end
				end)
				
				return
			end
		end
	end
	
	local var12 = "selectedMonthIndex"
	local var13 = "hasUserPickedMonth"
	
	function p7.onSelectedIndexChangedForMonth(p2, p3)
		-- upvalues: p1 (ref), var12 (ref), var13 (ref)
		if p1.state[var12] ~= p2 or p3 and (not p1.state[var13] and p1.placeholderOffset < p2) then
			spawn(function()
				-- upvalues: p1 (copy), var12 (copy), p2 (ref), p3 (ref), var13 (copy)
				if not p1.isMounted then return end
				local t = {}
				
				if p1.state[var12] ~= p2 then
					t[var12] = p2
				end
				if p3 and not p1.state[var13] and p1.placeholderOffset < p2 then
					t[var13] = true
				end
				if next(t) ~= nil then
					p1:setState(t)
				end
			end)
			
			return
		end
	end
	
	local var14 = "selectedDayIndex"
	local var15 = "hasUserPickedDay"
	
	function p7.onSelectedIndexChangedForDay(p2, p3)
		-- upvalues: p1 (ref), var14 (ref), var15 (ref)
		if p1.state[var14] ~= p2 or p3 and (not p1.state[var15] and p1.placeholderOffset < p2) then
			spawn(function()
				-- upvalues: p1 (copy), var14 (copy), p2 (ref), p3 (ref), var15 (copy)
				if not p1.isMounted then return end
				local t = {}
				
				if p1.state[var14] ~= p2 then
					t[var14] = p2
				end
				if p3 and not p1.state[var15] and p1.placeholderOffset < p2 then
					t[var15] = true
				end
				if next(t) ~= nil then
					p1:setState(t)
				end
			end)
			
			return
		end
	end
	
	local var16 = "selectedYearIndex"
	local var17 = "hasUserPickedYear"
	
	function p7.onSelectedIndexChangedForYear(p2, p3)
		-- upvalues: p1 (ref), var16 (ref), var17 (ref)
		if p1.state[var16] ~= p2 or p3 and (not p1.state[var17] and p1.placeholderOffset < p2) then
			spawn(function()
				-- upvalues: p1 (copy), var16 (copy), p2 (ref), p3 (ref), var17 (copy)
				if not p1.isMounted then return end
				local t = {}
				
				if p1.state[var16] ~= p2 then
					t[var16] = p2
				end
				if p3 and not p1.state[var17] and p1.placeholderOffset < p2 then
					t[var17] = true
				end
				if next(t) ~= nil then
					p1:setState(t)
				end
			end)
			
			return
		end
	end
	
	function p7.onActivated(_)
		-- upvalues: p1 (ref)
		if p1.props.focusedGuiObject and p1.datePickerRef and p1.defaultRef.current then
			p1.props.focusGuiObject(p1.defaultRef.current, true)
		end
	end
	
	function p7.onEntryActivated()
		-- upvalues: p1 (ref)
		if p1.props.focusedGuiObject and p1.datePickerRef and p1.datePickerRef.current then
			p1.props.focusGuiObject(p1.datePickerRef.current, true)
		end
	end
end

function birthdayPicker.getActualIndex(p2, p3, p4, p5)
	if not p2.state[p3] then
		return nil
	end
	local var18 = p2.state[p4] - p2.placeholderOffset
	
	return if var18 < 1 or p5 < var18 then nil else var18
end

function birthdayPicker.getActualMonth(p2)
	-- upvalues: monthsLocalizationKeys (ref)
	return p2:getActualIndex("hasUserPickedMonth", "selectedMonthIndex", #monthsLocalizationKeys)
end

function birthdayPicker.getActualDay(p2)
	-- upvalues: t (ref)
	return p2:getActualIndex("hasUserPickedDay", "selectedDayIndex", #t)
end

function birthdayPicker.getActualYear(p2)
	local hasUserPickedYearActualIndex = p2:getActualIndex("hasUserPickedYear", "selectedYearIndex", #p2.dummyYears)
	
	return if hasUserPickedYearActualIndex then p2.dummyYears[hasUserPickedYearActualIndex] else nil
end

function birthdayPicker.didMount(p2)
	local updateBirthday = p2.props.updateBirthday
	
	if updateBirthday and not p2.props.skipUpdateOnMount then
		updateBirthday(p2:getActualMonth(), p2:getActualDay(), p2:getActualYear())
	end
	if p2.props.focusedGuiObject and p2.datePickerRef and p2.datePickerRef.current then
		p2.props.focusGuiObject(p2.datePickerRef.current, true)
	end
	p2.isMounted = true
end

function birthdayPicker.willUnmount(p2)
	p2.isMounted = false
end

function birthdayPicker.updatePickerState(p2)
	-- upvalues: dateHelper (ref), reasonDateInvalid (ref)
	local actualMonth = p2:getActualMonth()
	local actualDay = p2:getActualDay()
	local actualYear = p2:getActualYear()
	local var18 = actualMonth ~= nil and (actualDay ~= nil and actualYear ~= nil)
	local var19 = false
	local var20 = nil
	local var21 = false
	
	if var18 then
		local _ = nil
		local var22, var23 = dateHelper:isValidDate(actualMonth, actualDay, actualYear)
		var21 = var22
		
		if not var21 and var23 == reasonDateInvalid.IsInvalidDayOfMonth then
			var19 = true
			var20 = dateHelper:getLastDayOfTheMonthInYear(actualMonth, actualYear) + p2.placeholderOffset
		end
	end
	spawn(function()
		-- upvalues: p2 (ref), var19 (write), var20 (write), var18 (ref), var21 (write)
		if p2.isMounted then
			p2:setState({
				selectedDayIndex = if var19 then var20 else nil,
				continueButtonEnabled = var18 and var21
			})
		end
	end)
end

function birthdayPicker.didUpdate(p2)
	-- upvalues: dateHelper (ref), reasonDateInvalid (ref)
	local updateBirthday = p2.props.updateBirthday
	local actualMonth = p2:getActualMonth()
	local actualDay = p2:getActualDay()
	local actualYear = p2:getActualYear()
	local continueButtonEnabled = p2.state.continueButtonEnabled
	local var18 = actualMonth ~= nil and (actualDay ~= nil and actualYear ~= nil)
	local var19 = false
	local var20 = nil
	
	if var18 then
		local var21, var22 = dateHelper:isValidDate(actualMonth, actualDay, actualYear)
		var19 = var21
		var20 = var22
	end
	if var19 ~= continueButtonEnabled or not var19 and var20 == reasonDateInvalid.IsInvalidDayOfMonth then
		p2:updatePickerState()
	end
	if updateBirthday then
		updateBirthday(actualMonth, actualDay, actualYear)
	end
end

function birthdayPicker.render(p2)
	-- upvalues: localizationService (ref), dateTypeOrder (ref), getFFlagSignUpBirthdayPickerRequireManualSelection (ref), monthsLocalizationKeys (ref), cryoModule (ref), t (ref), withStyle (ref), withLocalization (ref), roactModule (ref), fitChildren (ref), scrollingPicker (ref), timeUnit (ref), dateHelper (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var18 = dateTypeOrder[robloxLocaleId]
	local var19 = not p2.shouldExpandTapTarget or p2.tapTargetExpansionSize <= 0
	local layoutOrder = p2.props.layoutOrder
	local var20 = p2.props.requireManualSelection and getFFlagSignUpBirthdayPickerRequireManualSelection()
	local placeholderTextMonth = p2.props.placeholderTextMonth
	local placeholderTextDay = p2.props.placeholderTextDay
	local placeholderTextYear = p2.props.placeholderTextYear
	local var21 = if var20 then cryoModule.List.join({ placeholderTextMonth }, monthsLocalizationKeys) else monthsLocalizationKeys
	local var22 = if var20 then cryoModule.List.join({ placeholderTextDay }, t) else t
	local dummyYears = p2.dummyYears
	local var23 = if var20 then cryoModule.List.join({ placeholderTextYear }, dummyYears) else dummyYears
	local selectedMonthIndex = p2.state.selectedMonthIndex
	local selectedDayIndex = p2.state.selectedDayIndex
	local selectedYearIndex = p2.state.selectedYearIndex
	local var24 = if var20 and p2.state.hasUserPickedMonth then 2 else 1
	local var25 = if var20 and p2.state.hasUserPickedDay then 2 else 1
	local var26 = if var20 and p2.state.hasUserPickedYear then 2 else 1
	local actualMonth = p2:getActualMonth()
	local actualYear = p2:getActualYear()
	local hasUserPickedMonth = p2.state.hasUserPickedMonth
	local hasUserPickedDay = p2.state.hasUserPickedDay
	local hasUserPickedYear = p2.state.hasUserPickedYear
	
	return withStyle(function(_)
		-- upvalues: withLocalization (copy), roactModule (copy), fitChildren (copy), layoutOrder (ref), p2 (ref), var19 (ref), scrollingPicker (copy), var18 (ref), timeUnit (copy), placeholderTextMonth (ref), hasUserPickedMonth (ref), withStyle (copy), var21 (ref), selectedMonthIndex (ref), var24 (ref), hasUserPickedDay (ref), placeholderTextDay (ref), dateHelper (copy), var22 (ref), selectedDayIndex (ref), robloxLocaleId (ref), actualMonth (ref), actualYear (ref), var25 (ref), hasUserPickedYear (ref), placeholderTextYear (ref), var23 (ref), selectedYearIndex (ref), var26 (ref)
		return withLocalization({ continueText = "Authentication.SignUp.Label.Continue" })(function(_)
			-- upvalues: roactModule (copy), fitChildren (copy), layoutOrder (copy), p2 (copy), var19 (copy), scrollingPicker (copy), var18 (copy), timeUnit (copy), placeholderTextMonth (copy), hasUserPickedMonth (copy), withStyle (copy), withLocalization (copy), var21 (copy), selectedMonthIndex (copy), var24 (copy), hasUserPickedDay (copy), placeholderTextDay (copy), dateHelper (copy), var22 (copy), selectedDayIndex (copy), robloxLocaleId (copy), actualMonth (copy), actualYear (copy), var25 (copy), hasUserPickedYear (copy), placeholderTextYear (copy), var23 (copy), selectedYearIndex (copy), var26 (copy)
			return roactModule.createElement(fitChildren.FitFrame, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = layoutOrder,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = fitChildren.FitAxis.Height
			}, {
				ListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 14)
				}),
				DatePickerWrap = roactModule.createElement(fitChildren.FitFrame, {
					LayoutOrder = 1,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = fitChildren.FitAxis.Height
				}, {
					CenterFrame = roactModule.createElement("ImageLabel", {
						Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/DatePickerDivider.png",
						BackgroundTransparency = 1,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 0, 50),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(2, 2, 4, 4),
						Position = UDim2.new(0, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5)
					}),
					DatePicker = roactModule.createElement(fitChildren.FitTextButton, {
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = fitChildren.FitAxis.Height,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						Selectable = true,
						NextSelectionUp = p2.props.NextSelectionUp,
						NextSelectionDown = p2.props.NextSelectionDown,
						NextSelectionLeft = p2.datePickerRef.current,
						NextSelectionRight = p2.datePickerRef.current,
						Text = "",
						[roactModule.Ref] = p2.datePickerRef,
						[roactModule.Event.Activated] = p2.onActivated
					}, {
						ListLayout = roactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						WheelContainer = p2.renderWheelContainerFunction({
							ListLayout = roactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Horizontal,
								SortOrder = Enum.SortOrder.LayoutOrder,
								VerticalAlignment = if var19 then Enum.VerticalAlignment.Center else nil
							}),
							Padding = roactModule.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, 5),
								PaddingRight = UDim.new(0, 5),
								PaddingTop = UDim.new(0, 5),
								PaddingBottom = UDim.new(0, 5)
							}),
							MonthWheel = roactModule.createElement(scrollingPicker, {
								entrySizeOnScrollingAxis = 50,
								layoutOrder = var18[timeUnit.Months],
								size = UDim2.new(0.45, 0, 0, 200),
								renderEntry = function(p3)
									-- upvalues: placeholderTextMonth (copy), hasUserPickedMonth (copy), p2 (copy), withStyle (copy), withLocalization (copy), var21 (copy), selectedMonthIndex (copy)
									return if p3 == placeholderTextMonth then if hasUserPickedMonth then p2.renderEntryTextfunction("", "Default") else p2.renderEntryTextfunction(placeholderTextMonth, "Muted") else withStyle(function(_)
										-- upvalues: withLocalization (copy), p3 (ref), var21 (copy), selectedMonthIndex (copy), hasUserPickedMonth (copy), p2 (copy)
										return withLocalization({ monthText = p3 })(function(p4)
											-- upvalues: var21 (copy), selectedMonthIndex (copy), p3 (copy), hasUserPickedMonth (copy), p2 (copy)
											return p2.renderEntryTextfunction(p4.monthText, if p3 == var21[selectedMonthIndex] and hasUserPickedMonth then "Emphasized" else "Default")
										end)
									end)
								end,
								getEntryWrapperProps = function(p3)
									-- upvalues: var21 (copy), selectedMonthIndex (copy), roactModule (copy), p2 (copy)
									return {
										[roactModule.Ref] = if p3 == var21[selectedMonthIndex] then p2.defaultRef else nil
									}
								end,
								entries = var21,
								onSelectedIndexChanged = p2.onSelectedIndexChangedForMonth,
								parentSpecifiedTarget = selectedMonthIndex,
								minTargetIndex = var24,
								onEntryActivated = p2.onEntryActivated,
								shouldExpandTapTarget = p2.shouldExpandTapTarget,
								tapTargetExpansionSize = p2.tapTargetExpansionSize
							}),
							DayWheel = roactModule.createElement(scrollingPicker, {
								entrySizeOnScrollingAxis = 50,
								layoutOrder = var18[timeUnit.Days],
								size = UDim2.new(0.2, 0, 0, 200),
								renderEntry = function(p3)
									-- upvalues: hasUserPickedDay (copy), p2 (copy), placeholderTextDay (copy), withLocalization (copy), dateHelper (copy), var22 (copy), selectedDayIndex (copy), robloxLocaleId (copy), actualMonth (copy), actualYear (copy)
									return if type(p3) == "number" then withLocalization({ dayAffix = dateHelper.DayAffixLocalizationKey })(function(p4)
										-- upvalues: var22 (copy), selectedDayIndex (copy), p3 (ref), dateHelper (copy), robloxLocaleId (copy), actualMonth (copy), actualYear (copy), hasUserPickedDay (copy), p2 (copy)
										local var27 = p3 == var22[selectedDayIndex]
										local var28 = dateHelper:GetFormattedDayString(p3, p4.dayAffix, robloxLocaleId)
										local var29 = "Default"
										
										if actualMonth and actualYear and dateHelper:isInvalidDayOfTheMonth(actualMonth, p3, actualYear) then
											var29 = "Muted"
										elseif var27 and hasUserPickedDay then
											var29 = "Emphasized"
										end
										return p2.renderEntryTextfunction(var28, var29)
									end) elseif hasUserPickedDay then p2.renderEntryTextfunction("", "Default") else p2.renderEntryTextfunction(placeholderTextDay, "Muted")
								end,
								entries = var22,
								onSelectedIndexChanged = p2.onSelectedIndexChangedForDay,
								parentSpecifiedTarget = selectedDayIndex,
								minTargetIndex = var25,
								onEntryActivated = p2.onEntryActivated,
								shouldExpandTapTarget = p2.shouldExpandTapTarget,
								tapTargetExpansionSize = p2.tapTargetExpansionSize
							}),
							YearWheel = roactModule.createElement(scrollingPicker, {
								entrySizeOnScrollingAxis = 50,
								layoutOrder = var18[timeUnit.Years],
								size = UDim2.new(0.35, 0, 0, 200),
								renderEntry = function(p3)
									-- upvalues: hasUserPickedYear (copy), p2 (copy), placeholderTextYear (copy), withLocalization (copy), dateHelper (copy), var23 (copy), selectedYearIndex (copy), robloxLocaleId (copy)
									return if type(p3) == "number" then withLocalization({ yearAffix = dateHelper.YearAffixLocalizationKey })(function(p4)
										-- upvalues: var23 (copy), selectedYearIndex (copy), p3 (ref), dateHelper (copy), robloxLocaleId (copy), hasUserPickedYear (copy), p2 (copy)
										return p2.renderEntryTextfunction(dateHelper:GetFormattedYearString(p3, p4.yearAffix, robloxLocaleId), if p3 == var23[selectedYearIndex] and hasUserPickedYear then "Emphasized" else "Default")
									end) elseif hasUserPickedYear then p2.renderEntryTextfunction("", "Default") else p2.renderEntryTextfunction(placeholderTextYear, "Muted")
								end,
								entries = var23,
								onSelectedIndexChanged = p2.onSelectedIndexChangedForYear,
								parentSpecifiedTarget = selectedYearIndex,
								minTargetIndex = var26,
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
	-- upvalues: reactFocusNavigationModule (ref), useFocusNavigationBindings (ref), roactModule (ref), birthdayPicker (ref), cryoModule (ref)
	return roactModule.createElement(birthdayPicker, cryoModule.Dictionary.join(p2, {
		focusedGuiObject = reactFocusNavigationModule.useFocusedGuiObject(),
		focusGuiObject = reactFocusNavigationModule.useFocusGuiObject(),
		focusNavigationRef = useFocusNavigationBindings(nil)
	}))
end