local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local assetCardTypesModule = require(appChat.Components.ChatConversation.AssetCardView.AssetCardTypes)
local _ = require(appChat.Components.ChatConversation.Grouping.MessageGroupShape)
local loadFoundationCloudAssetModule = require(appChat.Utils.loadFoundationCloudAsset)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local fIntPlusReferralRewardRobux = require(parent.SharedFlags).FIntPlusReferralRewardRobux

return function(value)
	-- upvalues: reactModule (ref), loadFoundationCloudAssetModule (ref), useLocalization (ref), fIntPlusReferralRewardRobux (ref), useIsInExperienceModule (ref), parent (ref), assetCardTypesModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: loadFoundationCloudAssetModule (copy)
		return Content.fromUri(loadFoundationCloudAssetModule("pictograms/plus_robux"))
	end, {})
	local var2 = useLocalization({
		join = "Feature.Chat.Drawer.Join",
		title = {
			"Feature.RobloxSubscription.Heading.ReferralRecipientEntry",
			amount = tostring(fIntPlusReferralRewardRobux)
		}
	})
	local var3 = useIsInExperienceModule()
	local referrerId = value.referrerId
	local var4 = reactModule.useCallback(function()
		-- upvalues: parent (copy), var3 (ref), referrerId (ref)
		local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
		robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(nil, nil, nil, robloxSubscriptionPurchaseAppModule.SurfaceName.PlusReferralLandingSheet, if var3 then robloxSubscriptionPurchaseAppModule.SurfaceContext.InGame else robloxSubscriptionPurchaseAppModule.SurfaceContext.InApp, nil, nil, tonumber(referrerId))
	end, { referrerId, var3 })
	
	return reactModule.useMemo(function()
		-- upvalues: assetCardTypesModule (copy), value (ref), var1 (ref), var4 (ref), var2 (ref)
		return {
			status = assetCardTypesModule.Status.Ready,
			groupShape = value.groupShape,
			mediaRef = value.mediaRef,
			media = {
				aspectRatio = 1,
				isPictogram = true,
				isSelectable = true,
				image = var1,
				onActivated = var4
			},
			footer = {
				titleMaxLines = 2,
				titleText = var2.title,
				onActivated = var4,
				action = {
					isSelectable = false,
					label = var2.join,
					onActivated = var4
				}
			}
		}
	end, {
		value.groupShape, value.mediaRef, var1, var2.title, var2.join, var4
	})
end