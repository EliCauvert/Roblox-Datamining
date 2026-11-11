local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("DebugPanel").Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _UDim2 = UDim2.new(0, 16, 0, 80)

local function useDragInput(Current, Current1)
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseRefResult = ReactModule.useRef(Current)
	local UseRefResult1 = ReactModule.useRef(Current1)
	UseRefResult.current = Current
	UseRefResult1.current = Current1
	
	return ReactModule.useCallback(function(_, Input)
		-- upvalues: UseRefResult (copy), UserInputService (upval), UseRefResult1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			local Position = Input.Position
			local CurrentResult = UseRefResult.current()
			local InputChangedConnection = nil
			local Connection = nil
			InputChangedConnection = UserInputService.InputChanged:Connect(function(Input)
				-- upvalues: UseRefResult1 (upval), Position (copy), CurrentResult (copy)
				if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
					UseRefResult1.current(Input.Position - Position + CurrentResult)
					
					return
				end
			end)
			Connection = Input.Changed:Connect(function(p1)
				-- upvalues: Input (copy), InputChangedConnection (ref), Connection (ref)
				if p1 == "UserInputState" and Input.UserInputState == Enum.UserInputState.End then
					if InputChangedConnection then
						InputChangedConnection:Disconnect()
					end
					if Connection then
						Connection:Disconnect()
					end
				end
			end)
			
			return
		end
	end, {})
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), _UDim2 (copy), useDragInput (copy), View (copy), Text (copy), FoundationModule (copy), Icon (copy), IconName (copy), IconSize (copy), DashModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p1.initialPosition or _UDim2)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(p1.width or 280)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(400)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.defaultCollapsed == true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local Small: number = UseTokensResult.Padding.Small
	
	return ReactModule.createElement("ScreenGui", {
		DisplayOrder = 10000,
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		Name = p1.screenGuiName or "DevDebugPanel",
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Panel = ReactModule.createElement(View, {
			ClipsDescendants = true,
			Position = UseBindingResult,
			Size = ReactModule.joinBindings({ UseBindingResult1, UseBindingResult3 }):map(function(Entry): UDim2
				-- upvalues: UseStateResult (copy), Small (copy)
				return if UseStateResult then UDim2.new(0, Entry[1], 0, 22 + Small * 2) else UDim2.new(0, Entry[1], 0, Entry[2])
			end),
			backgroundStyle = {
				Transparency = 0.05,
				Color3 = UseTokensResult.Color.Surface.Surface_100.Color3
			},
			cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
			stroke = {
				Color = UseTokensResult.Color.Surface.Surface_0.Color3,
				Thickness = UseTokensResult.Stroke.Standard
			},
			padding = Small
		}, {
			Header = ReactModule.createElement("Frame", {
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, 22),
				BackgroundColor3 = UseTokensResult.Color.Surface.Surface_200.Color3,
				BackgroundTransparency = if UseStateResult1 then 0.4 else 1,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Active = true,
				[ReactModule.Event.InputBegan] = useDragInput(function(): Vector3
					-- upvalues: UseBindingResult (copy)
					local Value = UseBindingResult:getValue()
					
					return (Vector3.new(Value.X.Offset, Value.Y.Offset, 0))
				end, function(Vector)
					-- upvalues: UseBindingResult (copy), UseBindingResult2 (copy)
					local Value = UseBindingResult:getValue()
					UseBindingResult2(UDim2.new(Value.X.Scale, Vector.X, Value.Y.Scale, Vector.Y))
				end),
				[ReactModule.Event.MouseEnter] = function()
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1(true)
				end,
				[ReactModule.Event.MouseLeave] = function()
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1(false)
				end
			}, {
				HeaderPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseTokensResult.Padding.XXSmall)
				}),
				TitleLabel = ReactModule.createElement(Text, {
					tag = "text-label-small content-emphasis",
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 0, 0.5, 0),
					Size = UDim2.new(1, -26, 1, 0),
					Text = p1.title
				}),
				CollapseButton = ReactModule.createElement(View, {
					ClipsDescendants = true,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, 0, 0.5, 0),
					Size = UDim2.new(0, 22, 0, 22),
					backgroundStyle = {
						Transparency = 0,
						Color3 = UseTokensResult.Color.Surface.Surface_300.Color3
					},
					cornerRadius = UDim.new(0, UseTokensResult.Radius.Small),
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(function(p2): boolean
							return not p2
						end)
					end, {}),
					stateLayer = { mode = FoundationModule.Enums.StateLayerMode.Inverse }
				}, {
					CollapseIcon = ReactModule.createElement(Icon, {
						tag = "content-emphasis",
						name = if UseStateResult then IconName.PlusSmall else IconName.MinusSmall,
						size = IconSize.Small,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					})
				})
			}),
			Body = ReactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 0.5,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Visible = not UseStateResult,
				Position = UDim2.new(0, 0, 0, 22 + Small),
				Size = UDim2.new(1, 0, 1, -(22 + Small)),
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollBarThickness = UseTokensResult.Radius.Small,
				ScrollBarImageColor3 = UseTokensResult.Color.Surface.Surface_300.Color3,
				BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}, DashModule.join({
				Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Small) }),
				BodyPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, UseTokensResult.Padding.Small),
					PaddingBottom = UDim.new(0, UseTokensResult.Padding.Small),
					PaddingLeft = UDim.new(0, UseTokensResult.Padding.Small),
					PaddingRight = UDim.new(0, UseTokensResult.Padding.Small)
				}),
				Layout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, Small),
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				})
			}, p1.children)),
			ResizeHandle = ReactModule.createElement("TextButton", {
				Visible = not UseStateResult,
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, Small, 1, Small),
				Size = UDim2.new(0, 16, 0, 16),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				[ReactModule.Event.InputBegan] = useDragInput(function(): Vector3
					-- upvalues: UseBindingResult1 (copy), UseBindingResult3 (copy)
					return (Vector3.new(UseBindingResult1:getValue(), UseBindingResult3:getValue(), 0))
				end, function(Vector)
					-- upvalues: UseBindingResult2_1 (copy), UseBindingResult2_2 (copy)
					UseBindingResult2_1((math.max(200, Vector.X)))
					UseBindingResult2_2((math.max(100, Vector.Y)))
				end)
			}, {
				ResizeIcon = ReactModule.createElement(Icon, {
					tag = "content-emphasis",
					Rotation = -45,
					name = IconName.ChevronSmallDown,
					size = IconSize.Medium,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				})
			})
		})
	})
end