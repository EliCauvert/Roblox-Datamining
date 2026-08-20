local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local tutilsModule = require(parent.tutils)
local cryoModule = require(parent.Cryo)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local getTryOnItemReducerKey = avatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local constants = avatarExperienceCommonModule.Constants
local checkoutRowItemCardModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutRowItemCard)
local checkoutErrorBannerModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutErrorBanner)
local useTimedOptionsFtuxModule = require(avatarExperienceCatalog.Hooks.useTimedOptionsFtux)
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagAXDurables2Option = avatarExperienceFlagsModule.FFlagAXDurables2Option
local fFlagAXDurables2OptionFixes = avatarExperienceFlagsModule.FFlagAXDurables2OptionFixes

local function filterCartItems(p0, p1) --[[ line: 31 ]]
	-- upvalues: getTryOnItemReducerKey (ref), reactModule (ref), checkoutRowItemCardModule (ref), cryoModule (ref)
	local t = {}
	local var13 = 0
	
	for i, v in p0 do
		if p1(v) then
			var13 += 1
			t[`{getTryOnItemReducerKey(v.itemId, v.itemType)}`] = reactModule.createElement(checkoutRowItemCardModule, cryoModule.Dictionary.join(v, { LayoutOrder = var13 }))
		end
	end
	return t
end

return reactModule.memo(function(p2) --[[ line: 51 | named "CheckoutPageBody" ]]
	-- upvalues: fFlagAXDurables2Option (ref), useTokens (ref), useLocalization (ref), useTimedOptionsFtuxModule (ref), reactModule (ref), filterCartItems (ref), constants (ref), tutilsModule (ref), fFlagAXDurables2OptionFixes (ref), foundationModule (ref), fFlagAXMISWithBlackbird (ref), checkoutErrorBannerModule (ref)
	local var14 = if fFlagAXDurables2Option then useTokens() else nil
	local var15 = useLocalization({
		makeupTitle = "Feature.Catalog.Label.Makeup",
		makeupCartDescriptionText = "Feature.Catalog.Label.MakeupCartDescriptionText",
		rentalFtuxText = if fFlagAXDurables2Option then "Feature.Catalog.Title.RentalFtuxText" else nil
	})
	local var16 = nil
	local _ = nil
	local var17 = nil
	
	if fFlagAXDurables2Option then
		local var18 = useTimedOptionsFtuxModule()
		local var19, var20 = reactModule.useState(var18.shouldShow2OptionToolTipInCheckoutPage())
		var16 = var19
		local var21 = var20
		var17 = reactModule.useCallback(function() --[[ line: 65 ]]
			-- upvalues: var18 (ref), var21 (write)
			var18.hide2OptionToolTipInCheckoutPage()
			var21(false)
		end, { var18 })
	end
	local var22 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: filterCartItems (copy), p2 (ref), constants (copy)
		return filterCartItems(p2.cartItems, function(p3) --[[ line: 74 ]]
			-- upvalues: constants (copy)
			return constants.MAKEUP_LOOK_ASSET_TYPES[p3.itemSubType] ~= nil
		end)
	end, { p2.cartItems })
	local var23 = reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: filterCartItems (copy), p2 (ref), constants (copy)
		return filterCartItems(p2.cartItems, function(p4) --[[ line: 80 ]]
			-- upvalues: constants (copy)
			return not constants.MAKEUP_LOOK_ASSET_TYPES[p4.itemSubType]
		end)
	end, { p2.cartItems })
	local var24 = tutilsModule.fieldCount(var22) > 0
	
	return reactModule.createElement(foundationModule.View, {
		tag = if fFlagAXMISWithBlackbird then "col auto-y" else "col",
		Size = if fFlagAXMISWithBlackbird then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1)
	}, {
		CheckoutErrorBannerView = if p2.erroredItemCount and p2.erroredItemCount > 0 then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-x-xxlarge padding-y-medium",
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0)
		}, {
			CheckoutErrorBanner = reactModule.createElement(checkoutErrorBannerModule, { erroredItemCount = p2.erroredItemCount })
		}) else nil,
		Tooltip2OptionBanner = if fFlagAXDurables2Option and var16 and (not fFlagAXDurables2OptionFixes or (if fFlagAXDurables2OptionFixes then reactModule.useMemo(function() --[[ line: 88 ]]
			-- upvalues: p2 (ref)
			for i, v in p2.cartItems do
				if v.timedOptions and (not v.isOwned or v.expirationTime ~= nil) then
					return true
				end
			end
			return false
		end, { p2.cartItems }) else nil)) then reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y padding-x-xxlarge",
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, -var14.Size.Size_1800)
		}, {
			Banner = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-medium size-full-0 auto-y padding-left-xlarge padding-right-xsmall padding-y-xsmall radius-medium bg-surface-300"
			}, {
				Description = reactModule.createElement(foundationModule.Text, {
					tag = "fill auto-y text-caption-large text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var15.rentalFtuxText
				}),
				DismissIcon = reactModule.createElement(foundationModule.IconButton, {
					icon = "icons/navigation/close",
					LayoutOrder = 2,
					testId = "Checkout2OptionFtuxDismiss",
					size = foundationModule.Enums.IconSize.Small,
					onActivated = var17
				})
			})
		}) else nil,
		AllItemsView = if tutilsModule.fieldCount(var23) > 0 then reactModule.createElement(foundationModule.View, {
			tag = "col auto-y gap-medium padding-x-xxlarge padding-y-medium",
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0)
		}, var23) else nil,
		MakeupText = if var24 then reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy padding-x-xxlarge padding-top-medium text-title-medium content-emphasis",
			LayoutOrder = 3,
			Text = var15.makeupTitle .. " (" .. tutilsModule.fieldCount(var22) .. "/8)"
		}) else nil,
		MakeupDescriptionText = if var24 then reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy padding-x-xxlarge padding-top-xxsmall padding-bottom-medium text-body-small",
			LayoutOrder = 4,
			Text = var15.makeupCartDescriptionText
		}) else nil,
		MakeupItemsView = if var24 then reactModule.createElement(foundationModule.View, {
			tag = "col auto-y gap-medium padding-x-xxlarge padding-y-medium",
			LayoutOrder = 5,
			Size = UDim2.fromScale(1, 0)
		}, var22) else nil
	})
end, tutilsModule.deepEqual)