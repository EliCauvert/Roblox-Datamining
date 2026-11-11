local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ResponsiveModule = require(Parent.Responsive)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusedTextBoxFunction = FocusNavigationUtilsModule.useFocusedTextBox
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local DisallowStickyShortcutBarOnNotLoggedIn = game:DefineFastFlag("DisallowStickyShortcutBarOnNotLoggedIn", false)

local function selectUserLoggedIn(p1): boolean
	-- upvalues: LoginStatus (copy)
	return p1.AuthenticationStatus and p1.AuthenticationStatus.status == LoginStatus.LOGGED_IN
end

local UseAppShortcutBarHeightFunction = require(AppShortcutBar.Hooks).useAppShortcutBarHeight
local GetShortcutBarStatusStoreModule = require(AppShortcutBar.Stores.GetShortcutBarStatusStore)
local AppShortcut = require(AppShortcutBar.Components.AppShortcut).AppShortcut

function AppStickyShortcutBar(p1)
	-- upvalues: GetShortcutBarStatusStoreModule (copy), UseTokensFunction (copy), UseAppShortcutBarHeightFunction (copy), ResponsiveModule (copy), UseFocusedTextBoxFunction (copy), DisallowStickyShortcutBarOnNotLoggedIn (copy), UseSelectorFunction (copy), selectUserLoggedIn (copy), FocusNavigationEventNameEnum (copy), ReactModule (copy), AppShortcut (copy)
	local ShortcutBarStatusStoreModule = GetShortcutBarStatusStoreModule(false)
	local UseTokensResult = UseTokensFunction()
	local UseAppShortcutBarHeightResult = UseAppShortcutBarHeightFunction()
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local UseFocusedTextBoxResult = UseFocusedTextBoxFunction()
	local UseSelectorResult = if DisallowStickyShortcutBarOnNotLoggedIn then UseSelectorFunction(selectUserLoggedIn) else nil
	local NoItems = not p1.items or (#p1.items == 0 or (#p1.items == 1 and p1.items[1].eventName == FocusNavigationEventNameEnum.NavigateBack or (UseFocusedTextBoxResult or DisallowStickyShortcutBarOnNotLoggedIn and not UseSelectorResult)))
	ReactModule.useEffect(function()
		-- upvalues: ShortcutBarStatusStoreModule (copy), NoItems (copy)
		ShortcutBarStatusStoreModule.setShortcutBarVisible(not NoItems)
	end, { NoItems })
	
	if NoItems then
		return nil
	end
	local Element = nil
	local config = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.Large)
		})
	}
	local Smallest: number = if IsUsePreferredInputResultMatch then math.min(#p1.items, 4) else #p1.items
	local Count = 0
	
	for _, item in p1.items do
		if Count < Smallest and item.eventName ~= FocusNavigationEventNameEnum.NavigateBack then
			Count += 1
			local NewSmallest: number = if IsUsePreferredInputResultMatch then Smallest - Count + 1 else Count
			config["Item_" .. tostring(NewSmallest)] = ReactModule.createElement(AppShortcut, { layoutOrder = NewSmallest, item = item })
		end
		if item.eventName == FocusNavigationEventNameEnum.NavigateBack then
			Element = ReactModule.createElement(AppShortcut, { item = item })
		end
	end
	return ReactModule.createElement("ImageButton", {
		BorderSizePixel = 0,
		Selectable = false,
		AutoButtonColor = false,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency,
		Size = UDim2.new(1, 0, 0, UseAppShortcutBarHeightResult),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1)
	}, {
		Divider = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = UseTokensResult.Color.Stroke.Default.Color3,
			BackgroundTransparency = UseTokensResult.Color.Stroke.Default.Transparency,
			Size = UDim2.new(1, 0, 0, 1)
		}),
		ShortcutsFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0)
		}, {
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(UseTokensResult.Size.Size_3000 * 16, UseAppShortcutBarHeightResult)
			}),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseTokensResult.Size.Size_800),
				PaddingTop = UDim.new(0, UseTokensResult.Padding.XSmall),
				PaddingRight = UDim.new(0, UseTokensResult.Size.Size_800),
				PaddingBottom = UDim.new(0, UseTokensResult.Padding.XSmall)
			}),
			BackShortcutFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.fromScale(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY
			}, { BackShortcut = Element }),
			RightShortcutsFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.fromScale(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.X
			}, config)
		})
	})
end

return AppStickyShortcutBar