local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local _ = require("./control_types")
local _ = require("./navigation_props")
local _ = require("./nav_menu_items")

return function(p1, p2, p3, Callback)
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesUDim = p1.types.UDim
	p2.SplitButton = p1.construct("SplitButton", function(p4)
		-- upvalues: p3 (copy), p1 (copy), Compose (copy), TypesEnum (copy), ReadFunction (copy), p2 (copy), Host (copy), TypesUDim2 (copy), Callback (copy), TypesUDim (copy)
		local UserInputService = p3.service("UserInputService")
		local PreferredInputResult = if UserInputService then p1.observe.PreferredInput(UserInputService) else Compose.cell(nil)
		local CellResult = Compose.cell(false)
		
		local function Enabled(p5): boolean
			-- upvalues: ReadFunction (upval), p4 (copy)
			return ReadFunction(p4.enabled, p5) ~= false and ReadFunction(p4.busy, p5) ~= true
		end
		
		local function primary()
			-- upvalues: p4 (copy), p2 (upval)
			local OnActivateFunction = p4.onActivate
			
			return p2.Button("Primary")({
				appearance = "utility",
				label = p4.label,
				onActivate = if OnActivateFunction then function()
					-- upvalues: OnActivateFunction (copy)
					OnActivateFunction()
				end else nil,
				enabled = p4.enabled,
				busy = p4.busy,
				shortcut = p4.shortcut
			})
		end
		
		return Host.Frame(p1.props(p4, {
			"label", "onActivate", "items", "enabled", "busy", "shortcut", "menuLabel"
		}, {
			Name = "SplitButton",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.XY,
			Compose.show(Compose.formula(function(Callback): boolean
				-- upvalues: PreferredInputResult (copy), TypesEnum (upval)
				return Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch
			end), function()
				-- upvalues: p2 (upval), p4 (copy), TypesUDim2 (upval), TypesEnum (upval), Callback (upval), Enabled (copy), CellResult (copy)
				local Flag = false
				local v1 = p2.Button("Primary")({
					trailingIcon = "chevron.down",
					Size = if p4.Size then TypesUDim2.fromScale(1, 1) else nil,
					AutomaticSize = if p4.Size then TypesEnum.AutomaticSize.None else nil,
					label = p4.label,
					enabled = p4.enabled,
					busy = p4.busy,
					onActivate = function()
						-- upvalues: Flag (ref), p4 (upval)
						if Flag then
							Flag = false
							
							return
						end
						if p4.onActivate then
							p4.onActivate()
						end
					end
				})
				
				return Callback({
					Name = "TouchAlternatives",
					Size = if p4.Size then TypesUDim2.fromScale(1, 1) else nil,
					AutomaticSize = if p4.Size then TypesEnum.AutomaticSize.None else nil,
					trigger = function()
						-- upvalues: v1 (copy)
						return v1
					end,
					items = p4.items,
					enabled = Enabled,
					isPresented = CellResult,
					triggers = { "longPress", "secondary", "keyboard", "gamepad" },
					onOpen = function()
						-- upvalues: Flag (ref)
						Flag = true
					end,
					onClose = function()
						-- upvalues: Flag (ref)
						Flag = false
					end
				}, true)
			end, function()
				-- upvalues: p1 (upval), primary (copy), Host (upval), TypesUDim2 (upval), TypesEnum (upval), p2 (upval), p4 (copy), Enabled (copy), CellResult (copy), TypesUDim (upval), ReadFunction (upval)
				local RowResult = p1.row({
					primary(),
					p1.styled(Host.Frame("Divider")({
						BorderSizePixel = 0,
						Size = function(p5)
							-- upvalues: TypesUDim2 (upval), p1 (upval)
							return TypesUDim2.fromOffset(p1.metric("strokes.hairline", p5), 0)
						end,
						Host.UIFlexItem({ ItemLineAlignment = TypesEnum.ItemLineAlignment.Stretch })
					}), "divider"),
					p2.Menu("Alternatives")({
						trigger = function()
							-- upvalues: p2 (upval), p4 (upval), Enabled (upval), CellResult (upval)
							return p2.Button("Trigger")({
								appearance = "utility",
								icon = "chevron.down",
								name = p4.menuLabel or "More options",
								help = p4.menuLabel or "More options",
								enabled = Enabled,
								onActivate = function()
									-- upvalues: CellResult (upval)
									CellResult:set(true)
								end
							})
						end,
						items = p4.items,
						enabled = Enabled,
						isPresented = CellResult
					})
				}, { Name = "Split" })
				assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).Padding = TypesUDim.new(0, 0)
				RowResult:ResetPropertyToDefault("BackgroundTransparency")
				p1.skin(p1.styled(RowResult, "control"), "control", {
					disabled = function(p5): boolean
						-- upvalues: ReadFunction (upval), p4 (upval)
						return not (ReadFunction(p4.enabled, p5) ~= false and ReadFunction(p4.busy, p5) ~= true)
					end
				})
				
				return RowResult
			end)
		}))
	end)
end