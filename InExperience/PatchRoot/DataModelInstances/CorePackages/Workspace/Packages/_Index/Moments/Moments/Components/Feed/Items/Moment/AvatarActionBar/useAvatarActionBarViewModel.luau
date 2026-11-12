local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local LocalizationModule = require(Parent.Localization)
local SharedFlagsModule = require(Parent.SharedFlags)
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseAvatarLookModule = require(Moments.Hooks.useAvatarLook)
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local UseMomentsHostFunction = require(Moments.MomentsHostContext).useMomentsHost
local _ = require(script.Parent.AvatarActionBar)
local FFlagAXEnableUnifiedLoggingAvatarMoment = SharedFlagsModule.FFlagAXEnableUnifiedLoggingAvatarMoment
local FFlagMomentsRenderAvatarPostsInFeed = SharedFlagsModule.FFlagMomentsRenderAvatarPostsInFeed

local function _(p1): string
	return `rbxthumb://type=Look&id={p1}&w={150}&h={150}`
end

return function(Frame)
	-- upvalues: MomentContextModule (copy), FFlagMomentsRenderAvatarPostsInFeed (copy), UseMomentsHostFunction (copy), UseAvatarLookModule (copy), UseSignalStateFunction (copy), UseLocalizationFunction (copy), LocalizationModule (copy), LocalizationService (copy), FFlagAXEnableUnifiedLoggingAvatarMoment (copy)
	local Store = MomentContextModule.useMoment().store
	local Data = Store.getData(false)
	local Outfit = if FFlagMomentsRenderAvatarPostsInFeed and Data.kind == "avatar" then Data.outfit else nil
	local OutfitId = if Data.kind == "experience" then Data.outfitId elseif Outfit == nil or Outfit.source.type ~= "outfit" then nil else Outfit.source.id
	local OpenAvatarLookTryOnFunction = UseMomentsHostFunction().openAvatarLookTryOn
	local UseAvatarLookModuleResult = UseAvatarLookModule(OutfitId)
	local UseSignalStateResult = UseSignalStateFunction(Store.getIsModerated)
	local Config = if Outfit == nil or Outfit.source.type ~= "look" then nil else {
		lookId = Outfit.source.id,
		totalPrice = Outfit.price,
		itemCount = Outfit.itemCount
	}
	local Config1 = Config or UseAvatarLookModuleResult.look
	local UseLocalizationResult = UseLocalizationFunction({
		shop = "Feature.Avatar.Action.Shop",
		itemCount = {
			"Feature.Catalog.Label.TotalItemsParenthesis",
			itemCount = if Config1 == nil then 0 else Config1.itemCount
		}
	})
	local LookId = if Config1 == nil then nil else Config1.lookId
	
	return {
		LayoutOrder = Frame.LayoutOrder,
		isLoading = Config == nil and UseAvatarLookModuleResult.status ~= "Ready",
		thumbnailImage = if LookId == nil then nil else `rbxthumb://type=Look&id={LookId}&w={150}&h={150}`,
		priceText = if Config1 == nil or Config1.totalPrice == nil then nil else LocalizationModule.NumberLocalization.localize(Config1.totalPrice, LocalizationService.RobloxLocaleId),
		itemCountText = UseLocalizationResult.itemCount,
		shopText = UseLocalizationResult.shop,
		showShopButton = OpenAvatarLookTryOnFunction ~= nil,
		isShopDisabled = UseSignalStateResult,
		onShop = function()
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