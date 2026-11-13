local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local _ = require("./navigation_props")
local _ = require("./nav_picker_parts")

return function(p1, p2, p3)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local Keys = p3.keys
	
	return function(p4, p5)
		-- upvalues: ReadFunction (copy), Runtime (copy), p1 (copy), Compose (copy), p2 (copy), TypesUDim2 (copy), TypesEnum (copy), ReadFunction (copy), p3 (copy), Host (copy), Keys (copy)
		local IsSelectedFunction = p5.isSelected
		local SelectFunction = p5.select
		local Options = p5.options
		local IsX = ReadFunction(p4.axis) == "x"
		
		local function clear()
			-- upvalues: ReadFunction (upval), p4 (copy), Runtime (upval)
			if ReadFunction(p4.enabled) == false or p4.multiple then return end
			local PeekResult = p4.selected:peek()
			
			if not p4.onChanging or p4.onChanging(nil, PeekResult) ~= false then
				local Selected = p4.selected
				Runtime:batch(function()
					-- upvalues: Selected (copy), p4 (copy)
					Selected:set(nil)
					
					if p4.onChange then
						p4.onChange(nil)
					end
				end)
				
				return
			end
		end
		
		local ColumnResult = p1.column({
			Compose.keyed({
				from = Options,
				key = function(p6)
					return p6.id or p6.value
				end,
				render = function(p6, LayoutOrder)
					-- upvalues: IsSelectedFunction (copy), p2 (upval), IsX (copy), TypesUDim2 (upval), TypesEnum (upval), ReadFunction (upval), p3 (upval), p4 (copy), ReadFunction (upval), clear (copy), SelectFunction (copy), Runtime (upval), p1 (upval), Host (upval), Compose (upval)
					local ButtonResult = p2.Button({
						Name = "Card-" .. tostring(p6:peek().id or p6:peek().value),
						LayoutOrder = LayoutOrder,
						Size = if IsX then TypesUDim2.fromOffset(200, 0) else TypesUDim2.new(1, 0, 0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.Y,
						label = function(Callback)
							-- upvalues: ReadFunction (upval), p6 (copy)
							return ReadFunction(Callback(p6).label, Callback) or ""
						end,
						subtitle = function(Callback)
							-- upvalues: ReadFunction (upval), p6 (copy)
							return ReadFunction(Callback(p6).description, Callback) or ""
						end,
						icon = p3.liveIcon(p6),
						controlSize = p4.controlSize,
						appearance = function(Callback): string
							-- upvalues: IsSelectedFunction (upval), p6 (copy)
							return if IsSelectedFunction(Callback(p6).value, Callback) then "emphasis" else "standard"
						end,
						selected = function(Callback)
							-- upvalues: IsSelectedFunction (upval), p6 (copy)
							return IsSelectedFunction(Callback(p6).value, Callback)
						end,
						enabled = function(Callback): boolean
							-- upvalues: ReadFunction (upval), p4 (upval), p6 (copy)
							return ReadFunction(p4.enabled, Callback) ~= false and ReadFunction(Callback(p6).enabled, Callback) ~= false
						end,
						onActivate = function()
							-- upvalues: p6 (copy), IsSelectedFunction (upval), p4 (upval), clear (upval), SelectFunction (upval)
							local Value = p6:peek().value
							
							if IsSelectedFunction(Value) and p4.required == false then
								clear()
								
								return
							else
								SelectFunction(Value)
							end
						end
					})
					ButtonResult:AddTag("facet-card-option")
					local LayoutWidthResult = p3.layoutWidth(ButtonResult)
					p3.wrapCaptions(ButtonResult, p4.controlSize, function(Callback)
						-- upvalues: LayoutWidthResult (copy)
						return Callback(LayoutWidthResult)
					end)
					local Content = ButtonResult:FindFirstChild("Content")
					
					if Content then
						Runtime.mountFragment(function()
							-- upvalues: p6 (copy), p1 (upval), ReadFunction (upval), TypesEnum (upval), Host (upval), TypesUDim2 (upval), ReadFunction (upval)
							local List = {}
							
							if p6:peek().meta ~= nil then
								table.insert(List, p1.styled(p1.text({
									Name = "Meta",
									LayoutOrder = 50,
									Text = function(Callback)
										-- upvalues: ReadFunction (upval), p6 (upval)
										return ReadFunction(Callback(p6).meta, Callback) or ""
									end,
									AutomaticSize = TypesEnum.AutomaticSize.XY
								}), "secondary"))
							end
							if p6:peek().badge ~= nil then
								table.insert(List, p1.styled(Host.Frame("Badge")({
									LayoutOrder = 60,
									Size = TypesUDim2.fromOffset(0, 0),
									AutomaticSize = TypesEnum.AutomaticSize.XY,
									p1.text({
										Name = "Count",
										Text = function(Callback): string
											-- upvalues: ReadFunction (upval), p6 (upval)
											local ReadResult = ReadFunction(Callback(p6).badge, Callback)
											
											return if ReadResult == nil then "" else tostring(ReadResult)
										end,
										AutomaticSize = TypesEnum.AutomaticSize.XY
									})
								}), "badge"))
							end
							return List
						end, Content)
					end
					Compose.watch(function(Callback)
						-- upvalues: ButtonResult (copy), ReadFunction (upval), p6 (copy)
						ButtonResult:SetAttribute("FacetLabel", ReadFunction(Callback(p6).label, Callback))
					end)
					
					return ButtonResult
				end
			})
		}, {
			Name = "Cards",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
		local v1 = assert(ColumnResult:FindFirstChildWhichIsA("UIListLayout"))
		
		if IsX then
			v1.FillDirection = TypesEnum.FillDirection.Horizontal
			v1.Wraps = true
		end
		local PropsResult = p1.props(p4, Keys, {
			Name = "Picker",
			BackgroundTransparency = 1,
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
		
		return if p4.label == nil then p1.column({ ColumnResult }, PropsResult) else p1.column({
			p1.text({
				Name = "Label",
				TextWrapped = true,
				Text = function(p6)
					-- upvalues: ReadFunction (upval), p4 (copy)
					return ReadFunction(p4.label, p6) or ""
				end,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			}),
			ColumnResult
		}, PropsResult)
	end
end