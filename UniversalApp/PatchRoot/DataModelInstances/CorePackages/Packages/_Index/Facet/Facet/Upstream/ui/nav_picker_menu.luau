local _ = require("./types")
local _ = require("../vendor/compose/core")
local _ = require("./control_types")
local _ = require("./input_props")
local _ = require("./navigation_props")
local _ = require("./navigation_types")
local _ = require("./nav_menu_items")
local _ = require("./nav_picker_parts")

return function(p1, p2, p3, Callback)
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesUDim = p1.types.UDim
	local Keys = p3.keys
	local AppearanceForFunction = p3.appearanceFor
	
	return {
		menu = function(Frame, p4)
			-- upvalues: p1 (copy), Keys (copy), ReadFunction (copy), ReadFunction (copy), AppearanceForFunction (copy), TypesUDim2 (copy), TypesVector2 (copy), TypesEnum (copy), p2 (copy), Callback (copy), TypesUDim (copy)
			local IsSelectedFunction = p4.isSelected
			local SelectFunction = p4.select
			local Options = p4.options
			local Value = { items = {} }
			
			for i, value in pairs((p1.props(Frame, Keys))) do
				Value[i] = value
			end
			Value.enabled = Frame.enabled
			Value.isPresented = Frame.isPresented
			Value.query = Frame.query
			Value.maxHeight = Frame.maxHeight
			
			local function FacetLabel(p5)
				-- upvalues: ReadFunction (upval), Frame (copy), IsSelectedFunction (copy), ReadFunction (upval)
				local List = {}
				
				for _, value in ReadFunction(Frame.options, p5) do
					if IsSelectedFunction(value.value, p5) then
						table.insert(List, ReadFunction(value.label, p5))
					end
				end
				return if #List > 0 then table.concat(List, ", ") else ReadFunction(Frame.placeholder, p5) or "Choose"
			end
			
			local Label = {
				Name = "Trigger",
				label = FacetLabel,
				enabled = Frame.enabled,
				controlSize = Frame.controlSize,
				corners = Frame.corners,
				appearance = if Frame.appearance == nil then nil else function(p6): string
					-- upvalues: AppearanceForFunction (upval), ReadFunction (upval), Frame (copy)
					local Menu = AppearanceForFunction("menu", ReadFunction(Frame.appearance, p6))
					
					return if Menu == "contrast" then "emphasis" elseif Menu == "utility" then "utility" else "default"
				end,
				Attributes = { FacetLabel = FacetLabel },
				p1.icon("chevron.up.chevron.down", {
					Name = "Disclosure",
					BackgroundTransparency = 1,
					Size = TypesUDim2.fromOffset(12, 12),
					AnchorPoint = TypesVector2.new(1, 0.5),
					Position = TypesUDim2.new(1, 20, 0.5, 0)
				})
			}
			
			if Frame.Size ~= nil and Frame.label == nil then
				local AutomaticSize = Frame.AutomaticSize or TypesEnum.AutomaticSize.None
				Label.AutomaticSize = AutomaticSize
				
				function Label.Size(p6)
					-- upvalues: ReadFunction (upval), AutomaticSize (copy), TypesEnum (upval), TypesUDim2 (upval), p1 (upval), Frame (copy)
					local ReadResult = ReadFunction(AutomaticSize, p6)
					local IsReadResultMatch: boolean = ReadResult == TypesEnum.AutomaticSize.X or ReadResult == TypesEnum.AutomaticSize.XY
					local IsReadResultMatch1: boolean = ReadResult == TypesEnum.AutomaticSize.Y or ReadResult == TypesEnum.AutomaticSize.XY
					
					return TypesUDim2.new(if IsReadResultMatch then 0 else 1, 0, if IsReadResultMatch1 then 0 else 1, if IsReadResultMatch1 then p1.controlSize(Frame.controlSize, "height", p6) else 0)
				end
				
				Label.TextTruncate = TypesEnum.TextTruncate.AtEnd
				Label.TextWrapped = false
				Label.ClipsDescendants = true
			end
			local ButtonResult = p2.Button(Label)
			ButtonResult:AddTag("facet-disclosure")
			
			function Value.trigger()
				-- upvalues: ButtonResult (copy)
				return ButtonResult
			end
			
			function Value.items(Callback)
				-- upvalues: Options (copy), Frame (copy), IsSelectedFunction (copy), SelectFunction (copy)
				local List = {}
				
				for _, value in Callback(Options) do
					table.insert(List, {
						id = value.id or tostring(value.value),
						label = value.label,
						icon = value.icon,
						description = value.description,
						badge = value.badge,
						meta = value.meta,
						avatar = value.avatar,
						sectionTitle = value.sectionTitle,
						dismiss = not Frame.multiple,
						marked = function(p6)
							-- upvalues: IsSelectedFunction (upval), value (copy)
							return IsSelectedFunction(value.value, p6)
						end,
						enabled = value.enabled,
						onSelect = function()
							-- upvalues: SelectFunction (upval), value (copy)
							SelectFunction(value.value)
						end
					})
				end
				return List
			end
			
			if Frame.label == nil then
				return Callback(Value, true)
			end
			Value.Name = "Value"
			Value.Size = nil
			Value.AutomaticSize = TypesEnum.AutomaticSize.XY
			Value.AnchorPoint = nil
			Value.Position = nil
			local IsStart = Frame.valueAlignment == "start"
			local Label1 = p1.text({
				Name = "Label",
				Text = function(p6)
					-- upvalues: ReadFunction (upval), Frame (copy)
					return ReadFunction(Frame.label, p6) or ""
				end,
				Size = if IsStart then TypesUDim2.fromOffset(0, 0) else TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = if IsStart then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.Y,
				TextWrapped = not IsStart,
				TextXAlignment = TypesEnum.TextXAlignment.Left
			})
			
			if IsStart then
				local function _(p6): boolean
					-- upvalues: ReadFunction (upval), Frame (copy)
					return ReadFunction(Frame.sizing, p6) == "hug"
				end
				
				local RowResult = p1.row({ Label1, Callback(Value, true) }, p1.props(Frame, Keys, {
					BackgroundTransparency = 1,
					Name = Frame.Name or "Picker",
					Size = function(p6)
						-- upvalues: ReadFunction (upval), Frame (copy), TypesUDim2 (upval)
						return if ReadFunction(Frame.sizing, p6) == "hug" then TypesUDim2.fromOffset(0, 0) else TypesUDim2.new(1, 0, 0, 0)
					end,
					AutomaticSize = function(p6)
						-- upvalues: ReadFunction (upval), Frame (copy), TypesEnum (upval)
						return if ReadFunction(Frame.sizing, p6) == "hug" then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.Y
					end
				}))
				local v1 = assert(RowResult:FindFirstChildWhichIsA("UIListLayout"))
				v1.VerticalAlignment = TypesEnum.VerticalAlignment.Center
				v1.Wraps = true
				RowResult:SetAttribute("FacetValueAlignment", "start")
				
				return RowResult
			else
				local ColumnResult = p1.column({ Label1, Callback(Value, true) }, p1.props(Frame, Keys, {
					BackgroundTransparency = 1,
					Name = Frame.Name or "Picker",
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y
				}))
				assert(ColumnResult:FindFirstChildWhichIsA("UIListLayout")).Padding = TypesUDim.new(0, 4)
				
				return ColumnResult
			end
		end,
		navigationLink = function(Tbl, p6)
			-- upvalues: p1 (copy), ReadFunction (copy), ReadFunction (copy), Keys (copy), ReadFunction (copy), TypesUDim2 (copy), TypesEnum (copy), AppearanceForFunction (copy), p2 (copy), Runtime (copy)
			local IsSelectedFunction = p6.isSelected
			local IsPresented = Tbl.isPresented or p1.Compose.cell(false)
			
			local function Text(p7)
				-- upvalues: ReadFunction (upval), Tbl (copy), IsSelectedFunction (copy), ReadFunction (upval)
				for _, value in ReadFunction(Tbl.options, p7) do
					if IsSelectedFunction(value.value, p7) then
						return (ReadFunction(value.label, p7))
					end
				end
				return ReadFunction(Tbl.placeholder, p7) or "Choose"
			end
			
			local PropsResult = p1.props(Tbl, Keys, {
				enabled = Tbl.enabled,
				label = Tbl.label or Text,
				controlSize = Tbl.controlSize
			})
			PropsResult.Name = Tbl.Name or "Picker"
			PropsResult.trailingIcon = if Tbl.label == nil then nil else "chevron.trailing"
			
			if Tbl.label ~= nil then
				PropsResult.row = { title = Tbl.label }
				local Size = Tbl.Size
				
				function PropsResult.Size(p8)
					-- upvalues: ReadFunction (upval), Size (copy), TypesUDim2 (upval), p1 (upval), Tbl (copy)
					local ReadResult = ReadFunction(Size, p8) or TypesUDim2.fromScale(1, 0)
					
					return TypesUDim2.new(ReadResult.X.Scale, ReadResult.X.Offset, ReadResult.Y.Scale, (math.max(ReadResult.Y.Offset, (p1.controlSize(Tbl.controlSize, "height", p8)))))
				end
				
				PropsResult.AutomaticSize = Tbl.AutomaticSize or TypesEnum.AutomaticSize.Y
				PropsResult.ClipsDescendants = true
			end
			PropsResult.corners = Tbl.corners
			PropsResult.appearance = if Tbl.appearance == nil then nil else function(p8): string
				-- upvalues: AppearanceForFunction (upval), ReadFunction (upval), Tbl (copy)
				local NavigationLink = AppearanceForFunction("navigationLink", ReadFunction(Tbl.appearance, p8))
				
				return if NavigationLink == "contrast" then "emphasis" elseif NavigationLink == "utility" then "utility" else "standard"
			end
			local ButtonResult = p2.Button(PropsResult)
			local Content = ButtonResult:FindFirstChild("Content")
			local TrailingIcon = Content and Content:FindFirstChild("TrailingIcon")
			
			if TrailingIcon and TrailingIcon:IsA("GuiObject") then
				TrailingIcon.LayoutOrder = 100
			end
			if Tbl.label ~= nil and Content then
				Runtime.mountFragment(function()
					-- upvalues: p1 (upval), Text (copy), TypesEnum (upval)
					return {
						p1.styled(p1.text({
							Name = "Trailing",
							LayoutOrder = 90,
							Text = Text,
							AutomaticSize = TypesEnum.AutomaticSize.XY
						}), "secondary")
					}
				end, Content)
			end
			p2.Popover({
				edge = "bottom",
				align = "end",
				isPresented = IsPresented,
				onPresentedChange = function(p8)
					-- upvalues: IsPresented (copy)
					IsPresented:set(p8)
				end,
				trigger = ButtonResult,
				maxWidth = p1.metric("controls.popup.panelWidth"),
				maxHeight = Tbl.maxHeight or 400,
				title = Tbl.label,
				content = function()
					-- upvalues: Tbl (copy), TypesUDim2 (upval), IsPresented (copy), p2 (upval), p1 (upval), TypesEnum (upval)
					local Choices1 = nil
					if Tbl.multiple then
						local Choices = table.clone(Tbl)
						Choices.Name = "Choices"
						Choices.style = "inline"
						Choices.isPresented = nil
						Choices.Size = TypesUDim2.new(1, 0, 0, 0)
						Choices.appearance = nil
						Choices.corners = nil
						Choices.maxHeight = nil
						Choices.requiredMark = nil
						Choices.indicator = "none"
						
						function Choices.onChange(p8)
							-- upvalues: Tbl (copy)
							if Tbl.onChange then
								Tbl.onChange(p8)
							end
						end
						
						Choices1 = Choices
					else
						local Choices = table.clone(Tbl)
						Choices.Name = "Choices"
						Choices.style = "inline"
						Choices.isPresented = nil
						Choices.Size = TypesUDim2.new(1, 0, 0, 0)
						Choices.appearance = nil
						Choices.corners = nil
						Choices.maxHeight = nil
						Choices.requiredMark = nil
						Choices.indicator = "none"
						
						function Choices.onChange(p8)
							-- upvalues: IsPresented (upval), Tbl (copy)
							IsPresented:set(false)
							
							if Tbl.onChange then
								Tbl.onChange(p8)
							end
						end
						
						Choices1 = Choices
					end
					return p1.column({ p2.Picker(Choices1) }, {
						Name = "PickerSearch",
						Size = function(p8)
							-- upvalues: TypesUDim2 (upval), p1 (upval)
							return TypesUDim2.fromOffset(p1.metric("controls.popup.panelWidth", p8) - 16, 0)
						end,
						AutomaticSize = TypesEnum.AutomaticSize.Y
					})
				end
			})
			
			return ButtonResult
		end
	}
end