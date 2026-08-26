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

local function BottomRowSwatches(p2)
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
		local var4 = signal.Connect(current:GetPropertyChangedSignal("AbsoluteSize"), function()
			-- upvalues: var2 (copy), current (ref)
			var2(math.round(current.AbsoluteSize.X))
		end)
		
		return function()
			-- upvalues: connection (copy), var4 (ref)
			connection.Disconnect(var4)
		end
	end, { var1 })
	local t = {}
	
	if var1 > 0 then
		local colorsCount = #p2.colors
		local var4 = var1 - p2.paddingHorizontal * 2
		local floored = math.floor(var4 / colorsCount)
		local var5 = p2.paddingHorizontal + math.floor((var4 - floored * (colorsCount - 1)) / 2)
		
		for i, v in ipairs(p2.colors) do
			t[`Swatch_{i}`] = reactModule.createElement(imageModule, {
				Image = "component_assets/hexagon_24",
				Size = UDim2.fromOffset(p2.swatchWidth, p2.swatchHeight),
				Position = UDim2.fromOffset(var5 + floored * (i - 1), p2.swatchCenterY),
				AnchorPoint = Vector2.new(0.5, 0.5),
				imageStyle = { Color3 = v.Color }
			})
		end
	end
	return reactModule.createElement(viewModule, { tag = "size-full", ref = var3 }, t)
end

return function(p3)
	-- upvalues: useTokensModule (ref), reactModule (ref), brickColorConstantsModule (ref), calculateGridRadius (ref), imageModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), BottomRowSwatches (ref)
	local var6 = useTokensModule()
	local size200 = var6.Size.Size_200
	local size350 = var6.Size.Size_350
	local size400 = var6.Size.Size_400
	local size100 = var6.Size.Size_100
	local size350_1 = var6.Size.Size_350
	local size400_1 = var6.Size.Size_400
	local size200_1 = var6.Size.Size_200
	local var7 = reactModule.useMemo(function()
		-- upvalues: brickColorConstantsModule (copy)
		return brickColorConstantsModule.MAIN
	end, {})
	local var8 = reactModule.useMemo(function()
		-- upvalues: brickColorConstantsModule (copy)
		return brickColorConstantsModule.BOTTOM
	end, {})
	local var9 = reactModule.useMemo(function()
		-- upvalues: calculateGridRadius (copy), var7 (ref)
		local var10 = calculateGridRadius(#var7)
		
		if var10 < 3 then
			warn("BrickColorPicker: Calculated grid radius is too small, falling back to minimum")
			
			return 3
		end
		return var10
	end, {})
	local var10, var11 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), size200 (ref), var7 (ref), size350 (ref), size400 (ref)
		local t = {}
		local var12 = 1
		local var13 = size200 + 1
		local rounded = math.round(var13 * 1.5)
		
		for i_1 = 0, var9 - 1 do
			for i = 0, 2 * var9 - 1 - 1 do
				if math.abs(math.floor(var9 / 2) - i_1) + math.abs(math.floor((2 * var9 - 1) / 2) - i) < var9 and i_1 % 2 == i % 2 and var12 <= #var7 then
					table.insert(t, {
						brickColor = var7[var12],
						x = size200 * i,
						y = if rounded then rounded * i_1 else math.round(var13 * 1.5 * i_1)
					})
					var12 += 1
				end
			end
		end
		local var14 = 1e999
		local var15 = -1e999
		local var16 = 1e999
		local var17 = -1e999
		
		for i_2, v in t do
			var14 = math.min(var14, v.x - size350 / 2)
			var15 = math.max(var15, v.x + size350 / 2)
			var16 = math.min(var16, v.y - size400 / 2)
			var17 = math.max(var17, v.y + size400 / 2)
		end
		return t, {
			width = var15 - var14,
			height = var17 - var16,
			offset = Vector2.new(var14, var16)
		}
	end, {
		var9, size200, var7, var8, var6.Size.Size_100, var6.Size.Size_50
	})
	local var18 = reactModule.useCallback(function(p4, p5)
		-- upvalues: var11 (ref), reactModule (copy), imageModule (copy), size350 (ref), size200_1 (ref), size400 (ref), var6 (ref)
		local uDim2 = UDim2.fromOffset(p4.x - var11.offset.X, p4.y - var11.offset.Y)
		local t = {}
		
		if p5 then
			t.outline = reactModule.createElement(imageModule, {
				Image = "component_assets/hexagon_24",
				ZIndex = 1,
				Size = UDim2.fromOffset(size350 + size200_1, size400 + size200_1),
				Position = uDim2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				imageStyle = var6.Color.ActionEmphasis.Background
			})
		end
		t.hexagon = reactModule.createElement(imageModule, {
			Image = "component_assets/hexagon_24",
			ZIndex = 2,
			Size = UDim2.fromOffset(size350, size400),
			Position = uDim2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			imageStyle = { Color3 = p4.brickColor.Color }
		})
		
		return t
	end, { var11.offset.X, var11.offset.Y, size350, size400 })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p3, { tag = "col align-x-center gap-small size-full-0 auto-y" }), {
		ColorGrid = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var11.width, var11.height),
			onActivated = reactModule.useCallback(function(p4, p5)
				-- upvalues: var11 (ref), var10 (ref), size200 (ref), p3 (ref)
				if p5.UserInputType == Enum.UserInputType.MouseButton1 then
					local var19 = nil
					local var20 = 1e999
					local var21 = p5.Position.X - p4.AbsolutePosition.X + var11.offset.X
					local var22 = p5.Position.Y - p4.AbsolutePosition.Y + var11.offset.Y
					
					for i, v in var10 do
						local var23 = (var21 - v.x) ^ 2 + (var22 - v.y) ^ 2
						
						if var23 < var20 then
							var20 = var23
							var19 = v
						end
					end
					if var19 and var20 < size200 * size200 then
						p3.onBrickColorChanged(var19.brickColor)
						
						if p3.onColorChanged then
							p3.onColorChanged(var19.brickColor.Color)
						end
					end
				end
			end, {
				var10,
				var11,
				size200,
				p3.onBrickColorChanged,
				p3.onColorChanged
			}),
			stateLayer = { affordance = stateLayerAffordanceModule.None }
		}, reactModule.useCallback(function()
			-- upvalues: p3 (ref), var10 (ref), var18 (ref)
			local t = {}
			local var24 = p3.selectedColor and p3.selectedColor:getValue() or nil
			
			for i, v in var10 do
				for i_1, v_1 in var18(v, var24 ~= nil and var24 == v.brickColor.Color) do
					t[`{i_1}_{i}`] = v_1
				end
			end
			return t
		end, { p3.selectedColor })()),
		BottomRow = reactModule.createElement(viewModule, {
			tag = "stroke-standard stroke-muted radius-circle bg-surface-100",
			LayoutOrder = 2,
			Size = UDim2.new(1, -var6.Size.Size_400, 0, var6.Size.Size_500),
			onActivated = reactModule.useCallback(function(p6, p7)
				-- upvalues: size100 (ref), var8 (ref), p3 (ref)
				if p7.UserInputType == Enum.UserInputType.MouseButton1 then
					local var25 = p6.AbsoluteSize.X - 2 * size100
					local var26 = p7.Position.X - p6.AbsolutePosition.X - size100
					
					if var26 >= 0 and var26 <= var25 then
						local var27 = var8[math.clamp(math.floor(var26 / var25 * #var8) + 1, 1, #var8)]
						p3.onBrickColorChanged(var27)
						
						if p3.onColorChanged then
							p3.onColorChanged(var27.Color)
						end
					end
				end
			end, { var8, p3.onBrickColorChanged, p3.onColorChanged }),
			stateLayer = { affordance = stateLayerAffordanceModule.None }
		}, {
			Swatches = reactModule.createElement(BottomRowSwatches, {
				colors = var8,
				paddingHorizontal = size100,
				swatchWidth = size350_1,
				swatchHeight = size400_1,
				swatchCenterY = var6.Size.Size_250
			})
		})
	})
end