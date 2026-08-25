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

local function VPCPrologueController(p0)
	-- upvalues: reactModule (ref), accessResponseEnum (ref), cryoModule (ref), actionStatusEnum (ref), VPCPrologueModule (ref)
	local options = p0.options
	
	return reactModule.createElement(VPCPrologueModule, {
		recourseData = p0.recourseData,
		onConfirm = reactModule.useCallback(function()
			-- upvalues: p0 (ref), options (ref)
			local actionProps = p0.request.actionProps
			p0.onDone()
			
			if options and options.onConfirm then
				options.onConfirm()
			end
			if p0.request.openUpsellFn then
				p0.request.openUpsellFn(actionProps)
			end
		end, { p0.request, p0.onDone, options }),
		onCancel = reactModule.useCallback(function()
			-- upvalues: p0 (ref), options (ref), accessResponseEnum (copy), cryoModule (copy), actionStatusEnum (copy)
			p0.onDone()
			
			if options and options.onCancel then
				options.onCancel()
			end
			p0.handleCompletion(accessResponseEnum.Denied, cryoModule.Dictionary.join(p0.actionsTaken, { [p0.request.action] = actionStatusEnum.Cancelled }))
		end, {
			p0.handleCompletion,
			p0.actionsTaken,
			p0.onDone,
			p0.request,
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

return function(p2)
	-- upvalues: useNavigation (ref), ampApiProviderModule (ref), analyticsServiceModule (ref), useRoactService (ref), roactNetworking (ref), reactModule (ref), useApolloClient (ref), useCompletionCallbackWithReturnPageModule (ref), fFlagEnableAmpWizardDeepLink (ref), actionTypeEnum (ref), appScreensModule (ref), cryoModule (ref), actionStatusEnum (ref), accessResponseEnum (ref), getFFlagEnableAmpEmailUpsellSupportModule (ref), getFFlagEnableAmpIDVUpsellSupportModule (ref), getFFlagEnableAmpIDVUpsellPopOnCompletionModule (ref), getFFlagEnableAmpWizardVPCNavigationFixModule (ref), logEventOnceIfEnabled (ref), getFFlagEnableAmpSubscriptionUpsellModule (ref), userSettingsSettingNameEnum (ref), getFFlagEnableAmpVPCPrologueModule (ref), getFFlagEnableAmpWizardInlineVPCForFAEModule (ref), accountSettingsUpsellStringsFn (ref), getFFlagEnableAmpUpsellGqlModule (ref), getSuccessfulActions (ref), sendModalActionEventModule (ref), VPCRequestTypeEnum (ref), VPCApiProviderModule (ref), VPCPrologueController (ref), errorScreenModule (ref), loading (ref), iconSize (ref)
	local var24 = useNavigation()
	local featureName = p2.featureName
	local nameSpace = p2.nameSpace
	local recourseData = p2.recourseData
	local extraParameters = p2.extraParameters
	local entryPointEventCtx = p2.entryPointEventCtx
	local openUpsells = p2.openUpsells
	local selfContainedUpsells = p2.selfContainedUpsells
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
	
	local function _(p3)
		-- upvalues: selfContainedUpsells (ref)
		return selfContainedUpsells ~= nil and selfContainedUpsells[p3] == true
	end
	
	local var40 = reactModule.useCallback(function(p4)
		-- upvalues: selfContainedUpsells (ref), var24 (ref)
		if not (selfContainedUpsells ~= nil and selfContainedUpsells[p4] == true) then
			var24.pop()
		end
	end, { var24.pop, selfContainedUpsells })
	local var41 = reactModule.useCallback(function(_, p5)
		-- upvalues: actionTypeEnum (copy), appScreensModule (copy), var31 (ref), cryoModule (copy), var30 (ref), actionStatusEnum (copy), var39 (ref), accessResponseEnum (copy), getFFlagEnableAmpEmailUpsellSupportModule (copy), getFFlagEnableAmpIDVUpsellSupportModule (copy), featureName (ref), entryPointEventCtx (ref), metadata (ref), getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var24 (ref), recourseData (ref), var28 (ref), getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var40 (ref), p2 (ref), logEventOnceIfEnabled (copy), getFFlagEnableAmpSubscriptionUpsellModule (copy)
		local action = p5.action
		
		if action == actionTypeEnum.Phone then
			return {
				eventContext = "AmpUpsell",
				origin = appScreensModule.AmpWizardContainer,
				onSuccess = function()
					-- upvalues: var31 (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var31(cryoModule.Dictionary.join(var30, { [actionTypeEnum.Phone] = actionStatusEnum.Success }))
				end,
				onFailure = function()
					-- upvalues: var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [actionTypeEnum.Phone] = actionStatusEnum.Failure }))
				end,
				onCancelled = function()
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
				successCallback = function(_)
					-- upvalues: var31 (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var31(cryoModule.Dictionary.join(var30, { [actionTypeEnum.Email] = actionStatusEnum.Success }))
				end,
				failureCallback = function()
					-- upvalues: var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [actionTypeEnum.Phone] = actionStatusEnum.Failure }))
				end,
				closeCentralOverlay = function() end
			}
		elseif getFFlagEnableAmpIDVUpsellSupportModule() and action == actionTypeEnum.GovernmentId then
			return {
				featureName = featureName,
				entryPointEventCtx = entryPointEventCtx,
				metadata = metadata,
				onSuccess = function()
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var24 (copy), var31 (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var24.pop()
					end
					var31(cryoModule.Dictionary.join(var30, { [actionTypeEnum.GovernmentId] = actionStatusEnum.Success }))
				end,
				onFailure = function()
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var24.pop()
					end
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [actionTypeEnum.GovernmentId] = actionStatusEnum.Failure }))
				end,
				onCancelled = function()
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
				recourseAction = p5.action,
				parentConsentTypes = p5.parentConsentTypes,
				recourseData = recourseData,
				entryPointEventCtx = entryPointEventCtx,
				isInExperienceEntry = var28,
				onCancel = function()
					-- upvalues: getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var40 (copy), action (ref), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpWizardVPCNavigationFixModule() then
						var40(action)
					end
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [action] = actionStatusEnum.Cancelled }))
				end,
				onSuccess = function()
					-- upvalues: getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var40 (copy), action (ref), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpWizardVPCNavigationFixModule() then
						var40(action)
					end
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [action] = actionStatusEnum.Success }))
				end,
				onRetryAmp = function()
					-- upvalues: var40 (copy), action (ref), var31 (copy), cryoModule (copy), var30 (copy), actionStatusEnum (copy)
					var40(action)
					var31(cryoModule.Dictionary.join(var30, { [action] = actionStatusEnum.RetryRequested }))
				end
			}
		elseif action == actionTypeEnum.AgeEstimation then
			return {
				featureName = featureName,
				entryPointEventCtx = entryPointEventCtx,
				metadata = metadata,
				skipFacialAgeEstimationWebLinkModal = p2.skipFacialAgeEstimationWebLinkModal,
				onSuccess = function()
					-- upvalues: logEventOnceIfEnabled (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_success")
					var24.pop()
					var39(accessResponseEnum.Granted, cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Success
					}))
				end,
				onFailure = function()
					-- upvalues: logEventOnceIfEnabled (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_error")
					var24.pop()
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Failure
					}))
				end,
				onCancel = function()
					-- upvalues: logEventOnceIfEnabled (copy), var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_cancel")
					var24.pop()
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Cancelled
					}))
				end,
				onRetry = function()
					-- upvalues: var24 (copy), var31 (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var24.pop()
					var31(cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.RetryRequested
					}))
				end
			}
		elseif getFFlagEnableAmpSubscriptionUpsellModule() and action == actionTypeEnum.Subscription then
			local var45 = recourseData
			
			return {
				purchaseUIOptions = var45 and var45.purchaseUIOptions,
				surfaceName = var45 and var45.surfaceName,
				surfaceContext = var45 and var45.surfaceContext,
				analyticsContext = var45 and var45.analyticsContext,
				onSuccess = function()
					-- upvalues: var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var24.pop()
					var39(accessResponseEnum.Granted, cryoModule.Dictionary.join(var30, { [actionTypeEnum.Subscription] = actionStatusEnum.Success }))
				end,
				onFailure = function()
					-- upvalues: var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var24.pop()
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, { [actionTypeEnum.Subscription] = actionStatusEnum.Failure }))
				end,
				onCancel = function()
					-- upvalues: var24 (copy), var39 (copy), accessResponseEnum (copy), cryoModule (copy), var30 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var24.pop()
					var39(accessResponseEnum.Denied, cryoModule.Dictionary.join(var30, {
						[actionTypeEnum.Subscription] = actionStatusEnum.Cancelled
					}))
				end
			}
		end
		return {}
	end, { var30, var39, var40 })
	local var42 = reactModule.useCallback(function(p6)
		-- upvalues: actionTypeEnum (copy), userSettingsSettingNameEnum (copy), openUpsells (ref)
		local action = p6.action
		
		if action == actionTypeEnum.UserSettings then
			local userSettings = p6.userSettings
			
			return if userSettings and userSettings.settingName == userSettingsSettingNameEnum.AllowFacialAgeEstimation then nil else openUpsells[action]
		end
	end, { openUpsells })
	local var43 = reactModule.useCallback(function(_, p7)
		-- upvalues: var33 (ref), var42 (ref), var41 (ref), actionTypeEnum (copy), p2 (ref), getFFlagEnableAmpVPCPrologueModule (copy), selfContainedUpsells (ref), var35 (ref), getFFlagEnableAmpWizardInlineVPCForFAEModule (copy), userSettingsSettingNameEnum (copy), var37 (ref), var39 (ref), accessResponseEnum (copy), var30 (ref), accountSettingsUpsellStringsFn (copy), var27 (ref), featureName (ref), var24 (ref), cryoModule (copy), actionStatusEnum (copy)
		if p7 == nil or #p7 == 0 then
			var33(true)
			
			return
		end
		local var46 = p7[1]
		local action = var46.action
		local var47 = var42(var46)
		
		if var47 == nil then
			if getFFlagEnableAmpWizardInlineVPCForFAEModule() and action == actionTypeEnum.UserSettings then
				local userSettings = var46.userSettings
				
				if userSettings and userSettings.settingName == userSettingsSettingNameEnum.AllowFacialAgeEstimation then
					var37(var46)
					
					return
				elseif action == actionTypeEnum.Subscription then
					var39(accessResponseEnum.Denied, var30)
					
					return
				end
				local var49 = accountSettingsUpsellStringsFn(var46)
				
				if var49 then
					var27({
						featureName = featureName,
						localizationStrings = var49,
						onCloseModal = function()
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
			local var48 = var41(action, var46)
			
			if p2.usePrologue and (if action ~= actionTypeEnum.ParentConsent then action == actionTypeEnum.ParentLink else true) and getFFlagEnableAmpVPCPrologueModule() then
				if selfContainedUpsells ~= nil and selfContainedUpsells[action] == true then
					var47(var48)
					
					return
				else
					var35({
						action = action,
						actionProps = var48,
						openUpsellFn = var47
					})
				end
			end
		end
	end, {
		var30, var39, featureName, var41, var24.pop, var27, var42, p2.usePrologue,
		selfContainedUpsells, var37
	})
	local var44 = reactModule.useCallback(function(p8, p9)
		-- upvalues: var33 (ref), logEventOnceIfEnabled (copy), getFFlagEnableAmpUpsellGqlModule (copy), var25 (ref), var38 (ref), getSuccessfulActions (copy), var30 (ref), extraParameters (ref), accessResponseEnum (copy), var43 (ref), var39 (ref)
		var33(false)
		logEventOnceIfEnabled("amp_feature_access_init")
		local var50 = if getFFlagEnableAmpUpsellGqlModule() then var25.upsellFeatureAccessGql(var38, p8, getSuccessfulActions(var30), p9, extraParameters) else var25.upsellFeatureAccess(p8, getSuccessfulActions(var30), p9, extraParameters)
		
		if var50.access == accessResponseEnum.Error then
			var33(true)
			
			return
		elseif var50.access == accessResponseEnum.Actionable then
			logEventOnceIfEnabled("amp_feature_access_actionable")
			var43(var50.recourse, var50.recourses)
			
			return
		elseif var50.access == accessResponseEnum.Granted then
			logEventOnceIfEnabled("amp_feature_access_granted")
			var39(accessResponseEnum.Granted, var30)
			
			return
		elseif var50.access == accessResponseEnum.Denied then
			logEventOnceIfEnabled("amp_feature_access_denied")
			var39(accessResponseEnum.Denied, var30)
			
			return
		end
		var39(accessResponseEnum.Pending, var30)
	end, { var25, extraParameters, var39 })
	reactModule.useEffect(function()
		-- upvalues: sendModalActionEventModule (copy), var26 (ref), appScreensModule (copy), featureName (ref)
		sendModalActionEventModule(var26, appScreensModule.AmpWizardContainer, featureName, "Shown")
	end, { var26 })
	reactModule.useEffect(function()
		-- upvalues: var44 (ref), featureName (ref), nameSpace (ref)
		var44(featureName, nameSpace)
	end, { var30, featureName, var44, nameSpace })
	reactModule.useEffect(function()
		-- upvalues: getFFlagEnableAmpWizardInlineVPCForFAEModule (copy), var36 (ref), VPCRequestTypeEnum (copy), var41 (ref), cryoModule (copy), recourseData (ref), VPCApiProviderModule (copy), var29 (ref), actionTypeEnum (copy), openUpsells (ref), getFFlagEnableAmpVPCPrologueModule (copy), selfContainedUpsells (ref), var35 (ref), var37 (ref)
		if getFFlagEnableAmpWizardInlineVPCForFAEModule() and var36 ~= nil then
			local function buildFAEProps(p10)
				-- upvalues: VPCRequestTypeEnum (copy), var41 (copy), cryoModule (copy), recourseData (copy)
				return cryoModule.Dictionary.join(var41(p10, {
					action = p10,
					parentConsentTypes = { VPCRequestTypeEnum.UpdateUserSetting }
				}), {
					recourseData = cryoModule.Dictionary.join(recourseData or {}, { allowFacialAgeEstimation = "Enabled" })
				})
			end
			
			VPCApiProviderModule.getLinkedParentEmails(var29):andThen(function(p11)
				-- upvalues: actionTypeEnum (copy), buildFAEProps (ref), openUpsells (copy), getFFlagEnableAmpVPCPrologueModule (copy), selfContainedUpsells (copy), var35 (copy), var37 (copy)
				local var52 = if (if p11.parentEmails then #p11.parentEmails else 0) > 0 then actionTypeEnum.ParentConsent else actionTypeEnum.ParentLink
				local var53 = buildFAEProps(var52)
				local var54 = openUpsells[var52]
				
				if getFFlagEnableAmpVPCPrologueModule() then
					if selfContainedUpsells ~= nil and selfContainedUpsells[var52] == true then
						var54(var53)
					else
						var35({
							action = var52,
							actionProps = var53,
							openUpsellFn = var54
						})
					end
					var37(nil)
				end
			end):catch(function(_)
				-- upvalues: buildFAEProps (ref), actionTypeEnum (copy), openUpsells (copy), var37 (copy)
				openUpsells[actionTypeEnum.ParentLink](buildFAEProps(actionTypeEnum.ParentLink))
				var37(nil)
			end)
			
			return
		end
	end, {
		var36, var29, var41, openUpsells, recourseData, selfContainedUpsells
	})
	
	return if getFFlagEnableAmpVPCPrologueModule() and var34 then reactModule.createElement(VPCPrologueController, {
		request = var34,
		recourseData = recourseData,
		handleCompletion = var39,
		actionsTaken = var30,
		options = p2.prologueOptions,
		onDone = function()
			-- upvalues: var35 (ref)
			var35(nil)
		end
	}) elseif var32 then reactModule.createElement(errorScreenModule, {
		featureName = featureName,
		onRetry = function()
			-- upvalues: var33 (ref), var44 (ref), featureName (ref)
			var33(false)
			var44(featureName)
		end,
		onCancel = function()
			-- upvalues: var39 (ref), accessResponseEnum (copy), var30 (ref)
			var39(accessResponseEnum.Denied, var30)
		end
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end