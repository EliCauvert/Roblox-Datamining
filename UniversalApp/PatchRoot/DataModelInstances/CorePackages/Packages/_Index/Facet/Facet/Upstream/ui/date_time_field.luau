local CivilDateModule = require("./civil_date")
local _ = require("./field_chrome")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./date_time_picker_types")
local _ = require("./input_props")
local _ = require("../vendor/compose/core")
local DateTimePartsModule = require("./date_time_parts")
local _ = require("./date_time_options")
local _ = require("./date_time_state")
local _ = require("./date_time_calendar")
local CELL = DateTimePartsModule.CELL
local GAP = DateTimePartsModule.GAP
local ROW = DateTimePartsModule.ROW
local SpanFunction = DateTimePartsModule.span
local MonthOfFunction = DateTimePartsModule.monthOf

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, Callback, Spec, Native, p10)
	-- upvalues: CivilDateModule (copy), SpanFunction (copy), MonthOfFunction (copy), ROW (copy), CELL (copy), GAP (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local IsRange = p7.isRange
	local Draft = p7.draft
	local Locale = p7.locale
	local ViewMonth = p8.viewMonth
	local Room = p8.room
	local Dual = p8.dual
	local Preferred = p8.preferred
	local Presented = p8.presented
	local RequestPresentedFunction = p8.requestPresented
	local CloseFunction = p8.close
	local TypedError = p8.typedError
	local ValueText = p8.valueText
	local TypedEntry = p8.typedEntry
	local EnabledFunction = p8.enabled
	local InteractiveFunction = p8.interactive
	local ProposeFunction = p8.propose
	local LandingFunction = p9.landing
	
	local function _(p11)
		-- upvalues: CivilDateModule (upval), Locale (copy), p7 (copy), p8 (copy)
		local ParseResult, ParseResult2 = CivilDateModule.parse(p11, Locale, p7.withTime)
		
		if ParseResult == nil or not p8.isDisabled(ParseResult) then
			return ParseResult, ParseResult2
		else
			return nil, "That date is not available."
		end
	end
	
	local function typed(Text: string): boolean
		-- upvalues: ValueText (copy), TypedError (copy), IsRange (copy), SpanFunction (upval), CivilDateModule (upval), Locale (copy), p7 (copy), p8 (copy), ProposeFunction (copy), Draft (copy), ViewMonth (copy), MonthOfFunction (upval)
		if Text == ValueText:peek() then
			TypedError:set("")
			
			return true
		end
		local v1 = nil
		local v2: string? = nil
		local Flag = false
		
		if IsRange then
			local StartIndex, EndIndex = string.find(Text, "–", 1, true)
			
			if StartIndex == nil then
				StartIndex, EndIndex = string.find(Text, " - ", 1, true)
			end
			if StartIndex == nil and string.match(Text, "^%s*$") ~= nil then
				v1 = SpanFunction(nil, nil)
				Flag = true
			elseif StartIndex == nil or EndIndex == nil then
				v2 = "Enter two dates, like " .. CivilDateModule.format({ year = 2026, month = 1, day = 2 }, Locale) .. " – " .. CivilDateModule.format({ year = 2026, month = 1, day = 9 }, Locale)
			else
				local v3 = nil
				local ParseResult, ParseResult2 = CivilDateModule.parse(string.sub(Text, 1, StartIndex - 1), Locale, p7.withTime)
				local ParseResult1 = nil
				local ParseResult3 = nil
				
				if ParseResult == nil or not p8.isDisabled(ParseResult) then
					ParseResult1 = ParseResult
					ParseResult3 = ParseResult2
				else
					ParseResult1 = nil
					ParseResult3 = "That date is not available."
				end
				local ParseResult4 = ParseResult1
				v2 = ParseResult3
				
				if ParseResult4 ~= nil then
					local ParseResult5, ParseResult2_1 = CivilDateModule.parse(string.sub(Text, EndIndex + 1), Locale, p7.withTime)
					local ParseResult6 = nil
					local ParseResult7 = nil
					
					if ParseResult5 == nil or not p8.isDisabled(ParseResult5) then
						ParseResult6 = ParseResult5
						ParseResult7 = ParseResult2_1
					else
						ParseResult6 = nil
						ParseResult7 = "That date is not available."
					end
					v3 = ParseResult6
					v2 = ParseResult7
				end
				if ParseResult4 ~= nil and v3 ~= nil then
					v1 = if CivilDateModule.compare(ParseResult4, v3) <= 0 then SpanFunction(ParseResult4, v3) else SpanFunction(v3, ParseResult4)
					Flag = true
				end
			end
		elseif string.match(Text, "^%s*$") == nil then
			local ParseResult8, ParseResult2_2 = CivilDateModule.parse(Text, Locale, p7.withTime)
			local ParseResult9 = nil
			local ParseResult10 = nil
			
			if ParseResult8 == nil or not p8.isDisabled(ParseResult8) then
				ParseResult9 = ParseResult8
				ParseResult10 = ParseResult2_2
			else
				ParseResult9 = nil
				ParseResult10 = "That date is not available."
			end
			v2 = ParseResult10
			v1 = ParseResult9
			Flag = ParseResult9 ~= nil
		else
			v1 = nil
			Flag = true
		end
		if not Flag then
			TypedError:set(v2 or "Enter a date.")
			
			return false
		end
		TypedError:set("")
		
		if ProposeFunction(v1) then
			if not Draft then
				p8.commit()
			end
			local Start = if IsRange then v1.start else v1
			
			if Start ~= nil then
				ViewMonth:set(MonthOfFunction(Start))
			end
		end
		return true
	end
	
	local v1 = nil
	local RowResult = p1.row({
		Compose.show(function(Callback)
			-- upvalues: TypedEntry (copy)
			return Callback(TypedEntry)
		end, function()
			-- upvalues: Host (copy), ValueText (copy), p6 (copy), TypesUDim2 (copy), ROW (upval), TypesEnum (copy), InteractiveFunction (copy), p1 (copy), v1 (ref), Compose (copy), TypedError (copy), Runtime (copy), p8 (copy), typed (copy)
			local v2 = Host.TextBox("Entry")({
				LayoutOrder = 1,
				Text = ValueText:peek(),
				PlaceholderText = p6.placeholder or "",
				ClearTextOnFocus = false,
				BackgroundTransparency = 1,
				Size = TypesUDim2.new(1, -ROW, 1, 0),
				TextXAlignment = TypesEnum.TextXAlignment.Left,
				TextEditable = function(p11)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p11)
				end,
				Selectable = function(p11)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p11)
				end,
				p1.padding(12, 0)
			})
			p1.styled(v2, "text")
			p1.textRole(v2, "body")
			v1 = v2
			Compose.cleanup(function()
				-- upvalues: v1 (upval), v2 (copy)
				if v1 == v2 then
					v1 = nil
				end
			end)
			Compose.watch(function(Callback)
				-- upvalues: v2 (copy), ValueText (upval), TypedError (upval)
				v2.Text = Callback(ValueText)
				TypedError:set("")
			end)
			Runtime.connect(v2, "FocusLost", function(_, Input)
				-- upvalues: TypesEnum (upval), v2 (copy), ValueText (upval), p8 (upval), typed (upval), TypedError (upval)
				if Input and (Input.KeyCode == TypesEnum.KeyCode.Escape or Input.KeyCode == TypesEnum.KeyCode.ButtonB) then
					v2.Text = ValueText:peek()
					
					return
				end
				if not p8.mayEdit() then
					v2.Text = ValueText:peek()
					
					return
				end
				if typed(v2.Text) and TypedError:peek() == "" then
					v2.Text = ValueText:peek()
				end
			end)
			
			return v2
		end),
		Compose.show(function(Callback): boolean
			-- upvalues: TypedEntry (copy)
			return not Callback(TypedEntry)
		end, function()
			-- upvalues: p2 (copy), ValueText (copy), p6 (copy), TypesUDim2 (copy), ROW (upval), TypesEnum (copy), InteractiveFunction (copy), RequestPresentedFunction (copy), p4 (copy)
			local Show = p2.Button({
				Name = "Show",
				LayoutOrder = 1,
				textSize = "body",
				appearance = "utility",
				label = function(Callback)
					-- upvalues: ValueText (upval), p6 (upval)
					local CallbackResult = Callback(ValueText)
					
					return if CallbackResult == "" then p6.placeholder or "" else CallbackResult
				end,
				Size = TypesUDim2.new(1, -ROW, 1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				TextXAlignment = TypesEnum.TextXAlignment.Left,
				corners = p6.corners,
				enabled = function(p11)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p11)
				end,
				onActivate = function()
					-- upvalues: RequestPresentedFunction (upval)
					RequestPresentedFunction(true)
				end
			})
			p4.tagWhile(Show, "facet-secondary", function(Callback): boolean
				-- upvalues: ValueText (upval)
				return Callback(ValueText) == ""
			end)
			
			return Show
		end),
		(function()
			-- upvalues: p2 (copy), TypesUDim2 (copy), ROW (upval), TypesEnum (copy), p6 (copy), InteractiveFunction (copy), RequestPresentedFunction (copy), Presented (copy)
			return p2.Button({
				Name = "Open",
				LayoutOrder = 2,
				icon = "calendar",
				name = "Choose a date",
				appearance = "utility",
				Size = TypesUDim2.new(0, ROW, 1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				corners = p6.corners,
				enabled = function(p11)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p11)
				end,
				onActivate = function()
					-- upvalues: RequestPresentedFunction (upval), Presented (upval)
					RequestPresentedFunction(not Presented:peek())
				end
			})
		end)()
	}, {
		Name = "Field",
		Size = TypesUDim2.new(1, 0, 0, ROW),
		AutomaticSize = TypesEnum.AutomaticSize.None,
		BackgroundTransparency = 0,
		ClipsDescendants = true,
		p1.padding(0, 0)
	})
	local v2 = assert(RowResult:FindFirstChildWhichIsA("UIListLayout"))
	v2.VerticalAlignment = TypesEnum.VerticalAlignment.Center
	v2.Padding = TypesUDim.new(0, 0)
	p1.styled(RowResult, "text-input")
	local ErrorOfResult = p5.errorOf(Spec, TypedError)
	p5.paint("DateTimePicker", RowResult, Spec, function(p11): boolean
		-- upvalues: ErrorOfResult (copy)
		return ErrorOfResult(p11) ~= ""
	end)
	p1.skin(RowResult, "field", {
		disabled = function(p11): boolean
			-- upvalues: EnabledFunction (copy)
			return not EnabledFunction(p11)
		end
	})
	local WrapResult = p5.wrap({
		control = "DateTimePicker",
		spec = Spec,
		plate = RowResult,
		focus = function()
			-- upvalues: v1 (ref), RequestPresentedFunction (copy)
			local TextBox = v1
			
			if TextBox and not TextBox:IsFocused() then
				TextBox:CaptureFocus()
				
				return
			end
			if TextBox == nil then
				RequestPresentedFunction(true)
			end
		end,
		enabled = EnabledFunction,
		message = TypedError,
		native = Native
	})
	local AvailableResult = p3.available(RowResult)
	local Flag = false
	Compose.watch(function(Callback)
		-- upvalues: AvailableResult (copy), Flag (ref), Presented (copy), CloseFunction (copy)
		if Callback(AvailableResult) then
			Flag = true
			
			return
		end
		if Flag and Presented:peek() then
			CloseFunction("anchorLost")
		end
	end)
	p3.attach(WrapResult, {
		p3.overlay(RowResult, Presented, function(p11)
			-- upvalues: p3 (copy), RowResult (copy), p1 (copy), Compose (copy), TypesVector2 (copy), Preferred (copy), TypesEnum (copy), Room (copy), p10 (copy), Callback (copy), Host (copy), TypesUDim2 (copy), CloseFunction (copy), LandingFunction (copy), Runtime (copy), Dual (copy), CELL (upval), GAP (upval)
			local ParentResult = p3.parent(RowResult)
			local AbsoluteSizeResult = if ParentResult then p1.observe.AbsoluteSize(ParentResult) else Compose.cell(TypesVector2.zero)
			local AbsolutePositionResult = if ParentResult then p1.observe.AbsolutePosition(ParentResult) else Compose.cell(TypesVector2.zero)
			local AbsolutePositionResult1 = p1.observe.AbsolutePosition(RowResult)
			local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(RowResult)
			local PeekResult = Compose.formula((p1.tenFoot())):peek()
			local IsPeekResultMatch = Preferred:peek() == TypesEnum.PreferredInput.Touch
			local FormulaResult = Compose.formula(function(Callback): string
				-- upvalues: PeekResult (copy), AbsoluteSizeResult (copy), IsPeekResultMatch (copy)
				if PeekResult then
					return "sheet"
				else
					local CallbackResult = Callback(AbsoluteSizeResult)
					
					return if IsPeekResultMatch and CallbackResult.X > 0 and CallbackResult.X < 600 then "sheet" else "popover"
				end
			end)
			Compose.watch(function(Callback)
				-- upvalues: AbsoluteSizeResult (copy), Room (upval), p10 (upval), FormulaResult (copy)
				Room:set(Callback(AbsoluteSizeResult).X - 96)
				p10:set(Callback(FormulaResult))
			end)
			
			local function routeOf(Callback)
				-- upvalues: FormulaResult (copy)
				return Callback(FormulaResult)
			end
			
			local v3 = nil
			local CalendarSurface = nil
			local CellResult = Compose.cell(false)
			local AppearanceResult = p3.appearance(p11, p1.motionTiming("popover"), CellResult)
			
			local function _(p12, p13)
				-- upvalues: p3 (upval)
				return p3.inset(0, p12, nil, p13)
			end
			
			local ModalResult = p3.modal(function()
				-- upvalues: v3 (ref), Callback (upval), routeOf (copy), Host (upval), TypesUDim2 (upval), TypesEnum (upval), CalendarSurface (ref), p1 (upval), AppearanceResult (copy), p3 (upval)
				v3 = Callback(routeOf)
				local v4 = Host.ScrollingFrame("CalendarScroll")({
					Size = TypesUDim2.fromScale(1, 1),
					BorderSizePixel = 0,
					Selectable = false,
					CanvasSize = TypesUDim2.fromOffset(0, 0),
					AutomaticCanvasSize = TypesEnum.AutomaticSize.Y,
					ScrollingDirection = TypesEnum.ScrollingDirection.Y,
					ScrollBarThickness = 4,
					VerticalScrollBarInset = TypesEnum.ScrollBarInset.ScrollBar,
					v3
				})
				CalendarSurface = p1.fade({
					Name = "CalendarSurface",
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					GroupTransparency = function(p12): number
						-- upvalues: AppearanceResult (upval)
						return 1 - AppearanceResult.opacity(p12)
					end,
					v4
				})
				p1.styled(v4, "panel")
				p1.styled(v4, "calendar-scroll")
				p1.styled(v4, "floating")
				p3.skin(v4)
				
				return CalendarSurface
			end, function()
				-- upvalues: CloseFunction (upval)
				CloseFunction("cancel")
			end, {
				Name = "CalendarModal",
				exiting = if p11 then p11.exiting else nil,
				appearance = AppearanceResult.opacity,
				initialFocus = `D{LandingFunction()}`,
				backgroundTransparency = function(Callback): number
					-- upvalues: FormulaResult (copy)
					return if Callback(FormulaResult) == "sheet" then 0.5 else 1
				end,
				onOutside = function()
					-- upvalues: CloseFunction (upval)
					CloseFunction("outside")
				end
			})
			local AbsoluteSizeResult2 = p1.observe.AbsoluteSize(v3)
			
			local _ = function(Callback): boolean
				-- upvalues: FormulaResult (copy), PeekResult (copy)
				return Callback(FormulaResult) == "sheet" and not PeekResult
			end
			
			Runtime.decorate(v3, {
				Size = function(Callback)
					-- upvalues: FormulaResult (copy), PeekResult (copy), TypesUDim2 (upval), p3 (upval), Dual (upval), CELL (upval), GAP (upval)
					local NoPeekResult: boolean = Callback(FormulaResult) == "sheet" and not PeekResult
					
					return if NoPeekResult then TypesUDim2.new(1, -p3.inset(0, "left", nil, Callback) - p3.inset(0, "right", nil, Callback), 0, 0) else TypesUDim2.fromOffset((if Callback(Dual) then 14 * CELL + GAP else 7 * CELL) + 32, 0)
				end
			})
			
			local function surfaceSize(Callback)
				-- upvalues: AbsoluteSizeResult (copy), AbsoluteSizeResult2 (copy), p3 (upval), FormulaResult (copy), PeekResult (copy), TypesUDim2 (upval), Dual (upval), CELL (upval), GAP (upval)
				local CallbackResult = Callback(AbsoluteSizeResult)
				local NewY = Callback(AbsoluteSizeResult2).Y + p3.inset(0, "top", nil, Callback) + p3.inset(0, "bottom", nil, Callback)
				
				if CallbackResult.Y > 0 then
					NewY = math.min(NewY, CallbackResult.Y - 16)
				end
				local NoPeekResult: boolean = Callback(FormulaResult) == "sheet" and not PeekResult
				
				return if NoPeekResult then TypesUDim2.new(1, -24, 0, NewY) else TypesUDim2.fromOffset((if Callback(Dual) then 14 * CELL + GAP else 7 * CELL) + 32 + p3.inset(0, "left", nil, Callback) + p3.inset(0, "right", nil, Callback), NewY)
			end
			
			Runtime.decorate(CalendarSurface, {
				Size = surfaceSize,
				Position = function(Callback)
					-- upvalues: AbsolutePositionResult1 (copy), AbsoluteSizeResult1 (copy), AbsoluteSizeResult (copy), AbsolutePositionResult (copy), surfaceSize (copy), TypesVector2 (upval), FormulaResult (copy), PeekResult (copy), TypesUDim2 (upval)
					local CallbackResult = Callback(AbsolutePositionResult1)
					local CallbackResult1 = Callback(AbsoluteSizeResult1)
					local CallbackResult2 = Callback(AbsoluteSizeResult)
					local CallbackResult3 = Callback(AbsolutePositionResult)
					local SurfaceSizeResult = surfaceSize(Callback)
					local NewTypesVector = TypesVector2.new(CallbackResult2.X * SurfaceSizeResult.X.Scale + SurfaceSizeResult.X.Offset, SurfaceSizeResult.Y.Offset)
					
					if Callback(FormulaResult) == "sheet" then
						return if PeekResult then TypesUDim2.fromOffset(math.max(8, (CallbackResult2.X - NewTypesVector.X) / 2), (math.max(8, (CallbackResult2.Y - NewTypesVector.Y) / 2))) else TypesUDim2.fromOffset(12, (math.max(8, CallbackResult2.Y - NewTypesVector.Y - 12)))
					end
					local XDelta = CallbackResult.X - CallbackResult3.X
					local NewY = CallbackResult.Y - CallbackResult3.Y + CallbackResult1.Y + 4
					local YDelta = CallbackResult.Y - CallbackResult3.Y - NewTypesVector.Y - 4
					
					if CallbackResult2.Y > 0 and CallbackResult2.Y - 8 < NewY + NewTypesVector.Y then
						NewY = if YDelta >= 8 then YDelta else math.max(8, CallbackResult2.Y - NewTypesVector.Y - 8)
					end
					if CallbackResult2.X > 0 then
						XDelta = math.clamp(XDelta, 8, (math.max(8, CallbackResult2.X - NewTypesVector.X - 8)))
					end
					if CallbackResult2.Y > 0 then
						NewY = math.clamp(NewY, 8, (math.max(8, CallbackResult2.Y - NewTypesVector.Y - 8)))
					end
					return TypesUDim2.fromOffset(XDelta, (math.max(8, NewY)))
				end
			})
			p3.atRest(AppearanceResult.travel, CellResult, { CalendarSurface, v3 })
			
			return ModalResult
		end, { motion = p1.motionTiming("popover") })
	})
	
	return WrapResult
end