local UserInputService = game:GetService("UserInputService")
local AppShortcutBar1 = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar1.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseFocusedTextBoxFunction = require(Parent.FocusNavigationUtils).useFocusedTextBox
local ShortcutBar = require(Parent.UIBlox).App.Navigation.ShortcutBar
local ShortcutBarMinSize = game:DefineFastFlag("ShortcutBarMinSize", false)
local DisableAppShortcutBarAndroidTV = game:DefineFastFlag("DisableAppShortcutBarAndroidTV", false)
local FFlagEnableStickyShortcutBarOnAllPlatformsIxpEnabled = require(AppShortcutBar1.Flags).FFlagEnableStickyShortcutBarOnAllPlatformsIxpEnabled
local UseStickyShortcutBarExposureLoggingModule = require(AppShortcutBar1.Hooks.useStickyShortcutBarExposureLogging)

function AppShortcutBar(Frame: Frame)
	-- upvalues: UseFocusedTextBoxFunction (copy), ResponsiveModule (copy), ReactModule (copy), UserInputService (copy), DisableAppShortcutBarAndroidTV (copy), ShortcutBarMinSize (copy), FFlagEnableStickyShortcutBarOnAllPlatformsIxpEnabled (copy), UseStickyShortcutBarExposureLoggingModule (copy), ShortcutBar (copy)
	local Position = if Frame.Position then Frame.Position else UDim2.fromScale(0.5, 0)
	local AnchorPoint = if Frame.AnchorPoint then Frame.AnchorPoint else Vector2.new(0.5, 0)
	local UseFocusedTextBoxResult = UseFocusedTextBoxFunction()
	local UseLastInputResult = ResponsiveModule.useLastInput()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseLastInputResult ~= ResponsiveModule.Input.Directional or UserInputService:GamepadSupports(UserInputService:GetLastInputType(), Enum.KeyCode.Thumbstick1))
	
	if DisableAppShortcutBarAndroidTV then
		ReactModule.useEffect(function()
			-- upvalues: UserInputService (upval), UseStateResult2 (copy), UseLastInputResult (copy), ResponsiveModule (upval)
			local LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:Connect(function()
				-- upvalues: UseStateResult2 (upval), UseLastInputResult (upval), ResponsiveModule (upval), UserInputService (upval)
				UseStateResult2(UseLastInputResult ~= ResponsiveModule.Input.Directional or UserInputService:GamepadSupports(UserInputService:GetLastInputType(), Enum.KeyCode.Thumbstick1))
			end)
			
			return function()
				-- upvalues: LastInputTypeChangedConnection (copy)
				LastInputTypeChangedConnection:Disconnect()
			end
		end, { UseLastInputResult })
	end
	local NoDisableAppShortcutBarAndroidTV = #Frame.items > 0 and (not UseFocusedTextBoxResult and (not DisableAppShortcutBarAndroidTV or UseStateResult))
	
	if ShortcutBarMinSize then
		local Inverted = not ResponsiveModule.useBreakpointYOrSmaller(ResponsiveModule.Keys.XSmall)
		local Inverted1: boolean = not ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small) and Inverted
		NoDisableAppShortcutBarAndroidTV = NoDisableAppShortcutBarAndroidTV and Inverted1
	end
	if FFlagEnableStickyShortcutBarOnAllPlatformsIxpEnabled then
		UseStickyShortcutBarExposureLoggingModule(NoDisableAppShortcutBarAndroidTV)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 0),
		Size = if ShortcutBarMinSize and Frame.Size then Frame.Size else UDim2.fromScale(1, 1)
	}, if NoDisableAppShortcutBarAndroidTV then ReactModule.createElement(ShortcutBar, {
		items = Frame.items,
		position = Position,
		anchorPoint = AnchorPoint
	}) else nil)
end

return AppShortcutBar