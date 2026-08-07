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

local function calculateGridRadius(p0) --[[ line: 49 ]]
	for i = 3, 20, 2 do
		if p0 >= i * i - math.floor(i / 2) * (math.floor(i / 2) + 1) then
			continue
		end
		return i - 2
	end
	return 7
end

local function BottomRowSwatches(p1) --[[ line: 71 ]]
	-- upvalues: reactModule (ref), signal (ref), connection (ref), imageModule (ref), viewModule (ref)
	local var11, var12 = reactModule.useState(0)
	local var13 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: var13 (ref), var11 (ref), var12 (ref), signal (copy), connection (copy)
		local current = var13.current
		
		if not current then return end
		local rounded = math.round(current.AbsoluteSize.X)
		
		if rounded ~= var11 then
			var12(rounded)
		end
		local var20 = signal.Connect(current:GetPropertyChangedSignal("AbsoluteSize"), function() --[[ line: 84 ]]
			-- upvalues: var12 (copy), current (ref)
			var12(math.round(current.AbsoluteSize.X))
		end)
		
		return function() --[[ line: 87 ]]
			-- upvalues: connection (copy), var20 (ref)
			connection.Disconnect(var20)
		end
	end, { var11 })
	local t = {}
	
	if var11 > 0 then
		local colorsCount = #p1.colors
		local var16 = var11 - p1.paddingHorizontal * 2
		local floored = math.floor(var16 / colorsCount)
		local var18 = p1.paddingHorizontal + math.floor((var16 - floored * (colorsCount - 1)) / 2)
		
		for i, v in ipairs(p1.colors) do
			t[`Swatch_{i}`] = reactModule.createElement(imageModule, {
				Image = "component_assets/hexagon_24",
				Size = UDim2.fromOffset(p1.swatchWidth, p1.swatchHeight),
				Position = UDim2.fromOffset(var18 + floored * (i - 1), p1.swatchCenterY),
				AnchorPoint = Vector2.new(0.5, 0.5),
				imageStyle = { Color3 = v.Color }
			})
		end
	end
	return reactModule.createElement(viewModule, { tag = "size-full", ref = var13 }, t)
end

return function(p2) --[[ line: 122 | named "BrickColorPicker" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), brickColorConstantsModule (ref), calculateGridRadius (ref), imageModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), BottomRowSwatches (ref)
	local var21 = useTokensModule()
	local size200 = var21.Size.Size_200
	local size350 = var21.Size.Size_350
	local size400 = var21.Size.Size_400
	local size100 = var21.Size.Size_100
	local size350_1 = var21.Size.Size_350
	local size400_1 = var21.Size.Size_400
	local size200_1 = var21.Size.Size_200
	local var22 = reactModule.useMemo(function() --[[ line: 134 ]]
		-- upvalues: brickColorConstantsModule (copy)
		return brickColorConstantsModule.MAIN
	end, {})
	local var23 = reactModule.useMemo(function() --[[ line: 138 ]]
		-- upvalues: brickColorConstantsModule (copy)
		return brickColorConstantsModule.BOTTOM
	end, {})
	local var24 = reactModule.useMemo(function() --[[ line: 142 ]]
		-- upvalues: calculateGridRadius (copy), var22 (ref)
		local var28 = calculateGridRadius(#var22)
		
		if var28 < 3 then
			warn("BrickColorPicker: Calculated grid radius is too small, falling back to minimum")
			
			return 3
		end
		return var28
	end, {})
	local var25, var26 = reactModule.useMemo(function() --[[ line: 153 ]]
		-- upvalues: var24 (ref), size200 (ref), var22 (ref), size350 (ref), size400 (ref)
		local t = {}
		local var30 = 1
		local var31 = size200 + 1
		local rounded = math.round(var31 * 1.5)
		
		for i_1 = 0, var24 - 1 do
			for i = 0, 2 * var24 - 1 - 1 do
				if math.abs(math.floor(var24 / 2) - i_1) + math.abs(math.floor((2 * var24 - 1) / 2) - i) < var24 and i_1 % 2 == i % 2 and var30 <= #var22 then
					table.insert(t, {
						brickColor = var22[var30],
						x = size200 * i,
						y = if rounded then rounded * i_1 else math.round(var31 * 1.5 * i_1)
					})
					var30 += 1
				end
			end
		end
		local var33 = 1e999
		local var34 = -1e999
		local var35 = 1e999
		local var36 = -1e999
		
		for i_2, v in t do
			var33 = math.min(var33, v.x - size350 / 2)
			var34 = math.max(var34, v.x + size350 / 2)
			var35 = math.min(var35, v.y - size400 / 2)
			var36 = math.max(var36, v.y + size400 / 2)
		end
		return t, {
			width = var34 - var33,
			height = var36 - var35,
			offset = Vector2.new(var33, var35)
		}
	end, {
		var24, size200, var22, var23, var21.Size.Size_100, var21.Size.Size_50
	})
	local var27 = reactModule.useCallback(function(p3, p4) --[[ line: 252 ]]
		-- upvalues: var26 (ref), reactModule (copy), imageModule (copy), size350 (ref), size200_1 (ref), size400 (ref), var21 (ref)
		local uDim2 = UDim2.fromOffset(p3.x - var26.offset.X, p3.y - var26.offset.Y)
		local t = {}
		
		if p4 then
			t.outline = reactModule.createElement(imageModule, {
				Image = "component_assets/hexagon_24",
				ZIndex = 1,
				Size = UDim2.fromOffset(size350 + size200_1, size400 + size200_1),
				Position = uDim2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				imageStyle = var21.Color.ActionEmphasis.Background
			})
		end
		t.hexagon = reactModule.createElement(imageModule, {
			Image = "component_assets/hexagon_24",
			ZIndex = 2,
			Size = UDim2.fromOffset(size350, size400),
			Position = uDim2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			imageStyle = { Color3 = p3.brickColor.Color }
		})
		
		return t
	end, { var26.offset.X, var26.offset.Y, size350, size400 })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p2, { tag = "col align-x-center gap-small size-full-0 auto-y" }), {
		ColorGrid = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var26.width, var26.height),
			onActivated = reactModule.useCallback(function(p5, p6) --[[ line: 207 ]]
				-- upvalues: var26 (ref), var25 (ref), size200 (ref), p2 (ref)
				if p6.UserInputType == Enum.UserInputType.MouseButton1 then
					local var39 = nil
					local var40 = 1e999
					local var41 = p6.Position.X - p5.AbsolutePosition.X + var26.offset.X
					local var42 = p6.Position.Y - p5.AbsolutePosition.Y + var26.offset.Y
					
					for i, v in var25 do
						local var43 = (var41 - v.x) ^ 2 + (var42 - v.y) ^ 2
						
						if var43 < var40 then
							var40 = var43
							var39 = v
						end
					end
					if var39 and var40 < size200 * size200 then
						p2.onBrickColorChanged(var39.brickColor)
						
						if p2.onColorChanged then
							p2.onColorChanged(var39.brickColor.Color)
						end
					end
				end
			end, {
				var25,
				var26,
				size200,
				p2.onBrickColorChanged,
				p2.onColorChanged
			}),
			stateLayer = { affordance = stateLayerAffordanceModule.None }
		}, reactModule.useCallback(function() --[[ line: 285 ]]
			-- upvalues: p2 (ref), var25 (ref), var27 (ref)
			local t = {}
			local var45 = p2.selectedColor and p2.selectedColor:getValue() or nil
			
			for i, v in var25 do
				for i_1, v_1 in var27(v, var45 ~= nil and var45 == v.brickColor.Color) do
					t[`{i_1}_{i}`] = v_1
				end
			end
			return t
		end, { p2.selectedColor })()),
		BottomRow = reactModule.createElement(viewModule, {
			tag = "stroke-standard stroke-muted radius-circle bg-surface-100",
			LayoutOrder = 2,
			Size = UDim2.new(1, -var21.Size.Size_400, 0, var21.Size.Size_500),
			onActivated = reactModule.useCallback(function(p7, p8) --[[ line: 233 ]]
				-- upvalues: size100 (ref), var23 (ref), p2 (ref)
				if p8.UserInputType == Enum.UserInputType.MouseButton1 then
					local var46 = p7.AbsoluteSize.X - 2 * size100
					local var47 = p8.Position.X - p7.AbsolutePosition.X - size100
					
					if var47 >= 0 and var47 <= var46 then
						local var48 = var23[math.clamp(math.floor(var47 / var46 * #var23) + 1, 1, #var23)]
						p2.onBrickColorChanged(var48)
						
						if p2.onColorChanged then
							p2.onColorChanged(var48.Color)
						end
					end
				end
			end, { var23, p2.onBrickColorChanged, p2.onColorChanged }),
			stateLayer = { affordance = stateLayerAffordanceModule.None }
		}, {
			Swatches = reactModule.createElement(BottomRowSwatches, {
				colors = var23,
				paddingHorizontal = size100,
				swatchWidth = size350_1,
				swatchHeight = size400_1,
				swatchCenterY = var21.Size.Size_250
			})
		})
	})
end