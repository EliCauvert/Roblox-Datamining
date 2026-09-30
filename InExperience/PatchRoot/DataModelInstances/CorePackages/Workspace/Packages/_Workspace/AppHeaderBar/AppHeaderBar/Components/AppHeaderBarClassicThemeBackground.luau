local guiService = game:GetService("GuiService")
local workspaceService = game:GetService("Workspace")
local parent = script.Parent.Parent.Parent
local appNavBarModule = require(parent.AppNavBar)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local signalsReactModule = require(parent.SignalsReact)
local fFlagSplitPaneFixClassicThemeHeader = require(parent.SharedFlags).FFlagSplitPaneFixClassicThemeHeader
local var1 = if fFlagSplitPaneFixClassicThemeHeader then require(parent.SplitPane) else nil
local var2 = if fFlagSplitPaneFixClassicThemeHeader then var1.SplitPaneStore else nil
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
	-- upvalues: useTokens (ref), responsiveModule (ref), useNavBarPlacement (ref), useNavBarSize (ref), placement (ref), fFlagSplitPaneFixClassicThemeHeader (ref), var2 (ref), signalsReactModule (ref), var1 (ref), reactModule (ref), workspaceService (ref), guiService (ref), view (ref), image (ref)
	local var3 = useTokens()
	local var4 = responsiveModule.useDeviceInsets()
	local var5 = if useNavBarPlacement() == placement.Left then useNavBarSize() else 0
	local var6 = nil
	local var7 = nil
	
	if fFlagSplitPaneFixClassicThemeHeader then
		local store = var2.getStore()
		var6 = signalsReactModule.useSignalState(store.getSupportPaneModeIfActive) == var1.SupportPaneMode.Normal
		var7 = signalsReactModule.useSignalState(store.getContentRegionRect)
	end
	local var8, var9 = reactModule.useBinding(UDim2.fromOffset(0, 0))
	local var10, var11 = reactModule.useBinding(UDim2.fromOffset(0, 0))
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useCallback(function(p1)
		-- upvalues: var12 (ref), value (ref), var4 (ref), var5 (ref), fFlagSplitPaneFixClassicThemeHeader (copy), var6 (write), var7 (write), workspaceService (copy), guiService (copy), var9 (ref), var11 (ref)
		if not p1 then return end
		var12.current = p1
		local current = value.containerRef.current
		
		if not current then return end
		local var14
		local vector2 = Vector2.new(-var4.left + var5, -var4.top)
		local var15 = vector2 - p1.AbsolutePosition
		local _ = nil
		
		if fFlagSplitPaneFixClassicThemeHeader and var6 and var7 then
			var14 = var7.Max.X - vector2.X
		else
			local currentCamera = workspaceService.CurrentCamera
			var14 = (if currentCamera then currentCamera.ViewportSize.X else guiService:GetScreenResolution().X) + var4.left + var4.right - var5
		end
		local var16 = current.AbsolutePosition.Y + current.AbsoluteSize.Y - vector2.Y
		var9(UDim2.fromOffset(p1.Position.X.Offset + var15.X, p1.Position.Y.Offset + var15.Y))
		var11(UDim2.fromOffset(var14, var16))
	end, {
		var5, value.containerRef, var4.left, var4.top, var4.right,
		if fFlagSplitPaneFixClassicThemeHeader then var6 else nil,
		if fFlagSplitPaneFixClassicThemeHeader then var7 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var12 (ref), workspaceService (copy), value (ref)
		var13(var12.current)
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
				-- upvalues: var13 (copy), var12 (copy)
				var13(var12.current)
			end))
		end
		return function()
			-- upvalues: t_1 (ref)
			for i, v in t_1 do
				v:Disconnect()
			end
		end
	end, { value.containerRef, var13 })
	
	return reactModule.createElement(view, { tag = "size-0", ZIndex = -1 }, {
		Background = reactModule.createElement(view, {
			tag = "clip",
			Position = var8,
			Size = var10,
			backgroundStyle = var3.Color.Extended.White.White_100,
			ref = var13
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, value.config.gradientColor),
					ColorSequenceKeypoint.new(0.33, value.config.gradientColor),
					ColorSequenceKeypoint.new(1, var3.Color.Surface.Surface_0.Color3)
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