local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(gamePlayButton.PlayButtonTypes)
local fetchGamePlayButtonDataModule = require(gamePlayButton.FetchGamePlayButtonData)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local fetchUserSettingsAndOptions = require(parent.GameDetailRodux).FetchUserSettingsAndOptions
local dashModule = require(parent.Dash)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local openCloseOnlyInteractiveAlert = require(parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local openPlayButtonUpsellDialog = require(parent.DiscoveryRouting).OpenPlayButtonUpsellDialog
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local openAmpWizardContainer = require(parent.AmpUpsell).OpenAmpWizardContainer
local authButtonClick = require(parent.AuthAnalytics).Events.authButtonClick
local loggingProtocolModule = require(parent.LoggingProtocol)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local unlockPlayIntent = require(parent.DiscoveryAnalytics).Events.unlockPlayIntent
local delayedAmpWizardCompletionCallbackOverrideModule = require(gamePlayButton.PlayButtonLaunchChecks.delayedAmpWizardCompletionCallbackOverride)
local unknownUpsellErrorEventHundredthsPercent = game:DefineFastInt("UnknownUpsellErrorEventHundredthsPercent", 0)
local luaAppUpsellMaturityRatingToSettingMapping = game:DefineFastString("LuaAppUpsellMaturityRatingToSettingMapping", "mild=NinePlus,moderate=ThirteenPlus,restricted=SeventeenPlus,unrated=ThirteenPlus")
local fFlagLuaAppParentUpsellPolicy = require(parent.SharedFlags).FFlagLuaAppParentUpsellPolicy
local fFlagLuaAppPlayButtonAmpAgeCheckFlow = require(parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local fStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local fStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(parent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local fFlagLuaAppParentApprovedExperiences = require(parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local getFFlagEnableAmpWizardVPCNavigationFix = require(parent.AmpUpsell).GetFFlagEnableAmpWizardVPCNavigationFix
local fFlagLuaAppPlayButtonWizardCloseDelay = require(parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local fIntLuaAppPlayButtonWizardCloseDelayMs = require(parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local _ = {
	SelfUpdateSetting = "SelfUpdateSetting",
	ParentalConsent = "ParentalConsent",
	ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification"
}

local function parseContentMaturityMappingString(p0)
	if p0 == "" then
		return {}
	end
	local t = {}
	
	for i, v in string.split(p0, ",") do
		local parts = string.split(v, "=")
		
		if #parts == 2 and parts[1] ~= "" and parts[2] ~= "" then
			t[parts[1]] = parts[2]
		else
			error(`Invalid content maturity mapping string {p0}`)
		end
	end
	return t
end

local var10 = (function(p1)
	-- upvalues: parseContentMaturityMappingString (ref), flaggedMutedError (ref)
	local ok, status = pcall(function()
		-- upvalues: parseContentMaturityMappingString (copy), p1 (ref)
		return parseContentMaturityMappingString(p1)
	end)
	
	if ok then
		return status
	end
	flaggedMutedError("ExperienceParentalControlsUpsellContentMaturityMappingParsingError", `Error parsing content maturity mapping string {p1}, error is: {status}`)
	
	return {}
end)(luaAppUpsellMaturityRatingToSettingMapping)

return function(p2, p3, p4)
	-- upvalues: useRoactService (ref), roactNetworking (ref), appEventIngestService (ref), useDispatch (ref), useSelector (ref), gameInfosReducer (ref), useLocalization (ref), fFlagLuaAppParentApprovedExperiences (ref), reactModule (ref), openAmpWizardContainer (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateDown (ref), openPlayButtonUpsellDialog (ref), openCloseOnlyInteractiveAlert (ref), navigateBack (ref), closeCentralOverlay (ref), fetchGamePlayButtonDataModule (ref), authButtonClick (ref), getFFlagEnableAmpWizardVPCNavigationFix (ref), unlockPlayIntent (ref), playabilityStatusEnum (ref), fFlagLuaAppParentUpsellPolicy (ref), useAppPolicy (ref), fetchUserSettingsAndOptions (ref), flaggedMutedError (ref), var10 (ref), loggingProtocolModule (ref), unknownUpsellErrorEventHundredthsPercent (ref), dashModule (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref), delayedAmpWizardCompletionCallbackOverrideModule (ref), fIntLuaAppPlayButtonWizardCloseDelayMs (ref)
	local var13 = useRoactService(roactNetworking)
	local var14 = useRoactService(appEventIngestService)
	local var15 = useDispatch()
	local var16 = useSelector(function(p5)
		-- upvalues: p2 (ref), gameInfosReducer (copy)
		local var31 = p5.AgeRecommendations[p2]
		
		if var31 and var31.summary and (var31.summary.ageRecommendation and var31.summary.ageRecommendation.contentMaturity) then
			return var31.summary.ageRecommendation.contentMaturity
		end
		local var32 = p5.Personalization[gameInfosReducer.key][p2]
		
		return if var32 and var32.contentMaturity then var32.contentMaturity else nil
	end)
	local var17 = useLocalization({
		unplayableTitleText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Title",
		unplayableBodyText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Body",
		unplayableButtonText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Action.Ok",
		askYourParentTitleText = "Feature.ExperienceDetails.AskYourParentModal.Label.Title",
		askYourParentBodyText = "Feature.ExperienceDetails.AskYourParentModal.Label.Body",
		askYourParentActionButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.AskNow",
		askYourParentCancelButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.Cancel",
		consoleSelfUpdateSettingTitleText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Title",
		consoleSelfUpdateSettingBodyText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Body",
		consoleSelfUpdateSettingButtonText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Action.Ok",
		askYourParentToAllowGameBodyText = if fFlagLuaAppParentApprovedExperiences then "Feature.ExperienceDetails.AskYourParentToAllowGameModal.Label.Body" else nil
	})
	local var18 = reactModule.useCallback(function(p6, p7, p8, p9, p10, p11, p12)
		-- upvalues: var15 (ref), openAmpWizardContainer (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy)
		var15(openAmpWizardContainer(p6, p7, p8, p9, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then p10 else nil, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then p11 else nil, nil, nil, if fFlagLuaAppPlayButtonWizardCloseDelay then p12 else nil))
	end, { var15 })
	local var19 = reactModule.useCallback(function(p13, p14, p15, p16)
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var15 (ref), navigateDown (copy)
		local t = {
			name = appPage.AccountSettingsUpsell,
			extraProps = {
				featureName = p13,
				localizationStrings = p14,
				onCloseModal = p15,
				onCancelled = p16
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var4.down(var4.fromLegacyPage(t), true)
			
			return
		end
		var15(navigateDown(t, true))
	end, { var15 })
	local var20 = reactModule.useCallback(function(p17, p18, p19, p20, p21, p22, p23)
		-- upvalues: var15 (ref), openPlayButtonUpsellDialog (copy)
		var15(openPlayButtonUpsellDialog(p17, p18, p19, p20, p21, p22, p23))
	end, { var15 })
	local var21 = reactModule.useCallback(function(p24, p25, p26, p27, p28)
		-- upvalues: var15 (ref), openCloseOnlyInteractiveAlert (copy)
		var15(openCloseOnlyInteractiveAlert(p24, p25, p26, p27, p28))
	end, { var15 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var4 (copy), var15 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var4.back(true)
			
			return
		end
		var15(navigateBack(true))
	end, { var15 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), closeCentralOverlay (copy)
		var15(closeCentralOverlay())
	end, { var15 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), fetchGamePlayButtonDataModule (copy), var13 (ref), p2 (ref)
		var15(fetchGamePlayButtonDataModule.Fetch(var13, p2, true))
	end, { var15, var13, p2 })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var24 (ref)
		var22()
		var24()
	end, { var22, var24 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), authButtonClick (copy), var24 (ref)
		var23()
		authButtonClick("gameJoinContentMaturityLock", "cancelAskParent")
		var24()
	end, { var23, var24 })
	local var27 = reactModule.useCallback(function(p29)
		-- upvalues: var23 (ref), authButtonClick (copy), fFlagLuaAppParentApprovedExperiences (copy), var18 (ref), getFFlagEnableAmpWizardVPCNavigationFix (copy), var24 (ref), var22 (ref), p2 (ref)
		var23()
		authButtonClick("gameJoinContentMaturityLock", "askParent")
		
		if fFlagLuaAppParentApprovedExperiences then
			var18("CanApproveExperience", if getFFlagEnableAmpWizardVPCNavigationFix() then var24 else var22, { experienceManagementAction = "Approve", universeId = p2 }, "gameJoinContentMaturityLock", nil, nil, nil)
			
			return
		end
		var18("CanChangeSetting", if getFFlagEnableAmpWizardVPCNavigationFix() then var24 else var22, { contentAgeRestriction = p29 }, "gameJoinContentMaturityLock", nil, nil, nil)
	end, {
		var18,
		if getFFlagEnableAmpWizardVPCNavigationFix() then var24 else nil,
		if not getFFlagEnableAmpWizardVPCNavigationFix() then var22 else nil,
		var23,
		if fFlagLuaAppParentApprovedExperiences then p2 else nil
	})
	local var28 = reactModule.useCallback(function(p30, p31)
		-- upvalues: unlockPlayIntent (copy), var14 (ref), p2 (ref), fFlagLuaAppParentApprovedExperiences (copy), playabilityStatusEnum (copy), p4 (ref)
		unlockPlayIntent(var14, {
			universeId = p2,
			upsellName = p30,
			playabilityStatus = if fFlagLuaAppParentApprovedExperiences then p31 or playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls else playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls,
			pageName = p4
		})
	end, { var14, p2, p4 })
	local var29 = if fFlagLuaAppParentUpsellPolicy then useAppPolicy(function(p32)
		return p32.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local var30 = useAppPolicy(function(p33)
		return p33.getWebViewSupport()
	end)
	
	return reactModule.useCallback(function(p34)
		-- upvalues: fFlagLuaAppParentUpsellPolicy (copy), var29 (write), p3 (ref), var28 (ref), fetchUserSettingsAndOptions (copy), var13 (ref), var16 (ref), flaggedMutedError (copy), var10 (copy), loggingProtocolModule (copy), unknownUpsellErrorEventHundredthsPercent (copy), p2 (ref), dashModule (copy), var30 (ref), var21 (ref), var17 (ref), var23 (ref), var19 (ref), var25 (ref), var20 (ref), var27 (ref), var26 (ref), var18 (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var24 (ref), p4 (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy)
		if fFlagLuaAppParentUpsellPolicy and not var29 then
			p3(p34)
			var28("GameLaunch")
			
			return
		end
		fetchUserSettingsAndOptions(var13):andThen(function(p35)
			-- upvalues: var16 (copy), flaggedMutedError (copy), p3 (copy), p34 (ref), var28 (copy), var10 (copy), loggingProtocolModule (copy), unknownUpsellErrorEventHundredthsPercent (copy), p2 (copy), dashModule (copy), var30 (copy), var21 (copy), var17 (copy), var23 (copy), var19 (copy), var25 (copy), var20 (copy), var27 (copy), var26 (copy), var18 (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var24 (copy), p4 (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy)
			local contentAgeRestriction = p35.contentAgeRestriction
			
			if not contentAgeRestriction or not var16 then
				flaggedMutedError("ExperienceParentalControlsUpsellUnknownContentMaturityRating", `Unknown content maturity rating {var16} or age restriction setting {contentAgeRestriction} for Contextual Parental Controls upsell on play button click`)
				p3(p34)
				var28("GameLaunch")
				
				return
			end
			assert(var16, "Content maturity rating must be present to show correct upsell")
			
			if not var10[var16] then
				loggingProtocolModule.default:logRobloxTelemetryEvent({
					eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating",
					description = "Unexpected content maturity rating for Contextual Parental Controls upsell on play button click",
					backends = { loggingProtocolModule.TelemetryBackends.Points },
					throttlingPercentage = unknownUpsellErrorEventHundredthsPercent,
					lastUpdated = { 25, 8, 26 }
				}, {
					loggingProtocolModule.default.StandardizedFields.addOsInfo
				}, {
					eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating",
					contentMaturityRating = var16,
					universeId = p2
				})
				p3(p34)
				var28("GameLaunch")
				
				return
			end
			local var34 = var10[var16]
			local var35 = dashModule.find(contentAgeRestriction.options, function(p36)
				-- upvalues: var34 (ref)
				local var36
				if p36 and p36.option then
					var36 = true
					
					if p36.option.optionValue ~= var34 then
						var36 = false
					end
					return var36
				end
			end)
			
			if not var35 then
				var21(var17.unplayableTitleText, var17.unplayableBodyText, var23, var17.unplayableButtonText, true)
				var28("RestrictedUnplayableOptionNotFound")
				
				return
			end
			local requirement = var35.requirement
			
			if requirement == "SelfUpdateSetting" then
				if var30 then
					var19("gameJoinContentMaturityLock", {
						title = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Title",
						message = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Body",
						buttonCancel = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.Cancel",
						buttonSettings = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.GoToSettings"
					}, var25, var25)
				else
					var21(var17.consoleSelfUpdateSettingTitleText, var17.consoleSelfUpdateSettingBodyText, var23, var17.consoleSelfUpdateSettingButtonText, true)
				end
			elseif requirement == "ParentalConsent" then
				var20(var17.askYourParentTitleText, var17.askYourParentBodyText, var17.askYourParentActionButtonText, var17.askYourParentCancelButtonText, function()
					-- upvalues: var27 (copy), var35 (ref)
					var27(var35.option.optionValue)
				end, var26, var26)
			elseif requirement == "ContentAgeRestrictionVerification" then
				var18(if fFlagLuaAppPlayButtonAmpAgeCheckFlow then fStringLuaAppPlayButtonAgeCheckAmpFeatureName else "ShouldNotPromptSeventeenPlusSettingVerifications", var24, nil, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then if p4 then `gameJoinContentMaturityLock-{p4}` else "gameJoinContentMaturityLock" else nil, nil, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then fStringLuaAppPlayButtonAgeCheckAmpNameSpace else nil, if fFlagLuaAppPlayButtonWizardCloseDelay then delayedAmpWizardCompletionCallbackOverrideModule(var24, fIntLuaAppPlayButtonWizardCloseDelayMs) else nil)
			else
				flaggedMutedError("ExperienceParentalControlsUnknownUpsellRequirement", `Unknown requirement {requirement} for ContentAgeRestriction option {var35} on play button click`)
				p3(p34)
			end
			var28(requirement or "GameLaunch")
		end, function()
			-- upvalues: p3 (copy), p34 (ref), var28 (copy)
			p3(p34)
			var28("GameLaunch")
		end)
	end, {
		var13, p2, p3, var16, var15, var19, var18, var21, var20, var27, var25, var26,
		var23, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then var24 else nil, var28,
		var17.unplayableTitleText, var17.unplayableBodyText,
		var17.unplayableButtonText, var17.askYourParentTitleText,
		var17.askYourParentBodyText, var17.askYourParentActionButtonText,
		var17.askYourParentCancelButtonText, var17.consoleSelfUpdateSettingTitleText,
		var17.consoleSelfUpdateSettingBodyText,
		var17.consoleSelfUpdateSettingButtonText, var29, var30, p4
	}), if fFlagLuaAppParentApprovedExperiences then if fFlagLuaAppParentApprovedExperiences then reactModule.useCallback(function(p37)
		-- upvalues: fFlagLuaAppParentUpsellPolicy (copy), var29 (write), p3 (ref), var28 (ref), playabilityStatusEnum (copy), var20 (ref), var17 (ref), var27 (ref), var26 (ref)
		if fFlagLuaAppParentUpsellPolicy and not var29 then
			p3(p37)
			var28("GameLaunch", playabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
			
			return
		end
		var20(var17.askYourParentTitleText, var17.askYourParentToAllowGameBodyText, var17.askYourParentActionButtonText, var17.askYourParentCancelButtonText, var27, var26, var26)
		var28("ParentApprovedExperience", playabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
	end, {
		var20, var27, var26, var28, p3, var29, var17.askYourParentTitleText,
		var17.askYourParentToAllowGameBodyText, var17.askYourParentActionButtonText,
		var17.askYourParentCancelButtonText
	}) else nil else nil
end