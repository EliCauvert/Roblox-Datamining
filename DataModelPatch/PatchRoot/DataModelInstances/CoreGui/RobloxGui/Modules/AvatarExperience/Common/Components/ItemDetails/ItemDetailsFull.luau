local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local UseDescendantHasFocusFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useDescendantHasFocus
local AnimatedScrollingFrame = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.AnimatedScrollingFrame.AnimatedScrollingFrame
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local GetFFlagAXItemDetailsScrollingEnabledCallbackModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback)
local FFlagAXScrollingFramesShouldAnimateOnFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus
local AXMigrateItemDetailsFullToAutoFocus = game:DefineFastFlag("AXMigrateItemDetailsFullToAutoFocus", false)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local _UDim = UDim.new(1, 0)

local function v13()
	return nil
end

return function(p1)
	-- upvalues: v13 (copy), ReactModule (copy), UseDescendantHasFocusFunction (copy), GamepadUtils (copy), _UDim (copy), RunService (copy), UserInputService (copy), FFlagEnableLeftNavOnConsole (copy), UseSignalStateFunction (copy), DisplayModule (copy), RoactModule (copy), FFlagAXScrollingFramesShouldAnimateOnFocus (copy), AnimatedScrollingFrame (copy), GetFFlagAXItemDetailsScrollingEnabledCallbackModule (copy), AXMigrateItemDetailsFullToAutoFocus (copy)
	local RenderContentFunction = p1.renderContent
	local RenderTopBar = p1.renderTopBar or v13
	local RenderBottomBar = p1.renderBottomBar or v13
	local TopBarHeight = p1.topBarHeight or 0
	local BottomBarHeight = p1.bottomBarHeight or 0
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseDescendantHasFocusResult = UseDescendantHasFocusFunction(UseRefResult1.current)
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseDescendantHasFocusResult (copy), UseRefResult (copy), GamepadUtils (upval), _UDim (upval)
		if not UseDescendantHasFocusResult then return end
		local _Vector2 = Vector2.new(p2.Position.X, p2.Position.Y)
		local Current = UseRefResult.current
		
		if Current then
			local NewY = Current.CanvasPosition.Y + p3 * -GamepadUtils.normalizeStickByDeadzone(_Vector2).Y * 1000
			
			if NewY <= Current.AbsoluteSize.Y * _UDim.Scale + _UDim.Offset then
				Current.CanvasPosition = Vector2.new(0, NewY)
			end
		end
	end, { UseDescendantHasFocusResult })
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval), UseResult (copy), UserInputService (upval)
		local Input = nil
		local HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime)
			-- upvalues: Input (ref), UseResult (upval)
			if Input and Input.KeyCode == Enum.KeyCode.Thumbstick2 then
				UseResult(Input, DeltaTime)
			end
		end)
		local InputChangedConnection = UserInputService.InputChanged:Connect(function(Input1, _)
			-- upvalues: Input (ref)
			if Input1.KeyCode == Enum.KeyCode.Thumbstick2 then
				if Input1.UserInputState == Enum.UserInputState.Change then
					Input = Input1
					
					return
				end
				if Input1.UserInputState == Enum.UserInputState.End then
					Input = nil
				end
			end
		end)
		
		return function()
			-- upvalues: HeartbeatConnection (copy), InputChangedConnection (copy)
			HeartbeatConnection:Disconnect()
			InputChangedConnection:Disconnect()
		end
	end, { UseResult })
	local UseSignalStateResult = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.viewSize,
		Position = p1.viewPosition,
		[RoactModule.Ref] = UseRefResult1
	}, {
		TopBar = RenderTopBar(),
		ScrollingContent = RoactModule.createElement(if FFlagAXScrollingFramesShouldAnimateOnFocus then AnimatedScrollingFrame else "ScrollingFrame", {
			ScrollingEnabled = if GetFFlagAXItemDetailsScrollingEnabledCallbackModule() then p1.scrollingEnabled else nil,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, if FFlagEnableLeftNavOnConsole then UseSignalStateResult.right else 0, 1, -(TopBarHeight + BottomBarHeight)),
			Position = UDim2.new(0, 0, 0, TopBarHeight),
			ScrollBarThickness = 0,
			CanvasSize = UDim2.new(1, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ElasticBehavior = Enum.ElasticBehavior.Never,
			[RoactModule.Ref] = UseRefResult,
			Selectable = not AXMigrateItemDetailsFullToAutoFocus and nil
		}, { Content = RenderContentFunction() }),
		BottomBar = RenderBottomBar()
	})
end