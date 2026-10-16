local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local localizationModule = require(parent.Localization)
local signalsReactModule = require(parent.SignalsReact)
local localizationService = game:GetService("LocalizationService")
local useLocalization = localizationModule.Hooks.useLocalization
local useSignalState = signalsReactModule.useSignalState
local useAvatarLookModule = require(moments.Hooks.useAvatarLook)
local momentContextModule = require(script.Parent.Parent.MomentContext)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local _ = require(script.Parent.AvatarActionBar)

local function _(p1)
	return `rbxthumb://type=Look&id={p1}&w={150}&h={150}`
end

return function(p1)
	-- upvalues: momentContextModule (ref), useMomentsHost (ref), useAvatarLookModule (ref), useSignalState (ref), useLocalization (ref), localizationModule (ref), localizationService (ref)
	local store = momentContextModule.useMoment().store
	local data = store.getData(false)
	local openAvatarLookTryOn = useMomentsHost().openAvatarLookTryOn
	local var1 = useAvatarLookModule(if data.kind == "experience" then data.outfitId else nil)
	local var2 = useSignalState(store.getIsModerated)
	local look = var1.look
	local var3 = useLocalization({
		shop = "Feature.Avatar.Action.Shop",
		itemCount = {
			"Feature.Catalog.Label.TotalItemsParenthesis",
			itemCount = if look ~= nil then 0 else look.itemCount
		}
	})
	
	if var1.status == "Unavailable" then
		return nil
	end
	local var4 = if look ~= nil then nil else look.lookId
	
	return {
		LayoutOrder = p1.LayoutOrder,
		isLoading = var1.status == "Loading",
		thumbnailImage = if var4 ~= nil then nil else `rbxthumb://type=Look&id={var4}&w={150}&h={150}`,
		priceText = if look == nil or look.totalPrice == nil then nil else localizationModule.NumberLocalization.localize(look.totalPrice, localizationService.RobloxLocaleId),
		itemCountText = var3.itemCount,
		shopText = var3.shop,
		showShopButton = openAvatarLookTryOn ~= nil,
		isShopDisabled = var2,
		onShop = function()
			-- upvalues: openAvatarLookTryOn (ref), var4 (ref)
			if openAvatarLookTryOn ~= nil and var4 ~= nil then
				openAvatarLookTryOn(var4)
			end
		end
	}
end