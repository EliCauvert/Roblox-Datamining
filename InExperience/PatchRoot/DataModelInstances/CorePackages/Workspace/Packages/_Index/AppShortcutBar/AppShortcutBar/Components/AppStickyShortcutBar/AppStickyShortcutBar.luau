local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local responsiveModule = require(parent.Responsive)
local displayModule = require(parent.Display)
local useTokens = foundationModule.Hooks.useTokens
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusedTextBox = focusNavigationUtilsModule.useFocusedTextBox
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local disallowStickyShortcutBarOnNotLoggedIn = game:DefineFastFlag("DisallowStickyShortcutBarOnNotLoggedIn", false)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUseSignalsForAuthenticationStatus = sharedFlagsModule.FFlagUseSignalsForAuthenticationStatus
local fFlagEnableStickyShortcutBarOnAllPlatforms = sharedFlagsModule.FFlagEnableStickyShortcutBarOnAllPlatforms
local var1 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil

local function selectUserLoggedIn(p1)
	-- upvalues: loginStatus (ref)
	return p1.AuthenticationStatus and p1.AuthenticationStatus.status == loginStatus.LOGGED_IN
end

local useAppShortcutBarHeight = require(appShortcutBar.Hooks).useAppShortcutBarHeight
local useIsStickyShortcutBarEnabled = require(appShortcutBar.Hooks).useIsStickyShortcutBarEnabled
local getShortcutBarStatusStoreModule = require(appShortcutBar.Stores.GetShortcutBarStatusStore)
local appShortcut = require(appShortcutBar.Components.AppShortcut).AppShortcut

function AppStickyShortcutBar(p1)
	-- upvalues: getShortcutBarStatusStoreModule (ref), useTokens (ref), useAppShortcutBarHeight (ref), responsiveModule (ref), useFocusedTextBox (ref), fFlagEnableStickyShortcutBarOnAllPlatforms (ref), useIsStickyShortcutBarEnabled (ref), useSignalState (ref), displayModule (ref), disallowStickyShortcutBarOnNotLoggedIn (ref), fFlagUseSignalsForAuthenticationStatus (ref), var1 (ref), loginStatus (ref), useSelector (ref), selectUserLoggedIn (ref), focusNavigationEventNameEnum (ref), reactModule (ref), appShortcut (ref)
	local var2 = getShortcutBarStatusStoreModule(false)
	local var3 = useTokens()
	local var4 = useAppShortcutBarHeight()
	local var5 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var6 = useFocusedTextBox()
	local var7 = if fFlagEnableStickyShortcutBarOnAllPlatforms then useIsStickyShortcutBarEnabled(p1.currentPage) else nil
	local var8 = if fFlagEnableStickyShortcutBarOnAllPlatforms then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	if fFlagEnableStickyShortcutBarOnAllPlatforms then
		var8 = {
			left = math.ceil(var8.left),
			top = math.ceil(var8.top),
			right = math.ceil(var8.right),
			bottom = math.ceil(var8.bottom)
		}
	end
	local var9 = nil
	
	if disallowStickyShortcutBarOnNotLoggedIn then
		if fFlagUseSignalsForAuthenticationStatus then
			var9 = useSignalState(var1(false).getStatus) == loginStatus.LOGGED_IN
			var9 = nil
		else
			var9 = useSelector(selectUserLoggedIn)
		end
	end
	local var10 = not p1.items
	
	if not var10 then
		var10 = true
		
		if #p1.items ~= 0 then
			if #p1.items == 1 then
				var10 = true
				
				if p1.items[1].eventName ~= focusNavigationEventNameEnum.NavigateBack then
					var10 = var6 or disallowStickyShortcutBarOnNotLoggedIn and not var9
				end
			end
		end
	end
	if fFlagEnableStickyShortcutBarOnAllPlatforms then
		var10 = not var7
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var10 (write)
		var2.setShortcutBarVisible(not var10)
	end, { var10 })
	
	if fFlagEnableStickyShortcutBarOnAllPlatforms then
		local maxValue = math.max(var4 - var8.bottom, 0)
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), var10 (write), maxValue (ref)
			var2.setShortcutBarReservedHeight(if var10 then 0 else maxValue)
		end, { var10, maxValue, var2.setShortcutBarReservedHeight })
		reactModule.useEffect(function()
			-- upvalues: var2 (ref)
			return function()
				-- upvalues: var2 (copy)
				var2.setShortcutBarReservedHeight(0)
			end
		end, { var2.setShortcutBarReservedHeight })
	end
	if var10 then
		return nil
	end
	local var11 = nil
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var3.Gap.Large)
		})
	}
	local var12 = if fFlagEnableStickyShortcutBarOnAllPlatforms then p1.items or {} else p1.items
	local var13 = if var5 then math.min(#var12, 4) else #var12
	local var14 = 0
	
	for i, v in var12 do
		if var14 < var13 and v.eventName ~= focusNavigationEventNameEnum.NavigateBack then
			var14 += 1
			local var15 = if var5 then var13 - var14 + 1 else var14
			t["Item_" .. tostring(var15)] = reactModule.createElement(appShortcut, { layoutOrder = var15, item = v })
		end
		if v.eventName == focusNavigationEventNameEnum.NavigateBack then
			var11 = reactModule.createElement(appShortcut, { item = v })
		end
	end
	local var16 = fFlagEnableStickyShortcutBarOnAllPlatforms and not p1.isLeftNavVisible
	
	return reactModule.createElement("ImageButton", {
		BorderSizePixel = 0,
		Selectable = false,
		AutoButtonColor = false,
		BackgroundColor3 = var3.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var3.Color.Surface.Surface_0.Transparency,
		Size = if fFlagEnableStickyShortcutBarOnAllPlatforms then UDim2.new(1, var8.right + (if var16 then var8.left else 0), 0, var4) else UDim2.new(1, 0, 0, var4),
		AnchorPoint = Vector2.new(0, 1),
		Position = if fFlagEnableStickyShortcutBarOnAllPlatforms then UDim2.new(0, if var16 then -var8.left else 0, 1, var8.bottom) else UDim2.fromScale(0, 1)
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
			}, { BackShortcut = var11 }),
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