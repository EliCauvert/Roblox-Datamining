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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAmpWizardEntryPointEventCtxFallback = sharedFlagsModule.FFlagAmpWizardEntryPointEventCtxFallback
local fFlagEnableAmpWizardDeepLink = sharedFlagsModule.FFlagEnableAmpWizardDeepLink
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

local function VPCPrologueController(p1)
	-- upvalues: reactModule (ref), accessResponseEnum (ref), cryoModule (ref), actionStatusEnum (ref), VPCPrologueModule (ref)
	local options = p1.options
	
	return reactModule.createElement(VPCPrologueModule, {
		recourseData = p1.recourseData,
		onConfirm = reactModule.useCallback(function()
			-- upvalues: p1 (ref), options (ref)
			local actionProps = p1.request.actionProps
			p1.onDone()
			
			if options and options.onConfirm then
				options.onConfirm()
			end
			if p1.request.openUpsellFn then
				p1.request.openUpsellFn(actionProps)
			end
		end, { p1.request, p1.onDone, options }),
		onCancel = reactModule.useCallback(function()
			-- upvalues: p1 (ref), options (ref), accessResponseEnum (copy), cryoModule (copy), actionStatusEnum (copy)
			p1.onDone()
			
			if options and options.onCancel then
				options.onCancel()
			end
			p1.handleCompletion(accessResponseEnum.Denied, cryoModule.Dictionary.join(p1.actionsTaken, { [p1.request.action] = actionStatusEnum.Cancelled }))
		end, {
			p1.handleCompletion,
			p1.actionsTaken,
			p1.onDone,
			p1.request,
			options
		}),
		config = if options then options.config else nil
	})
end

local function getSuccessfulActions(p1)
	-- upvalues: actionStatusEnum (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		if v == actionStatusEnum.Success then
			table.insert(t, i)
		end
	end
	return t
end

local function _(p2, p3, p4)
	-- upvalues: actionTypeEnum (ref)
	local action = p4.action
	
	if p2 == nil or action ~= actionTypeEnum.ParentConsent and action ~= actionTypeEnum.ParentLink then
		return false
	end
	local parentConsentTypes = p4.parentConsentTypes
	local var1 = if parentConsentTypes then parentConsentTypes[1] else nil
	
	return var1 == nil or (if p3 ~= nil then table.find(p3, var1) == nil else true)
end

return function(p2)
	-- upvalues: useNavigation (ref), fFlagAmpWizardEntryPointEventCtxFallback (ref), ampApiProviderModule (ref), analyticsServiceModule (ref), useRoactService (ref), roactNetworking (ref), reactModule (ref), useApolloClient (ref), useCompletionCallbackWithReturnPageModule (ref), fFlagEnableAmpWizardDeepLink (ref), actionTypeEnum (ref), appScreensModule (ref), cryoModule (ref), actionStatusEnum (ref), accessResponseEnum (ref), getFFlagEnableAmpEmailUpsellSupportModule (ref), getFFlagEnableAmpIDVUpsellSupportModule (ref), getFFlagEnableAmpIDVUpsellPopOnCompletionModule (ref), getFFlagEnableAmpWizardVPCNavigationFixModule (ref), logEventOnceIfEnabled (ref), getFFlagEnableAmpSubscriptionUpsellModule (ref), userSettingsSettingNameEnum (ref), getFFlagEnableAmpVPCPrologueModule (ref), getFFlagEnableAmpWizardInlineVPCForFAEModule (ref), accountSettingsUpsellStringsFn (ref), getFFlagEnableAmpUpsellGqlModule (ref), getSuccessfulActions (ref), sendModalActionEventModule (ref), VPCRequestTypeEnum (ref), VPCApiProviderModule (ref), VPCPrologueController (ref), errorScreenModule (ref), loading (ref), iconSize (ref)
	local var1 = useNavigation()
	local featureName = p2.featureName
	local nameSpace = p2.nameSpace
	local recourseData = p2.recourseData
	local extraParameters = p2.extraParameters
	local var2 = if fFlagAmpWizardEntryPointEventCtxFallback and (p2.entryPointEventCtx == nil or p2.entryPointEventCtx == "") then "defaultLuaContext" else p2.entryPointEventCtx
	local openUpsells = p2.openUpsells
	local vpcV2Launcher = p2.vpcV2Launcher
	local vpcExcludedRequestTypes = p2.vpcExcludedRequestTypes
	local completionCallback = p2.completionCallback
	local metadata = p2.metadata
	local var3 = if p2.ampApiProvider then p2.ampApiProvider else ampApiProviderModule
	local var4 = if p2.analyticsService then p2.analyticsService else analyticsServiceModule.EventStream
	local var5 = if p2.openAccountSettingsUpsell then p2.openAccountSettingsUpsell else var1.push
	local var6 = if p2.isInExperienceEntry then p2.isInExperienceEntry else false
	local var7 = useRoactService(roactNetworking)
	local var8, var9 = reactModule.useState({})
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(nil)
	local var16 = useApolloClient()
	local var17 = if fFlagEnableAmpWizardDeepLink then useCompletionCallbackWithReturnPageModule(var1, completionCallback, metadata) else completionCallback
	local var18 = reactModule.useCallback(function(p3)
		-- upvalues: vpcV2Launcher (ref), vpcExcludedRequestTypes (ref), actionTypeEnum (copy), var1 (ref)
		local var19
		local action = p3.action
		
		if vpcV2Launcher == nil or action ~= actionTypeEnum.ParentConsent and action ~= actionTypeEnum.ParentLink then
			var19 = false
		else
			local parentConsentTypes = p3.parentConsentTypes
			local var20 = if parentConsentTypes then parentConsentTypes[1] else nil
			var19 = var20 == nil or (if vpcExcludedRequestTypes ~= nil then table.find(vpcExcludedRequestTypes, var20) == nil else true)
		end
		if not var19 then
			var1.pop()
		end
	end, { var1.pop, vpcV2Launcher, vpcExcludedRequestTypes })
	local var19 = reactModule.useCallback(function(_, p3)
		-- upvalues: actionTypeEnum (copy), appScreensModule (copy), var9 (ref), cryoModule (copy), var8 (ref), actionStatusEnum (copy), var17 (ref), accessResponseEnum (copy), getFFlagEnableAmpEmailUpsellSupportModule (copy), getFFlagEnableAmpIDVUpsellSupportModule (copy), featureName (ref), var2 (ref), metadata (ref), getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var1 (ref), recourseData (ref), var6 (ref), getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var18 (ref), p2 (ref), logEventOnceIfEnabled (copy), getFFlagEnableAmpSubscriptionUpsellModule (copy)
		local action = p3.action
		
		if action == actionTypeEnum.Phone then
			return {
				eventContext = "AmpUpsell",
				origin = appScreensModule.AmpWizardContainer,
				onSuccess = function()
					-- upvalues: var9 (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var9(cryoModule.Dictionary.join(var8, { [actionTypeEnum.Phone] = actionStatusEnum.Success }))
				end,
				onFailure = function()
					-- upvalues: var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, { [actionTypeEnum.Phone] = actionStatusEnum.Failure }))
				end,
				onCancelled = function()
					-- upvalues: var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, { [actionTypeEnum.Phone] = actionStatusEnum.Cancelled }))
				end
			}
		elseif getFFlagEnableAmpEmailUpsellSupportModule() and action == actionTypeEnum.AddedEmail then
			return {
				eventContext = "AmpUpsell",
				closeOnEmailUpdate = true,
				addEmailOver13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText",
				addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText",
				addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail",
				successCallback = function(_)
					-- upvalues: var9 (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var9(cryoModule.Dictionary.join(var8, { [actionTypeEnum.Email] = actionStatusEnum.Success }))
				end,
				failureCallback = function()
					-- upvalues: var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, { [actionTypeEnum.Phone] = actionStatusEnum.Failure }))
				end,
				closeCentralOverlay = function() end
			}
		elseif getFFlagEnableAmpIDVUpsellSupportModule() and action == actionTypeEnum.GovernmentId then
			return {
				featureName = featureName,
				entryPointEventCtx = var2,
				metadata = metadata,
				onSuccess = function()
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var1 (copy), var9 (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var1.pop()
					end
					var9(cryoModule.Dictionary.join(var8, { [actionTypeEnum.GovernmentId] = actionStatusEnum.Success }))
				end,
				onFailure = function()
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var1 (copy), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var1.pop()
					end
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, { [actionTypeEnum.GovernmentId] = actionStatusEnum.Failure }))
				end,
				onCancelled = function()
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var1 (copy), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var1.pop()
					end
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, {
						[actionTypeEnum.GovernmentId] = actionStatusEnum.Cancelled
					}))
				end
			}
		elseif action == actionTypeEnum.ParentConsent or action == actionTypeEnum.ParentLink then
			return {
				recourseAction = p3.action,
				parentConsentTypes = p3.parentConsentTypes,
				recourseData = recourseData,
				entryPointEventCtx = var2,
				isInExperienceEntry = var6,
				onCancel = function()
					-- upvalues: getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var18 (copy), p3 (ref), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), action (ref), actionStatusEnum (copy)
					if getFFlagEnableAmpWizardVPCNavigationFixModule() then
						var18(p3)
					end
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, { [action] = actionStatusEnum.Cancelled }))
				end,
				onSuccess = function()
					-- upvalues: getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var18 (copy), p3 (ref), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), action (ref), actionStatusEnum (copy)
					if getFFlagEnableAmpWizardVPCNavigationFixModule() then
						var18(p3)
					end
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, { [action] = actionStatusEnum.Success }))
				end,
				onRetryAmp = function()
					-- upvalues: var18 (copy), p3 (ref), var9 (copy), cryoModule (copy), var8 (copy), action (ref), actionStatusEnum (copy)
					var18(p3)
					var9(cryoModule.Dictionary.join(var8, { [action] = actionStatusEnum.RetryRequested }))
				end
			}
		elseif action == actionTypeEnum.AgeEstimation then
			return {
				featureName = featureName,
				entryPointEventCtx = var2,
				metadata = metadata,
				skipFacialAgeEstimationWebLinkModal = p2.skipFacialAgeEstimationWebLinkModal,
				onSuccess = function()
					-- upvalues: logEventOnceIfEnabled (copy), var1 (copy), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_success")
					var1.pop()
					var17(accessResponseEnum.Granted, cryoModule.Dictionary.join(var8, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Success
					}))
				end,
				onFailure = function()
					-- upvalues: logEventOnceIfEnabled (copy), var1 (copy), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_error")
					var1.pop()
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Failure
					}))
				end,
				onCancel = function()
					-- upvalues: logEventOnceIfEnabled (copy), var1 (copy), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_cancel")
					var1.pop()
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Cancelled
					}))
				end,
				onRetry = function()
					-- upvalues: var1 (copy), var9 (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var1.pop()
					var9(cryoModule.Dictionary.join(var8, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.RetryRequested
					}))
				end
			}
		elseif getFFlagEnableAmpSubscriptionUpsellModule() and action == actionTypeEnum.Subscription then
			local var20 = recourseData
			
			return {
				purchaseUIOptions = var20 and var20.purchaseUIOptions,
				surfaceName = var20 and var20.surfaceName,
				surfaceContext = var20 and var20.surfaceContext,
				analyticsContext = var20 and var20.analyticsContext,
				onSuccess = function()
					-- upvalues: var1 (copy), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var1.pop()
					var17(accessResponseEnum.Granted, cryoModule.Dictionary.join(var8, { [actionTypeEnum.Subscription] = actionStatusEnum.Success }))
				end,
				onFailure = function()
					-- upvalues: var1 (copy), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var1.pop()
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, { [actionTypeEnum.Subscription] = actionStatusEnum.Failure }))
				end,
				onCancel = function()
					-- upvalues: var1 (copy), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var1.pop()
					var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, {
						[actionTypeEnum.Subscription] = actionStatusEnum.Cancelled
					}))
				end
			}
		end
		return {}
	end, { var8, var17, var18 })
	local var20 = reactModule.useCallback(function(p3)
		-- upvalues: vpcV2Launcher (ref), vpcExcludedRequestTypes (ref), actionTypeEnum (copy), userSettingsSettingNameEnum (copy), openUpsells (ref)
		local var21
		local var22 = vpcExcludedRequestTypes
		local action = p3.action
		
		if vpcV2Launcher == nil or action ~= actionTypeEnum.ParentConsent and action ~= actionTypeEnum.ParentLink then
			var21 = false
		else
			local parentConsentTypes = p3.parentConsentTypes
			local var23 = if parentConsentTypes then parentConsentTypes[1] else nil
			var21 = var23 == nil or (if var22 ~= nil then table.find(var22, var23) == nil else true)
		end
		if var21 then
			return vpcV2Launcher
		end
		local action_1 = p3.action
		
		if action_1 == actionTypeEnum.UserSettings then
			local userSettings = p3.userSettings
			
			return if userSettings and userSettings.settingName == userSettingsSettingNameEnum.AllowFacialAgeEstimation then nil else openUpsells[action_1]
		end
	end, { openUpsells, vpcV2Launcher, vpcExcludedRequestTypes })
	local var21 = reactModule.useCallback(function(_, p3)
		-- upvalues: var11 (ref), var20 (ref), var19 (ref), actionTypeEnum (copy), p2 (ref), getFFlagEnableAmpVPCPrologueModule (copy), vpcV2Launcher (ref), vpcExcludedRequestTypes (ref), var13 (ref), getFFlagEnableAmpWizardInlineVPCForFAEModule (copy), userSettingsSettingNameEnum (copy), var15 (ref), var17 (ref), accessResponseEnum (copy), var8 (ref), accountSettingsUpsellStringsFn (copy), var5 (ref), featureName (ref), var1 (ref), cryoModule (copy), actionStatusEnum (copy)
		if p3 == nil or #p3 == 0 then
			var11(true)
			
			return
		end
		local var22 = p3[1]
		local action = var22.action
		local var23 = var20(var22)
		
		if var23 == nil then
			if getFFlagEnableAmpWizardInlineVPCForFAEModule() and action == actionTypeEnum.UserSettings then
				local userSettings = var22.userSettings
				
				if userSettings and userSettings.settingName == userSettingsSettingNameEnum.AllowFacialAgeEstimation then
					var15(var22)
					
					return
				elseif action == actionTypeEnum.Subscription then
					var17(accessResponseEnum.Denied, var8)
					
					return
				end
				local var24 = accountSettingsUpsellStringsFn(var22)
				
				if var24 then
					var5({
						featureName = featureName,
						localizationStrings = var24,
						onCloseModal = function()
							-- upvalues: var1 (copy), var17 (copy), accessResponseEnum (copy), cryoModule (copy), var8 (copy), action (ref), actionStatusEnum (copy)
							var1.pop()
							var17(accessResponseEnum.Denied, cryoModule.Dictionary.join(var8, { [action] = actionStatusEnum.Cancelled }))
						end
					})
					
					return
				end
				var17(accessResponseEnum.Error, var8)
				
				return
			end
		else
			local var25 = var19(action, var22)
			
			if p2.usePrologue and (if action ~= actionTypeEnum.ParentConsent then action == actionTypeEnum.ParentLink else true) and getFFlagEnableAmpVPCPrologueModule() then
				local var26
				local var27 = vpcV2Launcher
				local var28 = vpcExcludedRequestTypes
				local action_1 = var22.action
				
				if var27 == nil or action_1 ~= actionTypeEnum.ParentConsent and action_1 ~= actionTypeEnum.ParentLink then
					var26 = false
				else
					local parentConsentTypes = var22.parentConsentTypes
					local var29 = if parentConsentTypes then parentConsentTypes[1] else nil
					var26 = var29 == nil or (if var28 ~= nil then table.find(var28, var29) == nil else true)
				end
				if var26 then
					var23(var25)
					
					return
				else
					var13({
						action = action,
						actionProps = var25,
						openUpsellFn = var23
					})
				end
			end
		end
	end, {
		var8, var17, featureName, var19, var1.pop, var5, var20, p2.usePrologue,
		vpcV2Launcher, vpcExcludedRequestTypes, var15
	})
	local var22 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var11 (ref), logEventOnceIfEnabled (copy), getFFlagEnableAmpUpsellGqlModule (copy), var3 (ref), var16 (ref), getSuccessfulActions (copy), var8 (ref), extraParameters (ref), accessResponseEnum (copy), var21 (ref), var17 (ref)
		var11(false)
		logEventOnceIfEnabled("amp_feature_access_init")
		local var23 = if getFFlagEnableAmpUpsellGqlModule() then var3.upsellFeatureAccessGql(var16, p3, getSuccessfulActions(var8), p4, extraParameters) else var3.upsellFeatureAccess(p3, getSuccessfulActions(var8), p4, extraParameters)
		
		if var23.access == accessResponseEnum.Error then
			var11(true)
			
			return
		elseif var23.access == accessResponseEnum.Actionable then
			logEventOnceIfEnabled("amp_feature_access_actionable")
			var21(var23.recourse, var23.recourses)
			
			return
		elseif var23.access == accessResponseEnum.Granted then
			logEventOnceIfEnabled("amp_feature_access_granted")
			var17(accessResponseEnum.Granted, var8)
			
			return
		elseif var23.access == accessResponseEnum.Denied then
			logEventOnceIfEnabled("amp_feature_access_denied")
			var17(accessResponseEnum.Denied, var8)
			
			return
		end
		var17(accessResponseEnum.Pending, var8)
	end, { var3, extraParameters, var17 })
	reactModule.useEffect(function()
		-- upvalues: sendModalActionEventModule (copy), var4 (ref), appScreensModule (copy), featureName (ref)
		sendModalActionEventModule(var4, appScreensModule.AmpWizardContainer, featureName, "Shown")
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), featureName (ref), nameSpace (ref)
		var22(featureName, nameSpace)
	end, { var8, featureName, var22, nameSpace })
	reactModule.useEffect(function()
		-- upvalues: getFFlagEnableAmpWizardInlineVPCForFAEModule (copy), var14 (ref), VPCRequestTypeEnum (copy), var19 (ref), cryoModule (copy), recourseData (ref), VPCApiProviderModule (copy), var7 (ref), actionTypeEnum (copy), var20 (ref), var11 (ref), var15 (ref), getFFlagEnableAmpVPCPrologueModule (copy), vpcV2Launcher (ref), vpcExcludedRequestTypes (ref), var13 (ref)
		if getFFlagEnableAmpWizardInlineVPCForFAEModule() and var14 ~= nil then
			local function _(p3)
				-- upvalues: VPCRequestTypeEnum (copy)
				return {
					action = p3,
					parentConsentTypes = { VPCRequestTypeEnum.UpdateUserSetting }
				}
			end
			
			local function buildFAEProps(p3)
				-- upvalues: var19 (copy), cryoModule (copy), recourseData (copy)
				return cryoModule.Dictionary.join(var19(p3.action, p3), {
					recourseData = cryoModule.Dictionary.join(recourseData or {}, { allowFacialAgeEstimation = "Enabled" })
				})
			end
			
			VPCApiProviderModule.getLinkedParentEmails(var7):andThen(function(p3)
				-- upvalues: actionTypeEnum (copy), VPCRequestTypeEnum (copy), buildFAEProps (ref), var20 (copy), var11 (copy), var15 (copy), getFFlagEnableAmpVPCPrologueModule (copy), vpcV2Launcher (copy), vpcExcludedRequestTypes (copy), var13 (copy)
				local var23 = if (if p3.parentEmails then #p3.parentEmails else 0) > 0 then actionTypeEnum.ParentConsent else actionTypeEnum.ParentLink
				local t = {
					action = var23,
					parentConsentTypes = { VPCRequestTypeEnum.UpdateUserSetting }
				}
				local var24 = buildFAEProps(t)
				local var25 = var20(t)
				
				if var25 == nil then
					var11(true)
					var15(nil)
					
					return
				elseif getFFlagEnableAmpVPCPrologueModule() then
					local var26
					local var27 = vpcV2Launcher
					local var28 = vpcExcludedRequestTypes
					local action = t.action
					
					if var27 == nil or action ~= actionTypeEnum.ParentConsent and action ~= actionTypeEnum.ParentLink then
						var26 = false
					else
						local parentConsentTypes = t.parentConsentTypes
						local var29 = if parentConsentTypes then parentConsentTypes[1] else nil
						var26 = var29 == nil or (if var28 ~= nil then table.find(var28, var29) == nil else true)
					end
					if var26 then
						var25(var24)
					else
						var13({
							action = var23,
							actionProps = var24,
							openUpsellFn = var25
						})
					end
					var15(nil)
				end
			end):catch(function(_)
				-- upvalues: actionTypeEnum (copy), VPCRequestTypeEnum (copy), buildFAEProps (ref), var20 (copy), var11 (copy), getFFlagEnableAmpVPCPrologueModule (copy), vpcV2Launcher (copy), vpcExcludedRequestTypes (copy), var13 (copy), var15 (copy)
				local t = {
					action = actionTypeEnum.ParentLink,
					parentConsentTypes = { VPCRequestTypeEnum.UpdateUserSetting }
				}
				local var23 = buildFAEProps(t)
				local var24 = var20(t)
				
				if var24 == nil then
					var11(true)
				elseif getFFlagEnableAmpVPCPrologueModule() then
					local var25
					local var26 = vpcV2Launcher
					local var27 = vpcExcludedRequestTypes
					local action = t.action
					
					if var26 == nil or action ~= actionTypeEnum.ParentConsent and action ~= actionTypeEnum.ParentLink then
						var25 = false
					else
						local parentConsentTypes = t.parentConsentTypes
						local var28 = if parentConsentTypes then parentConsentTypes[1] else nil
						var25 = var28 == nil or (if var27 ~= nil then table.find(var27, var28) == nil else true)
					end
					if var25 then
						var24(var23)
					else
						var13({
							action = actionTypeEnum.ParentLink,
							actionProps = var23,
							openUpsellFn = var24
						})
					end
				end
				var15(nil)
			end)
			
			return
		end
	end, {
		var14, var7, var19, openUpsells, recourseData, var20, vpcV2Launcher,
		vpcExcludedRequestTypes
	})
	
	return if getFFlagEnableAmpVPCPrologueModule() and var12 then reactModule.createElement(VPCPrologueController, {
		request = var12,
		recourseData = recourseData,
		handleCompletion = var17,
		actionsTaken = var8,
		options = p2.prologueOptions,
		onDone = function()
			-- upvalues: var13 (ref)
			var13(nil)
		end
	}) elseif var10 then reactModule.createElement(errorScreenModule, {
		featureName = featureName,
		onRetry = function()
			-- upvalues: var11 (ref), var22 (ref), featureName (ref)
			var11(false)
			var22(featureName)
		end,
		onCancel = function()
			-- upvalues: var17 (ref), accessResponseEnum (copy), var8 (ref)
			var17(accessResponseEnum.Denied, var8)
		end
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end