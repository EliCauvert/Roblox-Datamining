local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(gamePlayButton.PlayButtonTypes)
local fetchGamePlayButtonDataModule = require(gamePlayButton.FetchGamePlayButtonData)
local playButtonUpsellBodyModule = require(gamePlayButton.PlayButtonUpsellBody)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local gameHydrationReactModule = require(parent.GameHydrationReact)
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local fetchUserSettingsAndOptions = require(parent.GameDetailRodux).FetchUserSettingsAndOptions
local dashModule = require(parent.Dash)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local openCloseOnlyInteractiveAlert = require(parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local openPlayButtonUpsellDialog = require(parent.DiscoveryRouting).OpenPlayButtonUpsellDialog
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local openAmpWizardContainer = require(parent.AmpUpsell).OpenAmpWizardContainer
local _ = require(parent.AmpUpsell)
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
local fFlagLuaAppVpcUpsellNamespace = require(parent.SharedFlags).FFlagLuaAppVpcUpsellNamespace
local fStringLuaAppVpcSettingsChangeAmpNameSpace = require(parent.SharedFlags).FStringLuaAppVpcSettingsChangeAmpNameSpace
local fStringLuaAppVpcAccountManagementAmpNameSpace = require(parent.SharedFlags).FStringLuaAppVpcAccountManagementAmpNameSpace
local fFlagLuaAppParentApprovedExperiences = require(parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local getFFlagEnableAmpWizardVPCNavigationFix = require(parent.AmpUpsell).GetFFlagEnableAmpWizardVPCNavigationFix
local fFlagEnablePlayButtonWizardVPCPrologueModule = require(gamePlayButton.Flags.FFlagEnablePlayButtonWizardVPCPrologue)
local fFlagLuaAppPlayButtonWizardCloseDelay = require(parent.SharedFlags).FFlagLuaAppPlayButtonWizardCloseDelay
local fIntLuaAppPlayButtonWizardCloseDelayMs = require(parent.SharedFlags).FIntLuaAppPlayButtonWizardCloseDelayMs
local _ = {
	SelfUpdateSetting = "SelfUpdateSetting",
	ParentalConsent = "ParentalConsent",
	ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification"
}

local function parseContentMaturityMappingString(p1)
	if p1 == "" then
		return {}
	end
	local t = {}
	
	for i, v in string.split(p1, ",") do
		local parts = string.split(v, "=")
		
		if #parts == 2 and parts[1] ~= "" and parts[2] ~= "" then
			t[parts[1]] = parts[2]
		else
			error(`Invalid content maturity mapping string {p1}`)
		end
	end
	return t
end

local var2 = (function(p2)
	-- upvalues: parseContentMaturityMappingString (ref), flaggedMutedError (ref)
	local ok, status = pcall(function()
		-- upvalues: parseContentMaturityMappingString (copy), p2 (ref)
		return parseContentMaturityMappingString(p2)
	end)
	
	if ok then
		return status
	end
	flaggedMutedError("ExperienceParentalControlsUpsellContentMaturityMappingParsingError", `Error parsing content maturity mapping string {p2}, error is: {status}`)
	
	return {}
end)(luaAppUpsellMaturityRatingToSettingMapping)

return function(p2, p3, p4)
	-- upvalues: useRoactService (ref), roactNetworking (ref), appEventIngestService (ref), useDispatch (ref), useSelector (ref), fFlagMigrateGameInfoToStore (ref), gameInfosReducer (ref), gameHydrationReactModule (ref), useLocalization (ref), fFlagLuaAppParentApprovedExperiences (ref), reactModule (ref), openAmpWizardContainer (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fFlagLuaAppVpcUpsellNamespace (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), fFlagEnablePlayButtonWizardVPCPrologueModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), openPlayButtonUpsellDialog (ref), openCloseOnlyInteractiveAlert (ref), navigateBack (ref), closeCentralOverlay (ref), fetchGamePlayButtonDataModule (ref), authButtonClick (ref), playButtonUpsellBodyModule (ref), getFFlagEnableAmpWizardVPCNavigationFix (ref), fStringLuaAppVpcAccountManagementAmpNameSpace (ref), fStringLuaAppVpcSettingsChangeAmpNameSpace (ref), unlockPlayIntent (ref), playabilityStatusEnum (ref), fFlagLuaAppParentUpsellPolicy (ref), useAppPolicy (ref), fetchUserSettingsAndOptions (ref), flaggedMutedError (ref), var2 (ref), loggingProtocolModule (ref), unknownUpsellErrorEventHundredthsPercent (ref), dashModule (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref), delayedAmpWizardCompletionCallbackOverrideModule (ref), fIntLuaAppPlayButtonWizardCloseDelayMs (ref)
	local var3 = useRoactService(roactNetworking)
	local var4 = useRoactService(appEventIngestService)
	local var5 = useDispatch()
	local var6 = useSelector(function(p5)
		-- upvalues: p2 (ref), fFlagMigrateGameInfoToStore (copy), gameInfosReducer (copy)
		local var7 = p5.AgeRecommendations[p2]
		
		if var7 and var7.summary and (var7.summary.ageRecommendation and var7.summary.ageRecommendation.contentMaturity) then
			return var7.summary.ageRecommendation.contentMaturity
		elseif fFlagMigrateGameInfoToStore then
			return nil
		end
		local var8 = p5.Personalization[gameInfosReducer.key][p2]
		
		return if var8 and var8.contentMaturity then var8.contentMaturity else nil
	end)
	local var7 = nil
	
	if fFlagMigrateGameInfoToStore then
		local var8 = gameHydrationReactModule.useGameInfo(p2)
		var7 = var8 and var8.contentMaturity
	end
	local var9 = if fFlagMigrateGameInfoToStore then var6 or var7 else var6
	local var10 = useLocalization({
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
	local var11 = reactModule.useCallback(function(p5, p6, p7, p8, p9, p10, p11, p12)
		-- upvalues: var5 (ref), openAmpWizardContainer (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fFlagLuaAppVpcUpsellNamespace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), fFlagEnablePlayButtonWizardVPCPrologueModule (copy)
		var5(openAmpWizardContainer(p5, p6, p7, p8, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then p9 else nil, if fFlagLuaAppPlayButtonAmpAgeCheckFlow or fFlagLuaAppVpcUpsellNamespace then p10 else nil, nil, nil, if fFlagLuaAppPlayButtonWizardCloseDelay then p11 else nil, if fFlagEnablePlayButtonWizardVPCPrologueModule and p12 then true else nil, if fFlagEnablePlayButtonWizardVPCPrologueModule then p12 else nil))
	end, { var5 })
	local var12 = reactModule.useCallback(function(p5, p6, p7, p8)
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (ref), navigateDown (copy)
		local t = {
			name = appPage.AccountSettingsUpsell,
			extraProps = {
				featureName = p5,
				localizationStrings = p6,
				onCloseModal = p7,
				onCancelled = p8
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t), true)
			
			return
		end
		var5(navigateDown(t, true))
	end, { var5 })
	local var13 = reactModule.useCallback(function(p5, p6, p7, p8, p9, p10, p11)
		-- upvalues: var5 (ref), openPlayButtonUpsellDialog (copy)
		var5(openPlayButtonUpsellDialog(p5, p6, p7, p8, p9, p10, p11))
	end, { var5 })
	local var14 = reactModule.useCallback(function(p5, p6, p7, p8, p9)
		-- upvalues: var5 (ref), openCloseOnlyInteractiveAlert (copy)
		var5(openCloseOnlyInteractiveAlert(p5, p6, p7, p8, p9))
	end, { var5 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var1.back(true)
			
			return
		end
		var5(navigateBack(true))
	end, { var5 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), closeCentralOverlay (copy)
		var5(closeCentralOverlay())
	end, { var5 })
	local var17 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), fetchGamePlayButtonDataModule (copy), var3 (ref), p2 (ref)
		var5(fetchGamePlayButtonDataModule.Fetch(var3, p2, true))
	end, { var5, var3, p2 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var17 (ref)
		var15()
		var17()
	end, { var15, var17 })
	local var19 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), authButtonClick (copy), var17 (ref)
		var16()
		authButtonClick("gameJoinContentMaturityLock", "cancelAskParent")
		var17()
	end, { var16, var17 })
	local var20 = if fFlagEnablePlayButtonWizardVPCPrologueModule then reactModule.useCallback(function(p5)
		-- upvalues: var10 (ref), fFlagLuaAppVpcUpsellNamespace (copy), reactModule (copy), playButtonUpsellBodyModule (copy), var19 (ref), authButtonClick (copy)
		return {
			config = {
				cancelFirst = true,
				dialogSize = "Medium",
				hasBackdrop = true,
				onCloseCancels = true,
				titleText = var10.askYourParentTitleText,
				bodyText = if fFlagLuaAppVpcUpsellNamespace then p5 else nil,
				bodyContent = reactModule.createElement(playButtonUpsellBodyModule, { bodyText = p5, onCloseModal = var19 }),
				confirmText = var10.askYourParentActionButtonText,
				cancelText = var10.askYourParentCancelButtonText
			},
			onConfirm = function()
				-- upvalues: authButtonClick (copy)
				authButtonClick("gameJoinContentMaturityLock", "askParent")
			end,
			onCancel = function()
				-- upvalues: authButtonClick (copy)
				authButtonClick("gameJoinContentMaturityLock", "cancelAskParent")
			end
		}
	end, {
		var10.askYourParentTitleText,
		var10.askYourParentActionButtonText,
		var10.askYourParentCancelButtonText,
		var19
	}) else nil
	local var21 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var16 (ref), fFlagEnablePlayButtonWizardVPCPrologueModule (copy), authButtonClick (copy), fFlagLuaAppParentApprovedExperiences (copy), var11 (ref), getFFlagEnableAmpWizardVPCNavigationFix (copy), var17 (ref), var15 (ref), p2 (ref), fFlagLuaAppVpcUpsellNamespace (copy), fStringLuaAppVpcAccountManagementAmpNameSpace (copy), fStringLuaAppVpcSettingsChangeAmpNameSpace (copy)
		var16()
		
		if not fFlagEnablePlayButtonWizardVPCPrologueModule then
			authButtonClick("gameJoinContentMaturityLock", "askParent")
		end
		if fFlagLuaAppParentApprovedExperiences then
			var11("CanApproveExperience", if getFFlagEnableAmpWizardVPCNavigationFix() then var17 else var15, { experienceManagementAction = "Approve", universeId = p2 }, "gameJoinContentMaturityLock", nil, if fFlagLuaAppVpcUpsellNamespace then fStringLuaAppVpcAccountManagementAmpNameSpace else nil, nil, if fFlagEnablePlayButtonWizardVPCPrologueModule then p6 else nil)
			
			return
		end
		var11("CanChangeSetting", if getFFlagEnableAmpWizardVPCNavigationFix() then var17 else var15, { contentAgeRestriction = p5 }, "gameJoinContentMaturityLock", nil, if fFlagLuaAppVpcUpsellNamespace then fStringLuaAppVpcSettingsChangeAmpNameSpace else nil, nil, if fFlagEnablePlayButtonWizardVPCPrologueModule then p6 else nil)
	end, {
		var11,
		if getFFlagEnableAmpWizardVPCNavigationFix() then var17 else nil,
		if not getFFlagEnableAmpWizardVPCNavigationFix() then var15 else nil,
		var16,
		if fFlagLuaAppParentApprovedExperiences then p2 else nil
	})
	local var22 = reactModule.useCallback(function(p5, p6)
		-- upvalues: unlockPlayIntent (copy), var4 (ref), p2 (ref), fFlagLuaAppParentApprovedExperiences (copy), playabilityStatusEnum (copy), p4 (ref)
		unlockPlayIntent(var4, {
			universeId = p2,
			upsellName = p5,
			playabilityStatus = if fFlagLuaAppParentApprovedExperiences then p6 or playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls else playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls,
			pageName = p4
		})
	end, { var4, p2, p4 })
	local var23 = if fFlagLuaAppParentUpsellPolicy then useAppPolicy(function(p5)
		return p5.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local var24 = useAppPolicy(function(p5)
		return p5.getWebViewSupport()
	end)
	
	return reactModule.useCallback(function(p5)
		-- upvalues: fFlagLuaAppParentUpsellPolicy (copy), var23 (write), p3 (ref), var22 (ref), fetchUserSettingsAndOptions (copy), var3 (ref), var9 (ref), flaggedMutedError (copy), var2 (copy), loggingProtocolModule (copy), unknownUpsellErrorEventHundredthsPercent (copy), p2 (ref), dashModule (copy), var24 (ref), var14 (ref), var10 (ref), var16 (ref), var12 (ref), var18 (ref), fFlagEnablePlayButtonWizardVPCPrologueModule (copy), var21 (ref), var20 (write), var13 (ref), var19 (ref), var11 (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var17 (ref), p4 (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy)
		if fFlagLuaAppParentUpsellPolicy and not var23 then
			p3(p5)
			var22("GameLaunch")
			
			return
		end
		fetchUserSettingsAndOptions(var3):andThen(function(p6)
			-- upvalues: var9 (copy), flaggedMutedError (copy), p3 (copy), p5 (ref), var22 (copy), var2 (copy), loggingProtocolModule (copy), unknownUpsellErrorEventHundredthsPercent (copy), p2 (copy), dashModule (copy), var24 (copy), var14 (copy), var10 (copy), var16 (copy), var12 (copy), var18 (copy), fFlagEnablePlayButtonWizardVPCPrologueModule (copy), var21 (copy), var20 (copy), var13 (copy), var19 (copy), var11 (copy), fFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), var17 (copy), p4 (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), fFlagLuaAppPlayButtonWizardCloseDelay (copy), delayedAmpWizardCompletionCallbackOverrideModule (copy), fIntLuaAppPlayButtonWizardCloseDelayMs (copy)
			local contentAgeRestriction = p6.contentAgeRestriction
			
			if not contentAgeRestriction or not var9 then
				flaggedMutedError("ExperienceParentalControlsUpsellUnknownContentMaturityRating", `Unknown content maturity rating {var9} or age restriction setting {contentAgeRestriction} for Contextual Parental Controls upsell on play button click`)
				p3(p5)
				var22("GameLaunch")
				
				return
			end
			assert(var9, "Content maturity rating must be present to show correct upsell")
			
			if not var2[var9] then
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
					contentMaturityRating = var9,
					universeId = p2
				})
				p3(p5)
				var22("GameLaunch")
				
				return
			end
			local var25 = var2[var9]
			local var26 = dashModule.find(contentAgeRestriction.options, function(p7)
				-- upvalues: var25 (ref)
				local var27
				if p7 and p7.option then
					var27 = true
					
					if p7.option.optionValue ~= var25 then
						var27 = false
					end
					return var27
				end
			end)
			
			if not var26 then
				var14(var10.unplayableTitleText, var10.unplayableBodyText, var16, var10.unplayableButtonText, true)
				var22("RestrictedUnplayableOptionNotFound")
				
				return
			end
			local requirement = var26.requirement
			
			if requirement == "SelfUpdateSetting" then
				if var24 then
					var12("gameJoinContentMaturityLock", {
						title = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Title",
						message = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Body",
						buttonCancel = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.Cancel",
						buttonSettings = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.GoToSettings"
					}, var18, var18)
				else
					var14(var10.consoleSelfUpdateSettingTitleText, var10.consoleSelfUpdateSettingBodyText, var16, var10.consoleSelfUpdateSettingButtonText, true)
				end
			elseif requirement == "ParentalConsent" then
				if fFlagEnablePlayButtonWizardVPCPrologueModule then
					var21(var26.option.optionValue, var20(var10.askYourParentBodyText))
				else
					var13(var10.askYourParentTitleText, var10.askYourParentBodyText, var10.askYourParentActionButtonText, var10.askYourParentCancelButtonText, function()
						-- upvalues: var21 (copy), var26 (ref)
						var21(var26.option.optionValue)
					end, var19, var19)
				end
			elseif requirement == "ContentAgeRestrictionVerification" then
				var11(if fFlagLuaAppPlayButtonAmpAgeCheckFlow then fStringLuaAppPlayButtonAgeCheckAmpFeatureName else "ShouldNotPromptSeventeenPlusSettingVerifications", var17, nil, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then if p4 then `gameJoinContentMaturityLock-{p4}` else "gameJoinContentMaturityLock" else nil, nil, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then fStringLuaAppPlayButtonAgeCheckAmpNameSpace else nil, if fFlagLuaAppPlayButtonWizardCloseDelay then delayedAmpWizardCompletionCallbackOverrideModule(var17, fIntLuaAppPlayButtonWizardCloseDelayMs) else nil)
			else
				flaggedMutedError("ExperienceParentalControlsUnknownUpsellRequirement", `Unknown requirement {requirement} for ContentAgeRestriction option {var26} on play button click`)
				p3(p5)
			end
			var22(requirement or "GameLaunch")
		end, function()
			-- upvalues: p3 (copy), p5 (ref), var22 (copy)
			p3(p5)
			var22("GameLaunch")
		end)
	end, {
		var3, p2, p3, var9, var5, var12, var11, var14, var13, var21, var18, var19,
		var16, if fFlagLuaAppPlayButtonAmpAgeCheckFlow then var17 else nil, var22,
		var10.unplayableTitleText, var10.unplayableBodyText,
		var10.unplayableButtonText, var10.askYourParentTitleText,
		var10.askYourParentBodyText, var10.askYourParentActionButtonText,
		var10.askYourParentCancelButtonText, var10.consoleSelfUpdateSettingTitleText,
		var10.consoleSelfUpdateSettingBodyText,
		var10.consoleSelfUpdateSettingButtonText, var23, var24, p4,
		if fFlagEnablePlayButtonWizardVPCPrologueModule then var20 else nil
	}), if fFlagLuaAppParentApprovedExperiences then if fFlagLuaAppParentApprovedExperiences then reactModule.useCallback(function(p7)
		-- upvalues: fFlagLuaAppParentUpsellPolicy (copy), var23 (write), p3 (ref), var22 (ref), playabilityStatusEnum (copy), fFlagEnablePlayButtonWizardVPCPrologueModule (copy), var21 (ref), var20 (write), var10 (ref), var13 (ref), var19 (ref)
		if fFlagLuaAppParentUpsellPolicy and not var23 then
			p3(p7)
			var22("GameLaunch", playabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
			
			return
		elseif fFlagEnablePlayButtonWizardVPCPrologueModule then
			var21(nil, var20(var10.askYourParentToAllowGameBodyText))
		else
			var13(var10.askYourParentTitleText, var10.askYourParentToAllowGameBodyText, var10.askYourParentActionButtonText, var10.askYourParentCancelButtonText, var21, var19, var19)
		end
		var22("ParentApprovedExperience", playabilityStatusEnum.ContextualPlayabilityRequireParentApproval)
	end, {
		var13, var21, var19, var22, p3, var23, var10.askYourParentTitleText,
		var10.askYourParentToAllowGameBodyText, var10.askYourParentActionButtonText,
		var10.askYourParentCancelButtonText,
		if fFlagEnablePlayButtonWizardVPCPrologueModule then var20 else nil
	}) else nil else nil
end