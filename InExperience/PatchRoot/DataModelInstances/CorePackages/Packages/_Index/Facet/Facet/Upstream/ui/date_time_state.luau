local CivilDateModule = require("./civil_date")
local _ = require("./types")
local _ = require("./date_time_picker_types")
local _ = require("./input_props")
local _ = require("../vendor/compose/core")
local DateTimePartsModule = require("./date_time_parts")
local _ = require("./date_time_options")
local CELL = DateTimePartsModule.CELL
local GAP = DateTimePartsModule.GAP
local SpanFunction = DateTimePartsModule.span
local MonthOfFunction = DateTimePartsModule.monthOf
local SameRangeFunction = DateTimePartsModule.sameRange

return function(p1, p2, p3, p4)
	-- upvalues: CivilDateModule (copy), MonthOfFunction (copy), CELL (copy), GAP (copy), SameRangeFunction (copy), SpanFunction (copy)
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local Gui = p2.gui
	local Input = p2.input
	local IsRange = p4.isRange
	local WithTime = p4.withTime
	local Draft = p4.draft
	local Overlay = p4.overlay
	local Months = p4.months
	local ClockFunction = p4.clock
	local CellResult = Compose.cell({})
	
	local function _(p5)
		-- upvalues: CellResult (copy), p1 (copy)
		local Copy = table.clone(CellResult:peek())
		table.insert(Copy, p5)
		CellResult:set(Copy)
		
		if p1.config.onError then
			p1.config.onError(p5)
		end
	end
	
	local _ = function(p5, p6, Callback)
		-- upvalues: Compose (copy), ReadFunction (copy), CellResult (copy), p1 (copy)
		local CellResult1 = Compose.cell(ReadFunction(p6))
		local Flag = false
		Compose.watch(function(p7)
			-- upvalues: ReadFunction (upval), p6 (copy), Callback (copy), Flag (ref), CellResult1 (copy), p5 (copy), CellResult (upval), p1 (upval)
			local ReadResult = ReadFunction(p6, p7)
			
			if Callback(ReadResult) then
				Flag = false
				CellResult1:set(ReadResult)
				
				return
			end
			if not Flag then
				Flag = true
				local Message: string = `Facet UI.DateTimePicker: {p5} is not a legal value; the picker keeps the last one.`
				local Copy = table.clone(CellResult:peek())
				table.insert(Copy, Message)
				CellResult:set(Copy)
				
				if p1.config.onError then
					p1.config.onError(Message)
				end
			end
		end)
		
		return CellResult1
	end
	
	local function optionalDate(p5): boolean
		-- upvalues: CivilDateModule (upval)
		return p5 == nil or CivilDateModule.problem(p5) == nil
	end
	
	local Value = p3.value
	
	local function v23(p5): boolean
		-- upvalues: CivilDateModule (upval), WithTime (copy)
		return p5 == nil or CivilDateModule.problem(p5, WithTime) == nil
	end
	
	local CellResult1 = Compose.cell(ReadFunction(Value))
	local Flag = false
	local v1 = "value"
	Compose.watch(function(p5)
		-- upvalues: ReadFunction (copy), Value (copy), v23 (copy), Flag (ref), CellResult1 (copy), v1 (copy), CellResult (copy), p1 (copy)
		local ReadResult = ReadFunction(Value, p5)
		
		if v23(ReadResult) then
			Flag = false
			CellResult1:set(ReadResult)
			
			return
		end
		if not Flag then
			Flag = true
			local Message: string = `Facet UI.DateTimePicker: {v1} is not a legal value; the picker keeps the last one.`
			local Copy = table.clone(CellResult:peek())
			table.insert(Copy, Message)
			CellResult:set(Copy)
			
			if p1.config.onError then
				p1.config.onError(Message)
			end
		end
	end)
	local T = if IsRange then assert(p3.range) else {}
	
	local function v28(p5): boolean
		-- upvalues: CivilDateModule (upval)
		if type(p5) ~= "table" then
			return false
		end
		local Start = p5.start
		local NoStart: boolean = Start == nil or CivilDateModule.problem(Start) == nil
		
		if NoStart then
			local Finish = p5.finish
			NoStart = (Finish == nil or CivilDateModule.problem(Finish) == nil) and not (p5.start ~= nil and (p5.finish ~= nil and CivilDateModule.compare(p5.start, p5.finish) > 0))
		end
		return NoStart
	end
	
	local CellResult2 = Compose.cell(ReadFunction(T))
	local Flag1 = false
	local v2 = "range"
	Compose.watch(function(p5)
		-- upvalues: ReadFunction (copy), T (copy), v28 (copy), Flag1 (ref), CellResult2 (copy), v2 (copy), CellResult (copy), p1 (copy)
		local ReadResult = ReadFunction(T, p5)
		
		if v28(ReadResult) then
			Flag1 = false
			CellResult2:set(ReadResult)
			
			return
		end
		if not Flag1 then
			Flag1 = true
			local Message: string = `Facet UI.DateTimePicker: {v2} is not a legal value; the picker keeps the last one.`
			local Copy = table.clone(CellResult:peek())
			table.insert(Copy, Message)
			CellResult:set(Copy)
			
			if p1.config.onError then
				p1.config.onError(Message)
			end
		end
	end)
	local Min = p3.min
	local CellResult3 = Compose.cell(ReadFunction(Min))
	local Flag2 = false
	local v3 = "min"
	Compose.watch(function(p5)
		-- upvalues: ReadFunction (copy), Min (copy), optionalDate (copy), Flag2 (ref), CellResult3 (copy), v3 (copy), CellResult (copy), p1 (copy)
		local ReadResult = ReadFunction(Min, p5)
		
		if optionalDate(ReadResult) then
			Flag2 = false
			CellResult3:set(ReadResult)
			
			return
		end
		if not Flag2 then
			Flag2 = true
			local Message: string = `Facet UI.DateTimePicker: {v3} is not a legal value; the picker keeps the last one.`
			local Copy = table.clone(CellResult:peek())
			table.insert(Copy, Message)
			CellResult:set(Copy)
			
			if p1.config.onError then
				p1.config.onError(Message)
			end
		end
	end)
	local Max = p3.max
	local CellResult4 = Compose.cell(ReadFunction(Max))
	local Flag3 = false
	local v4 = "max"
	Compose.watch(function(p5)
		-- upvalues: ReadFunction (copy), Max (copy), optionalDate (copy), Flag3 (ref), CellResult4 (copy), v4 (copy), CellResult (copy), p1 (copy)
		local ReadResult = ReadFunction(Max, p5)
		
		if optionalDate(ReadResult) then
			Flag3 = false
			CellResult4:set(ReadResult)
			
			return
		end
		if not Flag3 then
			Flag3 = true
			local Message: string = `Facet UI.DateTimePicker: {v4} is not a legal value; the picker keeps the last one.`
			local Copy = table.clone(CellResult:peek())
			table.insert(Copy, Message)
			CellResult:set(Copy)
			
			if p1.config.onError then
				p1.config.onError(Message)
			end
		end
	end)
	local ReferenceDate = p3.referenceDate
	local CellResult5 = Compose.cell(ReadFunction(ReferenceDate))
	local Flag4 = false
	local v5 = "referenceDate"
	Compose.watch(function(p5)
		-- upvalues: ReadFunction (copy), ReferenceDate (copy), optionalDate (copy), Flag4 (ref), CellResult5 (copy), v5 (copy), CellResult (copy), p1 (copy)
		local ReadResult = ReadFunction(ReferenceDate, p5)
		
		if optionalDate(ReadResult) then
			Flag4 = false
			CellResult5:set(ReadResult)
			
			return
		end
		if not Flag4 then
			Flag4 = true
			local Message: string = `Facet UI.DateTimePicker: {v5} is not a legal value; the picker keeps the last one.`
			local Copy = table.clone(CellResult:peek())
			table.insert(Copy, Message)
			CellResult:set(Copy)
			
			if p1.config.onError then
				p1.config.onError(Message)
			end
		end
	end)
	
	local function enabled(p5): boolean
		-- upvalues: ReadFunction (copy), p3 (copy)
		return ReadFunction(p3.enabled, p5) ~= false
	end
	
	local function interactive(p5)
		-- upvalues: ReadFunction (copy), p3 (copy), p4 (copy)
		return ReadFunction(p3.enabled, p5) ~= false and (ReadFunction(p3.readOnly, p5) ~= true and p4.hasProposer)
	end
	
	local CellResult6 = Compose.cell(CivilDateModule.dateOf(ClockFunction()))
	local Flag5 = false
	Compose.cleanup(function()
		-- upvalues: Flag5 (ref)
		Flag5 = true
	end)
	
	local function mayEdit()
		-- upvalues: Flag5 (ref), ReadFunction (copy), p3 (copy), p4 (copy)
		return not Flag5 and (ReadFunction(p3.enabled, nil) ~= false and (ReadFunction(p3.readOnly, nil) ~= true and p4.hasProposer))
	end
	
	local function isDisabled(p5, Callback): boolean
		-- upvalues: CellResult3 (copy), CellResult4 (copy), CivilDateModule (upval), p3 (copy)
		if CivilDateModule.within(p5, if Callback then Callback(CellResult3) else CellResult3:peek(), if Callback then Callback(CellResult4) else CellResult4:peek()) then
			local IsDateDisabledFunction = p3.isDateDisabled
			
			return IsDateDisabledFunction ~= nil and IsDateDisabledFunction(CivilDateModule.dateOf(p5)) == true
		else
			return true
		end
	end
	
	local function anchorDate()
		-- upvalues: IsRange (copy), CellResult2 (copy), CellResult1 (copy), CellResult5 (copy), CellResult6 (copy)
		return (if IsRange then CellResult2:peek().start else CellResult1:peek()) or (CellResult5:peek() or CellResult6:peek())
	end
	
	local CellResult7 = Compose.cell(MonthOfFunction((if IsRange then CellResult2:peek().start else CellResult1:peek()) or (CellResult5:peek() or CellResult6:peek())))
	
	local function peekMonth()
		-- upvalues: CellResult7 (copy)
		return CellResult7:peek()
	end
	
	local function paneMonth(p5: number, Callback)
		-- upvalues: CellResult7 (copy), CivilDateModule (upval)
		return CivilDateModule.addMonths(if Callback then Callback(CellResult7) else CellResult7:peek(), p5 - 1)
	end
	
	local FormulaResults = {}
	local v6 = 1
	local v7: number = if IsRange then 2 else 1
	for i = v6, v7 do
		FormulaResults[i] = Compose.formula(function(Callback)
			-- upvalues: i (copy), CellResult7 (copy), CivilDateModule (upval), p4 (copy)
			local AddMonthsResult = CivilDateModule.addMonths(if Callback then Callback(CellResult7) else CellResult7:peek(), i - 1)
			
			return CivilDateModule.monthGrid(AddMonthsResult.year, AddMonthsResult.month, p4.weekStart)
		end)
	end
	local function paneGrid(p5, Callback)
		-- upvalues: FormulaResults (copy)
		local FormulaResult = FormulaResults[p5]
		
		return if Callback then Callback(FormulaResult) else FormulaResult:peek()
	end
	
	local CellResult8 = Compose.cell(0)
	local FormulaResult = Compose.formula(function(Callback): boolean
		-- upvalues: IsRange (copy), CellResult8 (copy), CELL (upval), GAP (upval)
		return IsRange and 14 * CELL + GAP <= Callback(CellResult8)
	end)
	
	local function panes(Callback): number
		-- upvalues: FormulaResult (copy)
		return if if Callback then Callback(FormulaResult) else FormulaResult:peek() then 2 else 1
	end
	
	local function monthClosed(AddMonthsResult, Callback): boolean
		-- upvalues: CellResult3 (copy), CellResult4 (copy), CivilDateModule (upval), MonthOfFunction (upval)
		local CallbackResult = if Callback then Callback(CellResult3) else CellResult3:peek()
		local CallbackResult1 = if Callback then Callback(CellResult4) else CellResult4:peek()
		local config = {
			year = AddMonthsResult.year,
			month = AddMonthsResult.month,
			day = CivilDateModule.daysIn(AddMonthsResult.year, AddMonthsResult.month)
		}
		
		return if CallbackResult == nil then CallbackResult1 ~= nil and CivilDateModule.compare(MonthOfFunction(AddMonthsResult), CallbackResult1) > 0 else CivilDateModule.compare(config, CallbackResult) < 0 or CallbackResult1 ~= nil and CivilDateModule.compare(MonthOfFunction(AddMonthsResult), CallbackResult1) > 0
	end
	
	local function canPage(p5: number, Callback): boolean
		-- upvalues: FormulaResult (copy), CellResult7 (copy), CivilDateModule (upval), monthClosed (copy)
		local v8 = nil
		if p5 > 0 then
			local CallbackResult = if Callback then Callback(FormulaResult) else FormulaResult:peek()
			v8 = p5 + (if CallbackResult then 2 else 1) - 1
		else
			v8 = p5
		end
		return not monthClosed(CivilDateModule.addMonths(if Callback then Callback(CellResult7) else CellResult7:peek(), v8 + 1 - 1), Callback)
	end
	
	local function page(p5: number): boolean
		-- upvalues: FormulaResult (copy), CellResult7 (copy), CivilDateModule (upval), monthClosed (copy)
		if not monthClosed(CivilDateModule.addMonths(CellResult7:peek(), (if p5 > 0 then p5 + (if FormulaResult:peek() then 2 else 1) - 1 else p5) + 1 - 1), nil) then
			CellResult7:set(CivilDateModule.addMonths(CellResult7:peek(), p5))
			
			return true
		else
			return false
		end
	end
	
	local Flag6 = false
	local Config = { v = nil }
	
	local _ = function()
		-- upvalues: IsRange (copy), CellResult2 (copy), CellResult1 (copy)
		return if IsRange then CellResult2:peek() else CellResult1:peek()
	end
	
	local function same(PeekResult, p5)
		-- upvalues: IsRange (copy), SameRangeFunction (upval), CivilDateModule (upval)
		return if IsRange then SameRangeFunction(PeekResult, p5) else CivilDateModule.same(PeekResult, p5)
	end
	
	local function takeSnapshot()
		-- upvalues: Config (ref), IsRange (copy), CellResult2 (copy), CellResult1 (copy)
		Config = {
			v = if IsRange then CellResult2:peek() else CellResult1:peek()
		}
	end
	
	Config = {
		v = if IsRange then CellResult2:peek() else CellResult1:peek()
	}
	Compose.watch(function(Callback: (any) -> ())
		-- upvalues: IsRange (copy), CellResult2 (copy), CellResult1 (copy), Flag6 (ref), Config (ref)
		if IsRange then
			Callback(CellResult2)
		else
			Callback(CellResult1)
		end
		if not Flag6 then
			Config = {
				v = if IsRange then CellResult2:peek() else CellResult1:peek()
			}
		end
	end)
	
	local _ = function(p5)
		-- upvalues: Flag6 (ref), IsRange (copy), p4 (copy)
		Flag6 = true
		local Success, Result = pcall(function()
			-- upvalues: IsRange (upval), p4 (upval), p5 (copy)
			if IsRange then
				assert(p4.proposeRange)(p5)
				
				return
			else
				assert(p4.proposeSingle)(p5)
			end
		end)
		Flag6 = false
		
		if not Success then
			error(Result, 0)
		end
	end
	
	local function propose(p5)
		-- upvalues: Flag5 (ref), ReadFunction (copy), p3 (copy), p4 (copy), Flag6 (ref), IsRange (copy), same (copy), CellResult2 (copy), CellResult1 (copy)
		if Flag5 or (ReadFunction(p3.enabled, nil) == false or (ReadFunction(p3.readOnly, nil) == true or not p4.hasProposer)) then
			return false
		end
		Flag6 = true
		local Success, Result = pcall(function()
			-- upvalues: IsRange (upval), p4 (upval), p5 (copy)
			if IsRange then
				assert(p4.proposeRange)(p5)
				
				return
			else
				assert(p4.proposeSingle)(p5)
			end
		end)
		Flag6 = false
		
		if not Success then
			error(Result, 0)
		end
		return same(if IsRange then CellResult2:peek() else CellResult1:peek(), p5)
	end
	
	local function commit()
		-- upvalues: Flag5 (ref), IsRange (copy), CellResult2 (copy), p3 (copy), CellResult1 (copy)
		if Flag5 then return end
		if IsRange then
			local PeekResult = CellResult2:peek()
			
			if p3.onRangeCommit ~= nil and PeekResult.start ~= nil and PeekResult.finish ~= nil then
				p3.onRangeCommit(PeekResult)
				
				return
			end
		elseif p3.onCommit ~= nil then
			p3.onCommit(CellResult1:peek())
		end
	end
	
	local function restore()
		-- upvalues: Flag5 (ref), ReadFunction (copy), p3 (copy), p4 (copy), IsRange (copy), CellResult2 (copy), CellResult1 (copy), Config (ref), SameRangeFunction (upval), CivilDateModule (upval), Flag6 (ref)
		if Flag5 or (Flag5 or (ReadFunction(p3.enabled, nil) == false or (ReadFunction(p3.readOnly, nil) == true or not p4.hasProposer))) then return end
		local PeekResult = if IsRange then CellResult2:peek() else CellResult1:peek()
		local V = Config.v
		
		if not (if IsRange then SameRangeFunction(PeekResult, V) else CivilDateModule.same(PeekResult, V)) then
			local V1 = Config.v
			Flag6 = true
			local Success, Result = pcall(function()
				-- upvalues: IsRange (upval), p4 (upval), V1 (copy)
				if IsRange then
					assert(p4.proposeRange)(V1)
					
					return
				else
					assert(p4.proposeSingle)(V1)
				end
			end)
			Flag6 = false
			
			if not Success then
				error(Result, 0)
			end
		end
	end
	
	local CellResult9 = Compose.cell(false)
	local FormulaResult1 = Compose.formula(function(Callback)
		-- upvalues: Overlay (copy), p3 (copy), ReadFunction (copy), CellResult9 (copy)
		return not Overlay or (if p3.isPresented == nil then Callback(CellResult9) else ReadFunction(p3.isPresented, Callback) == true)
	end)
	local v8 = nil
	
	local function requestPresented(p5)
		-- upvalues: Flag5 (ref), ReadFunction (copy), p3 (copy), p4 (copy), CellResult9 (copy)
		if p5 and (Flag5 or (ReadFunction(p3.enabled, nil) == false or (ReadFunction(p3.readOnly, nil) == true or not p4.hasProposer))) then return end
		if p3.onPresentedChange ~= nil then
			p3.onPresentedChange(p5)
			
			return
		end
		if p3.isPresented == nil then
			CellResult9:set(p5)
			
			return
		end
		local IsPresented = p3.isPresented
		
		if type(IsPresented) == "table" and type(IsPresented.set) == "function" then
			p3.isPresented:set(p5)
		end
	end
	
	local function close(p5)
		-- upvalues: Overlay (copy), FormulaResult1 (copy), Draft (copy), Flag5 (ref), ReadFunction (copy), p3 (copy), p4 (copy), IsRange (copy), CellResult2 (copy), CellResult1 (copy), Config (ref), SameRangeFunction (upval), CivilDateModule (upval), Flag6 (ref), v8 (ref), requestPresented (copy)
		if not Overlay or not FormulaResult1:peek() then return end
		if Draft and p5 ~= "apply" and not Flag5 and (not Flag5 and (ReadFunction(p3.enabled, nil) ~= false and (ReadFunction(p3.readOnly, nil) ~= true and p4.hasProposer))) then
			local PeekResult = if IsRange then CellResult2:peek() else CellResult1:peek()
			local V = Config.v
			
			if not (if IsRange then SameRangeFunction(PeekResult, V) else CivilDateModule.same(PeekResult, V)) then
				local V1 = Config.v
				Flag6 = true
				local Success, Result = pcall(function()
					-- upvalues: IsRange (upval), p4 (upval), V1 (copy)
					if IsRange then
						assert(p4.proposeRange)(V1)
						
						return
					else
						assert(p4.proposeSingle)(V1)
					end
				end)
				Flag6 = false
				
				if not Success then
					error(Result, 0)
				end
			end
		end
		v8 = p5
		requestPresented(false)
	end
	
	local PeekResult = FormulaResult1:peek()
	Compose.watch(function(Callback)
		-- upvalues: FormulaResult1 (copy), PeekResult (ref), Config (ref), IsRange (copy), CellResult2 (copy), CellResult1 (copy), CellResult6 (copy), CivilDateModule (upval), ClockFunction (copy), CellResult7 (copy), MonthOfFunction (upval), CellResult5 (copy), Overlay (copy), v8 (ref), p3 (copy)
		local CallbackResult = Callback(FormulaResult1)
		
		if CallbackResult and not PeekResult then
			Config = {
				v = if IsRange then CellResult2:peek() else CellResult1:peek()
			}
			CellResult6:set(CivilDateModule.dateOf(ClockFunction()))
			CellResult7:set(MonthOfFunction((if IsRange then CellResult2:peek().start else CellResult1:peek()) or (CellResult5:peek() or CellResult6:peek())))
		elseif not CallbackResult and PeekResult and Overlay then
			local V75 = v8 or "cancel"
			v8 = nil
			
			if p3.onDismiss then
				p3.onDismiss(V75)
			end
		end
		PeekResult = CallbackResult
	end)
	
	local _ = function(p5)
		-- upvalues: p3 (copy), CivilDateModule (upval), p4 (copy)
		return if p5 == nil then "" elseif p3.format == nil then CivilDateModule.format(p5, p4.locale) else p3.format(p5)
	end
	
	local PreferredInputResult = if Input and Input.GetPropertyChangedSignal then p1.observe.PreferredInput(Input) else Compose.cell(nil)
	
	return {
		diagnostics = CellResult,
		value = CellResult1,
		range = CellResult2,
		minDate = CellResult3,
		maxDate = CellResult4,
		enabled = enabled,
		interactive = interactive,
		today = CellResult6,
		mayEdit = mayEdit,
		isDisabled = isDisabled,
		anchorDate = anchorDate,
		viewMonth = CellResult7,
		peekMonth = peekMonth,
		paneMonth = paneMonth,
		paneGrid = paneGrid,
		room = CellResult8,
		dual = FormulaResult,
		panes = panes,
		monthClosed = monthClosed,
		canPage = canPage,
		page = page,
		takeSnapshot = takeSnapshot,
		propose = propose,
		commit = commit,
		restore = restore,
		presented = FormulaResult1,
		requestPresented = requestPresented,
		close = close,
		choose = function(p5)
			-- upvalues: Flag5 (ref), ReadFunction (copy), p3 (copy), p4 (copy), isDisabled (copy), CivilDateModule (upval), IsRange (copy), CellResult1 (copy), WithTime (copy), Flag6 (ref), CellResult2 (copy), SameRangeFunction (upval), CellResult7 (copy), MonthOfFunction (upval), FormulaResult (copy), Draft (copy), commit (copy), Overlay (copy), FormulaResult1 (copy), Config (ref), v8 (ref), requestPresented (copy), SpanFunction (upval)
			if Flag5 or (ReadFunction(p3.enabled, nil) == false or (ReadFunction(p3.readOnly, nil) == true or not p4.hasProposer)) or isDisabled(p5) then return end
			local DateOfResult = CivilDateModule.dateOf(p5)
			
			if IsRange then
				local PeekResult1 = CellResult2:peek()
				local SpanResult = if PeekResult1.start == nil or PeekResult1.finish ~= nil then SpanFunction(DateOfResult, nil) elseif CivilDateModule.compare(DateOfResult, PeekResult1.start) < 0 then SpanFunction(DateOfResult, PeekResult1.start) else SpanFunction(PeekResult1.start, DateOfResult)
				local SameResult = nil
				
				if not Flag5 and (ReadFunction(p3.enabled, nil) ~= false and (ReadFunction(p3.readOnly, nil) ~= true and p4.hasProposer)) then
					Flag6 = true
					local Success2, Result2 = pcall(function()
						-- upvalues: IsRange (upval), p4 (upval), SpanResult (copy)
						if IsRange then
							assert(p4.proposeRange)(SpanResult)
							
							return
						else
							assert(p4.proposeSingle)(SpanResult)
						end
					end)
					Flag6 = false
					
					if not Success2 then
						error(Result2, 0)
					end
					local PeekResult = if IsRange then CellResult2:peek() else CellResult1:peek()
					SameResult = if IsRange then SameRangeFunction(PeekResult, SpanResult) else CivilDateModule.same(PeekResult, SpanResult)
				else
					SameResult = false
				end
				if SameResult and SpanResult.finish ~= nil and not Draft then
					commit()
					
					if Overlay then
						if not FormulaResult1:peek() then return end
						if Draft and not Flag5 and (not Flag5 and (ReadFunction(p3.enabled, nil) ~= false and (ReadFunction(p3.readOnly, nil) ~= true and p4.hasProposer))) then
							local PeekResult = if IsRange then CellResult2:peek() else CellResult1:peek()
							local V1 = Config.v
							
							if not (if IsRange then SameRangeFunction(PeekResult, V1) else CivilDateModule.same(PeekResult, V1)) then
								local V2 = Config.v
								Flag6 = true
								local Success3, Result3 = pcall(function()
									-- upvalues: IsRange (upval), p4 (upval), V2 (copy)
									if IsRange then
										assert(p4.proposeRange)(V2)
										
										return
									else
										assert(p4.proposeSingle)(V2)
									end
								end)
								Flag6 = false
								
								if not Success3 then
									error(Result3, 0)
								end
							end
						end
						v8 = "activate"
						requestPresented(false)
					end
				end
				return
			else
				local PeekResult = CellResult1:peek()
				
				if WithTime then
					DateOfResult.hour = if PeekResult == nil or PeekResult.hour == nil then 0 else PeekResult.hour
					DateOfResult.minute = if PeekResult == nil or PeekResult.minute == nil then 0 else PeekResult.minute
				end
				local SameResult = nil
				if not Flag5 and (ReadFunction(p3.enabled, nil) ~= false and (ReadFunction(p3.readOnly, nil) ~= true and p4.hasProposer)) then
					Flag6 = true
					local Success, Result = pcall(function()
						-- upvalues: IsRange (upval), p4 (upval), DateOfResult (copy)
						if IsRange then
							assert(p4.proposeRange)(DateOfResult)
							
							return
						else
							assert(p4.proposeSingle)(DateOfResult)
						end
					end)
					Flag6 = false
					
					if not Success then
						error(Result, 0)
					end
					local PeekResult2 = if IsRange then CellResult2:peek() else CellResult1:peek()
					SameResult = if IsRange then SameRangeFunction(PeekResult2, DateOfResult) else CivilDateModule.same(PeekResult2, DateOfResult)
				else
					SameResult = false
				end
				if not SameResult then return end
				local PeekResult3 = CellResult7:peek()
				
				if (DateOfResult.month ~= PeekResult3.month or DateOfResult.year ~= PeekResult3.year) and (not CivilDateModule.same(MonthOfFunction(DateOfResult), CivilDateModule.addMonths(PeekResult3, 1)) or not FormulaResult:peek()) then
					CellResult7:set(MonthOfFunction(DateOfResult))
				end
				if not Draft then
					commit()
					
					if not WithTime and Overlay then
						if not FormulaResult1:peek() then return end
						if Draft and not Flag5 and (not Flag5 and (ReadFunction(p3.enabled, nil) ~= false and (ReadFunction(p3.readOnly, nil) ~= true and p4.hasProposer))) then
							local PeekResult4 = if IsRange then CellResult2:peek() else CellResult1:peek()
							local V = Config.v
							
							if not (if IsRange then SameRangeFunction(PeekResult4, V) else CivilDateModule.same(PeekResult4, V)) then
								local V3 = Config.v
								Flag6 = true
								local Success1, Result1 = pcall(function()
									-- upvalues: IsRange (upval), p4 (upval), V3 (copy)
									if IsRange then
										assert(p4.proposeRange)(V3)
										
										return
									else
										assert(p4.proposeSingle)(V3)
									end
								end)
								Flag6 = false
								
								if not Success1 then
									error(Result1, 0)
								end
							end
						end
						v8 = "activate"
						requestPresented(false)
					end
				end
			end
		end,
		typedError = Compose.cell(""),
		valueText = Compose.formula(function(Callback)
			-- upvalues: IsRange (copy), CellResult2 (copy), p3 (copy), CivilDateModule (upval), p4 (copy), CellResult1 (copy)
			if not IsRange then
				local CallbackResult1 = Callback(CellResult1)
				
				return if CallbackResult1 == nil then "" elseif p3.format == nil then CivilDateModule.format(CallbackResult1, p4.locale) else p3.format(CallbackResult1)
			end
			local CallbackResult = Callback(CellResult2)
			
			if CallbackResult.start == nil then
				return ""
			end
			local v9 = "%* – %*"
			local Start = CallbackResult.start
			local FormatResult = if Start == nil then "" elseif p3.format == nil then CivilDateModule.format(Start, p4.locale) else p3.format(Start)
			local FormatResult1 = nil
			
			if CallbackResult.finish == nil then
				FormatResult1 = "…"
			else
				local Finish = CallbackResult.finish
				FormatResult1 = if Finish == nil then "" elseif p3.format == nil then CivilDateModule.format(Finish, p4.locale) else p3.format(Finish)
			end
			return (v9:format(FormatResult, FormatResult1))
		end),
		longName = function(p5): string
			-- upvalues: Months (copy)
			return `{Months[p5.month]} {p5.day}, {p5.year}`
		end,
		preferred = PreferredInputResult,
		prefers = function(p5, Callback): boolean
			-- upvalues: PreferredInputResult (copy)
			return Callback(PreferredInputResult) == p5
		end,
		typedEntry = Compose.formula(function(Callback): boolean
			-- upvalues: p3 (copy), PreferredInputResult (copy), TypesEnum (copy)
			if p3.format == nil then
				local CallbackResult = Callback(PreferredInputResult)
				
				return CallbackResult == nil or CallbackResult == TypesEnum.PreferredInput.KeyboardAndMouse
			else
				return false
			end
		end),
		selected = if Gui and Gui.GetPropertyChangedSignal then p1.selection.observe() else Compose.cell(nil)
	}
end