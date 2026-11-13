local _ = require("./input_types")
local _ = require("./types")
local _ = require("./input_props")
local _ = require("./control_types")
local _ = require("./input_kit")
local InputKeyGlyphModule = require("./input_key_glyph")
local _ = require("../vendor/compose/core")
local list = {
	"entries", "inputs", "controlSize", "Visible", "Selectable", "Active"
}

return function(p1, p2, p3)
	-- upvalues: InputKeyGlyphModule (copy), list (copy)
	local Runtime = p1.runtime
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local PropsFunction = p1.props
	local ReadFunction1 = p1.read
	local TypesUDim2 = p1.types.UDim2
	local TypesEnum = p1.types.Enum
	local TypesUDim = p1.types.UDim
	local InputKeyGlyphModuleResult = InputKeyGlyphModule(p1, p3.noKey)
	
	local function _(p4): boolean
		-- upvalues: TypesEnum (copy)
		return if type(p4) == "userdata" then p4.EnumType == TypesEnum.KeyCode else type(p4) == "table" and p4.EnumType == TypesEnum.KeyCode
	end
	
	local function codesOf(KeyCode)
		-- upvalues: TypesEnum (copy)
		if if type(KeyCode) == "userdata" then KeyCode.EnumType == TypesEnum.KeyCode else type(KeyCode) == "table" and KeyCode.EnumType == TypesEnum.KeyCode then
			return { KeyCode }
		end
		assert(type(KeyCode) == "table" and #KeyCode > 0, "Facet.ButtonGuide: keyCode must be a KeyCode or a nonempty list of KeyCodes")
		
		for _, value in KeyCode do
			assert(if type(value) == "userdata" then value.EnumType == TypesEnum.KeyCode else type(value) == "table" and value.EnumType == TypesEnum.KeyCode, "Facet.ButtonGuide: keyCode must be a KeyCode or a nonempty list of KeyCodes")
		end
		return KeyCode
	end
	
	local function textOf(Keys)
		-- upvalues: Compose (copy)
		if type(Keys) == "string" then
			return Keys
		end
		if type(Keys) ~= "table" or Compose.isValue(Keys) then
			return (tostring(Keys))
		end
		local List = {}
		
		for _, key in Keys do
			table.insert(List, if type(key) == "table" then table.concat(key, "+") else "?")
		end
		return table.concat(List, "/")
	end
	
	local function keyOf(p4)
		-- upvalues: codesOf (copy), textOf (copy)
		if p4.action ~= nil then
			return p4.action
		end
		if p4.keyCode == nil then
			return `keys:{textOf(p4.keys)}:{textOf(p4.label)}`
		end
		local CodesOfResult = codesOf(p4.keyCode)
		
		if #CodesOfResult == 1 then
			return CodesOfResult[1]
		end
		local List = {}
		
		for _, value in CodesOfResult do
			table.insert(List, value.Name)
		end
		return "keyCode:" .. table.concat(List, ",")
	end
	
	local function check(List)
		-- upvalues: codesOf (copy), keyOf (copy)
		assert(type(List) == "table", "Facet.ButtonGuide: entries must be a list of entries")
		local t = {}
		
		for _, value in List do
			assert(type(value) == "table", "Facet.ButtonGuide: each entry must be a table")
			assert((if value.action == nil then 0 else 1) + (if value.keys == nil then 0 else 1) + (if value.keyCode == nil then 0 else 1) == 1, "Facet.ButtonGuide: an entry takes one of action, keyCode or keys")
			assert(value.label ~= nil, "Facet.ButtonGuide: an entry needs a label")
			local Action = value.action
			
			if Action ~= nil then
				assert(Action.IsA and Action:IsA("InputAction"), "Facet.ButtonGuide: an entry action must be a native InputAction")
				assert(not t[Action], "Facet.ButtonGuide: an action appears twice; list each command once")
				t[Action] = true
				continue
			end
			if value.keyCode == nil then
				local KeyOfResult = keyOf(value)
				assert(not t[KeyOfResult], "Facet.ButtonGuide: an entry appears twice; list each command once")
				t[KeyOfResult] = true
			else
				for _, value1 in codesOf(value.keyCode) do
					assert(not t[value1], "Facet.ButtonGuide: a key appears twice; list each command once")
					t[value1] = true
				end
			end
		end
		return List
	end
	
	p2.ButtonGuide = p1.construct("ButtonGuide", function(p5)
		-- upvalues: p1 (copy), Compose (copy), p3 (copy), check (copy), ReadFunction (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), TypesUDim (copy), InputKeyGlyphModuleResult (copy), Runtime (copy), codesOf (copy), p2 (copy), PropsFunction (copy), list (upval), ReadFunction1 (copy), keyOf (copy)
		assert(p5.entries ~= nil, "Facet.ButtonGuide: entries is required")
		local Inputs = p5.inputs or { "Gamepad" }
		assert(type(Inputs) == "table" and #Inputs > 0, "Facet.ButtonGuide: inputs must be a nonempty list")
		local t = {}
		
		for _, input in Inputs do
			assert(input ~= "Touch", "Facet.ButtonGuide: a guide never shows on touch, where glyphs mean nothing")
			assert(input == "Gamepad" or input == "KeyboardAndMouse", "Facet.ButtonGuide: inputs takes Gamepad and KeyboardAndMouse")
			t[input] = true
		end
		local EffectiveInputResult = p1.effectiveInput()
		local FormulaResult = Compose.formula(function(p6): boolean
			-- upvalues: EffectiveInputResult (copy)
			return EffectiveInputResult(p6) == "Gamepad"
		end)
		local Entries = p5.entries
		
		if p3.dynamic(Entries) then
			Compose.watch(function(p6)
				-- upvalues: check (upval), ReadFunction (upval), Entries (copy)
				check(ReadFunction(Entries, p6))
			end)
		else
			check(ReadFunction(Entries))
		end
		local CellResult = Compose.cell({})
		local CellResult1 = Compose.cell(0)
		
		local function keyCodeHint(Keys, Text, p6)
			-- upvalues: TypesUDim2 (upval), TypesEnum (upval), FormulaResult (copy), Host (upval), TypesUDim (upval), p1 (upval), InputKeyGlyphModuleResult (upval), p5 (copy), Runtime (upval)
			local config = {
				Name = "Keys",
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				BackgroundTransparency = if FormulaResult:peek() then 1 else 0,
				Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Horizontal,
					VerticalAlignment = TypesEnum.VerticalAlignment.Center,
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					Padding = function(p7)
						-- upvalues: TypesUDim (upval), p1 (upval)
						return TypesUDim.new(0, p1.metric("space.xs", p7))
					end
				})
			}
			
			for LayoutOrder, key in Keys do
				local KeyCode = InputKeyGlyphModuleResult("KeyCode", p5.controlSize, { key = key })
				Runtime.decorate(KeyCode, { LayoutOrder = LayoutOrder })
				config[#config + 1] = KeyCode
			end
			local ShortcutHint = p1.styled(Host.Frame(config), "shortcut-hint")
			
			if FormulaResult:peek() then
				p1.styled(ShortcutHint, "shortcut-hint-bare")
			end
			return p1.row({
				ShortcutHint,
				(p1.styled(p1.text({
					Name = "Label",
					Text = Text,
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}), "secondary"))
			}, p6)
		end
		
		local function render(p7, p8)
			-- upvalues: p1 (upval), Compose (upval), CellResult (copy), keyCodeHint (copy), codesOf (upval), TypesUDim2 (upval), TypesEnum (upval), p5 (copy), FormulaResult (copy), p2 (upval)
			local PeekResult = p7:peek()
			local Action = PeekResult.action
			local FormulaResult1 = nil
			
			if Action then
				local EnabledResult = p1.observe.Enabled(Action)
				local PreferredBindingResult = p1.observe.PreferredBinding(Action)
				FormulaResult1 = Compose.formula(function(Callback): boolean
					-- upvalues: EnabledResult (copy), PreferredBindingResult (copy)
					return Callback(EnabledResult) ~= false and Callback(PreferredBindingResult) ~= nil
				end)
			end
			local t = {}
			local Copy = table.clone(CellResult:peek())
			Copy[t] = FormulaResult1 or true
			CellResult:set(Copy)
			Compose.cleanup(function()
				-- upvalues: CellResult (upval), t (copy)
				local Copy = table.clone(CellResult:peek())
				Copy[t] = nil
				CellResult:set(Copy)
			end)
			
			local function label(Callback)
				-- upvalues: p7 (copy), p1 (upval)
				local Label = Callback(p7).label
				
				return if type(Label) == "string" then Label else p1.readSource(Label, Callback)
			end
			
			local function order(Callback)
				-- upvalues: p8 (copy)
				return Callback(p8)
			end
			
			local function visible(Callback)
				-- upvalues: FormulaResult1 (ref)
				return FormulaResult1 == nil or Callback(FormulaResult1)
			end
			
			return if PeekResult.keyCode == nil then if Action then p2.ShortcutHint({
				Name = "Entry",
				label = label,
				controlSize = p5.controlSize,
				cap = not FormulaResult:peek(),
				LayoutOrder = order,
				Visible = visible,
				action = Action
			}) else p2.ShortcutHint({
				Name = "Entry",
				label = label,
				controlSize = p5.controlSize,
				cap = not FormulaResult:peek(),
				LayoutOrder = order,
				Visible = visible,
				keys = assert(PeekResult.keys)
			}) else keyCodeHint(codesOf(PeekResult.keyCode), label, {
				Name = "Entry",
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				LayoutOrder = order,
				Visible = visible
			})
		end
		
		local PropsResult = PropsFunction(p5, list, {
			Name = "ButtonGuide",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.XY
		})
		PropsResult.Selectable = false
		PropsResult.Active = false
		
		local function buildEntries()
			-- upvalues: Compose (upval), FormulaResult (copy), Host (upval), TypesUDim2 (upval), TypesEnum (upval), TypesUDim (upval), p1 (upval), ReadFunction1 (upval), Entries (copy), keyOf (upval), render (copy)
			return Compose.keyed({
				from = function(Callback)
					-- upvalues: FormulaResult (upval)
					return { Callback(FormulaResult) }
				end,
				render = function()
					-- upvalues: Host (upval), TypesUDim2 (upval), TypesEnum (upval), TypesUDim (upval), p1 (upval), Compose (upval), ReadFunction1 (upval), Entries (upval), keyOf (upval), render (upval)
					return Host.Frame("Entries")({
						Size = TypesUDim2.fromOffset(0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						Selectable = false,
						Host.UIListLayout({
							FillDirection = TypesEnum.FillDirection.Horizontal,
							VerticalAlignment = TypesEnum.VerticalAlignment.Center,
							SortOrder = TypesEnum.SortOrder.LayoutOrder,
							Padding = function(p7)
								-- upvalues: TypesUDim (upval), p1 (upval)
								return TypesUDim.new(0, p1.metric("space.m", p7))
							end
						}),
						Compose.keyed({
							from = function(p7)
								-- upvalues: ReadFunction1 (upval), Entries (upval)
								return ReadFunction1(Entries, p7)
							end,
							key = keyOf,
							render = render
						})
					})
				end
			})
		end
		
		local FrameResult = Host.Frame(PropsResult)
		Runtime.connect(FrameResult, "AncestryChanged", function()
			-- upvalues: CellResult1 (copy)
			CellResult1:set(CellResult1:peek() + 1)
		end)
		
		local function available(Callback: (any) -> ()): boolean
			-- upvalues: ReadFunction (upval), p5 (copy), p1 (upval), t (copy), EffectiveInputResult (copy), CellResult1 (copy), FrameResult (copy)
			if ReadFunction(p5.Visible, Callback) == false or ReadFunction(p1.config.buttonGuides, Callback) == false then
				return false
			elseif t[EffectiveInputResult(Callback)] then
				Callback(CellResult1)
				
				return if p1.withinModal(FrameResult, Callback) then true else false
			else
				return false
			end
		end
		
		local v1 = false
		Runtime.mountFragment(function()
			-- upvalues: Compose (upval), v1 (ref), available (copy), buildEntries (copy)
			return {
				Compose.show(function(p7)
					-- upvalues: v1 (upval), available (upval)
					v1 = v1 or available(p7)
					
					return v1
				end, buildEntries)
			}
		end, FrameResult)
		Runtime.decorate(FrameResult, {
			Visible = function(Callback): boolean
				-- upvalues: available (copy), CellResult (copy)
				if not available(Callback) then
					return false
				end
				for _, value in Callback(CellResult) do
					if value == true or Callback(value) then
						return true
					end
				end
				return false
			end
		})
		
		return FrameResult
	end)
end