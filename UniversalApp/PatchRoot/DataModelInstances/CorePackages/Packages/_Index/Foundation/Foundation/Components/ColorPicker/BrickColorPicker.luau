local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local imageModule = require(foundation.Components.Image)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local brickColorConstantsModule = require(foundation.Components.ColorPicker.BrickColorConstants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local wrappersModule = require(foundation.Utility.Wrappers)
local connection = wrappersModule.Connection
local signal = wrappersModule.Signal

local function calculateGridRadius(p1)
	for i = 3, 20, 2 do
		if p1 >= i * i - math.floor(i / 2) * (math.floor(i / 2) + 1) then
			continue
		end
		return i - 2
	end
	return 7
end

local function BottomRowSwatches(p1)
	-- upvalues: reactModule (ref), signal (ref), connection (ref), imageModule (ref), viewModule (ref)
	local var1, var2 = reactModule.useState(0)
	local var3 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref), var2 (ref), signal (copy), connection (copy)
		local current = var3.current
		
		if not current then return end
		local rounded = math.round(current.AbsoluteSize.X)
		
		if rounded ~= var1 then
			var2(rounded)
		end
		local var1 = signal.Connect(current:GetPropertyChangedSignal("AbsoluteSize"), function()
			-- upvalues: var2 (copy), current (ref)
			var2(math.round(current.AbsoluteSize.X))
		end)
		
		return function()
			-- upvalues: connection (copy), var1 (ref)
			connection.Disconnect(var1)
		end
	end, { var1 })
	local t = {}
	
	if var1 > 0 then
		local colorsCount = #p1.colors
		local var4 = var1 - p1.paddingHorizontal * 2
		local floored = math.floor(var4 / colorsCount)
		local var5 = p1.paddingHorizontal + math.floor((var4 - floored * (colorsCount - 1)) / 2)
		
		for i, v in ipairs(p1.colors) do
			t[`Swatch_{i}`] = reactModule.createElement(imageModule, {
				Image = "component_assets/hexagon_24",
				Size = UDim2.fromOffset(p1.swatchWidth, p1.swatchHeight),
				Position = UDim2.fromOffset(var5 + floored * (i - 1), p1.swatchCenterY),
				AnchorPoint = Vector2.new(0.5, 0.5),
				imageStyle = { Color3 = v.Color }
			})
		end
	end
	return reactModule.createElement(viewModule, { tag = "size-full", ref = var3 }, t)
end

return function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), brickColorConstantsModule (ref), calculateGridRadius (ref), imageModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), BottomRowSwatches (ref)
	local var1 = useTokensModule()
	local size200 = var1.Size.Size_200
	local size350 = var1.Size.Size_350
	local size400 = var1.Size.Size_400
	local size100 = var1.Size.Size_100
	local size350_1 = var1.Size.Size_350
	local size400_1 = var1.Size.Size_400
	local size200_1 = var1.Size.Size_200
	local var2 = reactModule.useMemo(function()
		-- upvalues: brickColorConstantsModule (copy)
		return brickColorConstantsModule.MAIN
	end, {})
	local var3 = reactModule.useMemo(function()
		-- upvalues: brickColorConstantsModule (copy)
		return brickColorConstantsModule.BOTTOM
	end, {})
	local var4 = reactModule.useMemo(function()
		-- upvalues: calculateGridRadius (copy), var2 (ref)
		local var1 = calculateGridRadius(#var2)
		
		if var1 < 3 then
			warn("BrickColorPicker: Calculated grid radius is too small, falling back to minimum")
			
			return 3
		end
		return var1
	end, {})
	local var5, var6 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), size200 (ref), var2 (ref), size350 (ref), size400 (ref)
		local t = {}
		local var1 = 1
		local var2 = size200 + 1
		local rounded = math.round(var2 * 1.5)
		
		for i_1 = 0, var4 - 1 do
			for i = 0, 2 * var4 - 1 - 1 do
				if math.abs(math.floor(var4 / 2) - i_1) + math.abs(math.floor((2 * var4 - 1) / 2) - i) < var4 and i_1 % 2 == i % 2 and var1 <= #var2 then
					table.insert(t, {
						brickColor = var2[var1],
						x = size200 * i,
						y = if rounded then rounded * i_1 else math.round(var2 * 1.5 * i_1)
					})
					var1 += 1
				end
			end
		end
		local var3 = 1e999
		local var4 = -1e999
		local var5 = 1e999
		local var6 = -1e999
		
		for i_2, v in t do
			var3 = math.min(var3, v.x - size350 / 2)
			var4 = math.max(var4, v.x + size350 / 2)
			var5 = math.min(var5, v.y - size400 / 2)
			var6 = math.max(var6, v.y + size400 / 2)
		end
		return t, {
			width = var4 - var3,
			height = var6 - var5,
			offset = Vector2.new(var3, var5)
		}
	end, {
		var4, size200, var2, var3, var1.Size.Size_100, var1.Size.Size_50
	})
	local var7 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var6 (ref), reactModule (copy), imageModule (copy), size350 (ref), size200_1 (ref), size400 (ref), var1 (ref)
		local uDim2 = UDim2.fromOffset(p1.x - var6.offset.X, p1.y - var6.offset.Y)
		local t = {}
		
		if p2 then
			t.outline = reactModule.createElement(imageModule, {
				Image = "component_assets/hexagon_24",
				ZIndex = 1,
				Size = UDim2.fromOffset(size350 + size200_1, size400 + size200_1),
				Position = uDim2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				imageStyle = var1.Color.ActionEmphasis.Background
			})
		end
		t.hexagon = reactModule.createElement(imageModule, {
			Image = "component_assets/hexagon_24",
			ZIndex = 2,
			Size = UDim2.fromOffset(size350, size400),
			Position = uDim2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			imageStyle = { Color3 = p1.brickColor.Color }
		})
		
		return t
	end, { var6.offset.X, var6.offset.Y, size350, size400 })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, { tag = "col align-x-center gap-small size-full-0 auto-y" }), {
		ColorGrid = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var6.width, var6.height),
			onActivated = reactModule.useCallback(function(p1, p2)
				-- upvalues: var6 (ref), var5 (ref), size200 (ref), p1 (ref)
				if p2.UserInputType == Enum.UserInputType.MouseButton1 then
					local var1 = nil
					local var2 = 1e999
					local var3 = p2.Position.X - p1.AbsolutePosition.X + var6.offset.X
					local var4 = p2.Position.Y - p1.AbsolutePosition.Y + var6.offset.Y
					
					for i, v in var5 do
						local var5 = (var3 - v.x) ^ 2 + (var4 - v.y) ^ 2
						
						if var5 < var2 then
							var2 = var5
							var1 = v
						end
					end
					if var1 and var2 < size200 * size200 then
						p1.onBrickColorChanged(var1.brickColor)
						
						if p1.onColorChanged then
							p1.onColorChanged(var1.brickColor.Color)
						end
					end
				end
			end, {
				var5,
				var6,
				size200,
				p1.onBrickColorChanged,
				p1.onColorChanged
			}),
			stateLayer = { affordance = stateLayerAffordanceModule.None }
		}, reactModule.useCallback(function()
			-- upvalues: p1 (ref), var5 (ref), var7 (ref)
			local t = {}
			local var1 = p1.selectedColor and p1.selectedColor:getValue() or nil
			
			for i, v in var5 do
				for i_1, v_1 in var7(v, var1 ~= nil and var1 == v.brickColor.Color) do
					t[`{i_1}_{i}`] = v_1
				end
			end
			return t
		end, { p1.selectedColor })()),
		BottomRow = reactModule.createElement(viewModule, {
			tag = "stroke-standard stroke-muted radius-circle bg-surface-100",
			LayoutOrder = 2,
			Size = UDim2.new(1, -var1.Size.Size_400, 0, var1.Size.Size_500),
			onActivated = reactModule.useCallback(function(p1, p2)
				-- upvalues: size100 (ref), var3 (ref), p1 (ref)
				if p2.UserInputType == Enum.UserInputType.MouseButton1 then
					local var1 = p1.AbsoluteSize.X - 2 * size100
					local var2 = p2.Position.X - p1.AbsolutePosition.X - size100
					
					if var2 >= 0 and var2 <= var1 then
						local var3 = var3[math.clamp(math.floor(var2 / var1 * #var3) + 1, 1, #var3)]
						p1.onBrickColorChanged(var3)
						
						if p1.onColorChanged then
							p1.onColorChanged(var3.Color)
						end
					end
				end
			end, { var3, p1.onBrickColorChanged, p1.onColorChanged }),
			stateLayer = { affordance = stateLayerAffordanceModule.None }
		}, {
			Swatches = reactModule.createElement(BottomRowSwatches, {
				colors = var3,
				paddingHorizontal = size100,
				swatchWidth = size350_1,
				swatchHeight = size400_1,
				swatchCenterY = var1.Size.Size_250
			})
		})
	})
end