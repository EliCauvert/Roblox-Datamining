local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useFocusedTextBox = require(parent.FocusNavigationUtils).useFocusedTextBox
local shortcutBar = require(parent.UIBlox).App.Navigation.ShortcutBar
local shortcutBarMinSize = game:DefineFastFlag("ShortcutBarMinSize", false)
local disableAppShortcutBarAndroidTV = game:DefineFastFlag("DisableAppShortcutBarAndroidTV", false)

function AppShortcutBar(p1)
	-- upvalues: useFocusedTextBox (ref), responsiveModule (ref), reactModule (ref), userInputService (ref), disableAppShortcutBarAndroidTV (ref), shortcutBarMinSize (ref), shortcutBar (ref)
	local var1 = if p1.Position then p1.Position else UDim2.fromScale(0.5, 0)
	local var2 = if p1.AnchorPoint then p1.AnchorPoint else Vector2.new(0.5, 0)
	local var3 = useFocusedTextBox()
	local var4 = responsiveModule.useLastInput()
	local var5, var6 = reactModule.useState(if var4 == responsiveModule.Input.Directional then userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.Thumbstick1) else true)
	
	if disableAppShortcutBarAndroidTV then
		reactModule.useEffect(function()
			-- upvalues: userInputService (copy), var6 (ref), var4 (ref), responsiveModule (copy)
			local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function()
				-- upvalues: var6 (copy), var4 (copy), responsiveModule (copy), userInputService (copy)
				var6(if var4 == responsiveModule.Input.Directional then userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.Thumbstick1) else true)
			end)
			
			return function()
				-- upvalues: lastInputTypeChangedConnection (ref)
				lastInputTypeChangedConnection:Disconnect()
			end
		end, { var4 })
	end
	local var7 = #p1.items > 0 and (not var3 and (not disableAppShortcutBarAndroidTV or var5))
	
	if shortcutBarMinSize then
		var7 = var7 and (not responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) and not responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.XSmall))
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 0),
		Size = if shortcutBarMinSize and p1.Size then p1.Size else UDim2.fromScale(1, 1)
	}, if var7 then reactModule.createElement(shortcutBar, { items = p1.items, position = var1, anchorPoint = var2 }) else nil)
end

return AppShortcutBar