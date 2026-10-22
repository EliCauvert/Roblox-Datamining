local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AssetCardTypesModule = require(AppChat.Components.ChatConversation.AssetCardView.AssetCardTypes)
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)
local LoadFoundationCloudAssetModule = require(AppChat.Utils.loadFoundationCloudAsset)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local FIntPlusReferralRewardRobux = require(Parent.SharedFlags).FIntPlusReferralRewardRobux
local FFlagEnablePlusReferralEntrypointTelemetry = require(Parent.SharedFlags).FFlagEnablePlusReferralEntrypointTelemetry
local FFlagAppChatPlusReferralHideSenderJoinModule = require(AppChat.Flags.FFlagAppChatPlusReferralHideSenderJoin)
local FFlagAppChatPlusReferralLargerPictogramModule = require(AppChat.Flags.FFlagAppChatPlusReferralLargerPictogram)

return function(p1)
	-- upvalues: ReactModule (copy), LoadFoundationCloudAssetModule (copy), UseLocalizationFunction (copy), FIntPlusReferralRewardRobux (copy), UseIsInExperienceModule (copy), FFlagAppChatPlusReferralHideSenderJoinModule (copy), UseLocalUserIdFunction (copy), Parent (copy), FFlagEnablePlusReferralEntrypointTelemetry (copy), AssetCardTypesModule (copy), FFlagAppChatPlusReferralLargerPictogramModule (copy)
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
	local UseLocalUserIdResult = if FFlagAppChatPlusReferralHideSenderJoinModule then UseLocalUserIdFunction() else nil
	local IsTextMatch: boolean = FFlagAppChatPlusReferralHideSenderJoinModule and tostring(UseLocalUserIdResult) == p1.referrerId
	local ReferrerId = p1.referrerId
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Parent (upval), UseIsInExperienceModuleResult (copy), FFlagEnablePlusReferralEntrypointTelemetry (upval), ReferrerId (copy)
		local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
		RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(nil, nil, nil, RobloxSubscriptionPurchaseAppModule.SurfaceName.PlusReferralLandingSheet, if UseIsInExperienceModuleResult then RobloxSubscriptionPurchaseAppModule.SurfaceContext.InGame else RobloxSubscriptionPurchaseAppModule.SurfaceContext.InApp, nil, if FFlagEnablePlusReferralEntrypointTelemetry then {
			entrypoint = RobloxSubscriptionPurchaseAppModule.Entrypoint.AppChat
		} else nil, (tonumber(ReferrerId)))
	end, { ReferrerId, UseIsInExperienceModuleResult })
	local UseResult1 = if IsTextMatch then nil else UseResult
	
	return ReactModule.useMemo(function()
		-- upvalues: AssetCardTypesModule (upval), p1 (copy), UseMemoResult (copy), FFlagAppChatPlusReferralLargerPictogramModule (upval), UseResult1 (copy), IsTextMatch (copy), UseLocalizationResult (copy), UseResult (copy)
		return {
			status = AssetCardTypesModule.Status.Ready,
			groupShape = p1.groupShape,
			mediaRef = p1.mediaRef,
			media = {
				aspectRatio = 1,
				isPictogram = true,
				image = UseMemoResult,
				pictogramScale = if FFlagAppChatPlusReferralLargerPictogramModule then 1 else nil,
				onActivated = UseResult1,
				isSelectable = not IsTextMatch
			},
			footer = {
				titleMaxLines = 2,
				titleText = UseLocalizationResult.title,
				onActivated = UseResult1,
				action = if IsTextMatch then nil else {
					isSelectable = false,
					label = UseLocalizationResult.join,
					onActivated = UseResult
				}
			}
		}
	end, {
		p1.groupShape, p1.mediaRef, UseMemoResult, UseLocalizationResult.title,
		UseLocalizationResult.join, UseResult, IsTextMatch, UseResult1
	})
end