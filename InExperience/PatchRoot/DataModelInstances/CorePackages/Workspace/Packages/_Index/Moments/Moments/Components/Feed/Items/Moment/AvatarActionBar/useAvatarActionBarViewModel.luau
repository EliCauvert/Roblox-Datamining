local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local LocalizationModule = require(Parent.Localization)
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseAvatarLookModule = require(Moments.Hooks.useAvatarLook)
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local UseMomentsHostFunction = require(Moments.MomentsHostContext).useMomentsHost
local _ = require(script.Parent.AvatarActionBar)
local FFlagAXEnableUnifiedLoggingAvatarMoment = require(Parent.SharedFlags).FFlagAXEnableUnifiedLoggingAvatarMoment

local function _(p1): string --[[ Line: 29 | Named "getLookThumbnail" ]]
	return `rbxthumb://type=Look&id={p1}&w={150}&h={150}`
end

return function(Frame) --[[ Line: 38 | Named "useAvatarActionBarViewModel" ]]
	-- upvalues: MomentContextModule (copy), UseMomentsHostFunction (copy), UseAvatarLookModule (copy), UseSignalStateFunction (copy), UseLocalizationFunction (copy), LocalizationModule (copy), LocalizationService (copy), FFlagAXEnableUnifiedLoggingAvatarMoment (copy)
	local Store = MomentContextModule.useMoment().store
	local Data = Store.getData(false)
	local OutfitId = if Data.kind == "experience" then Data.outfitId else nil
	local OpenAvatarLookTryOnFunction = UseMomentsHostFunction().openAvatarLookTryOn
	local UseAvatarLookModuleResult = UseAvatarLookModule(OutfitId)
	local UseSignalStateResult = UseSignalStateFunction(Store.getIsModerated)
	local Look = UseAvatarLookModuleResult.look
	local UseLocalizationResult = UseLocalizationFunction({
		shop = "Feature.Avatar.Action.Shop",
		itemCount = {
			"Feature.Catalog.Label.TotalItemsParenthesis",
			itemCount = if Look == nil then 0 else Look.itemCount
		}
	})
	local LookId = if Look == nil then nil else Look.lookId
	
	return {
		LayoutOrder = Frame.LayoutOrder,
		isLoading = UseAvatarLookModuleResult.status ~= "Ready",
		thumbnailImage = if LookId == nil then nil else `rbxthumb://type=Look&id={LookId}&w={150}&h={150}`,
		priceText = if Look == nil or Look.totalPrice == nil then nil else LocalizationModule.NumberLocalization.localize(Look.totalPrice, LocalizationService.RobloxLocaleId),
		itemCountText = UseLocalizationResult.itemCount,
		shopText = UseLocalizationResult.shop,
		showShopButton = OpenAvatarLookTryOnFunction ~= nil,
		isShopDisabled = UseSignalStateResult,
		onShop = function() --[[ Line: 68 ]]
			-- upvalues: OpenAvatarLookTryOnFunction (copy), LookId (copy), FFlagAXEnableUnifiedLoggingAvatarMoment (upval), Data (copy), OutfitId (copy)
			if OpenAvatarLookTryOnFunction ~= nil and LookId ~= nil then
				if FFlagAXEnableUnifiedLoggingAvatarMoment then
					OpenAvatarLookTryOnFunction(LookId, {
						feedItemId = Data.feedItemId,
						feedSessionId = Data.feedSessionId,
						outfitId = OutfitId
					})
					
					return
				end
				OpenAvatarLookTryOnFunction(LookId)
			end
		end
	}
end