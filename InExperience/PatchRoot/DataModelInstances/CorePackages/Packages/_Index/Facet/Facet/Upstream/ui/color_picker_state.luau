local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./color_picker_types")
local _ = require("./input_props")
local ColorPickerKitModule = require("./color_picker_kit")
local IsColorFunction = ColorPickerKitModule.isColor
local UnitFunction = ColorPickerKitModule.unit
local WritableFunction = ColorPickerKitModule.writable
local MODELABEL = ColorPickerKitModule.MODE_LABEL
local MAXCOLUMNS = ColorPickerKitModule.MAX_COLUMNS

local function _(p1, Callback)
	if Callback ~= nil and type(Callback) ~= "function" then
		error(`Facet UI.ColorPicker: \`{p1}\` is a function.`, 0)
	end
end

return function(p2, p3, Spec)
	-- upvalues: IsColorFunction (copy), WritableFunction (copy), UnitFunction (copy), MODELABEL (copy), MAXCOLUMNS (copy), ColorPickerKitModule (copy)
	local Compose = p2.Compose
	local ReadFunction = p2.read
	local ReadSourceFunction = p2.readSource
	local TypesEnum = p2.types.Enum
	local Color = p3.color
	local NormalizeFunction = p3.normalize
	
	local function _(p4)
		error(`Facet UI.ColorPicker: {p4}`, 0)
	end
	
	if Spec.allowEmpty ~= nil and type(Spec.allowEmpty) ~= "boolean" then
		error("Facet UI.ColorPicker: `allowEmpty` is true or false.", 0)
	end
	local IsAllowEmpty = Spec.allowEmpty == true
	local ReadResult = ReadFunction(Spec.value)
	
	if not IsColorFunction(ReadResult) and (ReadResult ~= nil or not IsAllowEmpty) then
		error("Facet UI.ColorPicker: `value` is a Color3 (or a readable one); nil only with `allowEmpty = true`.", 0)
	end
	local OnChangeFunction = Spec.onChange
	
	if OnChangeFunction ~= nil and type(OnChangeFunction) ~= "function" then
		error("Facet UI.ColorPicker: `onChange` is a function.", 0)
	end
	local OnCommitFunction = Spec.onCommit
	
	if OnCommitFunction ~= nil and type(OnCommitFunction) ~= "function" then
		error("Facet UI.ColorPicker: `onCommit` is a function.", 0)
	end
	local OnAlphaChangeFunction = Spec.onAlphaChange
	
	if OnAlphaChangeFunction ~= nil and type(OnAlphaChangeFunction) ~= "function" then
		error("Facet UI.ColorPicker: `onAlphaChange` is a function.", 0)
	end
	local OnPresentedChangeFunction = Spec.onPresentedChange
	
	if OnPresentedChangeFunction ~= nil and type(OnPresentedChangeFunction) ~= "function" then
		error("Facet UI.ColorPicker: `onPresentedChange` is a function.", 0)
	end
	local OnDismissFunction = Spec.onDismiss
	
	if OnDismissFunction ~= nil and type(OnDismissFunction) ~= "function" then
		error("Facet UI.ColorPicker: `onDismiss` is a function.", 0)
	end
	local OnSaveSwatchFunction = Spec.onSaveSwatch
	
	if OnSaveSwatchFunction ~= nil and type(OnSaveSwatchFunction) ~= "function" then
		error("Facet UI.ColorPicker: `onSaveSwatch` is a function.", 0)
	end
	local OnRemoveSwatchFunction = Spec.onRemoveSwatch
	
	if OnRemoveSwatchFunction ~= nil and type(OnRemoveSwatchFunction) ~= "function" then
		error("Facet UI.ColorPicker: `onRemoveSwatch` is a function.", 0)
	end
	local ReadResult1 = ReadFunction(Spec.readOnly)
	
	if ReadResult1 ~= nil and type(ReadResult1) ~= "boolean" then
		error("Facet UI.ColorPicker: `readOnly` is a boolean or a readable boolean.", 0)
	end
	if Spec.onChange == nil and not WritableFunction(Spec.value) and ReadResult1 ~= true then
		error("Facet UI.ColorPicker: an interactive ColorPicker needs `onChange(color)` or a writable cell; only a readOnly one may omit it.", 0)
	end
	local HasAlpha = Spec.alpha ~= nil
	
	if HasAlpha then
		if not UnitFunction(ReadFunction(Spec.alpha)) then
			error("Facet UI.ColorPicker: `alpha` is a number from 0 to 1 (or a readable one).", 0)
		end
		if Spec.onAlphaChange == nil and not WritableFunction(Spec.alpha) and ReadResult1 ~= true then
			error("Facet UI.ColorPicker: `alpha` needs `onAlphaChange(alpha)`: the pair mounts the opacity control.", 0)
		end
	elseif Spec.onAlphaChange ~= nil then
		error("Facet UI.ColorPicker: `onAlphaChange` needs `alpha`: without it there is no opacity to change.", 0)
	end
	local Style = Spec.style or "automatic"
	
	if Style ~= "automatic" and Style ~= "inline" then
		error("Facet UI.ColorPicker: `style` is \"automatic\" (a well that opens the panel) or \"inline\" (the panel in place).", 0)
	end
	if Style == "inline" and (Spec.isPresented ~= nil or Spec.onPresentedChange ~= nil) then
		error("Facet UI.ColorPicker: an inline panel is always shown: `isPresented` and `onPresentedChange` belong to the well.", 0)
	end
	if Spec.draft ~= nil and type(Spec.draft) ~= "boolean" then
		error("Facet UI.ColorPicker: `draft` is true or false.", 0)
	end
	local IsDraft = Spec.draft == true
	
	if Spec.placeholder ~= nil and type(Spec.placeholder) ~= "string" then
		error("Facet UI.ColorPicker: `placeholder` is a string.", 0)
	end
	local List = {}
	local Modes = Spec.modes or (if p2.types.BrickColor then { "swatches", "spectrum", "sliders", "brick" } else { "swatches", "spectrum", "sliders" })
	
	if Compose.isValue(Modes) or type(Modes) ~= "table" or #Modes == 0 then
		error("Facet UI.ColorPicker: `modes` is a non-empty list of \"swatches\" | \"spectrum\" | \"sliders\" | \"brick\", fixed at construction.", 0)
	end
	local t = {}
	
	for _, value in assert(Modes) do
		if type(value) ~= "string" or MODELABEL[value] == nil or t[value] then
			error(`Facet UI.ColorPicker: {`\`modes\` names each of "swatches" | "spectrum" | "sliders" | "brick" at most once (got '{tostring(value)}').`}`, 0)
		end
		t[value] = true
		table.insert(List, value)
	end
	local HasFoundIndex = table.find(List, "brick") ~= nil
	
	if HasFoundIndex and p2.types.BrickColor == nil then
		error("Facet UI.ColorPicker: the brick mode needs BrickColor in the controls' `types`.", 0)
	end
	if Spec.swatches ~= nil then
		local _, NormalizeResult2 = NormalizeFunction(ReadFunction(Spec.swatches))
		
		if NormalizeResult2 ~= nil then
			error(`Facet UI.ColorPicker: {`\`swatches\` {NormalizeResult2}.`}`, 0)
		end
	end
	p3.chrome.check("ColorPicker", Spec)
	local HasLabel = Spec.label ~= nil
	local CellResult = Compose.cell({})
	
	local function note(Message)
		-- upvalues: CellResult (copy)
		local PeekResult = CellResult:peek()
		
		if PeekResult[#PeekResult] ~= Message then
			local Copy = table.clone(PeekResult)
			table.insert(Copy, Message)
			
			if #Copy > 16 then
				table.remove(Copy, 1)
			end
			CellResult:set(Copy)
		end
	end
	
	local _ = function(p4)
		-- upvalues: IsColorFunction (upval), IsAllowEmpty (copy)
		return IsColorFunction(p4) or p4 == nil and IsAllowEmpty
	end
	
	local CellResult1 = Compose.cell(ReadResult)
	Compose.watch(function(p4)
		-- upvalues: ReadFunction (copy), Spec (copy), IsColorFunction (upval), IsAllowEmpty (copy), CellResult1 (copy), note (copy)
		local ReadResult = ReadFunction(Spec.value, p4)
		
		if IsColorFunction(ReadResult) or ReadResult == nil and IsAllowEmpty then
			CellResult1:set(ReadResult)
			
			return
		else
			note(`Facet UI.ColorPicker: \`value\` {if IsAllowEmpty then "is a Color3 or nil" else "is a Color3"}; keeping the last legal value`)
		end
	end)
	local CellResult2 = Compose.cell(if HasAlpha then ReadFunction(Spec.alpha or 1) else 1)
	
	if HasAlpha then
		Compose.watch(function(p5)
			-- upvalues: ReadFunction (copy), Spec (copy), UnitFunction (upval), CellResult2 (copy), note (copy)
			local ReadResult = ReadFunction(Spec.alpha or 1, p5)
			
			if UnitFunction(ReadResult) then
				CellResult2:set(ReadResult)
				
				return
			else
				note("Facet UI.ColorPicker: `alpha` is a number from 0 to 1; keeping the last legal value")
			end
		end)
	end
	if Spec.swatches ~= nil then
		Compose.watch(function(p5)
			-- upvalues: NormalizeFunction (copy), ReadFunction (copy), Spec (copy), note (copy)
			local _, NormalizeResult2 = NormalizeFunction(ReadFunction(Spec.swatches, p5))
			
			if NormalizeResult2 ~= nil then
				note(`Facet UI.ColorPicker: \`swatches\` {NormalizeResult2}; showing none`)
			end
		end)
	end
	local function enabled(p5): boolean
		-- upvalues: ReadFunction (copy), Spec (copy)
		return ReadFunction(Spec.enabled, p5) ~= false
	end
	
	local function interactive(p5): boolean
		-- upvalues: ReadFunction (copy), Spec (copy)
		return ReadFunction(Spec.enabled, p5) ~= false and ReadFunction(Spec.readOnly, p5) ~= true
	end
	
	local Flag = false
	Compose.cleanup(function()
		-- upvalues: Flag (ref)
		Flag = true
	end)
	
	local function mayEdit(): boolean
		-- upvalues: Flag (ref), ReadFunction (copy), Spec (copy)
		return not Flag and (ReadFunction(Spec.enabled, nil) ~= false and ReadFunction(Spec.readOnly, nil) ~= true)
	end
	
	local CellResult3 = Compose.cell(Color.hsvOf(ReadResult or p3.WHITE))
	local config = {
		value = CellResult1:peek(),
		alpha = CellResult2:peek(),
		canon = CellResult3:peek()
	}
	
	local _ = function()
		-- upvalues: config (ref), CellResult1 (copy), CellResult2 (copy), CellResult3 (copy)
		config = {
			value = CellResult1:peek(),
			alpha = CellResult2:peek(),
			canon = CellResult3:peek()
		}
	end
	
	local Value = nil
	local Alpha = nil
	Compose.watch(function(Callback)
		-- upvalues: CellResult1 (copy), Value (ref), Color (copy), CellResult3 (copy), config (ref)
		local CallbackResult = Callback(CellResult1)
		
		if Value ~= nil and CallbackResult ~= nil and Color.same(CallbackResult, Value) then
			Value = nil
			
			return
		end
		if CallbackResult ~= nil and not Color.same(CallbackResult, Color.toColor(CellResult3:peek())) then
			CellResult3:set(Color.hsvOf(CallbackResult, CellResult3:peek()))
		end
		local config1 = config
		local PeekResult = CellResult3:peek()
		config.value = CellResult1:peek()
		config1.canon = PeekResult
	end)
	Compose.watch(function(Callback)
		-- upvalues: CellResult2 (copy), Alpha (ref), config (ref)
		local CallbackResult = Callback(CellResult2)
		
		if Alpha == nil or CallbackResult ~= Alpha then
			config.alpha = CallbackResult
			
			return
		else
			Alpha = nil
		end
	end)
	
	local _ = function(p5)
		-- upvalues: Spec (copy), WritableFunction (upval)
		if Spec.onChange then
			Spec.onChange(p5)
			
			return
		end
		if WritableFunction(Spec.value) then
			Spec.value:set(p5)
		end
	end
	
	local _ = function(p5)
		-- upvalues: Spec (copy), WritableFunction (upval)
		if Spec.onAlphaChange then
			Spec.onAlphaChange(p5)
			
			return
		end
		if WritableFunction(Spec.alpha) then
			Spec.alpha:set(p5)
		end
	end
	
	local _ = function()
		-- upvalues: ReadFunction (copy), Spec (copy)
		local ReadResult = ReadFunction(Spec.value)
		
		return if typeof(ReadResult) == "Color3" then ReadResult else nil
	end
	
	local function propose(p5, p6): boolean
		-- upvalues: Flag (ref), ReadFunction (copy), Spec (copy), Color (copy), CellResult3 (copy), Value (ref), WritableFunction (upval)
		if Flag or (ReadFunction(Spec.enabled, nil) == false or ReadFunction(Spec.readOnly, nil) == true) then
			return false
		end
		local P15 = p6 or Color.toColor(p5)
		local ReadResult = ReadFunction(Spec.value)
		local ReadResult1 = if typeof(ReadResult) == "Color3" then ReadResult else nil
		
		if ReadResult1 ~= nil and Color.same(ReadResult1, P15) then
			CellResult3:set(p5)
			
			return true
		end
		Value = P15
		
		if Spec.onChange then
			Spec.onChange(P15)
		elseif WritableFunction(Spec.value) then
			Spec.value:set(P15)
		end
		local ReadResult2 = ReadFunction(Spec.value)
		local ReadResult21 = if typeof(ReadResult2) == "Color3" then ReadResult2 else nil
		
		if ReadResult21 == nil or not Color.same(ReadResult21, P15) then
			Value = nil
			
			return false
		else
			CellResult3:set(p5)
			
			return true
		end
	end
	
	local function proposeAlpha(Value: number): boolean
		-- upvalues: Flag (ref), ReadFunction (copy), Spec (copy), HasAlpha (copy), CellResult2 (copy), Alpha (ref), WritableFunction (upval)
		if Flag or (ReadFunction(Spec.enabled, nil) == false or ReadFunction(Spec.readOnly, nil) == true) or not HasAlpha then
			return false
		end
		local ClampedValue = math.clamp(Value, 0, 1)
		
		if ClampedValue == CellResult2:peek() then
			return false
		end
		Alpha = ClampedValue
		
		if Spec.onAlphaChange then
			Spec.onAlphaChange(ClampedValue)
		elseif WritableFunction(Spec.alpha) then
			Spec.alpha:set(ClampedValue)
		end
		if ReadFunction(Spec.alpha) == ClampedValue then
			return true
		else
			Alpha = nil
			
			return false
		end
	end
	
	local function commit()
		-- upvalues: Spec (copy), Flag (ref), IsDraft (copy), CellResult1 (copy)
		local OnCommitFunction: (any) -> () = Spec.onCommit
		
		if Flag or IsDraft or OnCommitFunction == nil then return end
		local PeekResult = CellResult1:peek()
		
		if PeekResult ~= nil then
			OnCommitFunction(PeekResult)
		end
	end
	
	local function apply()
		-- upvalues: CellResult1 (copy), Spec (copy), config (ref), CellResult2 (copy), CellResult3 (copy)
		local PeekResult = CellResult1:peek()
		
		if Spec.onCommit ~= nil and PeekResult ~= nil then
			Spec.onCommit(PeekResult)
		end
		config = {
			value = CellResult1:peek(),
			alpha = CellResult2:peek(),
			canon = CellResult3:peek()
		}
	end
	
	local function restore()
		-- upvalues: config (ref), Flag (ref), CellResult1 (copy), Color (copy), Value (ref), Spec (copy), WritableFunction (upval), HasAlpha (copy), CellResult2 (copy), Alpha (ref), CellResult3 (copy)
		local config1 = config
		
		if Flag then return end
		local PeekResult = CellResult1:peek()
		
		if PeekResult == nil ~= (config1.value == nil) or not Color.same(PeekResult, config1.value) then
			Value = config1.value
			local Value1 = config1.value
			
			if Spec.onChange then
				Spec.onChange(Value1)
			elseif WritableFunction(Spec.value) then
				Spec.value:set(Value1)
			end
		end
		if HasAlpha and CellResult2:peek() ~= config1.alpha then
			Alpha = config1.alpha
			local Alpha1 = config1.alpha
			
			if Spec.onAlphaChange then
				Spec.onAlphaChange(Alpha1)
			elseif WritableFunction(Spec.alpha) then
				Spec.alpha:set(Alpha1)
			end
		end
		CellResult3:set(config1.canon)
	end
	
	local function brickName(p5)
		-- upvalues: HasFoundIndex (copy), Color (copy)
		if p5 == nil or not HasFoundIndex then
			return nil
		end
		for _, value in Color.brick() do
			if Color.same(value.color, p5) then
				return value.label
			end
		end
		return nil
	end
	
	local function valueText(p6)
		-- upvalues: ReadSourceFunction (copy), CellResult1 (copy), Spec (copy), CellResult2 (copy), Color (copy), HasAlpha (copy)
		local Source = ReadSourceFunction(CellResult1, p6)
		
		if Source == nil then
			return Spec.placeholder or ""
		else
			local Source1: number = ReadSourceFunction(CellResult2, p6)
			
			return Color.hex(Source, if HasAlpha and Source1 < 1 then Source1 else nil)
		end
	end
	
	local function semanticName(p6)
		-- upvalues: brickName (copy), ReadSourceFunction (copy), CellResult1 (copy), Spec (copy), CellResult2 (copy), Color (copy), HasAlpha (copy), ReadFunction (copy)
		local BrickNameResult = brickName(ReadSourceFunction(CellResult1, p6))
		
		if not BrickNameResult then
			local Source = ReadSourceFunction(CellResult1, p6)
			
			if Source == nil then
				BrickNameResult = Spec.placeholder or ""
			else
				local Source1: number = ReadSourceFunction(CellResult2, p6)
				BrickNameResult = Color.hex(Source, if HasAlpha and Source1 < 1 then Source1 else nil)
			end
		end
		local ReadResult = ReadFunction(Spec.label, p6)
		
		return if type(ReadResult) == "string" and ReadResult ~= "" then `{ReadResult}, {BrickNameResult}` else BrickNameResult
	end
	
	local function currentPaint(Callback)
		-- upvalues: CellResult1 (copy), CellResult2 (copy)
		return {
			color = Callback(CellResult1),
			alpha = Callback(CellResult2)
		}
	end
	
	local GuiService = p2.config.services.GuiService
	local UserInputService = p2.config.services.UserInputService
	local ObserveResult = if GuiService then p2.selection.observe() else Compose.cell(nil)
	local PreferredInputResult = if UserInputService then p2.observe.PreferredInput(UserInputService) else Compose.cell(nil)
	
	local function touch(p6): boolean
		-- upvalues: ReadFunction (copy), PreferredInputResult (copy), TypesEnum (copy)
		return ReadFunction(PreferredInputResult, p6) == TypesEnum.PreferredInput.Touch
	end
	
	local function gamepad(p6): boolean
		-- upvalues: ReadFunction (copy), PreferredInputResult (copy), TypesEnum (copy)
		return ReadFunction(PreferredInputResult, p6) == TypesEnum.PreferredInput.Gamepad
	end
	
	local CellResult4 = Compose.cell(false)
	
	local function presented(p6)
		-- upvalues: Spec (copy), ReadFunction (copy), ReadSourceFunction (copy), CellResult4 (copy)
		return if Spec.isPresented == nil then ReadSourceFunction(CellResult4, p6) else ReadFunction(Spec.isPresented, p6) == true
	end
	
	local function requestPresented(p6)
		-- upvalues: Flag (ref), ReadFunction (copy), Spec (copy), WritableFunction (upval), CellResult4 (copy)
		if p6 and (Flag or (ReadFunction(Spec.enabled, nil) == false or ReadFunction(Spec.readOnly, nil) == true)) then return end
		if Spec.onPresentedChange then
			Spec.onPresentedChange(p6)
			
			return
		end
		if Spec.isPresented == nil then
			CellResult4:set(p6)
		elseif WritableFunction(Spec.isPresented) then
			Spec.isPresented:set(p6)
			
			return
		end
	end
	
	local v1 = false
	Compose.watch(function(p6)
		-- upvalues: Spec (copy), ReadFunction (copy), ReadSourceFunction (copy), CellResult4 (copy), v1 (ref), config (ref), CellResult1 (copy), CellResult2 (copy), CellResult3 (copy)
		local Source = if Spec.isPresented == nil then ReadSourceFunction(CellResult4, p6) else ReadFunction(Spec.isPresented, p6) == true
		
		if Source and not v1 then
			config = {
				value = CellResult1:peek(),
				alpha = CellResult2:peek(),
				canon = CellResult3:peek()
			}
		end
		v1 = Source
	end)
	local CellResult5 = Compose.cell(MAXCOLUMNS)
	local UchFloor = p2.touchFloor()
	
	return {
		spec = Spec,
		hasAlpha = HasAlpha,
		style = Style,
		draft = IsDraft,
		modes = List,
		labelled = HasLabel,
		diagnostics = CellResult,
		held = CellResult1,
		alphaHeld = CellResult2,
		canon = CellResult3,
		enabled = enabled,
		interactive = interactive,
		mayEdit = mayEdit,
		propose = propose,
		proposeAlpha = proposeAlpha,
		commit = commit,
		apply = apply,
		restore = restore,
		brickName = brickName,
		valueText = valueText,
		semanticName = semanticName,
		currentPaint = currentPaint,
		gui = GuiService,
		selected = ObserveResult,
		preferred = PreferredInputResult,
		touch = touch,
		gamepad = gamepad,
		presented = presented,
		requestPresented = requestPresented,
		close = function(p6)
			-- upvalues: Style (copy), Spec (copy), ReadFunction (copy), ReadSourceFunction (copy), CellResult4 (copy), IsDraft (copy), restore (copy), WritableFunction (upval)
			if Style == "inline" or not (if Spec.isPresented == nil then ReadSourceFunction(CellResult4, nil) else ReadFunction(Spec.isPresented, nil) == true) then return end
			if IsDraft and p6 ~= "apply" then
				restore()
			end
			if Spec.onPresentedChange then
				Spec.onPresentedChange(false)
			elseif Spec.isPresented == nil then
				CellResult4:set(false)
			elseif WritableFunction(Spec.isPresented) then
				Spec.isPresented:set(false)
			end
			if Spec.onDismiss then
				Spec.onDismiss(p6)
			end
		end,
		modeCell = Compose.cell(List[1]),
		formatCell = Compose.cell("rgb"),
		hexError = Compose.cell(""),
		placement = Compose.cell(if Style == "inline" then "inline" else "closed"),
		columns = CellResult5,
		cellSize = function(p6): number
			-- upvalues: ColorPickerKitModule (upval), UchFloor (copy)
			return (math.max(ColorPickerKitModule.CELL, UchFloor(p6)))
		end,
		editing = Compose.cell(false),
		saving = Spec.onSaveSwatch ~= nil,
		removing = Spec.onRemoveSwatch ~= nil,
		swatchList = Compose.formula(function(Callback)
			-- upvalues: Spec (copy), Color (copy), CellResult5 (copy), NormalizeFunction (copy), ReadFunction (copy)
			return if Spec.swatches == nil then Color.standard(Callback(CellResult5)) else NormalizeFunction(ReadFunction(Spec.swatches, Callback)) or {}
		end)
	}
end