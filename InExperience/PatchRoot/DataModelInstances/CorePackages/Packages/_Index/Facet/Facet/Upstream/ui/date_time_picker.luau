local FieldChromeModule = require("./field_chrome")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./input_props")
local _ = require("../vendor/compose/core")
local DateTimePartsModule = require("./date_time_parts")
local DateTimeOptionsModule = require("./date_time_options")
local DateTimeStateModule = require("./date_time_state")
local DateTimeCalendarModule = require("./date_time_calendar")
local DateTimePanelModule = require("./date_time_panel")
local DateTimeFieldModule = require("./date_time_field")
local list = {
	"selection", "value", "onChange", "onCommit", "range", "onRangeChange",
	"onRangeCommit", "time", "minuteStep", "hourCycle", "min", "max",
	"isDateDisabled", "weekStart", "locale", "clock", "referenceDate", "presets",
	"draft", "style", "format", "placeholder", "isPresented", "onPresentedChange",
	"onDismiss", "enabled", "readOnly", "label", "requiredMark", "hint",
	"errorText", "controlSize", "appearance", "corners"
}

return function(p1, p2, p3)
	-- upvalues: FieldChromeModule (copy), DateTimePartsModule (copy), list (copy), DateTimeOptionsModule (copy), DateTimeStateModule (copy), DateTimeCalendarModule (copy), DateTimePanelModule (copy), DateTimeFieldModule (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local FieldChromeModuleResult = FieldChromeModule(p1)
	local NewDateTimeParts = DateTimePartsModule.new(p1)
	local Gui = NewDateTimeParts.gui
	p2.DateTimePicker = p1.construct("DateTimePicker", function(Spec)
		-- upvalues: p1 (copy), list (upval), DateTimeOptionsModule (upval), FieldChromeModuleResult (copy), DateTimeStateModule (upval), NewDateTimeParts (copy), DateTimeCalendarModule (upval), p2 (copy), DateTimePanelModule (upval), Compose (copy), Gui (copy), DateTimeFieldModule (upval), p3 (copy), Runtime (copy)
		local PropsResult = p1.props(Spec, list, { Name = "DateTimePicker" })
		local DateTimeOptionsModuleResult = DateTimeOptionsModule(p1, FieldChromeModuleResult, Spec)
		local DateTimeStateModuleResult = DateTimeStateModule(p1, NewDateTimeParts, Spec, DateTimeOptionsModuleResult)
		local DateTimeCalendarModuleResult = DateTimeCalendarModule(p1, p2, NewDateTimeParts, DateTimeOptionsModuleResult, DateTimeStateModuleResult)
		local DateTimePanelModuleResult = DateTimePanelModule(p1, p2, NewDateTimeParts, Spec, DateTimeOptionsModuleResult, DateTimeStateModuleResult, DateTimeCalendarModuleResult)
		local Overlay = DateTimeOptionsModuleResult.overlay
		local Diagnostics = DateTimeStateModuleResult.diagnostics
		local Room = DateTimeStateModuleResult.room
		local Dual = DateTimeStateModuleResult.dual
		local Presented = DateTimeStateModuleResult.presented
		local TypedError = DateTimeStateModuleResult.typedError
		local Enabled = DateTimeStateModuleResult.enabled
		local LandingFunction = DateTimeCalendarModuleResult.landing
		local Spec1 = {
			label = Spec.label,
			requiredMark = Spec.requiredMark,
			hint = Spec.hint,
			errorText = Spec.errorText,
			controlSize = if Overlay then Spec.controlSize else nil,
			appearance = Spec.appearance,
			corners = Spec.corners
		}
		local CellResult = Compose.cell(if Overlay then "popover" else "inline")
		local WrapResult = nil
		
		if Overlay then
			WrapResult = DateTimeFieldModule(p1, p2, p3, NewDateTimeParts, FieldChromeModuleResult, Spec, DateTimeOptionsModuleResult, DateTimeStateModuleResult, DateTimeCalendarModuleResult, DateTimePanelModuleResult, Spec1, PropsResult, CellResult)
		else
			WrapResult = FieldChromeModuleResult.wrap({
				control = "DateTimePicker",
				spec = Spec1,
				plate = DateTimePanelModuleResult(function(): string
					return "inline"
				end),
				focus = function()
					-- upvalues: DateTimeCalendarModuleResult (copy), Gui (upval), LandingFunction (copy), p1 (upval)
					local Cell = DateTimeCalendarModuleResult.cells[1]
					
					if Gui and Cell and Cell[LandingFunction()] then
						p1.selection.set(Cell[LandingFunction()])
					end
				end,
				enabled = Enabled,
				message = TypedError,
				native = PropsResult
			})
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(WrapResult)
			Compose.watch(function(Callback)
				-- upvalues: AbsoluteSizeResult (copy), Room (copy)
				Room:set(Callback(AbsoluteSizeResult).X)
			end)
		end
		Runtime.decorate(WrapResult, {
			Attributes = {
				month = function(Callback): string
					-- upvalues: DateTimeStateModuleResult (copy)
					local CallbackResult = Callback(DateTimeStateModuleResult.viewMonth)
					
					return string.format("%04d-%02d", CallbackResult.year, CallbackResult.month)
				end,
				dual = function(Callback)
					-- upvalues: Dual (copy)
					return Callback(Dual)
				end,
				route = function(Callback)
					-- upvalues: CellResult (copy)
					return Callback(CellResult)
				end,
				presented = function(Callback)
					-- upvalues: Presented (copy)
					return Callback(Presented)
				end,
				text = function(Callback)
					-- upvalues: DateTimeStateModuleResult (copy)
					return Callback(DateTimeStateModuleResult.valueText)
				end,
				typedError = function(Callback)
					-- upvalues: TypedError (copy)
					return Callback(TypedError)
				end,
				diagnostics = function(Callback): number
					-- upvalues: Diagnostics (copy)
					return #Callback(Diagnostics)
				end
			}
		})
		WrapResult:AddTag("facet-date-time-picker")
		
		return WrapResult
	end)
end