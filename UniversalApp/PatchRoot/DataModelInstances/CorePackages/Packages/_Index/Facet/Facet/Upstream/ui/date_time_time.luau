local _ = require("./input_props")
local CivilDateModule = require("./civil_date")
local _ = require("./types")
local _ = require("./date_time_picker_types")
local _ = require("./collection_props")
local _ = require("./navigation_props")
local _ = require("../vendor/compose/core")
local _ = require("./date_time_options")
local _ = require("./date_time_state")
local _ = require("./date_time_calendar")
local ROW = require("./date_time_parts").ROW

return function(p1, p2, p3, p4, p5)
	-- upvalues: CivilDateModule (copy), ROW (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Draft = p3.draft
	local MinuteStep = p3.minuteStep
	local HourCycle = p3.hourCycle
	local ClockFunction = p3.clock
	local Value = p4.value
	local AnchorDateFunction = p4.anchorDate
	local InteractiveFunction = p4.interactive
	local ProposeFunction = p4.propose
	local CommitFunction = p4.commit
	local DownTarget = p5.downTarget
	
	return function()
		-- upvalues: Value (copy), CivilDateModule (upval), AnchorDateFunction (copy), Compose (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), InteractiveFunction (copy), ProposeFunction (copy), Draft (copy), CommitFunction (copy), p2 (copy), HourCycle (copy), MinuteStep (copy), DownTarget (copy), p1 (copy), p4 (copy), ClockFunction (copy), ROW (upval), TypesVector2 (copy)
		local function _()
			-- upvalues: Value (upval), CivilDateModule (upval), AnchorDateFunction (upval)
			local PeekResult = Value:peek()
			
			if PeekResult == nil or PeekResult.hour == nil then
				local DateOfResult = CivilDateModule.dateOf(PeekResult or AnchorDateFunction())
				DateOfResult.hour = 0
				DateOfResult.minute = 0
				
				return DateOfResult
			else
				return PeekResult
			end
		end
		
		local function field(Label, Min, Max, Step, Callback, Callback1)
			-- upvalues: Compose (upval), Value (upval), TypesUDim2 (upval), TypesEnum (upval), Host (upval), InteractiveFunction (upval), ProposeFunction (upval), CivilDateModule (upval), AnchorDateFunction (upval), Draft (upval), CommitFunction (upval), p2 (upval)
			local CellResult = Compose.cell("")
			local CellResult1 = Compose.cell(Min)
			Compose.watch(function(Callback1)
				-- upvalues: Value (upval), Callback (copy), Min (copy), CellResult1 (copy), CellResult (copy)
				local CallbackResult = Callback1(Value)
				local Min1 = if CallbackResult == nil or CallbackResult.hour == nil then Min else Callback(CallbackResult)
				CellResult1:set(Min1)
				CellResult:set(if CallbackResult == nil then "" else string.format("%02d", Min1))
			end)
			
			return p2.NumberInput({
				label = Label,
				Size = TypesUDim2.new(0, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill }),
				value = CellResult,
				numericValue = CellResult1,
				min = Min,
				max = Max,
				step = Step,
				precision = 0,
				stepButtons = true,
				enabled = function(p6)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p6)
				end,
				format = function(p6): string
					return string.format("%02d", p6)
				end,
				onCommit = function(p6)
					-- upvalues: Value (upval), ProposeFunction (upval), Callback1 (copy), CivilDateModule (upval), AnchorDateFunction (upval), Callback (copy), Min (copy), CellResult1 (copy), CellResult (copy), Draft (upval), CommitFunction (upval)
					local PeekResult = Value:peek()
					local PeekResult1 = Value:peek()
					local DateOfResult1 = nil
					
					if PeekResult1 == nil or PeekResult1.hour == nil then
						local DateOfResult = CivilDateModule.dateOf(PeekResult1 or AnchorDateFunction())
						DateOfResult.hour = 0
						DateOfResult.minute = 0
						DateOfResult1 = DateOfResult
					else
						DateOfResult1 = PeekResult1
					end
					if not ProposeFunction(Callback1(DateOfResult1, p6)) then
						local Min1 = if PeekResult == nil or PeekResult.hour == nil then Min else Callback(PeekResult)
						CellResult1:set(Min1)
						CellResult:set(if PeekResult == nil then "" else string.format("%02d", Min1))
						
						return
					elseif not Draft then
						CommitFunction()
					end
				end
			}, Label)
		end
		
		local Hour = field("Hour", if HourCycle == 12 then 1 else 0, if HourCycle == 12 then 12 else 23, 1, function(p6)
			-- upvalues: HourCycle (upval)
			local Hour = p6.hour or 0
			
			return if HourCycle == 12 then if Hour % 12 == 0 then 12 else Hour % 12 else Hour
		end, function(Tbl, p6: number)
			-- upvalues: HourCycle (upval)
			local Copy = table.clone(Tbl)
			local v1 = (Tbl.hour or 0) >= 12
			Copy.hour = if HourCycle == 12 then p6 % 12 + (if v1 then 12 else 0) else p6
			
			return Copy
		end)
		local Minute = field("Minute", 0, 60 - MinuteStep, MinuteStep, function(p6)
			return p6.minute or 0
		end, function(Tbl, Minute)
			local Copy = table.clone(Tbl)
			Copy.minute = Minute
			
			return Copy
		end)
		DownTarget:set((Hour:FindFirstChild("Field", true)))
		local List = {}
		
		if HourCycle == 12 then
			local AM = Compose.cell("AM")
			Compose.watch(function(Callback)
				-- upvalues: Value (upval), AM (copy)
				local CallbackResult = Callback(Value)
				AM:set(if CallbackResult == nil or CallbackResult.hour == nil or CallbackResult.hour < 12 then "AM" else "PM")
			end)
			table.insert(List, p2.Picker({
				Name = "Half",
				style = "segmented",
				sizing = "hug",
				options = {
					{ value = "AM", label = "AM" },
					{ value = "PM", label = "PM" }
				},
				selected = AM,
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				enabled = function(p6)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p6)
				end,
				onChanging = function(p6): boolean
					-- upvalues: Value (upval), ProposeFunction (upval), Draft (upval), CommitFunction (upval)
					local PeekResult = Value:peek()
					
					if PeekResult == nil or PeekResult.hour == nil then
						return false
					end
					local Copy = table.clone(PeekResult)
					Copy.hour = PeekResult.hour % 12 + (if p6 == "PM" then 12 else 0)
					
					if not ProposeFunction(Copy) then
						return false
					end
					if not Draft then
						CommitFunction()
					end
					return true
				end
			}))
		end
		local RowResult = p1.row({ Hour, Minute }, {
			Name = "Fields",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
		assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).VerticalAlignment = TypesEnum.VerticalAlignment.Top
		local From = {}
		
		for i = 0, 1439, MinuteStep do
			table.insert(From, {
				id = `{i // 60}:{i % 60}`,
				hour = i // 60,
				minute = i % 60
			})
		end
		local ShowResult = Compose.show(function(p6)
			-- upvalues: p4 (upval), TypesEnum (upval)
			return p4.prefers(TypesEnum.PreferredInput.Touch, p6)
		end, function()
			-- upvalues: Value (upval), ClockFunction (upval), MinuteStep (upval), From (copy), ROW (upval), TypesUDim2 (upval), TypesVector2 (upval), p2 (upval), CivilDateModule (upval), HourCycle (upval), TypesEnum (upval), InteractiveFunction (upval), AnchorDateFunction (upval), ProposeFunction (upval), Draft (upval), CommitFunction (upval)
			local PeekResult = Value:peek() or ClockFunction()
			
			if PeekResult.hour == nil then
				PeekResult = ClockFunction()
			end
			return p2.VirtualList({
				Name = "Times",
				LayoutOrder = 2,
				key = "id",
				from = From,
				itemSize = ROW,
				Size = TypesUDim2.new(1, 0, 0, 4 * ROW),
				CanvasPosition = TypesVector2.new(0, (if PeekResult.hour == nil then 0 else (PeekResult.hour * 60 + (PeekResult.minute or 0)) // MinuteStep) * ROW),
				render = function(p6)
					-- upvalues: p2 (upval), CivilDateModule (upval), HourCycle (upval), TypesUDim2 (upval), ROW (upval), TypesEnum (upval), InteractiveFunction (upval), Value (upval), AnchorDateFunction (upval), ProposeFunction (upval), Draft (upval), CommitFunction (upval)
					local PeekResult = p6:peek()
					
					return p2.Button({
						Name = "Time",
						label = CivilDateModule.formatTime({
							year = 2000,
							month = 1,
							day = 1,
							hour = PeekResult.hour,
							minute = PeekResult.minute
						}, HourCycle),
						Size = TypesUDim2.new(1, 0, 0, ROW),
						AutomaticSize = TypesEnum.AutomaticSize.None,
						enabled = function(p7)
							-- upvalues: InteractiveFunction (upval)
							return InteractiveFunction(p7)
						end,
						selected = function(Callback): boolean
							-- upvalues: Value (upval), PeekResult (copy)
							local CallbackResult = Callback(Value)
							
							return CallbackResult ~= nil and (CallbackResult.hour == PeekResult.hour and CallbackResult.minute == PeekResult.minute)
						end,
						onActivate = function()
							-- upvalues: CivilDateModule (upval), Value (upval), AnchorDateFunction (upval), PeekResult (copy), ProposeFunction (upval), Draft (upval), CommitFunction (upval)
							local DateOfResult = CivilDateModule.dateOf(Value:peek() or AnchorDateFunction())
							local Minute = PeekResult.minute
							DateOfResult.hour = PeekResult.hour
							DateOfResult.minute = Minute
							
							if ProposeFunction(DateOfResult) and not Draft then
								CommitFunction()
							end
						end
					})
				end
			})
		end)
		table.insert(List, 1, RowResult)
		table.insert(List, ShowResult)
		
		return p1.column(List, {
			Name = "Time",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
	end
end