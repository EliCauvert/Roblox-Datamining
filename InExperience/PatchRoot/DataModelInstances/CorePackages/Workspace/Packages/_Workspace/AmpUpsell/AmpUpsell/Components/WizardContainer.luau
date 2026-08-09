local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local enumsModule = require(ampUpsell.Common.Enums)
local actionTypeEnum = enumsModule.ActionTypeEnum
local actionStatusEnum = enumsModule.ActionStatusEnum
local accessResponseEnum = enumsModule.AccessResponseEnum
local userSettingsSettingNameEnum = enumsModule.UserSettingsSettingNameEnum
local _ = require(ampUpsell.Common.Types)
local accountSettingsUpsellStringsFn = require(ampUpsell.Common.LocalizationStrings).accountSettingsUpsellStringsFn
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local cryoModule = require(parent.Cryo)
local analyticsServiceModule = require(ampUpsell.Analytics.AnalyticsService)
local sendModalActionEventModule = require(ampUpsell.Analytics.sendModalActionEvent)
local ampApiProviderModule = require(ampUpsell.Common.AmpApiProvider)
local appScreensModule = require(ampUpsell.Common.AppScreens)
local errorScreenModule = require(ampUpsell.Components.ErrorScreen)
local useCompletionCallbackWithReturnPageModule = require(ampUpsell.Common.useCompletionCallbackWithReturnPage)
local useApolloClient = require(parent.ApolloClient).useApolloClient
local fFlagEnableAmpWizardDeepLink = require(parent.SharedFlags).FFlagEnableAmpWizardDeepLink
local getFFlagEnableAmpUpsellGqlModule = require(ampUpsell.Flags.GetFFlagEnableAmpUpsellGql)
local getFFlagEnableAmpEmailUpsellSupportModule = require(ampUpsell.Flags.GetFFlagEnableAmpEmailUpsellSupport)
local getFFlagEnableAmpIDVUpsellSupportModule = require(ampUpsell.Flags.GetFFlagEnableAmpIDVUpsellSupport)
local getFFlagEnableAmpIDVUpsellPopOnCompletionModule = require(ampUpsell.Flags.GetFFlagEnableAmpIDVUpsellPopOnCompletion)
local getFFlagEnableAmpSubscriptionUpsellModule = require(ampUpsell.Flags.GetFFlagEnableAmpSubscriptionUpsell)
local getFFlagEnableAmpVPCPrologueModule = require(ampUpsell.Flags.GetFFlagEnableAmpVPCPrologue)
local getFFlagEnableAmpWizardInlineVPCForFAEModule = require(ampUpsell.Flags.GetFFlagEnableAmpWizardInlineVPCForFAE)
local getFFlagEnableAmpWizardVPCNavigationFixModule = require(ampUpsell.Flags.GetFFlagEnableAmpWizardVPCNavigationFix)
local VPCPrologueModule = require(ampUpsell.Components.Prologues.VPCPrologue)
local logEventOnceIfEnabled = require(ampUpsell.Common.LoggingUtils).logEventOnceIfEnabled
local VPCApiProviderModule = require(ampUpsell.Common.VPCApiProvider)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local VPCRequestTypeEnum = enumsModule.VPCRequestTypeEnum

local function VPCPrologueController(p0) --[[ line: 83 ]]
	-- upvalues: reactModule (ref), accessResponseEnum (ref), cryoModule (ref), actionStatusEnum (ref), VPCPrologueModule (ref)
	return reactModule.createElement(VPCPrologueModule, {
		recourseData = p0.recourseData,
		onConfirm = reactModule.useCallback(function() --[[ line: 84 ]]
			-- upvalues: p0 (ref)
			local actionProps = p0.request.actionProps
			p0.onDone()
			
			if p0.request.openUpsellFn then
				p0.request.openUpsellFn(actionProps)
			end
		end, { p0.request, p0.onDone }),
		onCancel = reactModule.useCallback(function() --[[ line: 92 ]]
			-- upvalues: p0 (ref), accessResponseEnum (copy), cryoModule (copy), actionStatusEnum (copy)
			p0.onDone()
			p0.handleCompletion(accessResponseEnum.Denied, cryoModule.Dictionary.join(p0.actionsTaken, { [p0.request.action] = actionStatusEnum.Cancelled }))
		end, {
			p0.handleCompletion,
			p0.actionsTaken,
			p0.onDone,
			p0.request
		})
	})
end

local function getSuccessfulActions(p1) --[[ line: 107 ]]
	-- upvalues: actionStatusEnum (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		if v == actionStatusEnum.Success then
			table.insert(t, i)
		end
	end
	return t
end

return function(p2) --[[ line: 117 | named "WizardContainer" ]]
	-- upvalues: useNavigation (ref), ampApiProviderModule (ref), analyticsServiceModule (ref), useRoactService (ref), roactNetworking (ref), reactModule (ref), useApolloClient (ref), useCompletionCallbackWithReturnPageModule (ref), fFlagEnableAmpWizardDeepLink (ref), actionTypeEnum (ref), appScreensModule (ref), cryoModule (ref), actionStatusEnum (ref), accessResponseEnum (ref), getFFlagEnableAmpEmailUpsellSupportModule (ref), getFFlagEnableAmpIDVUpsellSupportModule (ref), getFFlagEnableAmpIDVUpsellPopOnCompletionModule (ref), getFFlagEnableAmpWizardVPCNavigationFixModule (ref), logEventOnceIfEnabled (ref), getFFlagEnableAmpSubscriptionUpsellModule (ref), userSettingsSettingNameEnum (ref), getFFlagEnableAmpVPCPrologueModule (ref), getFFlagEnableAmpWizardInlineVPCForFAEModule (ref), accountSettingsUpsellStringsFn (ref), getFFlagEnableAmpUpsellGqlModule (ref), getSuccessfulActions (ref), sendModalActionEventModule (ref), VPCRequestTypeEnum (ref), VPCApiProviderModule (ref), VPCPrologueController (ref), errorScreenModule (ref), loading (ref), iconSize (ref)
	local var24 = useNavigation()
	local featureName = p2.featureName
	local nameSpace = p2.nameSpace
	local recourseData = p2.recourseData
	local extraParameters = p2.extraParameters
	local entryPointEventCtx = p2.entryPointEventCtx
	local openUpsells = p2.openUpsells
	local completionCallback = p2.completionCallback
	local metadata = p2.metadata
	local var25 = if p2.ampApiProvider then p2.ampApiProvider else ampApiProviderModule
	local var26 = if p2.analyticsService then p2.analyticsService else analyticsServiceModule.EventStream
	local var27 = if p2.openAccountSettingsUpsell then p2.openAccountSettingsUpsell else var24.push
	local var28 = if p2.isInExperienceEntry then p2.isInExperienceEntry else false
	local var29 = useRoactService(roactNetworking)
	local var30, var31 = reactModule.useState({})
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState(nil)
	local var36, var37 = reactModule.useState(nil)
	local var38 = useApolloClient()
	local var39 = if fFlagEnableAmpWizardDeepLink then useCompletionCallbackWithReturnPageModule(var24, completionCallback, metadata) else completionCallback
	local var40 = reactModule.useCallback(function(_, p3) --[[ line: 149 ]]
		-- upvalues: actionTypeEnum (copy), appScreensModule (copy), var31 (ref), cryoModule (copy), var30 (ref), actionStatusEnum (copy), var39 (ref), accessResponseEnum (copy), getFFlagEnableAmpEmailUpsellSupportModule (copy), getFFlagEnableAmpIDVUpsellSupportModule (copy), featureName (ref), getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var24 (ref), recourseData (ref), entryPointEventCtx (ref), var28 (ref), getFFlagEnableAmpWizardVPCNavigationFixModule (copy), metadata (ref), p2 (ref), logEventOnceIfEnabled (copy), getFFlagEnableAmpSubscriptionUpsellModule (copy)
		local action = p3.action
		
		if action == actionTypeEnum.Phone then
			return {
				eventContext = "AmpUpsell",
				origin = appScreensModule.AmpWizardContainer,
				onSuccess = function() --[[ line: 155 ]]
					-- upvalues: var31 (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var31(cryoModule.Dictionary.join(var30, { [actionTypeEnum.Phone] = actionStatusEnum.Success }))
				end,
				onFailure = function() --[[ line: 160 ]]
					-- upvalues: var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [actionTypeEnum.Phone] = actionStatusEnum.Failure }))
				end,
				onCancelled = function() --[[ line: 166 ]]
					-- upvalues: var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [actionTypeEnum.Phone] = actionStatusEnum.Cancelled }))
				end
			}
		elseif getFFlagEnableAmpEmailUpsellSupportModule() and action == actionTypeEnum.AddedEmail then
			return {
				eventContext = "AmpUpsell",
				closeOnEmailUpdate = true,
				addEmailOver13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText",
				addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText",
				addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail",
				successCallback = function(_) --[[ line: 180 ]]
					-- upvalues: var31 (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var31(cryoModule.Dictionary.join(var30, { [actionTypeEnum.Email] = actionStatusEnum.Success }))
				end,
				failureCallback = function() --[[ line: 185 ]]
					-- upvalues: var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [actionTypeEnum.Phone] = actionStatusEnum.Failure }))
				end,
				closeCentralOverlay = function() --[[ line: 191 ]] end
			}
		elseif getFFlagEnableAmpIDVUpsellSupportModule() and action == actionTypeEnum.GovernmentId then
			return {
				featureName = featureName,
				onSuccess = function() --[[ line: 196 ]]
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var24 (copy), var31 (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var24.pop()
					end
					var31(cryoModule.Dictionary.join(var30, { [actionTypeEnum.GovernmentId] = actionStatusEnum.Success }))
				end,
				onFailure = function() --[[ line: 207 ]]
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var24.pop()
					end
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [actionTypeEnum.GovernmentId] = actionStatusEnum.Failure }))
				end,
				onCancelled = function() --[[ line: 219 ]]
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var24.pop()
					end
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.GovernmentId] = actionStatusEnum.Cancelled
					}))
				end
			}
		elseif action == actionTypeEnum.ParentConsent or action == actionTypeEnum.ParentLink then
			return {
				recourseAction = p3.action,
				parentConsentTypes = p3.parentConsentTypes,
				recourseData = recourseData,
				entryPointEventCtx = entryPointEventCtx,
				isInExperienceEntry = var28,
				onCancel = function() --[[ line: 240 ]]
					-- upvalues: getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), action (ref), actionStatusEnum (copy)
					if getFFlagEnableAmpWizardVPCNavigationFixModule() then
						var24.pop()
					end
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [action] = actionStatusEnum.Cancelled }))
				end,
				onSuccess = function() --[[ line: 249 ]]
					-- upvalues: getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), action (ref), actionStatusEnum (copy)
					if getFFlagEnableAmpWizardVPCNavigationFixModule() then
						var24.pop()
					end
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [action] = actionStatusEnum.Success }))
				end,
				onRetryAmp = function() --[[ line: 258 ]]
					-- upvalues: var24 (copy), var31 (copy), cryoModule (copy), var30 (copy), action (ref), actionStatusEnum (copy)
					var24.pop()
					var31(cryoModule.Dictionary.join(var30, { [action] = actionStatusEnum.RetryRequested }))
				end
			}
		elseif action == actionTypeEnum.AgeEstimation then
			return {
				featureName = featureName,
				entryPointEventCtx = entryPointEventCtx,
				metadata = metadata,
				skipFacialAgeEstimationWebLinkModal = p2.skipFacialAgeEstimationWebLinkModal,
				onSuccess = function() --[[ line: 271 ]]
					-- upvalues: logEventOnceIfEnabled (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_success")
					var24.pop()
					var39(accessResponseEnum.Granted, cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Success
					}))
				end,
				onFailure = function() --[[ line: 282 ]]
					-- upvalues: logEventOnceIfEnabled (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_error")
					var24.pop()
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Failure
					}))
				end,
				onCancel = function() --[[ line: 293 ]]
					-- upvalues: logEventOnceIfEnabled (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_cancel")
					var24.pop()
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Cancelled
					}))
				end,
				onRetry = function() --[[ line: 304 ]]
					-- upvalues: var24 (copy), var31 (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var24.pop()
					var31(cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.RetryRequested
					}))
				end
			}
		elseif getFFlagEnableAmpSubscriptionUpsellModule() and action == actionTypeEnum.Subscription then
			local var44 = recourseData
			
			return {
				purchaseUIOptions = var44 and var44.purchaseUIOptions,
				surfaceName = var44 and var44.surfaceName,
				surfaceContext = var44 and var44.surfaceContext,
				analyticsContext = var44 and var44.analyticsContext,
				onSuccess = function() --[[ line: 321 ]]
					-- upvalues: var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var24.pop()
					var39(accessResponseEnum.Granted, cryoModule.Dictionary.join(var30, { [actionTypeEnum.Subscription] = actionStatusEnum.Success }))
				end,
				onFailure = function() --[[ line: 331 ]]
					-- upvalues: var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var24.pop()
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [actionTypeEnum.Subscription] = actionStatusEnum.Failure }))
				end,
				onCancel = function() --[[ line: 341 ]]
					-- upvalues: var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var24.pop()
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.Subscription] = actionStatusEnum.Cancelled
					}))
				end
			}
		end
		return {}
	end, { var30, var39 })
	local var41 = reactModule.useCallback(function(p4) --[[ line: 362 ]]
		-- upvalues: actionTypeEnum (copy), userSettingsSettingNameEnum (copy), openUpsells (ref)
		local action = p4.action
		
		if action == actionTypeEnum.UserSettings then
			local userSettings = p4.userSettings
			
			return if userSettings and userSettings.settingName == userSettingsSettingNameEnum.AllowFacialAgeEstimation then nil else openUpsells[action]
		end
	end, { openUpsells })
	local var42 = reactModule.useCallback(function(_, p5) --[[ line: 376 ]]
		-- upvalues: var33 (ref), var41 (ref), var40 (ref), actionTypeEnum (copy), p2 (ref), getFFlagEnableAmpVPCPrologueModule (copy), var35 (ref), getFFlagEnableAmpWizardInlineVPCForFAEModule (copy), userSettingsSettingNameEnum (copy), var37 (ref), var39 (ref), accessResponseEnum (copy), var30 (ref), accountSettingsUpsellStringsFn (copy), var27 (ref), featureName (ref), var24 (ref), cryoModule (copy), actionStatusEnum (copy)
		if p5 == nil or #p5 == 0 then
			var33(true)
			
			return
		end
		local var45 = p5[1]
		local action = var45.action
		local var46 = var41(var45)
		
		if var46 == nil then
			if getFFlagEnableAmpWizardInlineVPCForFAEModule() and action == actionTypeEnum.UserSettings then
				local userSettings = var45.userSettings
				
				if userSettings and userSettings.settingName == userSettingsSettingNameEnum.AllowFacialAgeEstimation then
					var37(var45)
					
					return
				elseif action == actionTypeEnum.Subscription then
					var39(accessResponseEnum.Denied, var30)
					
					return
				end
				local var48 = accountSettingsUpsellStringsFn(var45)
				
				if var48 then
					var27({
						featureName = featureName,
						localizationStrings = var48,
						onCloseModal = function() --[[ line: 420 ]]
							-- upvalues: var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), action (ref), actionStatusEnum (copy)
							var24.pop()
							var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [action] = actionStatusEnum.Cancelled }))
						end
					})
					
					return
				end
				var39(accessResponseEnum.Error, var30)
				
				return
			end
		else
			local var47 = var40(action, var45)
			
			if p2.usePrologue and (if action ~= actionTypeEnum.ParentConsent then action == actionTypeEnum.ParentLink else true) and getFFlagEnableAmpVPCPrologueModule() then
				var35({
					action = action,
					actionProps = var47,
					openUpsellFn = var46
				})
				
				return
			end
			var46(var47)
		end
	end, {
		var30, var39, featureName, var40, var24.pop, var27, var41, p2.usePrologue,
		var37
	})
	local var43 = reactModule.useCallback(function(p6, p7) --[[ line: 440 ]]
		-- upvalues: var33 (ref), logEventOnceIfEnabled (copy), getFFlagEnableAmpUpsellGqlModule (copy), var25 (ref), var38 (ref), getSuccessfulActions (copy), var30 (ref), extraParameters (ref), accessResponseEnum (copy), var42 (ref), var39 (ref)
		var33(false)
		logEventOnceIfEnabled("amp_feature_access_init")
		local var49 = if getFFlagEnableAmpUpsellGqlModule() then var25.upsellFeatureAccessGql(var38, p6, getSuccessfulActions(var30), p7, extraParameters) else var25.upsellFeatureAccess(p6, getSuccessfulActions(var30), p7, extraParameters)
		
		if var49.access == accessResponseEnum.Error then
			var33(true)
			
			return
		elseif var49.access == accessResponseEnum.Actionable then
			logEventOnceIfEnabled("amp_feature_access_actionable")
			var42(var49.recourse, var49.recourses)
			
			return
		elseif var49.access == accessResponseEnum.Granted then
			logEventOnceIfEnabled("amp_feature_access_granted")
			var39(accessResponseEnum.Granted, var30)
			
			return
		elseif var49.access == accessResponseEnum.Denied then
			logEventOnceIfEnabled("amp_feature_access_denied")
			var39(accessResponseEnum.Denied, var30)
			
			return
		end
		var39(accessResponseEnum.Pending, var30)
	end, { var25, extraParameters, var39 })
	reactModule.useEffect(function() --[[ line: 473 ]]
		-- upvalues: sendModalActionEventModule (copy), var26 (ref), appScreensModule (copy), featureName (ref)
		sendModalActionEventModule(var26, appScreensModule.AmpWizardContainer, featureName, "Shown")
	end, { var26 })
	reactModule.useEffect(function() --[[ line: 477 ]]
		-- upvalues: var43 (ref), featureName (ref), nameSpace (ref)
		var43(featureName, nameSpace)
	end, { var30, featureName, var43, nameSpace })
	reactModule.useEffect(function() --[[ line: 483 ]]
		-- upvalues: getFFlagEnableAmpWizardInlineVPCForFAEModule (copy), var36 (ref), VPCRequestTypeEnum (copy), var40 (ref), cryoModule (copy), recourseData (ref), VPCApiProviderModule (copy), var29 (ref), actionTypeEnum (copy), openUpsells (ref), getFFlagEnableAmpVPCPrologueModule (copy), var35 (ref), var37 (ref)
		if getFFlagEnableAmpWizardInlineVPCForFAEModule() and var36 ~= nil then
			local function buildFAEProps(p8) --[[ line: 490 ]]
				-- upvalues: VPCRequestTypeEnum (copy), var40 (copy), cryoModule (copy), recourseData (copy)
				return cryoModule.Dictionary.join(var40(p8, {
					action = p8,
					parentConsentTypes = { VPCRequestTypeEnum.UpdateUserSetting }
				}), {
					recourseData = cryoModule.Dictionary.join(recourseData or {}, { allowFacialAgeEstimation = "Enabled" })
				})
			end
			
			VPCApiProviderModule.getLinkedParentEmails(var29):andThen(function(p9) --[[ line: 501 ]]
				-- upvalues: actionTypeEnum (copy), buildFAEProps (ref), openUpsells (copy), getFFlagEnableAmpVPCPrologueModule (copy), var35 (copy), var37 (copy)
				local var51 = if (if p9.parentEmails then #p9.parentEmails else 0) > 0 then actionTypeEnum.ParentConsent else actionTypeEnum.ParentLink
				local var52 = buildFAEProps(var51)
				local var53 = openUpsells[var51]
				
				if getFFlagEnableAmpVPCPrologueModule() then
					var35({
						action = var51,
						actionProps = var52,
						openUpsellFn = var53
					})
				else
					var53(var52)
				end
				var37(nil)
			end):catch(function(_) --[[ line: 520 ]]
				-- upvalues: buildFAEProps (ref), actionTypeEnum (copy), openUpsells (copy), var37 (copy)
				openUpsells[actionTypeEnum.ParentLink](buildFAEProps(actionTypeEnum.ParentLink))
				var37(nil)
			end)
			
			return
		end
	end, {
		var36,
		var29,
		var40,
		openUpsells,
		recourseData
	})
	
	return if getFFlagEnableAmpVPCPrologueModule() and var34 then reactModule.createElement(VPCPrologueController, {
		request = var34,
		recourseData = recourseData,
		handleCompletion = var39,
		actionsTaken = var30,
		onDone = function() --[[ line: 534 ]]
			-- upvalues: var35 (ref)
			var35(nil)
		end
	}) elseif var32 then reactModule.createElement(errorScreenModule, {
		featureName = featureName,
		onRetry = function() --[[ line: 543 ]]
			-- upvalues: var33 (ref), var43 (ref), featureName (ref)
			var33(false)
			var43(featureName)
		end,
		onCancel = function() --[[ line: 547 ]]
			-- upvalues: var39 (ref), accessResponseEnum (copy), var30 (ref)
			var39(accessResponseEnum.Denied, var30)
		end
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end