local _ = require("./types")
local _ = require("./navigation_types")
local FieldChromeModule = require("./field_chrome")
local _ = require("../vendor/compose/core")
local _ = require("./control_types")
local _ = require("./navigation_props")
local _ = require("./nav_menu_items")
local NavPickerPartsModule = require("./nav_picker_parts")
local NavPickerMenuModule = require("./nav_picker_menu")
local NavPickerCardsModule = require("./nav_picker_cards")
local NavPickerOptionsModule = require("./nav_picker_options")

return function(p1, p2, p3, p4)
	-- upvalues: NavPickerPartsModule (copy), NavPickerMenuModule (copy), NavPickerCardsModule (copy), NavPickerOptionsModule (copy), FieldChromeModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local NavPickerPartsModuleResult = NavPickerPartsModule(p1, p3)
	local Keys = NavPickerPartsModuleResult.keys
	local DeriveFunction = NavPickerPartsModuleResult.derive
	local NavPickerMenuModuleResult = NavPickerMenuModule(p1, p2, NavPickerPartsModuleResult, p4)
	local NavPickerCardsModuleResult = NavPickerCardsModule(p1, p2, NavPickerPartsModuleResult)
	local NavPickerOptionsModuleResult = NavPickerOptionsModule(p1, p2, p3, NavPickerPartsModuleResult)
	
	local function _(p5, Text)
		assert(type(p5) == "table" and type(p5.set) == "function", Text .. " requires a writable Compose cell")
	end
	
	local config = {
		id = true,
		value = true,
		label = true,
		description = true,
		icon = true,
		badge = true,
		enabled = true,
		meta = true,
		avatar = true,
		sectionTitle = true,
		indicator = true
	}
	
	local function checkOptionFields(p5)
		-- upvalues: config (copy)
		assert(type(p5) == "table", "Picker options require a table")
		
		for i in next, p5 do
			assert(type(i) == "string" and config[i] == true, `Unknown Picker option field {tostring(i)}`)
		end
	end
	
	local _ = function(p6, p7)
		return if p6 == nil then nil elseif p7 == "segmented" then if p6 == "standard" then "filled" elseif p6 == "contrast" then "stroke" else p6 elseif p7 == "menu" or p7 == "navigationLink" then if p6 == "filled" then "standard" elseif p6 == "stroke" then "contrast" else p6 else nil
	end
	
	local FieldChromeModuleResult = FieldChromeModule(p1)
	p2.Picker = p1.construct("Picker", function(Tbl)
		-- upvalues: ReadFunction (copy), p2 (copy), NavPickerMenuModuleResult (copy), NavPickerCardsModuleResult (copy), NavPickerOptionsModuleResult (copy), FieldChromeModuleResult (copy), NavPickerPartsModuleResult (copy), ReadFunction (copy), Compose (copy), p1 (copy), Runtime (copy), p3 (copy), DeriveFunction (copy), TypesEnum (copy), Keys (copy), TypesUDim2 (copy), ReadFunction (copy), ReadFunction (copy), Host (copy), checkOptionFields (copy)
		local PickerFunction = p2.Picker
		local MenuFunction = NavPickerMenuModuleResult.menu
		local NavigationLinkFunction = NavPickerMenuModuleResult.navigationLink
		local Selected = Tbl.selected
		assert(type(Selected) == "table" and type(Selected.set) == "function", "Picker.selected requires a writable Compose cell")
		assert(Tbl.onChange == nil or type(Tbl.onChange) == "function", "Picker.onChange must be a function")
		assert(Tbl.onChanging == nil or type(Tbl.onChanging) == "function", "Picker.onChanging must be a function")
		assert(Tbl.required == nil or type(Tbl.required) == "boolean", "Picker.required must be a boolean")
		assert(Tbl.enabled == nil or type(ReadFunction(Tbl.enabled)) == "boolean", "Picker.enabled must be a boolean or a readable boolean")
		local Style = Tbl.style or "automatic"
		FieldChromeModuleResult.check("Picker", {
			label = Tbl.label,
			requiredMark = Tbl.requiredMark,
			hint = Tbl.hint,
			errorText = Tbl.errorText,
			controlSize = Tbl.controlSize,
			corners = Tbl.corners
		})
		NavPickerPartsModuleResult.appearanceFor(Style, ReadFunction(Tbl.appearance))
		assert(Tbl.maxHeight == nil or type(Tbl.maxHeight) == "number" and Tbl.maxHeight > 0 and Tbl.maxHeight < 1e999, "Facet UI.Picker: maxHeight must be a finite number of pixels above zero")
		assert(Tbl.maxHeight == nil or table.find({ "automatic", "menu", "navigationLink" }, Style), "Facet UI.Picker: maxHeight belongs to the menu styles")
		assert(Tbl.valueAlignment == nil or (Tbl.valueAlignment == "start" or Tbl.valueAlignment == "end"), "Facet UI.Picker: valueAlignment must be start or end")
		assert(Tbl.query == nil or Style ~= "segmented", "Facet UI.Picker: a segmented picker takes no query. Use navigationLink or menu for a searchable list")
		assert(Tbl.indicatorPosition == nil or Style == "radioGroup", "Facet UI.Picker: indicatorPosition belongs to the radioGroup style")
		assert(Tbl.indicatorPosition == nil or (Tbl.indicatorPosition == "leading" or Tbl.indicatorPosition == "trailing"), "Facet UI.Picker: indicatorPosition must be leading or trailing")
		
		if Tbl.requiredMark == "required" and Tbl.label ~= nil then
			local Copy = table.clone(Tbl)
			local Label = Tbl.label
			Copy.requiredMark = nil
			
			function Copy.label(p6): string
				-- upvalues: ReadFunction (upval), Label (copy)
				return (ReadFunction(Label, p6) or "") .. " *"
			end
			
			return p2.Picker(Copy)
		end
		if Tbl.hint ~= nil or Tbl.errorText ~= nil then
			local Control = table.clone(Tbl)
			Control.Name = nil
			Control.Size = nil
			Control.Position = nil
			Control.AnchorPoint = nil
			Control.LayoutOrder = nil
			Control.Visible = nil
			local Native = {
				Name = Control.Name,
				Size = Control.Size,
				Position = Control.Position,
				AnchorPoint = Control.AnchorPoint,
				LayoutOrder = Control.LayoutOrder,
				Visible = Control.Visible,
				ZIndex = Control.ZIndex
			}
			Control.ZIndex = nil
			Control.hint = nil
			Control.errorText = nil
			Control.Name = "Control"
			local PickerResult = p2.Picker(Control)
			local ErrorOfResult = FieldChromeModuleResult.errorOf({ errorText = Tbl.errorText }, nil)
			Compose.watch(function(p6)
				-- upvalues: ErrorOfResult (copy), PickerResult (copy)
				local IsNotErrorOfResultResultMatch = ErrorOfResult(p6) ~= ""
				for _, Gui in PickerResult:GetDescendants() do
					if Gui.Name == "Trigger" and Gui:IsA("GuiObject") then
						if IsNotErrorOfResultResultMatch then
							Gui:AddTag("facet-invalid")
						elseif Gui:HasTag("facet-invalid") then
							Gui:RemoveTag("facet-invalid")
						end
					end
				end
			end)
			Native.Name = Native.Name or "Picker"
			
			return FieldChromeModuleResult.wrap({
				control = "Picker",
				spec = { hint = Tbl.hint, errorText = Tbl.errorText },
				plate = PickerResult,
				focus = function() end,
				enabled = function(p7): boolean
					-- upvalues: ReadFunction (upval), Tbl (copy)
					return ReadFunction(Tbl.enabled, p7) ~= false
				end,
				native = Native
			})
		end
		assert(type(Tbl.options) == "table" or type(Tbl.options) == "function", "Facet UI.Picker: options must be an array of { value, label } entries, a Compose readable, or a function(use) that returns one")
		local Inverted: boolean = type(Tbl.options) == "table" and not Compose.isValue(Tbl.options)
		
		if Inverted then
			for _, value in ReadFunction(Tbl.options) do
				local ValueType = type(value.value)
				
				if ValueType ~= "string" and ValueType ~= "number" and ValueType ~= "boolean" then
					Inverted = false
					break
				end
			end
		end
		local SelectorResult = if Tbl.multiple or not Inverted then nil else Compose.selector(Tbl.selected)
		
		local function isSelected(Source, p6)
			-- upvalues: Tbl (copy), p1 (upval), SelectorResult (copy)
			return if Tbl.multiple then p1.readSource(Tbl.selected, p6)[Source] == true elseif SelectorResult then p1.readSource(SelectorResult(Source), p6) else p1.readSource(Tbl.selected, p6) == Source
		end
		
		local function _(p6, Key, Callback, p7)
			-- upvalues: Runtime (upval)
			local PeekResult = p6:peek()
			
			if not Callback or Callback(Key, PeekResult) ~= false then
				Runtime:batch(function()
					-- upvalues: p6 (copy), Key (copy), p7 (copy)
					p6:set(Key)
					
					if p7 then
						p7(Key)
					end
				end)
				
				return
			end
		end
		
		local function _select(Key)
			-- upvalues: ReadFunction (upval), Tbl (copy), p1 (upval), Runtime (upval)
			if ReadFunction(Tbl.enabled) == false then return end
			if Tbl.multiple then
				local Source = p1.readSource(Tbl.selected)
				local Key1 = {}
				
				for i, value in Source do
					if i ~= Key then
						Key1[i] = value
					end
				end
				if not Source[Key] then
					Key1[Key] = true
				end
				if Tbl.required and next(Key1) == nil then return end
				local Selected = Tbl.selected
				local OnChangingFunction1 = Tbl.onChanging
				local OnChange = Tbl.onChange
				local PeekResult = Selected:peek()
				
				if not OnChangingFunction1 or OnChangingFunction1(Key1, PeekResult) ~= false then
					Runtime:batch(function()
						-- upvalues: Selected (copy), Key1 (copy), OnChange (copy)
						Selected:set(Key1)
						
						if OnChange then
							OnChange(Key1)
						end
					end)
					
					return
				end
				return
			elseif Key ~= p1.readSource(Tbl.selected) then
				local Selected1 = Tbl.selected
				local OnChangingFunction = Tbl.onChanging
				local OnChangeFunction = Tbl.onChange
				local PeekResult = Selected1:peek()
				
				if OnChangingFunction and OnChangingFunction(Key, PeekResult) == false then return end
				Runtime:batch(function()
					-- upvalues: Selected1 (copy), Key (copy), OnChangeFunction (copy)
					Selected1:set(Key)
					
					if OnChangeFunction then
						OnChangeFunction(Key)
					end
				end)
			end
		end
		
		local ReadResult = ReadFunction(Tbl.indicator)
		local ReadResult1 = ReadFunction(Tbl.axis)
		local ReadResult2 = ReadFunction(Tbl.sizing)
		assert(ReadResult == nil or table.find({ "automatic", "pill", "underline", "none" }, ReadResult), "Invalid Picker.indicator")
		assert(ReadResult1 == nil or table.find({ "x", "y" }, ReadResult1), "Picker.axis must be x or y")
		assert(ReadResult2 == nil or table.find({ "fill", "hug" }, ReadResult2), "Picker.sizing must be fill or hug")
		local Style1 = Tbl.style or "automatic"
		
		if Style1 == "automatic" then
			local NoQuery: boolean = p1.config.services.RunService ~= nil and Tbl.query == nil
			local UserInputService = p3.service("UserInputService")
			local PreferredInputResult = if UserInputService then p1.observe.PreferredInput(UserInputService) else Compose.cell(nil)
			local IsPresented = Tbl.isPresented or Compose.cell(false)
			local TenFootResult = p1.tenFoot()
			local CellResult1 = Compose.cell(0)
			local Labels = {}
			
			if type(Tbl.options) == "table" and not Compose.isValue(Tbl.options) then
				for _, value1 in ReadFunction(Tbl.options) do
					table.insert(Labels, value1.label)
				end
			end
			local LabelMeasure = p1.text({
				Name = "LabelMeasure",
				TextWrapped = false,
				Visible = false,
				Text = DeriveFunction(function(p6): string
					-- upvalues: ReadFunction (copy), Tbl (copy), ReadFunction (upval)
					local List = {}
					
					for _, value in ReadFunction(Tbl.options, p6) do
						table.insert(List, (tostring(ReadFunction(value.label, p6) or "")))
					end
					return table.concat(List, "")
				end, Tbl.options, table.unpack(Labels)),
				TextSize = Tbl.textSize,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			}, nil, if Tbl.textSize == nil then "control" else nil)
			local TextBoundsResult = p1.observe.TextBounds(LabelMeasure)
			local CellResult = Compose.cell(false)
			local FormulaResult = Compose.formula(function(Callback): string
				-- upvalues: Tbl (copy), ReadFunction (copy), CellResult1 (copy), TextBoundsResult (copy), CellResult (copy), PreferredInputResult (copy), TenFootResult (copy), TypesEnum (upval)
				if Tbl.query then
					return "navigationLink"
				end
				local ReadResult = ReadFunction(Tbl.options, Callback)
				local CountReadResult = #ReadResult
				local CallbackResult = Callback(CellResult1)
				local Flag = false
				
				for _, value in ReadResult do
					if value.description ~= nil then
						Flag = true
					end
				end
				local NewX = Callback(TextBoundsResult).X + CountReadResult * 24 + math.max(0, CountReadResult - 1) * 4 + 6
				local Inverted: boolean = if CallbackResult == 0 then not Callback(CellResult) else NewX <= CallbackResult and not Callback(CellResult)
				
				if CountReadResult <= 4 and not Flag and Inverted then
					return "segmented"
				else
					local CallbackResult1 = Callback(PreferredInputResult)
					
					return if (TenFootResult(Callback) or CallbackResult1 ~= TypesEnum.PreferredInput.KeyboardAndMouse and CallbackResult1 ~= TypesEnum.PreferredInput.Touch) and CountReadResult <= 6 then "inline" else "menu"
				end
			end)
			local PropsResult = p1.props(Tbl, Keys, {
				Name = "Picker",
				BackgroundTransparency = 1,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			
			local function presented(Object, PeekResult)
				-- upvalues: NoQuery (copy), CellResult (copy), Runtime (upval), Compose (upval)
				if NoQuery and PeekResult == "segmented" then
					local function _()
						-- upvalues: CellResult (upval), Object (copy)
						CellResult:set(Object:GetAttribute("FacetOverflow") == true)
					end
					
					CellResult:set(Object:GetAttribute("FacetOverflow") == true)
					Runtime.connect(Object, "AttributeChanged", function(p7)
						-- upvalues: CellResult (upval), Object (copy)
						if p7 == "FacetOverflow" then
							CellResult:set(Object:GetAttribute("FacetOverflow") == true)
						end
					end)
					Compose.cleanup(function()
						-- upvalues: CellResult (upval)
						CellResult:set(false)
					end)
				end
				return Object
			end
			
			PropsResult[#PropsResult + 1] = Compose.keyed({
				from = function(Callback)
					-- upvalues: FormulaResult (copy), NoQuery (copy), ReadFunction (copy), Tbl (copy)
					local CallbackResult = Callback(FormulaResult)
					
					if not NoQuery then
						return { CallbackResult }
					end
					local list = { "menu" }
					local ReadResult = ReadFunction(Tbl.options, Callback)
					
					if #ReadResult <= 6 then
						list[#list + 1] = "inline"
					end
					local v1 = false
					
					for _, value in ReadResult do
						v1 = v1 or value.description ~= nil
					end
					if #ReadResult <= 4 and not v1 then
						list[#list + 1] = "segmented"
					end
					return list
				end,
				render = function(p7)
					-- upvalues: FormulaResult (copy), ReadFunction (upval), Tbl (copy), PropsResult (copy), DeriveFunction (upval), ReadFunction (upval), TypesUDim2 (upval), TypesEnum (upval), NoQuery (copy), IsPresented (copy), ReadFunction (upval), presented (copy), PickerFunction (copy)
					local PeekResult = p7:peek()
					
					local function active(Callback): boolean
						-- upvalues: FormulaResult (upval), PeekResult (copy)
						return Callback(FormulaResult) == PeekResult
					end
					
					local function enabled(Callback): boolean
						-- upvalues: FormulaResult (upval), PeekResult (copy), ReadFunction (upval), Tbl (upval)
						return Callback(FormulaResult) == PeekResult and ReadFunction(Tbl.enabled, Callback) ~= false
					end
					
					local AutomaticSize = PropsResult.AutomaticSize
					local DeriveResult = DeriveFunction(function(p8)
						-- upvalues: ReadFunction (upval), AutomaticSize (copy), TypesUDim2 (upval), TypesEnum (upval)
						local ReadResult = ReadFunction(AutomaticSize, p8)
						
						return TypesUDim2.fromScale(if ReadResult == TypesEnum.AutomaticSize.X or ReadResult == TypesEnum.AutomaticSize.XY then 0 else 1, if ReadResult == TypesEnum.AutomaticSize.Y or ReadResult == TypesEnum.AutomaticSize.XY then 0 else 1)
					end, AutomaticSize)
					local Presentation = if Tbl.multiple then {
						multiple = true,
						options = Tbl.options,
						selected = Tbl.selected,
						onChanging = Tbl.onChanging,
						onChange = Tbl.onChange
					} else {
						multiple = false,
						options = Tbl.options,
						selected = Tbl.selected,
						onChanging = Tbl.onChanging,
						onChange = Tbl.onChange
					}
					local Placeholder = Tbl.placeholder
					local Label = Tbl.label
					Presentation.query = Tbl.query
					Presentation.placeholder = Placeholder
					Presentation.label = Label
					local Indicator = Tbl.indicator
					local Axis = Tbl.axis
					Presentation.required = Tbl.required
					Presentation.indicator = Indicator
					Presentation.axis = Axis
					local IconOnly = Tbl.iconOnly
					local TextSize = Tbl.textSize
					Presentation.sizing = Tbl.sizing
					Presentation.iconOnly = IconOnly
					Presentation.textSize = TextSize
					Presentation.Name = "Presentation"
					Presentation.Visible = if NoQuery then active else nil
					Presentation.style = PeekResult
					Presentation.isPresented = IsPresented
					Presentation.AutomaticSize = AutomaticSize
					Presentation.Size = DeriveResult
					local ValueAlignment = Tbl.valueAlignment
					Presentation.controlSize = Tbl.controlSize
					Presentation.valueAlignment = ValueAlignment
					Presentation.enabled = if NoQuery then enabled else Tbl.enabled
					local IsMenu: boolean = PeekResult == "menu" or PeekResult == "navigationLink"
					local IsMenu1: boolean = IsMenu or PeekResult == "segmented"
					Presentation.corners = if IsMenu1 then Tbl.corners else nil
					Presentation.maxHeight = if IsMenu then Tbl.maxHeight else nil
					Presentation.appearance = if IsMenu1 and Tbl.appearance ~= nil then function(p8)
						-- upvalues: ReadFunction (upval), Tbl (upval), PeekResult (copy)
						local ReadResult = ReadFunction(Tbl.appearance, p8)
						
						return (if ReadResult == nil then nil elseif PeekResult == "segmented" then if ReadResult == "standard" then "filled" elseif ReadResult == "contrast" then "stroke" else ReadResult elseif PeekResult == "menu" or PeekResult == "navigationLink" then if ReadResult == "filled" then "standard" elseif ReadResult == "stroke" then "contrast" else ReadResult else nil) or "utility"
					end else nil
					
					return (presented(PickerFunction(Presentation), PeekResult))
				end
			})
			PropsResult[#PropsResult + 1] = LabelMeasure
			local FrameResult = Host.Frame(PropsResult)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(FrameResult)
			Compose.watch(function(Callback)
				-- upvalues: AbsoluteSizeResult (copy), CellResult1 (copy)
				local X: number = Callback(AbsoluteSizeResult).X
				
				if X > 0 then
					CellResult1:set(X)
				end
			end)
			
			return FrameResult
		else
			local config = {
				isSelected = isSelected,
				select = _select,
				options = Compose.formula(function(p7)
					-- upvalues: ReadFunction (upval), Tbl (copy), ReadFunction (copy), checkOptionFields (upval), ReadFunction (upval)
					local Lowered = string.lower((tostring(ReadFunction(Tbl.query, p7) or "")))
					local List = {}
					local t = {}
					local ReadResult = ReadFunction(Tbl.options, p7)
					
					for i in ReadResult do
						assert(type(i) == "number" and (i >= 1 and i <= #ReadResult) and i % 1 == 0, "Picker options require a dense array")
					end
					for _, value in ReadResult do
						checkOptionFields(value)
						assert(value.description == nil or type(ReadFunction(value.description, p7)) == "string", "Picker description must be text")
						assert(value.enabled == nil or type(ReadFunction(value.enabled, p7)) == "boolean", "Picker option enabled must be a boolean")
						assert(value.icon == nil or type(ReadFunction(value.icon, p7)) == "string", "Picker option icon must be an icon name")
						local ReadResult1 = ReadFunction(value.badge, p7)
						assert(ReadResult1 == nil or (type(ReadResult1) == "string" or type(ReadResult1) == "number"), "Picker option badge must be text or a number")
						local Id = value.id or value.value
						assert(Id ~= nil and not t[Id], "Picker options require unique values or ids")
						t[Id] = true
						local ReadResult2: string = ReadFunction(value.label, p7)
						assert(type(ReadResult2) == "string" and string.find(ReadResult2, "%S") ~= nil, "Picker options require nonempty labels")
						assert(ReadFunction(Tbl.iconOnly) ~= true or value.icon ~= nil, "Picker.iconOnly requires an icon on each option")
						
						if Lowered == "" or string.find(string.lower(ReadResult2), Lowered, 1, true) then
							table.insert(List, value)
						end
					end
					return List
				end)
			}
			
			if Style1 == "menu" then
				return MenuFunction(Tbl, config)
			elseif Style1 == "navigationLink" then
				return NavigationLinkFunction(Tbl, config)
			elseif Style1 == "cards" then
				return NavPickerCardsModuleResult(Tbl, config)
			else
				assert(table.find({ "segmented", "inline", "radioGroup", "navigationLink" }, Style1), "Unknown Picker style")
				
				return NavPickerOptionsModuleResult(Tbl, config, Style1)
			end
		end
	end)
end