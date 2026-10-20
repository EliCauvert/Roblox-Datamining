local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ResponsiveModule = require(Parent.Responsive)
local DisplayModule = require(Parent.Display)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusedTextBoxFunction = FocusNavigationUtilsModule.useFocusedTextBox
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local DisallowStickyShortcutBarOnNotLoggedIn = game:DefineFastFlag("DisallowStickyShortcutBarOnNotLoggedIn", false)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseSignalsForAuthenticationStatus = SharedFlagsModule.FFlagUseSignalsForAuthenticationStatus
local FFlagEnableStickyShortcutBarOnAllPlatforms = SharedFlagsModule.FFlagEnableStickyShortcutBarOnAllPlatforms
local FFlagEnableStickyShortcutBarOnAllPlatformsIxpEnabled = require(AppShortcutBar.Flags).FFlagEnableStickyShortcutBarOnAllPlatformsIxpEnabled
local GetAuthenticationStatusStore = if FFlagUseSignalsForAuthenticationStatus then require(Parent.AuthenticationStatus).GetAuthenticationStatusStore else nil

local function selectUserLoggedIn(p1): boolean
	-- upvalues: LoginStatus (copy)
	return p1.AuthenticationStatus and p1.AuthenticationStatus.status == LoginStatus.LOGGED_IN
end

local UseAppShortcutBarHeightFunction = require(AppShortcutBar.Hooks).useAppShortcutBarHeight
local UseIsStickyShortcutBarEnabledFunction = require(AppShortcutBar.Hooks).useIsStickyShortcutBarEnabled
local GetShortcutBarStatusStoreModule = require(AppShortcutBar.Stores.GetShortcutBarStatusStore)
local AppShortcut = require(AppShortcutBar.Components.AppShortcut).AppShortcut
local UseStickyShortcutBarExposureLoggingModule = require(AppShortcutBar.Hooks.useStickyShortcutBarExposureLogging)

function AppStickyShortcutBar(p1)
	-- upvalues: GetShortcutBarStatusStoreModule (copy), UseTokensFunction (copy), UseAppShortcutBarHeightFunction (copy), ResponsiveModule (copy), UseFocusedTextBoxFunction (copy), FFlagEnableStickyShortcutBarOnAllPlatforms (copy), UseIsStickyShortcutBarEnabledFunction (copy), UseSignalStateFunction (copy), DisplayModule (copy), DisallowStickyShortcutBarOnNotLoggedIn (copy), FFlagUseSignalsForAuthenticationStatus (copy), GetAuthenticationStatusStore (copy), LoginStatus (copy), UseSelectorFunction (copy), selectUserLoggedIn (copy), FocusNavigationEventNameEnum (copy), ReactModule (copy), FFlagEnableStickyShortcutBarOnAllPlatformsIxpEnabled (copy), UseStickyShortcutBarExposureLoggingModule (copy), AppShortcut (copy)
	local ShortcutBarStatusStoreModule = GetShortcutBarStatusStoreModule(false)
	local UseTokensResult = UseTokensFunction()
	local UseAppShortcutBarHeightResult = UseAppShortcutBarHeightFunction()
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local UseFocusedTextBoxResult = UseFocusedTextBoxFunction()
	local UseIsStickyShortcutBarEnabledResult = if FFlagEnableStickyShortcutBarOnAllPlatforms then UseIsStickyShortcutBarEnabledFunction(p1.currentPage) else nil
	local UseSignalStateResult = if FFlagEnableStickyShortcutBarOnAllPlatforms then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	if FFlagEnableStickyShortcutBarOnAllPlatforms then
		UseSignalStateResult = {
			left = math.ceil(UseSignalStateResult.left),
			top = math.ceil(UseSignalStateResult.top),
			right = math.ceil(UseSignalStateResult.right),
			bottom = math.ceil(UseSignalStateResult.bottom)
		}
	end
	local IsUseSignalStateResultMatch = if DisallowStickyShortcutBarOnNotLoggedIn then if FFlagUseSignalsForAuthenticationStatus then UseSignalStateFunction(GetAuthenticationStatusStore(false).getStatus) == LoginStatus.LOGGED_IN else UseSelectorFunction(selectUserLoggedIn) else nil
	local NoUseIsStickyShortcutBarEnabledResult = if not p1.items then if FFlagEnableStickyShortcutBarOnAllPlatforms then not UseIsStickyShortcutBarEnabledResult else not p1.items elseif FFlagEnableStickyShortcutBarOnAllPlatforms then not UseIsStickyShortcutBarEnabledResult else #p1.items == 0 or (#p1.items == 1 and p1.items[1].eventName == FocusNavigationEventNameEnum.NavigateBack or (UseFocusedTextBoxResult or DisallowStickyShortcutBarOnNotLoggedIn and not IsUseSignalStateResultMatch))
	ReactModule.useEffect(function()
		-- upvalues: ShortcutBarStatusStoreModule (copy), NoUseIsStickyShortcutBarEnabledResult (ref)
		ShortcutBarStatusStoreModule.setShortcutBarVisible(not NoUseIsStickyShortcutBarEnabledResult)
	end, { NoUseIsStickyShortcutBarEnabledResult })
	
	if FFlagEnableStickyShortcutBarOnAllPlatformsIxpEnabled then
		UseStickyShortcutBarExposureLoggingModule(not NoUseIsStickyShortcutBarEnabledResult)
	end
	if FFlagEnableStickyShortcutBarOnAllPlatforms then
		local Largest = math.max(UseAppShortcutBarHeightResult - UseSignalStateResult.bottom, 0)
		ReactModule.useEffect(function()
			-- upvalues: ShortcutBarStatusStoreModule (copy), NoUseIsStickyShortcutBarEnabledResult (ref), Largest (copy)
			ShortcutBarStatusStoreModule.setShortcutBarReservedHeight(if NoUseIsStickyShortcutBarEnabledResult then 0 else Largest)
		end, {
			NoUseIsStickyShortcutBarEnabledResult,
			Largest,
			ShortcutBarStatusStoreModule.setShortcutBarReservedHeight
		})
		ReactModule.useEffect(function()
			-- upvalues: ShortcutBarStatusStoreModule (copy)
			return function()
				-- upvalues: ShortcutBarStatusStoreModule (upval)
				ShortcutBarStatusStoreModule.setShortcutBarReservedHeight(0)
			end
		end, {
			ShortcutBarStatusStoreModule.setShortcutBarReservedHeight
		})
	end
	if NoUseIsStickyShortcutBarEnabledResult then
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
	local Items = if FFlagEnableStickyShortcutBarOnAllPlatforms then p1.items or {} else p1.items
	local Smallest: number = if IsUsePreferredInputResultMatch then math.min(#Items, 4) else #Items
	local Count = 0
	
	for _, item in Items do
		if Count < Smallest and item.eventName ~= FocusNavigationEventNameEnum.NavigateBack then
			Count += 1
			local NewSmallest: number = if IsUsePreferredInputResultMatch then Smallest - Count + 1 else Count
			config["Item_" .. tostring(NewSmallest)] = ReactModule.createElement(AppShortcut, { layoutOrder = NewSmallest, item = item })
		end
		if item.eventName == FocusNavigationEventNameEnum.NavigateBack then
			Element = ReactModule.createElement(AppShortcut, { item = item })
		end
	end
	local NoIsLeftNavVisible: boolean = FFlagEnableStickyShortcutBarOnAllPlatforms and not p1.isLeftNavVisible
	
	return ReactModule.createElement("ImageButton", {
		BorderSizePixel = 0,
		Selectable = false,
		AutoButtonColor = false,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency,
		Size = if FFlagEnableStickyShortcutBarOnAllPlatforms then UDim2.new(1, UseSignalStateResult.right + (if NoIsLeftNavVisible then UseSignalStateResult.left else 0), 0, UseAppShortcutBarHeightResult) else UDim2.new(1, 0, 0, UseAppShortcutBarHeightResult),
		AnchorPoint = Vector2.new(0, 1),
		Position = if FFlagEnableStickyShortcutBarOnAllPlatforms then UDim2.new(0, if NoIsLeftNavVisible then -UseSignalStateResult.left else 0, 1, UseSignalStateResult.bottom) else UDim2.fromScale(0, 1)
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