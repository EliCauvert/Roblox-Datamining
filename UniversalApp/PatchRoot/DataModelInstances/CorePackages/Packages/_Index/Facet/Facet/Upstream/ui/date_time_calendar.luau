local CivilDateModule = require("./civil_date")
local _ = require("./types")
local _ = require("./input_props")
local _ = require("./date_time_picker_types")
local _ = require("../vendor/compose/core")
local DateTimePartsModule = require("./date_time_parts")
local _ = require("./date_time_options")
local _ = require("./date_time_state")
local CELLS = DateTimePartsModule.CELLS
local CELL = DateTimePartsModule.CELL
local DISC = DateTimePartsModule.DISC
local SpanFunction = DateTimePartsModule.span

return function(p1, p2, p3, p4, p5)
	-- upvalues: CivilDateModule (copy), SpanFunction (copy), DISC (copy), CELL (copy), CELLS (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Gui = p3.gui
	local Input = p3.input
	local TagWhileFunction = p3.tagWhile
	local FrameFunction = p3.frame
	local IsRange = p4.isRange
	local Draft = p4.draft
	local Months = p4.months
	local Value = p5.value
	local Range = p5.range
	local Today = p5.today
	local Selected = p5.selected
	local PaneMonthFunction = p5.paneMonth
	local PaneGridFunction = p5.paneGrid
	local CanPageFunction = p5.canPage
	local PageFunction = p5.page
	local InteractiveFunction = p5.interactive
	local IsDisabledFunction = p5.isDisabled
	local ProposeFunction = p5.propose
	local Cells = {}
	local CellIndex = {}
	
	local function _(p6, p7)
		-- upvalues: PaneGridFunction (copy)
		return PaneGridFunction(p6)[p7]
	end
	
	local function cellFor(AddDaysResult, p6)
		-- upvalues: p5 (copy), PaneMonthFunction (copy), PaneGridFunction (copy), CivilDateModule (upval)
		for i = 1, p5.panes(p6) do
			local PaneMonthResult = PaneMonthFunction(i, p6)
			
			if AddDaysResult.year == PaneMonthResult.year and AddDaysResult.month == PaneMonthResult.month then
				for i1, value in PaneGridFunction(i, p6) do
					if CivilDateModule.compare(value, AddDaysResult) == 0 then
						return i, i1
					end
				end
			end
		end
		return nil, nil
	end
	
	local function landing()
		-- upvalues: p5 (copy), PaneGridFunction (copy), IsRange (copy), Range (copy), Value (copy), Today (copy), CivilDateModule (upval), IsDisabledFunction (copy)
		local PeekMonthResult = p5.peekMonth()
		local PaneGridResult = PaneGridFunction(1)
		local Start = if IsRange then Range:peek().start else Value:peek()
		local List = { Today:peek() }
		
		if Start ~= nil then
			table.insert(List, 1, Start)
		end
		for i, value in List do
			for i1, value1 in PaneGridResult do
				if CivilDateModule.compare(value1, value) == 0 and value1.month == PeekMonthResult.month and not IsDisabledFunction(value1) then
					return i1
				end
			end
		end
		for i, value2 in PaneGridResult do
			if value2.month == PeekMonthResult.month and not IsDisabledFunction(value2) then
				return i
			end
		end
		return 1
	end
	
	local Config = nil
	local Inverted = false
	
	local function dayUnder(p7, p8)
		-- upvalues: Cells (copy), PaneGridFunction (copy)
		for i, cell in Cells do
			for i1, Frame in cell do
				local AbsolutePosition = Frame.AbsolutePosition
				local AbsoluteSize = Frame.AbsoluteSize
				
				if AbsolutePosition.X <= p7 and p7 < AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= p8 and p8 < AbsolutePosition.Y + AbsoluteSize.Y then
					return PaneGridFunction(i)[i1]
				end
			end
		end
		return nil
	end
	
	local function grabEnd(Last): boolean
		-- upvalues: Range (copy), IsRange (copy), p5 (copy), CivilDateModule (upval), Config (ref)
		local PeekResult = Range:peek()
		
		if not IsRange or PeekResult.start == nil or PeekResult.finish == nil or not p5.mayEdit() then
			return false
		end
		local Finish = if CivilDateModule.compare(Last, PeekResult.start) == 0 then PeekResult.finish elseif CivilDateModule.compare(Last, PeekResult.finish) == 0 then PeekResult.start else nil
		
		if Finish == nil then
			return false
		else
			Config = {
				moved = false,
				other = Finish,
				from = PeekResult,
				last = Last
			}
			
			return true
		end
	end
	
	local function dragTo(X, Y)
		-- upvalues: Config (ref), dayUnder (copy), IsDisabledFunction (copy), CivilDateModule (upval), ProposeFunction (copy), SpanFunction (upval)
		local Config1 = Config
		
		if Config1 == nil then return end
		local DayUnderResult = dayUnder(X, Y)
		
		if DayUnderResult ~= nil and not IsDisabledFunction(DayUnderResult) and CivilDateModule.compare(DayUnderResult, Config1.last) ~= 0 then
			Config1.last = DayUnderResult
			Config1.moved = true
			local Other = Config1.other
			local DateOfResult = CivilDateModule.dateOf(DayUnderResult)
			ProposeFunction(if CivilDateModule.compare(DateOfResult, Other) < 0 then SpanFunction(DateOfResult, Other) else SpanFunction(Other, DateOfResult))
			
			return
		end
	end
	
	local _ = function(p9)
		-- upvalues: Config (ref), Inverted (ref), ProposeFunction (copy), Draft (copy), p5 (copy)
		local Config1 = Config
		Config = nil
		
		if Config1 == nil or not Config1.moved then return end
		Inverted = not p9
		
		if p9 then
			ProposeFunction(Config1.from)
			
			return
		end
		if not Draft then
			p5.commit()
		end
	end
	
	if IsRange and Input then
		local _ = function(Input): boolean
			-- upvalues: TypesEnum (copy)
			return Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or (Input.UserInputType == TypesEnum.UserInputType.MouseMovement or Input.UserInputType == TypesEnum.UserInputType.Touch)
		end
		
		Runtime.connect(Input, "InputChanged", function(Input)
			-- upvalues: Config (ref), TypesEnum (copy), Inverted (ref), ProposeFunction (copy), dragTo (copy)
			if Config ~= nil and (Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or (Input.UserInputType == TypesEnum.UserInputType.MouseMovement or Input.UserInputType == TypesEnum.UserInputType.Touch)) then
				if Input.UserInputState == TypesEnum.UserInputState.Cancel then
					local Config1 = Config
					Config = nil
					
					if Config1 ~= nil then
						if Config1.moved then
							Inverted = false
							ProposeFunction(Config1.from)
							
							return
						end
						return
					end
				else
					dragTo(Input.Position.X, Input.Position.Y)
				end
			end
		end)
		Runtime.connect(Input, "InputEnded", function(Input)
			-- upvalues: Config (ref), TypesEnum (copy), Inverted (ref), ProposeFunction (copy), Draft (copy), p5 (copy)
			if Config ~= nil and (Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or (Input.UserInputType == TypesEnum.UserInputType.MouseMovement or Input.UserInputType == TypesEnum.UserInputType.Touch)) then
				local IsUserInputStateMatch = Input.UserInputState == TypesEnum.UserInputState.Cancel
				local Config1 = Config
				Config = nil
				
				if Config1 ~= nil then
					if not Config1.moved then return end
					Inverted = not IsUserInputStateMatch
					
					if IsUserInputStateMatch then
						ProposeFunction(Config1.from)
						
						return
					end
					if not Draft then
						p5.commit()
					end
				end
			end
		end)
		Runtime.connect(Input, "WindowFocusReleased", function()
			-- upvalues: Config (ref), Inverted (ref), ProposeFunction (copy)
			local Config1 = Config
			Config = nil
			
			if Config1 ~= nil then
				if not Config1.moved then return end
				Inverted = false
				ProposeFunction(Config1.from)
			end
		end)
	end
	local CellResult = Compose.cell(nil)
	local CellResult1 = Compose.cell(nil)
	
	local _ = function(p9, p10, p11, p12): boolean
		-- upvalues: CivilDateModule (upval), PaneGridFunction (copy), cellFor (copy)
		return cellFor(CivilDateModule.addDays(PaneGridFunction(p9, p12)[p10], p11), p12) ~= nil
	end
	
	local function dayCell(Key, LayoutOrder: number)
		-- upvalues: Compose (copy), PaneGridFunction (copy), PaneMonthFunction (copy), IsDisabledFunction (copy), IsRange (copy), Range (copy), CivilDateModule (upval), Value (copy), FrameFunction (copy), p1 (copy), DISC (upval), TypesUDim2 (copy), TypesVector2 (copy), Today (copy), Host (copy), TypesEnum (copy), TagWhileFunction (copy), cellFor (copy), CellResult (copy), CellResult1 (copy), p5 (copy), CELL (upval), InteractiveFunction (copy), Inverted (ref), p2 (copy), Runtime (copy), grabEnd (copy), Cells (copy), CellIndex (copy)
		local FormulaResult = Compose.formula(function(p9)
			-- upvalues: PaneGridFunction (upval), Key (copy), LayoutOrder (copy)
			return PaneGridFunction(Key, p9)[LayoutOrder]
		end)
		local FormulaResult1 = Compose.formula(function(Callback): boolean
			-- upvalues: FormulaResult (copy), PaneMonthFunction (upval), Key (copy)
			return Callback(FormulaResult).month ~= PaneMonthFunction(Key, Callback).month
		end)
		local FormulaResult2 = Compose.formula(function(Callback)
			-- upvalues: IsDisabledFunction (upval), FormulaResult (copy)
			return IsDisabledFunction(Callback(FormulaResult), Callback)
		end)
		local FormulaResult3 = Compose.formula(function(Callback): boolean
			-- upvalues: FormulaResult (copy), FormulaResult1 (copy), IsRange (upval), Range (upval), CivilDateModule (upval), Value (upval)
			local CallbackResult = Callback(FormulaResult)
			
			if Callback(FormulaResult1) then
				return false
			elseif IsRange then
				local CallbackResult1 = Callback(Range)
				
				return if CallbackResult1.start == nil then CallbackResult1.finish ~= nil and CivilDateModule.compare(CallbackResult, CallbackResult1.finish) == 0 else CivilDateModule.compare(CallbackResult, CallbackResult1.start) == 0 or CallbackResult1.finish ~= nil and CivilDateModule.compare(CallbackResult, CallbackResult1.finish) == 0
			else
				local CallbackResult2 = Callback(Value)
				
				return CallbackResult2 ~= nil and CivilDateModule.compare(CallbackResult, CallbackResult2) == 0
			end
		end)
		local FormulaResult4 = Compose.formula(function(Callback)
			-- upvalues: IsRange (upval), FormulaResult1 (copy), Range (upval), CivilDateModule (upval), FormulaResult (copy)
			if IsRange and not Callback(FormulaResult1) then
				local CallbackResult = Callback(Range)
				
				return CallbackResult.start ~= nil and (CallbackResult.finish ~= nil and CivilDateModule.within(Callback(FormulaResult), CallbackResult.start, CallbackResult.finish))
			else
				return false
			end
		end)
		local NewLayoutOrder = (LayoutOrder - 1) % 7 + 1
		
		local function _(p9, Callback): boolean
			-- upvalues: FormulaResult4 (copy), Range (upval), CivilDateModule (upval), FormulaResult (copy), NewLayoutOrder (copy)
			if Callback(FormulaResult4) then
				local CallbackResult = Callback(Range)
				
				return CivilDateModule.compare(Callback(FormulaResult), (assert(if p9 == "leading" then CallbackResult.start else CallbackResult.finish))) == 0 or NewLayoutOrder == (if p9 == "leading" then 1 else 7)
			else
				return true
			end
		end
		
		local function capped(Callback): boolean
			-- upvalues: FormulaResult4 (copy), Range (upval), CivilDateModule (upval), FormulaResult (copy), NewLayoutOrder (copy), FormulaResult3 (copy)
			return Callback(FormulaResult4) and (if not Callback(FormulaResult4) or CivilDateModule.compare(Callback(FormulaResult), (assert(Callback(Range).start))) == 0 or NewLayoutOrder == 1 then not Callback(FormulaResult3) else (not Callback(FormulaResult4) or CivilDateModule.compare(Callback(FormulaResult), (assert(Callback(Range).finish))) == 0 or NewLayoutOrder == 7) and not Callback(FormulaResult3))
		end
		
		local Disc = FrameFunction("Disc", {
			Visible = function(Callback)
				-- upvalues: FormulaResult3 (copy)
				return Callback(FormulaResult3)
			end,
			ZIndex = 3,
			p1.corner(DISC)
		})
		Disc:AddTag("facet-calendar-disc")
		
		if IsRange then
			Disc:AddTag("facet-calendar-end")
		end
		local Band = FrameFunction("Band", {
			Size = TypesUDim2.new(1, 0, 0, DISC),
			Visible = function(Callback)
				-- upvalues: FormulaResult4 (copy)
				return Callback(FormulaResult4)
			end,
			BackgroundTransparency = 1,
			ZIndex = 1,
			FrameFunction("Leading", {
				Size = TypesUDim2.new(0.5, 0, 1, 0),
				AnchorPoint = TypesVector2.new(0, 0),
				Position = TypesUDim2.fromScale(0, 0),
				Visible = function(Callback): boolean
					-- upvalues: FormulaResult4 (copy), Range (upval), CivilDateModule (upval), FormulaResult (copy), NewLayoutOrder (copy)
					return not (not Callback(FormulaResult4) or (CivilDateModule.compare(Callback(FormulaResult), (assert(Callback(Range).start))) == 0 or NewLayoutOrder == 1))
				end
			}),
			FrameFunction("Trailing", {
				Size = TypesUDim2.new(0.5, 0, 1, 0),
				AnchorPoint = TypesVector2.new(0, 0),
				Position = TypesUDim2.fromScale(0.5, 0),
				Visible = function(Callback): boolean
					-- upvalues: FormulaResult4 (copy), Range (upval), CivilDateModule (upval), FormulaResult (copy), NewLayoutOrder (copy)
					return not (not Callback(FormulaResult4) or (CivilDateModule.compare(Callback(FormulaResult), (assert(Callback(Range).finish))) == 0 or NewLayoutOrder == 7))
				end
			})
		})
		
		for _, child in Band:GetChildren() do
			child:AddTag("facet-calendar-band")
		end
		local Cap = FrameFunction("Cap", { Visible = capped, ZIndex = 2, p1.corner(DISC) })
		Cap:AddTag("facet-calendar-band")
		local Today1 = FrameFunction("Today", {
			Visible = function(Callback): boolean
				-- upvalues: CivilDateModule (upval), FormulaResult (copy), Today (upval)
				return CivilDateModule.compare(Callback(FormulaResult), Callback(Today)) == 0
			end,
			ZIndex = 4,
			BackgroundTransparency = 1,
			p1.corner(DISC),
			Host.UIStroke({ Thickness = 1 })
		})
		Today1:AddTag("facet-calendar-today")
		local Day = p1.text({
			Name = "Day",
			ZIndex = 5,
			Text = function(Callback): string
				-- upvalues: FormulaResult (copy)
				return (tostring(Callback(FormulaResult).day))
			end,
			AutomaticSize = TypesEnum.AutomaticSize.None,
			Size = TypesUDim2.fromScale(1, 1),
			TextXAlignment = TypesEnum.TextXAlignment.Center
		})
		Day:AddTag("facet-calendar-number")
		TagWhileFunction(Day, "facet-calendar-banded", function(Callback)
			-- upvalues: FormulaResult4 (copy)
			return Callback(FormulaResult4)
		end)
		TagWhileFunction(Day, "facet-calendar-dim", function(Callback)
			-- upvalues: FormulaResult1 (copy), FormulaResult2 (copy)
			return Callback(FormulaResult1) or Callback(FormulaResult2)
		end)
		TagWhileFunction(Day, if IsRange then "facet-calendar-chosen-end" else "facet-calendar-chosen", function(Callback)
			-- upvalues: FormulaResult3 (copy)
			return Callback(FormulaResult3)
		end)
		local Strike = FrameFunction("Strike", {
			ZIndex = 6,
			Size = TypesUDim2.new(0.5, 0, 0, 1),
			Visible = function(Callback)
				-- upvalues: FormulaResult2 (copy)
				return Callback(FormulaResult2)
			end
		})
		Strike:AddTag("facet-calendar-strike")
		local ButtonResult = nil
		ButtonResult = p2.Button({
			Name = `D{LayoutOrder}`,
			LayoutOrder = LayoutOrder,
			label = "",
			name = function(Callback): string
				-- upvalues: p5 (upval), FormulaResult (copy), FormulaResult2 (copy)
				return p5.longName(Callback(FormulaResult)) .. (if Callback(FormulaResult2) then ", unavailable" else "")
			end,
			Size = TypesUDim2.fromOffset(CELL, CELL),
			AutomaticSize = TypesEnum.AutomaticSize.None,
			enabled = function(p9)
				-- upvalues: InteractiveFunction (upval)
				return InteractiveFunction(p9)
			end,
			Selectable = function(Callback): boolean
				-- upvalues: InteractiveFunction (upval), FormulaResult1 (copy)
				return InteractiveFunction(Callback) and not Callback(FormulaResult1)
			end,
			NextSelectionUp = function(Callback)
				-- upvalues: Key (copy), LayoutOrder (copy), CivilDateModule (upval), PaneGridFunction (upval), cellFor (upval), CellResult (upval)
				return if cellFor(CivilDateModule.addDays(PaneGridFunction(Key, Callback)[LayoutOrder], -7), Callback) ~= nil then nil else Callback(CellResult)
			end,
			NextSelectionDown = function(Callback)
				-- upvalues: Key (copy), LayoutOrder (copy), CivilDateModule (upval), PaneGridFunction (upval), cellFor (upval), CellResult1 (upval)
				return if cellFor(CivilDateModule.addDays(PaneGridFunction(Key, Callback)[LayoutOrder], 7), Callback) ~= nil then nil else Callback(CellResult1)
			end,
			onActivate = function()
				-- upvalues: Inverted (upval), p5 (upval), FormulaResult (copy)
				if Inverted then
					Inverted = false
					
					return
				else
					p5.choose(FormulaResult:peek())
				end
			end,
			Host.Frame("Layers")({
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 1),
				Band,
				Cap,
				Disc,
				Today1,
				Day,
				Strike
			})
		})
		ButtonResult:AddTag("facet-calendar-day")
		
		if IsRange then
			Runtime.connect(ButtonResult, "InputBegan", function(Input)
				-- upvalues: TypesEnum (upval), Inverted (upval), FormulaResult1 (copy), grabEnd (upval), FormulaResult (copy)
				if Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.Touch then
					Inverted = false
					
					if not FormulaResult1:peek() then
						grabEnd(FormulaResult:peek())
					end
				end
			end)
		end
		Cells[Key] = Cells[Key] or {}
		Cells[Key][LayoutOrder] = ButtonResult
		CellIndex[ButtonResult] = { k = Key, i = LayoutOrder }
		Compose.cleanup(function()
			-- upvalues: Cells (upval), Key (copy), LayoutOrder (copy), ButtonResult (ref), CellIndex (upval)
			if Cells[Key] and Cells[Key][LayoutOrder] == ButtonResult then
				Cells[Key][LayoutOrder] = nil
			end
			CellIndex[ButtonResult] = nil
		end)
		
		return ButtonResult
	end
	
	return {
		cells = Cells,
		cellIndex = CellIndex,
		cellFor = cellFor,
		landing = landing,
		upTarget = CellResult,
		downTarget = CellResult1,
		pane = function(p9)
			-- upvalues: p4 (copy), p1 (copy), TypesUDim2 (copy), CELL (upval), TypesEnum (copy), TypesUDim (copy), Host (copy), CELLS (upval), dayCell (copy), PaneMonthFunction (copy), Months (copy), p5 (copy)
			local Captions = {}
			
			for i = 0, 6 do
				table.insert(Captions, p1.text({
					Name = `W{i + 1}`,
					Text = p4.weekdays[(p4.weekStart - 1 + i) % 7 + 1],
					Size = TypesUDim2.fromOffset(CELL, 20),
					AutomaticSize = TypesEnum.AutomaticSize.None,
					TextXAlignment = TypesEnum.TextXAlignment.Center
				}, nil, "caption"))
			end
			local RowResult = p1.row(Captions, { Name = "Weekdays" })
			assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).Padding = TypesUDim.new(0, 0)
			local List = {
				Host.UIListLayout({
					Wraps = true,
					FillDirection = TypesEnum.FillDirection.Horizontal,
					Padding = TypesUDim.new(0, 0),
					SortOrder = TypesEnum.SortOrder.LayoutOrder
				})
			}
			
			for i1 = 1, CELLS do
				table.insert(List, (dayCell(p9, i1)))
			end
			return p1.column({
				p1.text({
					Name = "Title",
					Text = function(p10): string
						-- upvalues: PaneMonthFunction (upval), p9 (copy), Months (upval)
						local PaneMonthResult = PaneMonthFunction(p9, p10)
						
						return `{Months[PaneMonthResult.month]} {PaneMonthResult.year}`
					end,
					Visible = function(Callback)
						-- upvalues: p5 (upval)
						return Callback(p5.dual)
					end,
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}, nil, "label"),
				RowResult,
				(Host.Frame("Days")({
					BackgroundTransparency = 1,
					Size = TypesUDim2.fromOffset(7 * CELL, 6 * CELL),
					table.unpack(List)
				}))
			}, { Name = `Pane{p9}` })
		end,
		navigate = function(p10)
			-- upvalues: Selected (copy), CellIndex (copy), CivilDateModule (upval), PaneGridFunction (copy), cellFor (copy), CanPageFunction (copy), Cells (copy), Gui (copy), p1 (copy), InteractiveFunction (copy), PageFunction (copy), TypesEnum (copy), Compose (copy), landing (copy)
			local function _(Callback)
				-- upvalues: Selected (upval), CellIndex (upval)
				local CallbackResult = if Callback then Callback(Selected) else Selected:peek()
				local CellIndexEntry = if CallbackResult == nil then nil else CellIndex[CallbackResult]
				
				if CellIndexEntry == nil then
					return nil, nil
				else
					return CellIndexEntry.k, CellIndexEntry.i
				end
			end
			
			local function plan(Value: number, Callback)
				-- upvalues: Selected (upval), CellIndex (upval), CivilDateModule (upval), PaneGridFunction (upval), cellFor (upval), CanPageFunction (upval)
				local CallbackResult = if Callback then Callback(Selected) else Selected:peek()
				local CellIndexEntry = if CallbackResult == nil then nil else CellIndex[CallbackResult]
				local K = nil
				local I = nil
				
				if CellIndexEntry == nil then
					K = nil
					I = nil
				else
					K = CellIndexEntry.k
					I = CellIndexEntry.i
				end
				if K == nil or I == nil then
					return nil, nil
				end
				local AddDaysResult = CivilDateModule.addDays(PaneGridFunction(K, Callback)[I], Value)
				
				if cellFor(AddDaysResult, Callback) ~= nil then
					return "move", AddDaysResult
				elseif math.abs(Value) == 1 and CanPageFunction(Value, Callback) then
					return "page", AddDaysResult
				else
					return nil, nil
				end
			end
			
			local _ = function(p11)
				-- upvalues: cellFor (upval), Cells (upval), Gui (upval), p1 (upval)
				local CellForResult, CellForResult2 = cellFor(p11)
				local Cell = if CellForResult then Cells[CellForResult] else nil
				local CellEntry = if Cell and CellForResult2 then Cell[CellForResult2] else nil
				
				if Gui and CellEntry then
					p1.selection.set(CellEntry)
				end
			end
			
			local function walk(p11, p12, p13)
				-- upvalues: p1 (upval), p10 (copy), InteractiveFunction (upval), plan (copy), PageFunction (upval), cellFor (upval), Cells (upval), Gui (upval)
				p1.action(p10, p11, p13, function(p14): boolean
					-- upvalues: InteractiveFunction (upval), plan (upval), p12 (copy)
					return InteractiveFunction(p14) and plan(p12, p14) ~= nil
				end, function()
					-- upvalues: plan (upval), p12 (copy), PageFunction (upval), cellFor (upval), Cells (upval), Gui (upval), p1 (upval)
					local PlanResult, PlanResult2 = plan(p12)
					
					if PlanResult == "page" then
						PageFunction(if p12 > 0 then 1 else -1)
					end
					if PlanResult2 then
						local CellForResult, CellForResult2 = cellFor(PlanResult2)
						local Cell = if CellForResult then Cells[CellForResult] else nil
						local CellEntry = if Cell and CellForResult2 then Cell[CellForResult2] else nil
						
						if Gui and CellEntry then
							p1.selection.set(CellEntry)
						end
					end
				end, { priority = 2200 })
			end
			
			walk("CalendarLeft", -1, { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.DPadLeft })
			walk("CalendarRight", 1, { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadRight })
			walk("CalendarUp", -7, { TypesEnum.KeyCode.Up, TypesEnum.KeyCode.DPadUp })
			walk("CalendarDown", 7, { TypesEnum.KeyCode.Down, TypesEnum.KeyCode.DPadDown })
			
			local function turn(p11, p12, p13)
				-- upvalues: p1 (upval), p10 (copy), InteractiveFunction (upval), Selected (upval), CellIndex (upval), CanPageFunction (upval), PageFunction (upval)
				p1.action(p10, p11, p13, function(Callback)
					-- upvalues: InteractiveFunction (upval), Selected (upval), CellIndex (upval), CanPageFunction (upval), p12 (copy)
					local InteractiveResult = InteractiveFunction(Callback)
					
					if InteractiveResult then
						InteractiveResult = false
						local CallbackResult = if Callback then Callback(Selected) else Selected:peek()
						local CellIndexEntry = if CallbackResult == nil then nil else CellIndex[CallbackResult]
						local K = nil
						
						if CellIndexEntry == nil then
							K = nil
						else
							K = CellIndexEntry.k
							local _ = CellIndexEntry.i
						end
						if K ~= nil then
							InteractiveResult = CanPageFunction(p12, Callback)
						end
					end
					return InteractiveResult
				end, function()
					-- upvalues: PageFunction (upval), p12 (copy)
					PageFunction(p12)
				end, { priority = 2200 })
			end
			
			turn("CalendarPreviousMonth", -1, { TypesEnum.KeyCode.ButtonL1, TypesEnum.KeyCode.Comma })
			turn("CalendarNextMonth", 1, { TypesEnum.KeyCode.ButtonR1, TypesEnum.KeyCode.Period })
			
			if Gui then
				local PeekResult = Selected:peek()
				Compose.watch(function(Callback)
					-- upvalues: Selected (upval), CellIndex (upval), PeekResult (ref), Cells (upval), landing (upval), p1 (upval)
					local CallbackResult = Callback(Selected)
					local NoCellIndexEntry: boolean = CallbackResult ~= nil and (CellIndex[CallbackResult] ~= nil and (PeekResult ~= nil and CellIndex[PeekResult] == nil))
					PeekResult = CallbackResult
					
					if NoCellIndexEntry then
						local Cell = Cells[1]
						local CellEntry = if Cell then Cell[landing()] else nil
						
						if CellEntry and CellEntry ~= CallbackResult and CellEntry.Selectable then
							p1.selection.set(CellEntry)
						end
					end
				end)
			end
		end
	}
end