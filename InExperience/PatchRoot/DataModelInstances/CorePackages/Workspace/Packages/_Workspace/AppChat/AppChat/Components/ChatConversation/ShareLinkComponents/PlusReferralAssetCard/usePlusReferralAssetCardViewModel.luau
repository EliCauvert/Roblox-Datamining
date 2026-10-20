local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AssetCardTypesModule = require(AppChat.Components.ChatConversation.AssetCardView.AssetCardTypes)
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)
local LoadFoundationCloudAssetModule = require(AppChat.Utils.loadFoundationCloudAsset)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local FIntPlusReferralRewardRobux = require(Parent.SharedFlags).FIntPlusReferralRewardRobux
local FFlagEnablePlusReferralEntrypointTelemetry = require(Parent.SharedFlags).FFlagEnablePlusReferralEntrypointTelemetry

return function(p1)
	-- upvalues: ReactModule (copy), LoadFoundationCloudAssetModule (copy), UseLocalizationFunction (copy), FIntPlusReferralRewardRobux (copy), UseIsInExperienceModule (copy), Parent (copy), FFlagEnablePlusReferralEntrypointTelemetry (copy), AssetCardTypesModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: LoadFoundationCloudAssetModule (upval)
		return Content.fromUri((LoadFoundationCloudAssetModule("pictograms/plus_robux")))
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({
		join = "Feature.Chat.Drawer.Join",
		title = {
			"Feature.RobloxSubscription.Heading.ReferralRecipientEntry",
			amount = tostring(FIntPlusReferralRewardRobux)
		}
	})
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local ReferrerId = p1.referrerId
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Parent (upval), UseIsInExperienceModuleResult (copy), FFlagEnablePlusReferralEntrypointTelemetry (upval), ReferrerId (copy)
		local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
		RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(nil, nil, nil, RobloxSubscriptionPurchaseAppModule.SurfaceName.PlusReferralLandingSheet, if UseIsInExperienceModuleResult then RobloxSubscriptionPurchaseAppModule.SurfaceContext.InGame else RobloxSubscriptionPurchaseAppModule.SurfaceContext.InApp, nil, if FFlagEnablePlusReferralEntrypointTelemetry then {
			entrypoint = RobloxSubscriptionPurchaseAppModule.Entrypoint.AppChat
		} else nil, (tonumber(ReferrerId)))
	end, { ReferrerId, UseIsInExperienceModuleResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: AssetCardTypesModule (upval), p1 (copy), UseMemoResult (copy), UseResult (copy), UseLocalizationResult (copy)
		return {
			status = AssetCardTypesModule.Status.Ready,
			groupShape = p1.groupShape,
			mediaRef = p1.mediaRef,
			media = {
				aspectRatio = 1,
				isPictogram = true,
				isSelectable = true,
				image = UseMemoResult,
				onActivated = UseResult
			},
			footer = {
				titleMaxLines = 2,
				titleText = UseLocalizationResult.title,
				onActivated = UseResult,
				action = {
					isSelectable = false,
					label = UseLocalizationResult.join,
					onActivated = UseResult
				}
			}
		}
	end, {
		p1.groupShape, p1.mediaRef, UseMemoResult, UseLocalizationResult.title,
		UseLocalizationResult.join, UseResult
	})
end