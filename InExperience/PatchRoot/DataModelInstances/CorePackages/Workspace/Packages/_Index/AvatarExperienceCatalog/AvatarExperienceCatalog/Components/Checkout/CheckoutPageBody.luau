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

local function filterCartItems(p1, p2)
	-- upvalues: getTryOnItemReducerKey (ref), reactModule (ref), checkoutRowItemCardModule (ref), cryoModule (ref)
	local t = {}
	local var1 = 0
	
	for i, v in p1 do
		if p2(v) then
			var1 += 1
			t[`{getTryOnItemReducerKey(v.itemId, v.itemType)}`] = reactModule.createElement(checkoutRowItemCardModule, cryoModule.Dictionary.join(v, { LayoutOrder = var1 }))
		end
	end
	return t
end

return reactModule.memo(function(p3)
	-- upvalues: fFlagAXDurables2Option (ref), useTokens (ref), useLocalization (ref), useTimedOptionsFtuxModule (ref), reactModule (ref), filterCartItems (ref), constants (ref), tutilsModule (ref), foundationModule (ref), fFlagAXMISWithBlackbird (ref), checkoutErrorBannerModule (ref)
	local var2 = if fFlagAXDurables2Option then useTokens() else nil
	local var3 = useLocalization({
		makeupTitle = "Feature.Catalog.Label.Makeup",
		makeupCartDescriptionText = "Feature.Catalog.Label.MakeupCartDescriptionText",
		rentalFtuxText = if fFlagAXDurables2Option then "Feature.Catalog.Title.RentalFtuxText" else nil
	})
	local var4 = nil
	local _ = nil
	local var5 = nil
	
	if fFlagAXDurables2Option then
		local var6 = useTimedOptionsFtuxModule()
		local var7, var8 = reactModule.useState(var6.shouldShow2OptionToolTipInCheckoutPage())
		var4 = var7
		local var9 = var8
		var5 = reactModule.useCallback(function()
			-- upvalues: var6 (ref), var9 (write)
			var6.hide2OptionToolTipInCheckoutPage()
			var9(false)
		end, { var6 })
	end
	local var10 = reactModule.useMemo(function()
		-- upvalues: filterCartItems (copy), p3 (ref), constants (copy)
		return filterCartItems(p3.cartItems, function(p4)
			-- upvalues: constants (copy)
			return constants.MAKEUP_LOOK_ASSET_TYPES[p4.itemSubType] ~= nil
		end)
	end, { p3.cartItems })
	local var11 = reactModule.useMemo(function()
		-- upvalues: filterCartItems (copy), p3 (ref), constants (copy)
		return filterCartItems(p3.cartItems, function(p4)
			-- upvalues: constants (copy)
			return not constants.MAKEUP_LOOK_ASSET_TYPES[p4.itemSubType]
		end)
	end, { p3.cartItems })
	local var12 = tutilsModule.fieldCount(var10) > 0
	
	return reactModule.createElement(foundationModule.View, {
		tag = if fFlagAXMISWithBlackbird then "col auto-y" else "col",
		Size = if fFlagAXMISWithBlackbird then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1)
	}, {
		CheckoutErrorBannerView = if p3.erroredItemCount and p3.erroredItemCount > 0 then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-x-xxlarge padding-y-medium",
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0)
		}, {
			CheckoutErrorBanner = reactModule.createElement(checkoutErrorBannerModule, { erroredItemCount = p3.erroredItemCount })
		}) else nil,
		Tooltip2OptionBanner = if fFlagAXDurables2Option and var4 and reactModule.useMemo(function()
			-- upvalues: p3 (ref)
			for i, v in p3.cartItems do
				if v.timedOptions and (not v.isOwned or v.expirationTime ~= nil) then
					return true
				end
			end
			return false
		end, { p3.cartItems }) then reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y padding-x-xxlarge",
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, -var2.Size.Size_1800)
		}, {
			Banner = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-medium size-full-0 auto-y padding-left-xlarge padding-right-xsmall padding-y-xsmall radius-medium bg-surface-300"
			}, {
				Description = reactModule.createElement(foundationModule.Text, {
					tag = "fill auto-y text-caption-large text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var3.rentalFtuxText
				}),
				DismissIcon = reactModule.createElement(foundationModule.IconButton, {
					icon = "icons/navigation/close",
					LayoutOrder = 2,
					testId = "Checkout2OptionFtuxDismiss",
					size = foundationModule.Enums.IconSize.Small,
					onActivated = var5
				})
			})
		}) else nil,
		AllItemsView = if tutilsModule.fieldCount(var11) > 0 then reactModule.createElement(foundationModule.View, {
			tag = "col auto-y gap-medium padding-x-xxlarge padding-y-medium",
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0)
		}, var11) else nil,
		MakeupText = if var12 then reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy padding-x-xxlarge padding-top-medium text-title-medium content-emphasis",
			LayoutOrder = 3,
			Text = var3.makeupTitle .. " (" .. tutilsModule.fieldCount(var10) .. "/8)"
		}) else nil,
		MakeupDescriptionText = if var12 then reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy padding-x-xxlarge padding-top-xxsmall padding-bottom-medium text-body-small",
			LayoutOrder = 4,
			Text = var3.makeupCartDescriptionText
		}) else nil,
		MakeupItemsView = if var12 then reactModule.createElement(foundationModule.View, {
			tag = "col auto-y gap-medium padding-x-xxlarge padding-y-medium",
			LayoutOrder = 5,
			Size = UDim2.fromScale(1, 0)
		}, var10) else nil
	})
end, tutilsModule.deepEqual)