local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./input_props")
local ColorPickerKitModule = require("./color_picker_kit")
local ColorPickerStateModule = require("./color_picker_state")
local ColorPickerPanelModule = require("./color_picker_panel")
local ColorPickerWellModule = require("./color_picker_well")
local list = {
	"value", "onChange", "onCommit", "alpha", "onAlphaChange", "allowEmpty",
	"placeholder", "modes", "swatches", "onSaveSwatch", "onRemoveSwatch", "style",
	"draft", "isPresented", "onPresentedChange", "onDismiss", "enabled",
	"readOnly", "label", "requiredMark", "hint", "errorText", "controlSize",
	"appearance", "corners"
}

return function(p1, p2, p3)
	-- upvalues: ColorPickerKitModule (copy), ColorPickerStateModule (copy), ColorPickerPanelModule (copy), list (copy), ColorPickerWellModule (copy)
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local NewColorPickerKit = ColorPickerKitModule.new(p1)
	local Chrome = NewColorPickerKit.chrome
	local Color = NewColorPickerKit.color
	p2.ColorPicker = p1.construct("ColorPicker", function(p4)
		-- upvalues: ColorPickerStateModule (upval), p1 (copy), NewColorPickerKit (copy), ColorPickerPanelModule (upval), p2 (copy), p3 (copy), list (upval), TypesUDim2 (copy), TypesEnum (copy), Chrome (copy), ColorPickerWellModule (upval), Runtime (copy), Color (copy)
		local ColorPickerStateModuleResult = ColorPickerStateModule(p1, NewColorPickerKit, p4)
		local Style = ColorPickerStateModuleResult.style
		local Labelled = ColorPickerStateModuleResult.labelled
		local Diagnostics = ColorPickerStateModuleResult.diagnostics
		local Held = ColorPickerStateModuleResult.held
		local Canon = ColorPickerStateModuleResult.canon
		local PresentedFunction = ColorPickerStateModuleResult.presented
		local Placement = ColorPickerStateModuleResult.placement
		local HexError = ColorPickerStateModuleResult.hexError
		local Columns = ColorPickerStateModuleResult.columns
		local Editing = ColorPickerStateModuleResult.editing
		local Enabled = ColorPickerStateModuleResult.enabled
		local ColorPickerPanelModuleResult = ColorPickerPanelModule(p1, p2, p3, NewColorPickerKit, ColorPickerStateModuleResult)
		local PropsResult = p1.props(p4, list, {
			Name = "ColorPicker",
			BackgroundTransparency = 1,
			Size = if Labelled or Style == "inline" then TypesUDim2.new(1, 0, 0, 0) else TypesUDim2.fromOffset(0, 0),
			AutomaticSize = if Labelled or Style == "inline" then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY
		})
		local WrapResult = nil
		
		if Style == "inline" then
			local ColorPickerPanelModuleResultResult = ColorPickerPanelModuleResult(false, function(): boolean
				return false
			end, p1.Compose.cell(1e999))
			WrapResult = if Chrome.present(p4) then Chrome.wrap({
				control = "ColorPicker",
				spec = {
					label = p4.label,
					requiredMark = p4.requiredMark,
					hint = p4.hint,
					errorText = p4.errorText,
					appearance = p4.appearance
				},
				plate = ColorPickerPanelModuleResultResult.panel,
				focus = function() end,
				enabled = Enabled,
				native = PropsResult
			}) else p1.column({ ColorPickerPanelModuleResultResult.panel }, PropsResult)
		else
			WrapResult = ColorPickerWellModule(p1, p2, p3, NewColorPickerKit, ColorPickerStateModuleResult, ColorPickerPanelModuleResult, PropsResult)
		end
		Runtime.decorate(WrapResult, {
			Attributes = {
				value = function(Callback)
					-- upvalues: Held (copy), Color (upval)
					local CallbackResult = Callback(Held)
					
					return if CallbackResult == nil then "" else Color.hex(CallbackResult)
				end,
				text = function(p5)
					-- upvalues: ColorPickerStateModuleResult (copy)
					return ColorPickerStateModuleResult.valueText(p5)
				end,
				hue = function(Callback)
					-- upvalues: Canon (copy)
					return Callback(Canon).h * 360
				end,
				saturation = function(Callback)
					-- upvalues: Canon (copy)
					return Callback(Canon).s * 100
				end,
				brightness = function(Callback)
					-- upvalues: Canon (copy)
					return Callback(Canon).v * 100
				end,
				mode = function(Callback)
					-- upvalues: ColorPickerStateModuleResult (copy)
					return Callback(ColorPickerStateModuleResult.modeCell)
				end,
				format = function(Callback)
					-- upvalues: ColorPickerStateModuleResult (copy)
					return Callback(ColorPickerStateModuleResult.formatCell)
				end,
				presented = function(p5)
					-- upvalues: PresentedFunction (copy)
					return PresentedFunction(p5)
				end,
				placement = function(Callback)
					-- upvalues: Placement (copy)
					return Callback(Placement)
				end,
				hexError = function(Callback)
					-- upvalues: HexError (copy)
					return Callback(HexError)
				end,
				columns = function(Callback)
					-- upvalues: Columns (copy)
					return Callback(Columns)
				end,
				editing = function(Callback)
					-- upvalues: Editing (copy)
					return Callback(Editing)
				end,
				diagnostics = function(Callback): string
					-- upvalues: Diagnostics (copy)
					return table.concat(Callback(Diagnostics), "\n")
				end
			}
		})
		
		return p1.styled(WrapResult, "color-picker")
	end)
end