local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ImageModule = require(Foundation.Components.Image)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local BrickColorConstantsModule = require(Foundation.Components.ColorPicker.BrickColorConstants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WrappersModule = require(Foundation.Utility.Wrappers)
local Connection = WrappersModule.Connection
local Signal = WrappersModule.Signal

local function calculateGridRadius(Count): number
	for i = 3, 20, 2 do
		if Count < i * i - math.floor(i / 2) * (math.floor(i / 2) + 1) then
			return i - 2
		end
	end
	return 7
end

local function BottomRowSwatches(p1)
	-- upvalues: ReactModule (copy), Signal (copy), Connection (copy), ImageModule (copy), ViewModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult (copy), UseStateResult2 (copy), Signal (upval), Connection (upval)
		local Current = UseRefResult.current
		
		if not Current then return end
		local Rounded = math.round(Current.AbsoluteSize.X)
		
		if Rounded ~= UseStateResult then
			UseStateResult2(Rounded)
		end
		local ConnectResult = Signal.Connect(Current:GetPropertyChangedSignal("AbsoluteSize"), function()
			-- upvalues: UseStateResult2 (upval), Current (copy)
			UseStateResult2((math.round(Current.AbsoluteSize.X)))
		end)
		
		return function()
			-- upvalues: Connection (upval), ConnectResult (copy)
			Connection.Disconnect(ConnectResult)
		end
	end, { UseStateResult })
	local Elements = {}
	
	if UseStateResult > 0 then
		local CountColors = #p1.colors
		local UseStateResultDelta = UseStateResult - p1.paddingHorizontal * 2
		local Floored = math.floor(UseStateResultDelta / CountColors)
		local NewPaddingHorizontal = p1.paddingHorizontal + math.floor((UseStateResultDelta - Floored * (CountColors - 1)) / 2)
		
		for i, color in ipairs(p1.colors) do
			Elements[`Swatch_{i}`] = ReactModule.createElement(ImageModule, {
				Image = "component_assets/hexagon_24",
				Size = UDim2.fromOffset(p1.swatchWidth, p1.swatchHeight),
				Position = UDim2.fromOffset(NewPaddingHorizontal + Floored * (i - 1), p1.swatchCenterY),
				AnchorPoint = Vector2.new(0.5, 0.5),
				imageStyle = { Color3 = color.Color }
			})
		end
	end
	return ReactModule.createElement(ViewModule, { tag = "size-full", ref = UseRefResult }, Elements)
end

return function(p2)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), BrickColorConstantsModule (copy), calculateGridRadius (copy), ImageModule (copy), ViewModule (copy), WithCommonPropsModule (copy), StateLayerAffordanceModule (copy), BottomRowSwatches (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Size200 = UseTokensModuleResult.Size.Size_200
	local Size350 = UseTokensModuleResult.Size.Size_350
	local Size400 = UseTokensModuleResult.Size.Size_400
	local Size100 = UseTokensModuleResult.Size.Size_100
	local Size350_1 = UseTokensModuleResult.Size.Size_350
	local Size400_1 = UseTokensModuleResult.Size.Size_400
	local Size200_1 = UseTokensModuleResult.Size.Size_200
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: BrickColorConstantsModule (upval)
		return BrickColorConstantsModule.MAIN
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: BrickColorConstantsModule (upval)
		return BrickColorConstantsModule.BOTTOM
	end, {})
	local UseMemoResult2 = ReactModule.useMemo(function(): number
		-- upvalues: calculateGridRadius (upval), UseMemoResult (copy)
		local GridRadius: number = calculateGridRadius(#UseMemoResult)
		
		if GridRadius < 3 then
			warn("BrickColorPicker: Calculated grid radius is too small, falling back to minimum")
			
			return 3
		else
			return GridRadius
		end
	end, {})
	local UseMemoResult3, UseMemoResult2_1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult2 (copy), Size200 (copy), UseMemoResult (copy), Size350 (copy), Size400 (copy)
		local List = {}
		local Count = 1
		local NewSize = Size200 + 1
		local Rounded = math.round(NewSize * 1.5)
		
		for i = 0, UseMemoResult2 - 1 do
			for i1 = 0, 2 * UseMemoResult2 - 1 - 1 do
				if math.abs(math.floor(UseMemoResult2 / 2) - i) + math.abs(math.floor((2 * UseMemoResult2 - 1) / 2) - i1) < UseMemoResult2 and i % 2 == i1 % 2 and Count <= #UseMemoResult then
					table.insert(List, {
						brickColor = UseMemoResult[Count],
						x = Size200 * i1,
						y = if Rounded then Rounded * i else math.round(NewSize * 1.5 * i)
					})
					Count += 1
				end
			end
		end
		local X = 1e999
		local Largest = -1e999
		local Y = 1e999
		local Largest1 = -1e999
		
		for _, Vector in List do
			X = math.min(X, Vector.x - Size350 / 2)
			Largest = math.max(Largest, Vector.x + Size350 / 2)
			Y = math.min(Y, Vector.y - Size400 / 2)
			Largest1 = math.max(Largest1, Vector.y + Size400 / 2)
		end
		return List, {
			width = Largest - X,
			height = Largest1 - Y,
			offset = Vector2.new(X, Y)
		}
	end, {
		UseMemoResult2, Size200, UseMemoResult, UseMemoResult1,
		UseTokensModuleResult.Size.Size_100, UseTokensModuleResult.Size.Size_50
	})
	local UseResult = ReactModule.useCallback(function(Vector, p3)
		-- upvalues: UseMemoResult2_1 (copy), ReactModule (upval), ImageModule (upval), Size350 (copy), Size200_1 (copy), Size400 (copy), UseTokensModuleResult (copy)
		local _UDim2 = UDim2.fromOffset(Vector.x - UseMemoResult2_1.offset.X, Vector.y - UseMemoResult2_1.offset.Y)
		local t = {}
		
		if p3 then
			t.outline = ReactModule.createElement(ImageModule, {
				Image = "component_assets/hexagon_24",
				ZIndex = 1,
				Size = UDim2.fromOffset(Size350 + Size200_1, Size400 + Size200_1),
				Position = _UDim2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				imageStyle = UseTokensModuleResult.Color.ActionEmphasis.Background
			})
		end
		t.hexagon = ReactModule.createElement(ImageModule, {
			Image = "component_assets/hexagon_24",
			ZIndex = 2,
			Size = UDim2.fromOffset(Size350, Size400),
			Position = _UDim2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			imageStyle = { Color3 = Vector.brickColor.Color }
		})
		
		return t
	end, {
		UseMemoResult2_1.offset.X,
		UseMemoResult2_1.offset.Y,
		Size350,
		Size400
	})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p2, { tag = "col align-x-center gap-small size-full-0 auto-y" }), {
		ColorGrid = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(UseMemoResult2_1.width, UseMemoResult2_1.height),
			onActivated = ReactModule.useCallback(function(Frame: Frame, Input)
				-- upvalues: UseMemoResult2_1 (copy), UseMemoResult3 (copy), Size200 (copy), p2 (copy)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					local v1 = nil
					local v2 = 1e999
					local NewX = Input.Position.X - Frame.AbsolutePosition.X + UseMemoResult2_1.offset.X
					local NewY = Input.Position.Y - Frame.AbsolutePosition.Y + UseMemoResult2_1.offset.Y
					
					for _, value in UseMemoResult3 do
						local NewNewX = (NewX - value.x) ^ 2 + (NewY - value.y) ^ 2
						
						if NewNewX < v2 then
							v2 = NewNewX
							v1 = value
						end
					end
					if v1 and v2 < Size200 * Size200 then
						p2.onBrickColorChanged(v1.brickColor)
						
						if p2.onColorChanged then
							p2.onColorChanged(v1.brickColor.Color)
						end
					end
				end
			end, {
				UseMemoResult3,
				UseMemoResult2_1,
				Size200,
				p2.onBrickColorChanged,
				p2.onColorChanged
			}),
			stateLayer = { affordance = StateLayerAffordanceModule.None }
		}, (ReactModule.useCallback(function()
			-- upvalues: p2 (copy), UseMemoResult3 (copy), UseResult (copy)
			local t = {}
			local Value = p2.selectedColor and p2.selectedColor:getValue() or nil
			for i, value in UseMemoResult3 do
				local IsValueMatch: boolean = Value ~= nil and Value == value.brickColor.Color
				for i1, value1 in UseResult(value, IsValueMatch) do
					t[`{i1}_{i}`] = value1
				end
			end
			return t
		end, { p2.selectedColor })())),
		BottomRow = ReactModule.createElement(ViewModule, {
			tag = "stroke-standard stroke-muted radius-circle bg-surface-100",
			LayoutOrder = 2,
			Size = UDim2.new(1, -UseTokensModuleResult.Size.Size_400, 0, UseTokensModuleResult.Size.Size_500),
			onActivated = ReactModule.useCallback(function(Frame: Frame, Input)
				-- upvalues: Size100 (copy), UseMemoResult1 (copy), p2 (copy)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					local XDelta = Frame.AbsoluteSize.X - 2 * Size100
					local XDelta1 = Input.Position.X - Frame.AbsolutePosition.X - Size100
					
					if XDelta1 >= 0 and XDelta1 <= XDelta then
						local UseMemoResultEntry = UseMemoResult1[math.clamp(math.floor(XDelta1 / XDelta * #UseMemoResult1) + 1, 1, #UseMemoResult1)]
						p2.onBrickColorChanged(UseMemoResultEntry)
						
						if p2.onColorChanged then
							p2.onColorChanged(UseMemoResultEntry.Color)
						end
					end
				end
			end, {
				UseMemoResult1,
				p2.onBrickColorChanged,
				p2.onColorChanged
			}),
			stateLayer = { affordance = StateLayerAffordanceModule.None }
		}, {
			Swatches = ReactModule.createElement(BottomRowSwatches, {
				colors = UseMemoResult1,
				paddingHorizontal = Size100,
				swatchWidth = Size350_1,
				swatchHeight = Size400_1,
				swatchCenterY = UseTokensModuleResult.Size.Size_250
			})
		})
	})
end