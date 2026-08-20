local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local responsiveModule = require(parent.Responsive)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local constants = avatarExperienceCommonModule.Constants
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagStackedBottomNavMarketplaceCTA = sharedFlagsModule.FFlagStackedBottomNavMarketplaceCTA
local fFlagAXFixBottomNavCTAHeight = sharedFlagsModule.FFlagAXFixBottomNavCTAHeight
local constants_1 = require(parent.AppSystemBar).Constants
local useNavBarSize = require(parent.AppNavBar).useNavBarSize

local function selectDeviceOrientation(p0) --[[ line: 23 ]]
	return p0.DeviceOrientation
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 38 ]]
	-- upvalues: foundationModule (ref), fFlagStackedBottomNavMarketplaceCTA (ref), fFlagAXFixBottomNavCTAHeight (ref), useNavBarSize (ref), useSelector (ref), selectDeviceOrientation (ref), responsiveModule (ref), useLocalization (ref), reactModule (ref), constants (ref), constants_1 (ref)
	local var6 = foundationModule.Hooks.useTokens()
	local var7 = if fFlagStackedBottomNavMarketplaceCTA and not fFlagAXFixBottomNavCTAHeight then useNavBarSize() else nil
	local var8 = useSelector(selectDeviceOrientation) == responsiveModule.Keys.Portrait
	local var9 = useLocalization({
		checkoutItemSingular = "Feature.Catalog.Action.CheckoutSingular",
		checkoutButtonFtuxTooltip = "Feature.Catalog.Label.Checkout.CheckoutButtonFtuxTooltip",
		checkoutItemPlural = {
			"Feature.Catalog.Action.CheckoutPlural",
			count = p1.itemCount
		}
	})
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: var8 (ref), constants (copy)
		return if var8 then UDim2.fromScale(0, 1) else UDim2.fromScale(constants.LANDSCAPE_UI_WIDTH_PERCENTAGE, 1)
	end, { var8 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row items-center gap-medium auto-y padding-y-large padding-x-xlarge bg-surface-0 anchor-bottom-left",
		ZIndex = 3,
		ref = p2,
		Visible = p1.Visible,
		Size = reactModule.useMemo(function() --[[ line: 56 ]]
			-- upvalues: var8 (ref), constants (copy)
			return if var8 then UDim2.fromScale(1, 0) else UDim2.fromScale(constants.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 0)
		end, { var8 }),
		Position = if fFlagStackedBottomNavMarketplaceCTA then reactModule.useMemo(function() --[[ line: 69 ]]
			-- upvalues: p1 (ref), fFlagAXFixBottomNavCTAHeight (copy), constants_1 (copy), var11 (ref), var7 (ref)
			return if p1.footerVisibilityBinding then p1.footerVisibilityBinding:map(function(p3) --[[ line: 71 ]]
				-- upvalues: fFlagAXFixBottomNavCTAHeight (copy), constants_1 (copy), var11 (copy), var7 (copy)
				return if fFlagAXFixBottomNavCTAHeight then var11 + UDim2.new(0, 0, 0, -math.max(0, constants_1.BOTTOM_BAR_SIZE * p3 - 8)) else var11 + UDim2.new(0, 0, 0, -(var7 - 8) * p3)
			end) else var11
		end, { var11, p1.footerVisibilityBinding, var7 }) else var11,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, {
		ActionButton = reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 1,
			text = if p1.itemCount <= 1 then var9.checkoutItemSingular else var9.checkoutItemPlural,
			onActivated = p1.onCheckoutButtonActivated,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.ButtonSize.Medium,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			ref = var10
		}),
		ActionButtonPopover = reactModule.createElement(foundationModule.Popover.Root, { isOpen = p1.showCheckoutButtonTooltip }, {
			Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = var10 }),
			Content = reactModule.createElement(foundationModule.Popover.Content, {
				align = foundationModule.Enums.PopoverAlign.Center,
				side = foundationModule.Enums.PopoverSide.Top,
				radius = foundationModule.Enums.Radius.Medium,
				backgroundStyle = var6.Color.System.Contrast
			}, {
				PopCoverContent = reactModule.createElement(foundationModule.View, {
					tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
				}, {
					CategoryButtonTooltipTitle = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-title-medium text-truncate-end content-inverse-emphasis",
						Text = var9.checkoutButtonFtuxTooltip
					}, {
						TooltipOverlayButton = reactModule.createElement("TextButton", {
							Transparency = 1,
							[reactModule.Event.Activated] = p1.onTooltipButtonActivated,
							Size = UDim2.fromScale(1, 1)
						})
					})
				})
			})
		}),
		ClearButton = reactModule.createElement(foundationModule.Button, {
			icon = "trash-can",
			LayoutOrder = 2,
			onActivated = p1.onClearButtonActivated,
			variant = foundationModule.Enums.ButtonVariant.Standard,
			size = foundationModule.Enums.ButtonSize.Medium
		})
	})
end))