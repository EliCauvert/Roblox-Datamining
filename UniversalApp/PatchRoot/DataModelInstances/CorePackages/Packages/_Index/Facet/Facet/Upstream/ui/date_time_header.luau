local CivilDateModule = require("./civil_date")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./date_time_picker_types")
local _ = require("../vendor/compose/core")
local DateTimePartsModule = require("./date_time_parts")
local _ = require("./date_time_options")
local _ = require("./date_time_state")
local _ = require("./date_time_calendar")
local CELL = DateTimePartsModule.CELL
local YEARSPAN = DateTimePartsModule.YEAR_SPAN
local ROW = DateTimePartsModule.ROW
local MonthOfFunction = DateTimePartsModule.monthOf

return function(p1, p2, p3, p4, p5)
	-- upvalues: CivilDateModule (copy), MonthOfFunction (copy), YEARSPAN (copy), CELL (copy), ROW (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local ViewMonth = p4.viewMonth
	local MinDate = p4.minDate
	local MaxDate = p4.maxDate
	local PeekMonthFunction = p4.peekMonth
	local InteractiveFunction = p4.interactive
	local UpTarget = p5.upTarget
	
	local function menu(Name, Callback1, Callback, OnChange, MaxHeight)
		-- upvalues: Compose (copy), PeekMonthFunction (copy), ViewMonth (copy), p1 (copy), p2 (copy), InteractiveFunction (copy)
		local CellResult = Compose.cell(Callback(PeekMonthFunction()))
		Compose.watch(function(Callback1)
			-- upvalues: CellResult (copy), Callback (copy), ViewMonth (upval)
			CellResult:set(Callback(Callback1(ViewMonth)))
		end)
		
		return p2.Menu({
			presentation = "menu",
			align = "center",
			items = function(p6)
				-- upvalues: Callback1 (copy), CellResult (copy), OnChange (copy)
				local List = {}
				
				for _, value in Callback1(p6) do
					table.insert(List, {
						dismiss = true,
						id = tostring(value.value),
						label = value.label,
						selected = CellResult,
						value = value.value,
						enabled = value.enabled,
						onChange = OnChange
					})
				end
				return List
			end,
			trigger = p1.styled(p2.Button({
				trailingIcon = "chevron.down",
				appearance = "utility",
				Name = Name,
				label = function(Callback)
					-- upvalues: CellResult (copy), Callback1 (copy)
					local CallbackResult = Callback(CellResult)
					
					for _, value in Callback1(Callback) do
						if value.value == CallbackResult then
							return value.label
						end
					end
					return (tostring(CallbackResult))
				end,
				enabled = function(p7)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p7)
				end
			}), "calendar-choice"),
			maxHeight = MaxHeight,
			enabled = function(p7)
				-- upvalues: InteractiveFunction (upval)
				return InteractiveFunction(p7)
			end
		})
	end
	
	local function landIn(p7)
		-- upvalues: MinDate (copy), MaxDate (copy), CivilDateModule (upval), MonthOfFunction (upval), ViewMonth (copy)
		local PeekResult = MinDate:peek()
		local PeekResult1 = MaxDate:peek()
		
		if PeekResult == nil or CivilDateModule.compare(p7, MonthOfFunction(PeekResult)) >= 0 then
			if PeekResult1 ~= nil and CivilDateModule.compare(p7, MonthOfFunction(PeekResult1)) > 0 then
				p7 = MonthOfFunction(PeekResult1)
			end
		else
			p7 = MonthOfFunction(PeekResult)
		end
		ViewMonth:set(p7)
	end
	
	return function()
		-- upvalues: menu (copy), p3 (copy), p4 (copy), ViewMonth (copy), landIn (copy), PeekMonthFunction (copy), MinDate (copy), MaxDate (copy), YEARSPAN (upval), CELL (upval), UpTarget (copy), p2 (copy), InteractiveFunction (copy), p1 (copy), Runtime (copy), Host (copy), TypesEnum (copy), TypesUDim2 (copy), ROW (upval)
		local Month = menu("Month", function(_)
			-- upvalues: p3 (upval), p4 (upval), ViewMonth (upval)
			local List = {}
			
			for i = 1, 12 do
				table.insert(List, {
					value = i,
					label = p3.months[i],
					enabled = function(Callback): boolean
						-- upvalues: p4 (upval), ViewMonth (upval), i (copy)
						return not p4.monthClosed({ day = 1, year = Callback(ViewMonth).year, month = i }, Callback)
					end
				})
			end
			return List
		end, function(p7)
			return p7.month
		end, function(Month)
			-- upvalues: landIn (upval), PeekMonthFunction (upval)
			landIn({ day = 1, year = PeekMonthFunction().year, month = Month })
		end)
		local Year = menu("Year", function(Callback)
			-- upvalues: ViewMonth (upval), MinDate (upval), MaxDate (upval), YEARSPAN (upval)
			local Year = Callback(ViewMonth).year
			local CallbackResult = Callback(MinDate)
			local CallbackResult1 = Callback(MaxDate)
			local List = {}
			local Largest = math.max(Year - YEARSPAN, if CallbackResult then CallbackResult.year else -1e999)
			local NewYear = Year + YEARSPAN
			local Year1 = if CallbackResult1 then CallbackResult1.year else 1e999
			for i = Largest, math.min(NewYear, Year1) do
				table.insert(List, {
					value = i,
					label = tostring(i),
					enabled = function(): boolean
						return true
					end
				})
			end
			return List
		end, function(p7)
			return p7.year
		end, function(Year)
			-- upvalues: landIn (upval), PeekMonthFunction (upval)
			landIn({ day = 1, year = Year, month = PeekMonthFunction().month })
		end, 5 * CELL)
		UpTarget:set(Month)
		
		local function arrow(p7, Icon, Name, p8)
			-- upvalues: p2 (upval), InteractiveFunction (upval), p4 (upval)
			return p2.Button(p7)({
				shape = "circle",
				appearance = "utility",
				icon = Icon,
				name = Name,
				enabled = function(p9)
					-- upvalues: InteractiveFunction (upval), p4 (upval), p8 (copy)
					return InteractiveFunction(p9) and p4.canPage(p8, p9)
				end,
				onActivate = function()
					-- upvalues: p4 (upval), p8 (copy)
					p4.page(p8)
				end
			})
		end
		
		local RowResult = p1.row({ Month, Year }, { Name = "Choose" })
		Runtime.mountFragment(function()
			-- upvalues: Host (upval), TypesEnum (upval)
			return {
				Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
			}
		end, RowResult)
		local RowResult1 = p1.row({
			arrow("Previous", "chevron.leading", "Previous month", -1),
			RowResult,
			arrow("Next", "chevron.trailing", "Next month", 1)
		}, {
			Name = "Header",
			Size = TypesUDim2.new(1, 0, 0, ROW),
			AutomaticSize = TypesEnum.AutomaticSize.None
		})
		assert(RowResult1:FindFirstChildWhichIsA("UIListLayout")).VerticalAlignment = TypesEnum.VerticalAlignment.Center
		
		return RowResult1
	end
end