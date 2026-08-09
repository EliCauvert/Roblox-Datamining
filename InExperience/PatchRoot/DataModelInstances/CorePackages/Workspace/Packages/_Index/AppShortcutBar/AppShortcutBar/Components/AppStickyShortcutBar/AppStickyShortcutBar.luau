local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local responsiveModule = require(parent.Responsive)
local useTokens = foundationModule.Hooks.useTokens
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusedTextBox = focusNavigationUtilsModule.useFocusedTextBox
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local disallowStickyShortcutBarOnNotLoggedIn = game:DefineFastFlag("DisallowStickyShortcutBarOnNotLoggedIn", false)

local function selectUserLoggedIn(p0) --[[ line: 16 ]]
	-- upvalues: loginStatus (ref)
	return p0.AuthenticationStatus and p0.AuthenticationStatus.status == loginStatus.LOGGED_IN
end

local useAppShortcutBarHeight = require(appShortcutBar.Hooks).useAppShortcutBarHeight
local getShortcutBarStatusStoreModule = require(appShortcutBar.Stores.GetShortcutBarStatusStore)
local appShortcut = require(appShortcutBar.Components.AppShortcut).AppShortcut

function AppStickyShortcutBar(p1) --[[ line: 26 ]]
	-- upvalues: getShortcutBarStatusStoreModule (ref), useTokens (ref), useAppShortcutBarHeight (ref), responsiveModule (ref), useFocusedTextBox (ref), disallowStickyShortcutBarOnNotLoggedIn (ref), useSelector (ref), selectUserLoggedIn (ref), focusNavigationEventNameEnum (ref), reactModule (ref), appShortcut (ref)
	local var8 = getShortcutBarStatusStoreModule(false)
	local var9 = useTokens()
	local var10 = useAppShortcutBarHeight()
	local var11 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var12 = if p1.items then if #p1.items ~= 0 then #p1.items == 1 or (useFocusedTextBox() or disallowStickyShortcutBarOnNotLoggedIn and not (if disallowStickyShortcutBarOnNotLoggedIn then useSelector(selectUserLoggedIn) else nil)) else true else not p1.items
	reactModule.useEffect(function() --[[ line: 45 ]]
		-- upvalues: var8 (ref), var12 (ref)
		var8.setShortcutBarVisible(not var12)
	end, { var12 })
	
	if var12 then
		return nil
	end
	local var13 = nil
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var9.Gap.Large)
		})
	}
	local var15 = if var11 then math.min(#p1.items, 4) else #p1.items
	local var16 = 0
	
	for i, v in p1.items do
		if var16 < var15 and v.eventName ~= focusNavigationEventNameEnum.NavigateBack then
			var16 += 1
			local var17 = if var11 then var15 - var16 + 1 else var16
			t["Item_" .. tostring(var17)] = reactModule.createElement(appShortcut, { layoutOrder = var17, item = v })
		end
		if v.eventName == focusNavigationEventNameEnum.NavigateBack then
			var13 = reactModule.createElement(appShortcut, { item = v })
		end
	end
	return reactModule.createElement("ImageButton", {
		BorderSizePixel = 0,
		Selectable = false,
		AutoButtonColor = false,
		BackgroundColor3 = var9.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var9.Color.Surface.Surface_0.Transparency,
		Size = UDim2.new(1, 0, 0, var10),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1)
	}, {
		Divider = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = var9.Color.Stroke.Default.Color3,
			BackgroundTransparency = var9.Color.Stroke.Default.Transparency,
			Size = UDim2.new(1, 0, 0, 1)
		}),
		ShortcutsFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0)
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var9.Size.Size_3000 * 16, var10) }),
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var9.Size.Size_800),
				PaddingTop = UDim.new(0, var9.Padding.XSmall),
				PaddingRight = UDim.new(0, var9.Size.Size_800),
				PaddingBottom = UDim.new(0, var9.Padding.XSmall)
			}),
			BackShortcutFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.fromScale(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY
			}, { BackShortcut = var13 }),
			RightShortcutsFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.fromScale(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.X
			}, t)
		})
	})
end

return AppStickyShortcutBar