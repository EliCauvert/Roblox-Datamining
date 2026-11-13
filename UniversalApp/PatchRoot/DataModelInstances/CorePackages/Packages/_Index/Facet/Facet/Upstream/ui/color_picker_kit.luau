local _ = require("../vendor/compose/core")
local _ = require("./types")
local ColorValueModule = require("./color_value")
local FieldChromeModule = require("./field_chrome")
local _ = require("./control_types")

return {
	CELL = 44,
	GAP = 4,
	PAD = 12,
	SPACE = 8,
	MARGIN = 8,
	MAX_COLUMNS = 8,
	GRID_WIDTH = 380,
	RING = 20,
	BUBBLE = 44,
	MODE_LABEL = {
		swatches = "Swatches",
		spectrum = "Spectrum",
		sliders = "Sliders",
		brick = "Bricks"
	},
	isColor = function(p1): boolean
		return typeof(p1) == "Color3"
	end,
	unit = function(p1: number): boolean
		return type(p1) == "number" and (p1 == p1 and p1 >= 0) and p1 <= 1
	end,
	writable = function(p1): boolean
		return type(p1) == "table" and type(p1.set) == "function"
	end,
	new = function(p1)
		-- upvalues: FieldChromeModule (copy), ColorValueModule (copy)
		local Host = p1.Host
		local TypesEnum = p1.types.Enum
		local TypesUDim2 = p1.types.UDim2
		local TypesVector2 = p1.types.Vector2
		local TypesColor3 = p1.types.Color3
		local FieldChromeModuleResult = FieldChromeModule(p1)
		local ColorValueModuleResult = ColorValueModule({ Color3 = TypesColor3, BrickColor = p1.types.BrickColor })
		local NewTypesColor = TypesColor3.new(1, 1, 1)
		local NewTypesColor1 = TypesColor3.new(0, 0, 0)
		local FromRGBResult = TypesColor3.fromRGB(255, 255, 255)
		local FromRGBResult1 = TypesColor3.fromRGB(204, 204, 204)
		local FromRGBResult2 = TypesColor3.fromRGB(128, 128, 128)
		
		return {
			chrome = FieldChromeModuleResult,
			color = ColorValueModuleResult,
			WHITE = NewTypesColor,
			BLACK = NewTypesColor1,
			LIGHT = FromRGBResult,
			DARK = FromRGBResult1,
			normalize = function(List)
				-- upvalues: ColorValueModuleResult (copy)
				if type(List) ~= "table" then
					return nil, "is an array of Color3 or { color, label? }"
				end
				local List1 = {}
				local t = {}
				local Label1_1 = nil
				
				for i, value in List do
					local Color = value
					local Label = nil
					
					if type(value) == "table" then
						Color = value.color
						Label = value.label
						
						for i1 in value do
							if i1 ~= "color" and i1 ~= "label" then
								return nil, `item {i} has an unknown key '{tostring(i1)}' (it is \{ color, label? })`
							end
						end
					end
					if typeof(Color) ~= "Color3" or Label ~= nil and type(Label) ~= "string" then
						return nil, `item {i} is a Color3 or \{ color = Color3, label = string? }`
					end
					local Label1 = if type(Label) == "string" then Label else nil
					Label1_1 = Label1 or ColorValueModuleResult.hex(Color)
					
					if t[Label1_1] then
						return nil, `repeats '{Label1_1}' (a label or hex is the item's key)`
					end
					t[Label1_1] = true
					table.insert(List1, { color = Color, label = Label1, key = Label1_1 })
				end
				return List1, nil
			end,
			ring = function(p2)
				-- upvalues: Host (copy), TypesUDim2 (copy), p1 (copy), NewTypesColor1 (copy), TypesVector2 (copy), NewTypesColor (copy)
				return Host.Frame(p2)({
					Size = TypesUDim2.fromOffset(20, 20),
					BackgroundTransparency = 1,
					p1.corner(20),
					Host.UIStroke("Stroke")({ Thickness = 1, Transparency = 0, Color = NewTypesColor1 }),
					Host.Frame("Band")({
						AnchorPoint = TypesVector2.new(0.5, 0.5),
						Position = TypesUDim2.fromScale(0.5, 0.5),
						Size = TypesUDim2.new(1, -2, 1, -2),
						BackgroundTransparency = 1,
						p1.corner(20),
						Host.UIStroke("Stroke")({ Thickness = 3, Transparency = 0, Color = NewTypesColor }),
						Host.Frame("Inner")({
							AnchorPoint = TypesVector2.new(0.5, 0.5),
							Position = TypesUDim2.fromScale(0.5, 0.5),
							Size = TypesUDim2.new(1, -6, 1, -6),
							BackgroundTransparency = 1,
							p1.corner(20),
							(function(Color, Thickness)
								-- upvalues: Host (upval)
								return Host.UIStroke("Stroke")({ Transparency = 0, Color = Color, Thickness = Thickness })
							end)(NewTypesColor1, 1)
						})
					})
				})
			end,
			solid = function(p2, Size, BackgroundColor3)
				-- upvalues: p1 (copy), Host (copy), TypesEnum (copy)
				return p1.styled(Host.Frame(p2)({
					Size = Size,
					BorderSizePixel = 0,
					BackgroundColor3 = BackgroundColor3,
					p1.corner(),
					Host.UIStroke({
						Thickness = 1,
						ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border
					})
				}), "color-swatch")
			end,
			swatch = function(p2, Size, Callback)
				-- upvalues: Host (copy), TypesUDim2 (copy), FromRGBResult (copy), FromRGBResult1 (copy), p1 (copy), NewTypesColor (copy), TypesEnum (copy), TypesVector2 (copy), FromRGBResult2 (copy)
				local function checkerView()
					-- upvalues: Host (upval), TypesUDim2 (upval), FromRGBResult (upval), FromRGBResult1 (upval), Callback (copy)
					local List = {}
					
					for i, value in { { 0, 0 }, { 0.5, 0 }, { 0, 0.5 }, { 0.5, 0.5 } } do
						table.insert(List, Host.Frame((string.char(64 + i)))({
							BorderSizePixel = 0,
							Size = TypesUDim2.fromScale(0.5, 0.5),
							Position = TypesUDim2.fromScale(value[1], value[2]),
							BackgroundColor3 = if i == 1 or i == 4 then FromRGBResult else FromRGBResult1
						}))
					end
					local config = {
						Name = "Checker",
						BackgroundTransparency = 1,
						Size = TypesUDim2.fromScale(1, 1),
						Visible = function(p3): boolean
							-- upvalues: Callback (upval)
							local CallbackResult = Callback(p3)
							
							return CallbackResult.color ~= nil and CallbackResult.alpha < 1
						end
					}
					
					for _, value1 in List do
						config[#config + 1] = value1
					end
					return Host.Frame(config)
				end
				
				return p1.styled(Host.Frame(p2)({
					Size = Size,
					BorderSizePixel = 0,
					BackgroundColor3 = function(p3)
						-- upvalues: Callback (copy), NewTypesColor (upval)
						return Callback(p3).color or NewTypesColor
					end,
					BackgroundTransparency = function(p3): number
						-- upvalues: Callback (copy)
						local CallbackResult = Callback(p3)
						
						return if CallbackResult.color == nil or CallbackResult.alpha < 1 then 1 else 0
					end,
					p1.corner(),
					Host.UIStroke({
						Thickness = 1,
						ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border
					}),
					p1.Compose.show(function(p3): boolean
						-- upvalues: Callback (copy)
						local CallbackResult = Callback(p3)
						
						return CallbackResult.color ~= nil and CallbackResult.alpha < 1
					end, function()
						-- upvalues: Host (upval), TypesUDim2 (upval), p1 (upval), checkerView (copy), Callback (copy), NewTypesColor (upval)
						return Host.CanvasGroup({
							Name = "Paint",
							Size = TypesUDim2.fromScale(1, 1),
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							p1.corner(),
							checkerView(),
							Host.Frame("Plate")({
								BorderSizePixel = 0,
								Size = TypesUDim2.fromScale(1, 1),
								BackgroundColor3 = function(p3)
									-- upvalues: Callback (upval), NewTypesColor (upval)
									return Callback(p3).color or NewTypesColor
								end,
								BackgroundTransparency = function(p3): number
									-- upvalues: Callback (upval)
									local CallbackResult = Callback(p3)
									
									return if CallbackResult.color == nil then 1 else 1 - CallbackResult.alpha
								end
							})
						})
					end),
					p1.Compose.show(function(p3): boolean
						-- upvalues: Callback (copy)
						return Callback(p3).color == nil
					end, function()
						-- upvalues: Host (upval), TypesVector2 (upval), TypesUDim2 (upval), FromRGBResult2 (upval)
						return Host.Frame("Empty")({
							Rotation = -45,
							BorderSizePixel = 0,
							AnchorPoint = TypesVector2.new(0.5, 0.5),
							Position = TypesUDim2.fromScale(0.5, 0.5),
							Size = TypesUDim2.new(1, 0, 0, 1),
							BackgroundColor3 = FromRGBResult2
						})
					end)
				}), "color-swatch")
			end
		}
	end
}