local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TutilsModule = require(Parent.tutils)
local CryoModule = require(Parent.Cryo)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local Constants = AvatarExperienceCommonModule.Constants
local CheckoutRowItemCardModule = require(AvatarExperienceCatalog.Components.Checkout.CheckoutRowItemCard)
local CheckoutErrorBannerModule = require(AvatarExperienceCatalog.Components.Checkout.CheckoutErrorBanner)
local UseTimedOptionsFtuxModule = require(AvatarExperienceCatalog.Hooks.useTimedOptionsFtux)
local FFlagAXMISWithBlackbird = require(Parent.SharedFlags).FFlagAXMISWithBlackbird
local FFlagAXDurables2Option = require(Parent.AvatarExperienceFlags).FFlagAXDurables2Option

local function filterCartItems(CartItems, Callback) --[[ Line: 30 ]]
	-- upvalues: GetTryOnItemReducerKeyFunction (copy), ReactModule (copy), CheckoutRowItemCardModule (copy), CryoModule (copy)
	local Elements = {}
	local LayoutOrder = 0
	
	for _, cartItem in CartItems do
		if Callback(cartItem) then
			LayoutOrder += 1
			Elements[`{GetTryOnItemReducerKeyFunction(cartItem.itemId, cartItem.itemType)}`] = ReactModule.createElement(CheckoutRowItemCardModule, CryoModule.Dictionary.join(cartItem, { LayoutOrder = LayoutOrder }))
		end
	end
	return Elements
end

return ReactModule.memo(function(p1) --[[ Line: 50 | Named "CheckoutPageBody" ]]
	-- upvalues: FFlagAXDurables2Option (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), UseTimedOptionsFtuxModule (copy), ReactModule (copy), filterCartItems (copy), Constants (copy), TutilsModule (copy), FoundationModule (copy), FFlagAXMISWithBlackbird (copy), CheckoutErrorBannerModule (copy)
	local UseTokensResult = if FFlagAXDurables2Option then UseTokensFunction() else nil
	local UseLocalizationResult = UseLocalizationFunction({
		makeupTitle = "Feature.Catalog.Label.Makeup",
		makeupCartDescriptionText = "Feature.Catalog.Label.MakeupCartDescriptionText",
		rentalFtuxText = if FFlagAXDurables2Option then "Feature.Catalog.Title.RentalFtuxText" else nil
	})
	local v1 = nil
	local UseStateResult2 = nil
	local UseResult = nil
	
	if FFlagAXDurables2Option then
		local UseTimedOptionsFtuxModuleResult = UseTimedOptionsFtuxModule()
		v1, UseStateResult2 = ReactModule.useState(UseTimedOptionsFtuxModuleResult.shouldShow2OptionToolTipInCheckoutPage())
		UseResult = ReactModule.useCallback(function() --[[ Line: 64 ]]
			-- upvalues: UseTimedOptionsFtuxModuleResult (copy), UseStateResult2 (ref)
			UseTimedOptionsFtuxModuleResult.hide2OptionToolTipInCheckoutPage()
			UseStateResult2(false)
		end, { UseTimedOptionsFtuxModuleResult })
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 72 ]]
		-- upvalues: filterCartItems (upval), p1 (copy), Constants (upval)
		return (filterCartItems(p1.cartItems, function(p2): boolean --[[ Line: 73 ]]
			-- upvalues: Constants (upval)
			return Constants.MAKEUP_LOOK_ASSET_TYPES[p2.itemSubType] ~= nil
		end))
	end, { p1.cartItems })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 78 ]]
		-- upvalues: filterCartItems (upval), p1 (copy), Constants (upval)
		return (filterCartItems(p1.cartItems, function(p2): boolean --[[ Line: 79 ]]
			-- upvalues: Constants (upval)
			return not Constants.MAKEUP_LOOK_ASSET_TYPES[p2.itemSubType]
		end))
	end, { p1.cartItems })
	local IsFieldCountResultAbove = TutilsModule.fieldCount(UseMemoResult) > 0
	local IsFieldCountResultAbove1 = TutilsModule.fieldCount(UseMemoResult1) > 0
	local UseMemoResult2 = ReactModule.useMemo(function(): boolean --[[ Line: 86 ]]
		-- upvalues: p1 (copy)
		for _, cartItem in p1.cartItems do
			if cartItem.timedOptions and (not cartItem.isOwned or cartItem.expirationTime ~= nil) then
				return true
			end
		end
		return false
	end, { p1.cartItems })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = if FFlagAXMISWithBlackbird then "col auto-y" else "col",
		Size = if FFlagAXMISWithBlackbird then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1)
	}, {
		CheckoutErrorBannerView = if p1.erroredItemCount and p1.erroredItemCount > 0 then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy padding-x-xxlarge padding-y-medium",
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0)
		}, {
			CheckoutErrorBanner = ReactModule.createElement(CheckoutErrorBannerModule, { erroredItemCount = p1.erroredItemCount })
		}) else nil,
		Tooltip2OptionBanner = if FFlagAXDurables2Option and v1 and UseMemoResult2 then ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y padding-x-xxlarge",
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, -UseTokensResult.Size.Size_1800)
		}, {
			Banner = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-medium size-full-0 auto-y padding-left-xlarge padding-right-xsmall padding-y-xsmall radius-medium bg-surface-300"
			}, {
				Description = ReactModule.createElement(FoundationModule.Text, {
					tag = "fill auto-y text-caption-large text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = UseLocalizationResult.rentalFtuxText
				}),
				DismissIcon = ReactModule.createElement(FoundationModule.IconButton, {
					icon = "icons/navigation/close",
					LayoutOrder = 2,
					testId = "Checkout2OptionFtuxDismiss",
					size = FoundationModule.Enums.IconSize.Small,
					onActivated = UseResult
				})
			})
		}) else nil,
		AllItemsView = if IsFieldCountResultAbove1 then ReactModule.createElement(FoundationModule.View, {
			tag = "col auto-y gap-medium padding-x-xxlarge padding-y-medium",
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0)
		}, UseMemoResult1) else nil,
		MakeupText = if IsFieldCountResultAbove then ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy padding-x-xxlarge padding-top-medium text-title-medium content-emphasis",
			LayoutOrder = 3,
			Text = UseLocalizationResult.makeupTitle .. " (" .. TutilsModule.fieldCount(UseMemoResult) .. "/8)"
		}) else nil,
		MakeupDescriptionText = if IsFieldCountResultAbove then ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy padding-x-xxlarge padding-top-xxsmall padding-bottom-medium text-body-small",
			LayoutOrder = 4,
			Text = UseLocalizationResult.makeupCartDescriptionText
		}) else nil,
		MakeupItemsView = if IsFieldCountResultAbove then ReactModule.createElement(FoundationModule.View, {
			tag = "col auto-y gap-medium padding-x-xxlarge padding-y-medium",
			LayoutOrder = 5,
			Size = UDim2.fromScale(1, 0)
		}, UseMemoResult) else nil
	})
end, TutilsModule.deepEqual)