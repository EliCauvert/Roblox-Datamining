local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local Constants = require(Parent.AvatarExperienceCommon).Constants
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagStackedBottomNavMarketplaceCTA = SharedFlagsModule.FFlagStackedBottomNavMarketplaceCTA
local FFlagAXFixBottomNavCTAHeight = SharedFlagsModule.FFlagAXFixBottomNavCTAHeight
local FFlagEnableSplitPane = SharedFlagsModule.FFlagEnableSplitPane
local Constants1 = require(Parent.AppSystemBar).Constants
local UseNavBarSizeFunction = require(Parent.AppNavBar).useNavBarSize
local SplitPaneStore = if FFlagEnableSplitPane then require(Parent.SplitPane).SplitPaneStore else nil
local UseSignalState = if FFlagEnableSplitPane then require(Parent.SignalsReact).useSignalState else nil

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

return ReactModule.memo((ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: FoundationModule (copy), FFlagStackedBottomNavMarketplaceCTA (copy), FFlagAXFixBottomNavCTAHeight (copy), UseNavBarSizeFunction (copy), FFlagEnableSplitPane (copy), UseSignalState (copy), SplitPaneStore (copy), UseSelectorFunction (copy), selectDeviceOrientation (copy), ResponsiveModule (copy), UseLocalizationFunction (copy), ReactModule (copy), Constants (copy), Constants1 (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseNavBarSizeResult = if FFlagStackedBottomNavMarketplaceCTA and not FFlagAXFixBottomNavCTAHeight then UseNavBarSizeFunction() else nil
	local UseSignalStateResult = if FFlagEnableSplitPane then UseSignalState(SplitPaneStore.getStore().getIsBreakpointEnabled) else false
	local UseSignalStateResult1 = if FFlagEnableSplitPane then UseSignalState(SplitPaneStore.getStore().getSupportWidthFraction) else nil
	local UseSelectorResult = UseSelectorFunction(selectDeviceOrientation)
	local IsPortraitMatch = (if FFlagEnableSplitPane and UseSignalStateResult then ResponsiveModule.Keys.Landscape else UseSelectorResult) == ResponsiveModule.Keys.Portrait
	local UseLocalizationResult = UseLocalizationFunction({
		checkoutItemSingular = "Feature.Catalog.Action.CheckoutSingular",
		checkoutButtonFtuxTooltip = "Feature.Catalog.Label.Checkout.CheckoutButtonFtuxTooltip",
		checkoutItemPlural = {
			"Feature.Catalog.Action.CheckoutPlural",
			count = p1.itemCount
		}
	})
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function(): UDim2
		-- upvalues: IsPortraitMatch (copy), FFlagEnableSplitPane (upval), UseSignalStateResult (copy), UseSignalStateResult1 (copy), Constants (upval)
		return if IsPortraitMatch then UDim2.fromScale(0, 1) elseif FFlagEnableSplitPane then UDim2.fromScale(if UseSignalStateResult then 1 - UseSignalStateResult1 else Constants.LANDSCAPE_UI_WIDTH_PERCENTAGE, 1) else UDim2.fromScale(Constants.LANDSCAPE_UI_WIDTH_PERCENTAGE, 1)
	end, {
		IsPortraitMatch,
		UseSignalStateResult,
		UseSignalStateResult1
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row items-center gap-medium auto-y padding-y-large padding-x-xlarge bg-surface-0 anchor-bottom-left",
		ZIndex = 3,
		testId = if FFlagEnableSplitPane then "CheckoutActionBar" else nil,
		ref = Ref,
		Visible = p1.Visible,
		Size = ReactModule.useMemo(function(): UDim2
			-- upvalues: IsPortraitMatch (copy), FFlagEnableSplitPane (upval), UseSignalStateResult (copy), UseSignalStateResult1 (copy), Constants (upval)
			return if IsPortraitMatch then UDim2.fromScale(1, 0) elseif FFlagEnableSplitPane then UDim2.fromScale(if UseSignalStateResult then UseSignalStateResult1 else Constants.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 0) else UDim2.fromScale(Constants.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 0)
		end, {
			IsPortraitMatch,
			UseSignalStateResult,
			UseSignalStateResult1
		}),
		Position = if FFlagStackedBottomNavMarketplaceCTA then ReactModule.useMemo(function()
			-- upvalues: p1 (copy), FFlagAXFixBottomNavCTAHeight (upval), Constants1 (upval), UseMemoResult (copy), UseNavBarSizeResult (copy)
			return if p1.footerVisibilityBinding then p1.footerVisibilityBinding:map(function(p2): UDim2
				-- upvalues: FFlagAXFixBottomNavCTAHeight (upval), Constants1 (upval), UseMemoResult (upval), UseNavBarSizeResult (upval)
				return if FFlagAXFixBottomNavCTAHeight then UseMemoResult + UDim2.new(0, 0, 0, -math.max(0, Constants1.BOTTOM_BAR_SIZE * p2 - 8)) else UseMemoResult + UDim2.new(0, 0, 0, -(UseNavBarSizeResult - 8) * p2)
			end) else UseMemoResult
		end, {
			UseMemoResult,
			p1.footerVisibilityBinding,
			UseNavBarSizeResult
		}) else UseMemoResult,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, {
		ActionButton = ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 1,
			text = if p1.itemCount <= 1 then UseLocalizationResult.checkoutItemSingular else UseLocalizationResult.checkoutItemPlural,
			onActivated = p1.onCheckoutButtonActivated,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis,
			size = FoundationModule.Enums.ButtonSize.Medium,
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
			ref = UseRefResult
		}),
		ActionButtonPopover = ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = p1.showCheckoutButtonTooltip }, {
			Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, { anchorRef = UseRefResult }),
			Content = ReactModule.createElement(FoundationModule.Popover.Content, {
				align = FoundationModule.Enums.PopoverAlign.Center,
				side = FoundationModule.Enums.PopoverSide.Top,
				radius = FoundationModule.Enums.Radius.Medium,
				backgroundStyle = UseTokensResult.Color.System.Contrast
			}, {
				PopCoverContent = ReactModule.createElement(FoundationModule.View, {
					tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
				}, {
					CategoryButtonTooltipTitle = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-title-medium text-truncate-end content-inverse-emphasis",
						Text = UseLocalizationResult.checkoutButtonFtuxTooltip
					}, {
						TooltipOverlayButton = ReactModule.createElement("TextButton", {
							Transparency = 1,
							[ReactModule.Event.Activated] = p1.onTooltipButtonActivated,
							Size = UDim2.fromScale(1, 1)
						})
					})
				})
			})
		}),
		ClearButton = ReactModule.createElement(FoundationModule.Button, {
			icon = "trash-can",
			LayoutOrder = 2,
			onActivated = p1.onClearButtonActivated,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			size = FoundationModule.Enums.ButtonSize.Medium
		})
	})
end)))