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
local useSignalState = require(parent.SignalsReact).useSignalState
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local disallowStickyShortcutBarOnNotLoggedIn = game:DefineFastFlag("DisallowStickyShortcutBarOnNotLoggedIn", false)
local fFlagUseSignalsForAuthenticationStatus = require(parent.SharedFlags).FFlagUseSignalsForAuthenticationStatus
local var6 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil

local function selectUserLoggedIn(p0)
	-- upvalues: loginStatus (ref)
	return p0.AuthenticationStatus and p0.AuthenticationStatus.status == loginStatus.LOGGED_IN
end

local useAppShortcutBarHeight = require(appShortcutBar.Hooks).useAppShortcutBarHeight
local getShortcutBarStatusStoreModule = require(appShortcutBar.Stores.GetShortcutBarStatusStore)
local appShortcut = require(appShortcutBar.Components.AppShortcut).AppShortcut

function AppStickyShortcutBar(p1)
	-- upvalues: getShortcutBarStatusStoreModule (ref), useTokens (ref), useAppShortcutBarHeight (ref), responsiveModule (ref), useFocusedTextBox (ref), disallowStickyShortcutBarOnNotLoggedIn (ref), fFlagUseSignalsForAuthenticationStatus (ref), useSignalState (ref), var6 (ref), loginStatus (ref), useSelector (ref), selectUserLoggedIn (ref), focusNavigationEventNameEnum (ref), reactModule (ref), appShortcut (ref)
	local var9 = getShortcutBarStatusStoreModule(false)
	local var10 = useTokens()
	local var11 = useAppShortcutBarHeight()
	local var12 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var13 = useFocusedTextBox()
	local var14 = nil
	
	if disallowStickyShortcutBarOnNotLoggedIn then
		if fFlagUseSignalsForAuthenticationStatus then
			var14 = useSignalState(var6(false).getStatus) == loginStatus.LOGGED_IN
			var14 = nil
		else
			var14 = useSelector(selectUserLoggedIn)
		end
	end
	local var15 = if p1.items then if #p1.items ~= 0 then #p1.items == 1 or (var13 or disallowStickyShortcutBarOnNotLoggedIn and not var14) else true else not p1.items
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var15 (ref)
		var9.setShortcutBarVisible(not var15)
	end, { var15 })
	
	if var15 then
		return nil
	end
	local var16 = nil
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var10.Gap.Large)
		})
	}
	local var18 = if var12 then math.min(#p1.items, 4) else #p1.items
	local var19 = 0
	
	for i, v in p1.items do
		if var19 < var18 and v.eventName ~= focusNavigationEventNameEnum.NavigateBack then
			var19 += 1
			local var20 = if var12 then var18 - var19 + 1 else var19
			t["Item_" .. tostring(var20)] = reactModule.createElement(appShortcut, { layoutOrder = var20, item = v })
		end
		if v.eventName == focusNavigationEventNameEnum.NavigateBack then
			var16 = reactModule.createElement(appShortcut, { item = v })
		end
	end
	return reactModule.createElement("ImageButton", {
		BorderSizePixel = 0,
		Selectable = false,
		AutoButtonColor = false,
		BackgroundColor3 = var10.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var10.Color.Surface.Surface_0.Transparency,
		Size = UDim2.new(1, 0, 0, var11),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1)
	}, {
		Divider = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = var10.Color.Stroke.Default.Color3,
			BackgroundTransparency = var10.Color.Stroke.Default.Transparency,
			Size = UDim2.new(1, 0, 0, 1)
		}),
		ShortcutsFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0)
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var10.Size.Size_3000 * 16, var11) }),
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var10.Size.Size_800),
				PaddingTop = UDim.new(0, var10.Padding.XSmall),
				PaddingRight = UDim.new(0, var10.Size.Size_800),
				PaddingBottom = UDim.new(0, var10.Padding.XSmall)
			}),
			BackShortcutFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.fromScale(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY
			}, { BackShortcut = var16 }),
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