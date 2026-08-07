local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useFocusedTextBox = require(parent.FocusNavigationUtils).useFocusedTextBox
local shortcutBar = require(parent.UIBlox).App.Navigation.ShortcutBar
local shortcutBarMinSize = game:DefineFastFlag("ShortcutBarMinSize", false)
local disableAppShortcutBarAndroidTV = game:DefineFastFlag("DisableAppShortcutBarAndroidTV", false)

function AppShortcutBar(p0) --[[ line: 23 ]]
	-- upvalues: useFocusedTextBox (ref), responsiveModule (ref), reactModule (ref), userInputService (ref), disableAppShortcutBarAndroidTV (ref), shortcutBarMinSize (ref), shortcutBar (ref)
	local var5 = if p0.Position then p0.Position else UDim2.fromScale(0.5, 0)
	local var6 = if p0.AnchorPoint then p0.AnchorPoint else Vector2.new(0.5, 0)
	local var7 = useFocusedTextBox()
	local var8 = responsiveModule.useLastInput()
	local var9, var10 = reactModule.useState(if var8 == responsiveModule.Input.Directional then userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.Thumbstick1) else true)
	
	if disableAppShortcutBarAndroidTV then
		reactModule.useEffect(function() --[[ line: 34 ]]
			-- upvalues: userInputService (copy), var10 (ref), var8 (ref), responsiveModule (copy)
			local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function() --[[ line: 35 ]]
				-- upvalues: var10 (copy), var8 (copy), responsiveModule (copy), userInputService (copy)
				var10(if var8 == responsiveModule.Input.Directional then userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.Thumbstick1) else true)
			end)
			
			return function() --[[ line: 44 ]]
				-- upvalues: lastInputTypeChangedConnection (ref)
				lastInputTypeChangedConnection:Disconnect()
			end
		end, { var8 })
	end
	local var11 = #p0.items > 0 and (not var7 and (not disableAppShortcutBarAndroidTV or var9))
	
	if shortcutBarMinSize then
		var11 = var11 and (not responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) and not responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.XSmall))
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 0),
		Size = if shortcutBarMinSize and p0.Size then p0.Size else UDim2.fromScale(1, 1)
	}, if var11 then reactModule.createElement(shortcutBar, { items = p0.items, position = var5, anchorPoint = var6 }) else nil)
end

return AppShortcutBar