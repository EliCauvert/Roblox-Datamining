local GuiService = game:GetService("GuiService")
local Workspace = game:GetService("Workspace")
local Parent = script.Parent.Parent.Parent
local AppNavBarModule = require(Parent.AppNavBar)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagSplitPaneFixClassicThemeHeader = require(Parent.SharedFlags).FFlagSplitPaneFixClassicThemeHeader
local SplitPaneModule = if FFlagSplitPaneFixClassicThemeHeader then require(Parent.SplitPane) else nil
local SplitPaneStore = if FFlagSplitPaneFixClassicThemeHeader then SplitPaneModule.SplitPaneStore else nil
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local UseNavBarSizeFunction = AppNavBarModule.useNavBarSize
local Placement = AppNavBarModule.Placement
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Image = FoundationModule.Image
local View = FoundationModule.View

local function _()
	-- upvalues: Workspace (copy), GuiService (copy)
	local CurrentCamera = Workspace.CurrentCamera
	
	return if CurrentCamera then CurrentCamera.ViewportSize.X else GuiService:GetScreenResolution().X
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy), UseNavBarPlacementFunction (copy), UseNavBarSizeFunction (copy), Placement (copy), FFlagSplitPaneFixClassicThemeHeader (copy), SplitPaneStore (copy), SignalsReactModule (copy), SplitPaneModule (copy), ReactModule (copy), Workspace (copy), GuiService (copy), View (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = ResponsiveModule.useDeviceInsets()
	local UseNavBarPlacementResult = UseNavBarPlacementFunction()
	local UseNavBarSizeResult = UseNavBarSizeFunction()
	local UseNavBarSizeResult1 = if UseNavBarPlacementResult == Placement.Left then UseNavBarSizeResult else 0
	local IsUseSignalStateResultMatch: boolean? = nil
	local UseSignalStateResult = nil
	
	if FFlagSplitPaneFixClassicThemeHeader then
		local Store = SplitPaneStore.getStore()
		IsUseSignalStateResultMatch = SignalsReactModule.useSignalState(Store.getSupportPaneModeIfActive) == SplitPaneModule.SupportPaneMode.Normal
		UseSignalStateResult = SignalsReactModule.useSignalState(Store.getContentRegionRect)
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromOffset(0, 0))
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(UDim2.fromOffset(0, 0))
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), p1 (copy), UseDeviceInsetsResult (copy), UseNavBarSizeResult1 (copy), FFlagSplitPaneFixClassicThemeHeader (upval), IsUseSignalStateResultMatch (ref), UseSignalStateResult (ref), Workspace (upval), GuiService (upval), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		if not Current then return end
		UseRefResult.current = Current
		local Current1 = p1.containerRef.current
		
		if not Current1 then return end
		local _Vector2 = Vector2.new(-UseDeviceInsetsResult.left + UseNavBarSizeResult1, -UseDeviceInsetsResult.top)
		local VectorDelta: Vector2 = _Vector2 - Current.AbsolutePosition
		local LeftDelta = nil
		
		if FFlagSplitPaneFixClassicThemeHeader and IsUseSignalStateResultMatch and UseSignalStateResult then
			LeftDelta = UseSignalStateResult.Max.X - _Vector2.X
		else
			local CurrentCamera = Workspace.CurrentCamera
			LeftDelta = (if CurrentCamera then CurrentCamera.ViewportSize.X else GuiService:GetScreenResolution().X) + UseDeviceInsetsResult.left + UseDeviceInsetsResult.right - UseNavBarSizeResult1
		end
		local YDelta = Current1.AbsolutePosition.Y + Current1.AbsoluteSize.Y - _Vector2.Y
		UseBindingResult2(UDim2.fromOffset(Current.Position.X.Offset + VectorDelta.X, Current.Position.Y.Offset + VectorDelta.Y))
		UseBindingResult2_1(UDim2.fromOffset(LeftDelta, YDelta))
	end, {
		UseNavBarSizeResult1, p1.containerRef, UseDeviceInsetsResult.left,
		UseDeviceInsetsResult.top, UseDeviceInsetsResult.right,
		if FFlagSplitPaneFixClassicThemeHeader then IsUseSignalStateResultMatch else nil,
		if FFlagSplitPaneFixClassicThemeHeader then UseSignalStateResult else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), UseRefResult (copy), Workspace (upval), p1 (copy)
		UseResult(UseRefResult.current)
		local List = {}
		local CurrentCamera = Workspace.CurrentCamera
		
		if CurrentCamera then
			table.insert(List, CurrentCamera:GetPropertyChangedSignal("ViewportSize"))
		end
		local Current = p1.containerRef.current
		
		if Current then
			table.insert(List, Current:GetPropertyChangedSignal("AbsolutePosition"))
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteSize"))
		end
		local List1 = {}
		
		for _, Signal in List do
			table.insert(List1, (Signal:Connect(function()
				-- upvalues: UseResult (upval), UseRefResult (upval)
				UseResult(UseRefResult.current)
			end)))
		end
		return function()
			-- upvalues: List1 (copy)
			for _, Connection in List1 do
				Connection:Disconnect()
			end
		end
	end, { p1.containerRef, UseResult })
	
	return ReactModule.createElement(View, { tag = "size-0", ZIndex = -1 }, {
		Background = ReactModule.createElement(View, {
			tag = "clip",
			Position = UseBindingResult,
			Size = UseBindingResult1,
			backgroundStyle = UseTokensResult.Color.Extended.White.White_100,
			ref = UseResult
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, p1.config.gradientColor),
					ColorSequenceKeypoint.new(0.33, p1.config.gradientColor),
					ColorSequenceKeypoint.new(1, UseTokensResult.Color.Surface.Surface_0.Color3)
				})
			}),
			CenterImage = ReactModule.createElement(Image, {
				tag = "position-top-center anchor-top-center size-full",
				Image = p1.config.centerImage,
				ScaleType = Enum.ScaleType.Stretch,
				sizeConstraint = {
					MinSize = Vector2.new(960, 0),
					MaxSize = Vector2.new(1920, 1e999)
				}
			})
		})
	})
end)