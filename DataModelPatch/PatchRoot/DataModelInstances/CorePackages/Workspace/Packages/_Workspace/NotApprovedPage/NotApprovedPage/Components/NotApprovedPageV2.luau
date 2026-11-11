local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local GuiService = game:GetService("GuiService")
local IXPService = game:GetService("IXPService")
local UserInputService = game:GetService("UserInputService")
local CanReactivateModule = require(NotApprovedPage.Utils.canReactivate)
local CtaButtonsContainerModule = require(NotApprovedPage.Components.cta.CtaButtonsContainer)
local GetCommutationEligibilityModule = require(NotApprovedPage.Http.GetCommutationEligibility)
local HeaderModule = require(NotApprovedPage.Components.header.Header)
local LoadingSkeletonModule = require(NotApprovedPage.Components.LoadingSkeleton)
local NotApprovedPageProvider = require(NotApprovedPage.Contexts.NotApprovedPageContext).NotApprovedPageProvider
local PageAnalyticsProvider = require(NotApprovedPage.Contexts.PageAnalyticsContext).PageAnalyticsProvider
local PageItemsFromConfigsModule = require(NotApprovedPage.Components.pageItemConfigs.PageItemsFromConfigs)
local PageNavigationProvider = require(NotApprovedPage.Contexts.PageNavigationContext).PageNavigationProvider
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local SetBadUtterancesTranslationKeysModule = require(NotApprovedPage.Utils.setBadUtterancesTranslationKeys)
local SetViolationEvidenceTranslationKeysModule = require(NotApprovedPage.Utils.setViolationEvidenceTranslationKeys)
local _ = require(NotApprovedPage.Common.Types)
local Constants = require(Parent.NotApprovedPageShared).Constants
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local View = require(Parent.Foundation).View
local FFlagNotApprovedPageIXPExposure = require(Parent.SharedFlags).FFlagNotApprovedPageIXPExposure
local EVENTTYPES = Constants.EVENT_TYPES
local TRANSLATIONKEYS = Constants.TRANSLATION_KEYS

return ReactModule.memo(function(p1)
	-- upvalues: UseStateFunction (copy), UserInputService (copy), GuiService (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UseEffectFunction (copy), GetCommutationEligibilityModule (copy), FFlagNotApprovedPageIXPExposure (copy), IXPService (copy), AppUserLayers (copy), SendNotApprovedPageEventModule (copy), EVENTTYPES (copy), CanReactivateModule (copy), TRANSLATIONKEYS (copy), SetBadUtterancesTranslationKeysModule (copy), SetViolationEvidenceTranslationKeysModule (copy), UseLocalizationFunction (copy), ReactModule (copy), CtaButtonsContainerModule (copy), LoadingSkeletonModule (copy), NotApprovedPageProvider (copy), PageNavigationProvider (copy), PageAnalyticsProvider (copy), View (copy), HeaderModule (copy), PageItemsFromConfigsModule (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(true)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(nil)
	local Y = UserInputService.StatusBarSize.Y
	local Y1 = UserInputService.BottomBarSize.Y
	local Bottom = GuiService:GetSafeZoneOffsets().bottom
	local Offset = if Y1 == 0 then Bottom else Y1
	local ModerationDetail = p1.moderationDetail
	local InterventionType = p1.interventionType
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	UseEffectFunction(function()
		-- upvalues: GetCommutationEligibilityModule (upval), UseRoactServiceResult (copy), UseStateResult2_1 (copy), UseStateResult2 (copy)
		GetCommutationEligibilityModule(UseRoactServiceResult):andThen(function(Result)
			-- upvalues: UseStateResult2_1 (upval)
			if Result.responseBody then
				UseStateResult2_1(Result.responseBody)
			end
		end):catch(function(_)
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1({ educational_pass_eligible = false })
		end):finally(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
	end, { UseRoactServiceResult })
	UseEffectFunction(function()
		-- upvalues: FFlagNotApprovedPageIXPExposure (upval), IXPService (upval), AppUserLayers (upval), SendNotApprovedPageEventModule (upval), EVENTTYPES (upval), ModerationDetail (copy), CanReactivateModule (upval), InterventionType (copy)
		if FFlagNotApprovedPageIXPExposure and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(AppUserLayers.NotApprovedPageUserIDLayer)
		end
		SendNotApprovedPageEventModule({
			eventType = EVENTTYPES.PageRendered,
			interventionId = ModerationDetail.interventionId,
			verificationCategory = ModerationDetail.verificationCategory,
			isReactivationEligible = tostring(CanReactivateModule(InterventionType, ModerationDetail.endDate, ModerationDetail.verificationCategory)),
			punishedUserId = ModerationDetail.punishedUserId
		})
	end, {
		InterventionType,
		ModerationDetail.endDate,
		ModerationDetail.verificationCategory,
		ModerationDetail.interventionId,
		ModerationDetail.punishedUserId
	})
	SetBadUtterancesTranslationKeysModule(ModerationDetail, TRANSLATIONKEYS)
	SetViolationEvidenceTranslationKeysModule(ModerationDetail, TRANSLATIONKEYS)
	local UseLocalizationResult = UseLocalizationFunction(TRANSLATIONKEYS)
	local Element = ReactModule.createElement(CtaButtonsContainerModule, {
		moderationDetail = ModerationDetail,
		LogoutThunk = p1.LogoutThunk
	})
	
	return if UseStateResult then ReactModule.createElement(LoadingSkeletonModule) else ReactModule.createElement(NotApprovedPageProvider, {
		translations = UseLocalizationResult,
		moderationDetail = ModerationDetail,
		commutationEligibility = UseStateResult1
	}, ReactModule.createElement(PageNavigationProvider, { moderationDetail = ModerationDetail }, ReactModule.createElement(PageAnalyticsProvider, nil, ReactModule.createElement(View, {
		tag = "size-full col align-x-center align-y-center bg-surface-0",
		padding = { top = UDim.new(0, Y), bottom = UDim.new(0, Offset) }
	}, {
		InnerContainer = ReactModule.createElement(View, {
			tag = "size-full col bg-surface-100 radius-large stroke-default stroke-standard",
			LayoutOrder = 1,
			sizeConstraint = {
				MaxSize = if IsUsePreferredInputResultMatch then Vector2.new(800, 1000) else Vector2.new(600, 800)
			}
		}, {
			HeaderSection = ReactModule.createElement(HeaderModule, {
				LayoutOrder = 1,
				moderationDetail = ModerationDetail,
				LogoutThunk = p1.LogoutThunk
			}),
			Content = ReactModule.createElement(View, { tag = "size-full-0 grow col", LayoutOrder = 2 }, ReactModule.createElement(PageItemsFromConfigsModule, {
				moderationDetail = ModerationDetail,
				LogoutThunk = p1.LogoutThunk,
				commutationEligibility = UseStateResult1
			})),
			Footer = ReactModule.createElement(View, { tag = "size-full-0 auto-y col", LayoutOrder = 3 }, { FooterContent = Element })
		})
	}))))
end)