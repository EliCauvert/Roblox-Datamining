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
local var1 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil

local function selectUserLoggedIn(p1)
	-- upvalues: loginStatus (ref)
	return p1.AuthenticationStatus and p1.AuthenticationStatus.status == loginStatus.LOGGED_IN
end

local useAppShortcutBarHeight = require(appShortcutBar.Hooks).useAppShortcutBarHeight
local getShortcutBarStatusStoreModule = require(appShortcutBar.Stores.GetShortcutBarStatusStore)
local appShortcut = require(appShortcutBar.Components.AppShortcut).AppShortcut

function AppStickyShortcutBar(p1)
	-- upvalues: getShortcutBarStatusStoreModule (ref), useTokens (ref), useAppShortcutBarHeight (ref), responsiveModule (ref), useFocusedTextBox (ref), disallowStickyShortcutBarOnNotLoggedIn (ref), fFlagUseSignalsForAuthenticationStatus (ref), useSignalState (ref), var1 (ref), loginStatus (ref), useSelector (ref), selectUserLoggedIn (ref), focusNavigationEventNameEnum (ref), reactModule (ref), appShortcut (ref)
	local var2 = getShortcutBarStatusStoreModule(false)
	local var3 = useTokens()
	local var4 = useAppShortcutBarHeight()
	local var5 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var6 = useFocusedTextBox()
	local var7 = nil
	
	if disallowStickyShortcutBarOnNotLoggedIn then
		if fFlagUseSignalsForAuthenticationStatus then
			var7 = useSignalState(var1(false).getStatus) == loginStatus.LOGGED_IN
			var7 = nil
		else
			var7 = useSelector(selectUserLoggedIn)
		end
	end
	local var8 = if p1.items then if #p1.items ~= 0 then #p1.items == 1 or (var6 or disallowStickyShortcutBarOnNotLoggedIn and not var7) else true else not p1.items
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var8 (ref)
		var2.setShortcutBarVisible(not var8)
	end, { var8 })
	
	if var8 then
		return nil
	end
	local var9 = nil
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var3.Gap.Large)
		})
	}
	local var10 = if var5 then math.min(#p1.items, 4) else #p1.items
	local var11 = 0
	
	for i, v in p1.items do
		if var11 < var10 and v.eventName ~= focusNavigationEventNameEnum.NavigateBack then
			var11 += 1
			local var12 = if var5 then var10 - var11 + 1 else var11
			t["Item_" .. tostring(var12)] = reactModule.createElement(appShortcut, { layoutOrder = var12, item = v })
		end
		if v.eventName == focusNavigationEventNameEnum.NavigateBack then
			var9 = reactModule.createElement(appShortcut, { item = v })
		end
	end
	return reactModule.createElement("ImageButton", {
		BorderSizePixel = 0,
		Selectable = false,
		AutoButtonColor = false,
		BackgroundColor3 = var3.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var3.Color.Surface.Surface_0.Transparency,
		Size = UDim2.new(1, 0, 0, var4),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1)
	}, {
		Divider = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = var3.Color.Stroke.Default.Color3,
			BackgroundTransparency = var3.Color.Stroke.Default.Transparency,
			Size = UDim2.new(1, 0, 0, 1)
		}),
		ShortcutsFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0)
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var3.Size.Size_3000 * 16, var4) }),
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var3.Size.Size_800),
				PaddingTop = UDim.new(0, var3.Padding.XSmall),
				PaddingRight = UDim.new(0, var3.Size.Size_800),
				PaddingBottom = UDim.new(0, var3.Padding.XSmall)
			}),
			BackShortcutFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.fromScale(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY
			}, { BackShortcut = var9 }),
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