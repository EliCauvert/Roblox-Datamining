local guiService = game:GetService("GuiService")
local workspaceService = game:GetService("Workspace")
local parent = script.Parent.Parent.Parent
local appNavBarModule = require(parent.AppNavBar)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useNavBarPlacement = appNavBarModule.useNavBarPlacement
local useNavBarSize = appNavBarModule.useNavBarSize
local placement = appNavBarModule.Placement
local useTokens = foundationModule.Hooks.useTokens
local image = foundationModule.Image
local view = foundationModule.View

local function _()
	-- upvalues: workspaceService (ref), guiService (ref)
	local currentCamera = workspaceService.CurrentCamera
	
	return if currentCamera then currentCamera.ViewportSize.X else guiService:GetScreenResolution().X
end

return reactModule.memo(function(value)
	-- upvalues: useTokens (ref), responsiveModule (ref), useNavBarPlacement (ref), useNavBarSize (ref), placement (ref), reactModule (ref), workspaceService (ref), guiService (ref), view (ref), image (ref)
	local var1 = useTokens()
	local var2 = responsiveModule.useDeviceInsets()
	local var3 = if useNavBarPlacement() == placement.Left then useNavBarSize() else 0
	local var4, var5 = reactModule.useBinding(UDim2.fromOffset(0, 0))
	local var6, var7 = reactModule.useBinding(UDim2.fromOffset(0, 0))
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useCallback(function(p1)
		-- upvalues: var8 (ref), value (ref), var2 (ref), var3 (ref), workspaceService (copy), guiService (copy), var5 (ref), var7 (ref)
		if not p1 then return end
		var8.current = p1
		local current = value.containerRef.current
		
		if current then
			local vector2 = Vector2.new(-var2.left + var3, -var2.top)
			local var10 = vector2 - p1.AbsolutePosition
			local currentCamera = workspaceService.CurrentCamera
			local var11 = (if currentCamera then currentCamera.ViewportSize.X else guiService:GetScreenResolution().X) + var2.left + var2.right - var3
			local var12 = current.AbsolutePosition.Y + current.AbsoluteSize.Y - vector2.Y
			var5(UDim2.fromOffset(p1.Position.X.Offset + var10.X, p1.Position.Y.Offset + var10.Y))
			var7(UDim2.fromOffset(var11, var12))
			
			return
		end
	end, {
		var3,
		value.containerRef,
		var2.left,
		var2.top,
		var2.right
	})
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var8 (ref), workspaceService (copy), value (ref)
		var9(var8.current)
		local t = {}
		local currentCamera = workspaceService.CurrentCamera
		
		if currentCamera then
			table.insert(t, currentCamera:GetPropertyChangedSignal("ViewportSize"))
		end
		local current = value.containerRef.current
		
		if current then
			table.insert(t, current:GetPropertyChangedSignal("AbsolutePosition"))
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteSize"))
		end
		local t_1 = {}
		
		for i, v in t do
			table.insert(t_1, v:Connect(function()
				-- upvalues: var9 (copy), var8 (copy)
				var9(var8.current)
			end))
		end
		return function()
			-- upvalues: t_1 (ref)
			for i, v in t_1 do
				v:Disconnect()
			end
		end
	end, { value.containerRef, var9 })
	
	return reactModule.createElement(view, { tag = "size-0", ZIndex = -1 }, {
		Background = reactModule.createElement(view, {
			tag = "clip",
			Position = var4,
			Size = var6,
			backgroundStyle = var1.Color.Extended.White.White_100,
			ref = var9
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, value.config.gradientColor),
					ColorSequenceKeypoint.new(0.33, value.config.gradientColor),
					ColorSequenceKeypoint.new(1, var1.Color.Surface.Surface_0.Color3)
				})
			}),
			CenterImage = reactModule.createElement(image, {
				tag = "position-top-center anchor-top-center size-full",
				Image = value.config.centerImage,
				ScaleType = Enum.ScaleType.Stretch,
				sizeConstraint = {
					MinSize = Vector2.new(960, 0),
					MaxSize = Vector2.new(1920, 1e999)
				}
			})
		})
	})
end)