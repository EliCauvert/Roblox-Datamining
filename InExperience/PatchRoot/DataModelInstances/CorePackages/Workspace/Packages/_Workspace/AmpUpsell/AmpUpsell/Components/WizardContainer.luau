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

return function(p2)
	-- upvalues: useNavigation (ref), ampApiProviderModule (ref), analyticsServiceModule (ref), useRoactService (ref), roactNetworking (ref), reactModule (ref), useApolloClient (ref), useCompletionCallbackWithReturnPageModule (ref), fFlagEnableAmpWizardDeepLink (ref), actionTypeEnum (ref), appScreensModule (ref), cryoModule (ref), actionStatusEnum (ref), accessResponseEnum (ref), getFFlagEnableAmpEmailUpsellSupportModule (ref), getFFlagEnableAmpIDVUpsellSupportModule (ref), getFFlagEnableAmpIDVUpsellPopOnCompletionModule (ref), getFFlagEnableAmpWizardVPCNavigationFixModule (ref), logEventOnceIfEnabled (ref), getFFlagEnableAmpSubscriptionUpsellModule (ref), userSettingsSettingNameEnum (ref), getFFlagEnableAmpVPCPrologueModule (ref), getFFlagEnableAmpWizardInlineVPCForFAEModule (ref), accountSettingsUpsellStringsFn (ref), getFFlagEnableAmpUpsellGqlModule (ref), getSuccessfulActions (ref), sendModalActionEventModule (ref), VPCRequestTypeEnum (ref), VPCApiProviderModule (ref), VPCPrologueController (ref), errorScreenModule (ref), loading (ref), iconSize (ref)
	local var1 = useNavigation()
	local featureName = p2.featureName
	local nameSpace = p2.nameSpace
	local recourseData = p2.recourseData
	local extraParameters = p2.extraParameters
	local entryPointEventCtx = p2.entryPointEventCtx
	local openUpsells = p2.openUpsells
	local selfContainedUpsells = p2.selfContainedUpsells
	local completionCallback = p2.completionCallback
	local metadata = p2.metadata
	local var2 = if p2.ampApiProvider then p2.ampApiProvider else ampApiProviderModule
	local var3 = if p2.analyticsService then p2.analyticsService else analyticsServiceModule.EventStream
	local var4 = if p2.openAccountSettingsUpsell then p2.openAccountSettingsUpsell else var1.push
	local var5 = if p2.isInExperienceEntry then p2.isInExperienceEntry else false
	local var6 = useRoactService(roactNetworking)
	local var7, var8 = reactModule.useState({})
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(nil)
	local var13, var14 = reactModule.useState(nil)
	local var15 = useApolloClient()
	local var16 = if fFlagEnableAmpWizardDeepLink then useCompletionCallbackWithReturnPageModule(var1, completionCallback, metadata) else completionCallback
	
	local function _(p3)
		-- upvalues: selfContainedUpsells (ref)
		return selfContainedUpsells ~= nil and selfContainedUpsells[p3] == true
	end
	
	local var17 = reactModule.useCallback(function(p3)
		-- upvalues: selfContainedUpsells (ref), var1 (ref)
		if not (selfContainedUpsells ~= nil and selfContainedUpsells[p3] == true) then
			var1.pop()
		end
	end, { var1.pop, selfContainedUpsells })
	local var18 = reactModule.useCallback(function(_, p3)
		-- upvalues: actionTypeEnum (copy), appScreensModule (copy), var8 (ref), cryoModule (copy), var7 (ref), actionStatusEnum (copy), var16 (ref), accessResponseEnum (copy), getFFlagEnableAmpEmailUpsellSupportModule (copy), getFFlagEnableAmpIDVUpsellSupportModule (copy), featureName (ref), entryPointEventCtx (ref), metadata (ref), getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var1 (ref), recourseData (ref), var5 (ref), getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var17 (ref), p2 (ref), logEventOnceIfEnabled (copy), getFFlagEnableAmpSubscriptionUpsellModule (copy)
		local action = p3.action
		
		if action == actionTypeEnum.Phone then
			return {
				eventContext = "AmpUpsell",
				origin = appScreensModule.AmpWizardContainer,
				onSuccess = function()
					-- upvalues: var8 (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var8(cryoModule.Dictionary.join(var7, { [actionTypeEnum.Phone] = actionStatusEnum.Success }))
				end,
				onFailure = function()
					-- upvalues: var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, { [actionTypeEnum.Phone] = actionStatusEnum.Failure }))
				end,
				onCancelled = function()
					-- upvalues: var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, { [actionTypeEnum.Phone] = actionStatusEnum.Cancelled }))
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
					-- upvalues: var8 (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var8(cryoModule.Dictionary.join(var7, { [actionTypeEnum.Email] = actionStatusEnum.Success }))
				end,
				failureCallback = function()
					-- upvalues: var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, { [actionTypeEnum.Phone] = actionStatusEnum.Failure }))
				end,
				closeCentralOverlay = function() end
			}
		elseif getFFlagEnableAmpIDVUpsellSupportModule() and action == actionTypeEnum.GovernmentId then
			return {
				featureName = featureName,
				entryPointEventCtx = entryPointEventCtx,
				metadata = metadata,
				onSuccess = function()
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var1 (copy), var8 (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var1.pop()
					end
					var8(cryoModule.Dictionary.join(var7, { [actionTypeEnum.GovernmentId] = actionStatusEnum.Success }))
				end,
				onFailure = function()
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var1 (copy), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var1.pop()
					end
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, { [actionTypeEnum.GovernmentId] = actionStatusEnum.Failure }))
				end,
				onCancelled = function()
					-- upvalues: getFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), var1 (copy), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
						var1.pop()
					end
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, {
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
				isInExperienceEntry = var5,
				onCancel = function()
					-- upvalues: getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var17 (copy), action (ref), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpWizardVPCNavigationFixModule() then
						var17(action)
					end
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, { [action] = actionStatusEnum.Cancelled }))
				end,
				onSuccess = function()
					-- upvalues: getFFlagEnableAmpWizardVPCNavigationFixModule (copy), var17 (copy), action (ref), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionStatusEnum (copy)
					if getFFlagEnableAmpWizardVPCNavigationFixModule() then
						var17(action)
					end
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, { [action] = actionStatusEnum.Success }))
				end,
				onRetryAmp = function()
					-- upvalues: var17 (copy), action (ref), var8 (copy), cryoModule (copy), var7 (copy), actionStatusEnum (copy)
					var17(action)
					var8(cryoModule.Dictionary.join(var7, { [action] = actionStatusEnum.RetryRequested }))
				end
			}
		elseif action == actionTypeEnum.AgeEstimation then
			return {
				featureName = featureName,
				entryPointEventCtx = entryPointEventCtx,
				metadata = metadata,
				skipFacialAgeEstimationWebLinkModal = p2.skipFacialAgeEstimationWebLinkModal,
				onSuccess = function()
					-- upvalues: logEventOnceIfEnabled (copy), var1 (copy), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_success")
					var1.pop()
					var16(accessResponseEnum.Granted, cryoModule.Dictionary.join(var7, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Success
					}))
				end,
				onFailure = function()
					-- upvalues: logEventOnceIfEnabled (copy), var1 (copy), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_error")
					var1.pop()
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Failure
					}))
				end,
				onCancel = function()
					-- upvalues: logEventOnceIfEnabled (copy), var1 (copy), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_cancel")
					var1.pop()
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.Cancelled
					}))
				end,
				onRetry = function()
					-- upvalues: var1 (copy), var8 (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var1.pop()
					var8(cryoModule.Dictionary.join(var7, {
						[actionTypeEnum.AgeEstimation] = actionStatusEnum.RetryRequested
					}))
				end
			}
		elseif getFFlagEnableAmpSubscriptionUpsellModule() and action == actionTypeEnum.Subscription then
			local var19 = recourseData
			
			return {
				purchaseUIOptions = var19 and var19.purchaseUIOptions,
				surfaceName = var19 and var19.surfaceName,
				surfaceContext = var19 and var19.surfaceContext,
				analyticsContext = var19 and var19.analyticsContext,
				onSuccess = function()
					-- upvalues: var1 (copy), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var1.pop()
					var16(accessResponseEnum.Granted, cryoModule.Dictionary.join(var7, { [actionTypeEnum.Subscription] = actionStatusEnum.Success }))
				end,
				onFailure = function()
					-- upvalues: var1 (copy), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var1.pop()
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, { [actionTypeEnum.Subscription] = actionStatusEnum.Failure }))
				end,
				onCancel = function()
					-- upvalues: var1 (copy), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), actionTypeEnum (copy), actionStatusEnum (copy)
					var1.pop()
					var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, {
						[actionTypeEnum.Subscription] = actionStatusEnum.Cancelled
					}))
				end
			}
		end
		return {}
	end, { var7, var16, var17 })
	local var19 = reactModule.useCallback(function(p3)
		-- upvalues: actionTypeEnum (copy), userSettingsSettingNameEnum (copy), openUpsells (ref)
		local action = p3.action
		
		if action == actionTypeEnum.UserSettings then
			local userSettings = p3.userSettings
			
			return if userSettings and userSettings.settingName == userSettingsSettingNameEnum.AllowFacialAgeEstimation then nil else openUpsells[action]
		end
	end, { openUpsells })
	local var20 = reactModule.useCallback(function(_, p3)
		-- upvalues: var10 (ref), var19 (ref), var18 (ref), actionTypeEnum (copy), p2 (ref), getFFlagEnableAmpVPCPrologueModule (copy), selfContainedUpsells (ref), var12 (ref), getFFlagEnableAmpWizardInlineVPCForFAEModule (copy), userSettingsSettingNameEnum (copy), var14 (ref), var16 (ref), accessResponseEnum (copy), var7 (ref), accountSettingsUpsellStringsFn (copy), var4 (ref), featureName (ref), var1 (ref), cryoModule (copy), actionStatusEnum (copy)
		if p3 == nil or #p3 == 0 then
			var10(true)
			
			return
		end
		local var21 = p3[1]
		local action = var21.action
		local var22 = var19(var21)
		
		if var22 == nil then
			if getFFlagEnableAmpWizardInlineVPCForFAEModule() and action == actionTypeEnum.UserSettings then
				local userSettings = var21.userSettings
				
				if userSettings and userSettings.settingName == userSettingsSettingNameEnum.AllowFacialAgeEstimation then
					var14(var21)
					
					return
				elseif action == actionTypeEnum.Subscription then
					var16(accessResponseEnum.Denied, var7)
					
					return
				end
				local var23 = accountSettingsUpsellStringsFn(var21)
				
				if var23 then
					var4({
						featureName = featureName,
						localizationStrings = var23,
						onCloseModal = function()
							-- upvalues: var1 (copy), var16 (copy), accessResponseEnum (copy), cryoModule (copy), var7 (copy), action (ref), actionStatusEnum (copy)
							var1.pop()
							var16(accessResponseEnum.Denied, cryoModule.Dictionary.join(var7, { [action] = actionStatusEnum.Cancelled }))
						end
					})
					
					return
				end
				var16(accessResponseEnum.Error, var7)
				
				return
			end
		else
			local var24 = var18(action, var21)
			
			if p2.usePrologue and (if action ~= actionTypeEnum.ParentConsent then action == actionTypeEnum.ParentLink else true) and getFFlagEnableAmpVPCPrologueModule() then
				if selfContainedUpsells ~= nil and selfContainedUpsells[action] == true then
					var22(var24)
					
					return
				else
					var12({
						action = action,
						actionProps = var24,
						openUpsellFn = var22
					})
				end
			end
		end
	end, {
		var7, var16, featureName, var18, var1.pop, var4, var19, p2.usePrologue,
		selfContainedUpsells, var14
	})
	local var21 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var10 (ref), logEventOnceIfEnabled (copy), getFFlagEnableAmpUpsellGqlModule (copy), var2 (ref), var15 (ref), getSuccessfulActions (copy), var7 (ref), extraParameters (ref), accessResponseEnum (copy), var20 (ref), var16 (ref)
		var10(false)
		logEventOnceIfEnabled("amp_feature_access_init")
		local var22 = if getFFlagEnableAmpUpsellGqlModule() then var2.upsellFeatureAccessGql(var15, p3, getSuccessfulActions(var7), p4, extraParameters) else var2.upsellFeatureAccess(p3, getSuccessfulActions(var7), p4, extraParameters)
		
		if var22.access == accessResponseEnum.Error then
			var10(true)
			
			return
		elseif var22.access == accessResponseEnum.Actionable then
			logEventOnceIfEnabled("amp_feature_access_actionable")
			var20(var22.recourse, var22.recourses)
			
			return
		elseif var22.access == accessResponseEnum.Granted then
			logEventOnceIfEnabled("amp_feature_access_granted")
			var16(accessResponseEnum.Granted, var7)
			
			return
		elseif var22.access == accessResponseEnum.Denied then
			logEventOnceIfEnabled("amp_feature_access_denied")
			var16(accessResponseEnum.Denied, var7)
			
			return
		end
		var16(accessResponseEnum.Pending, var7)
	end, { var2, extraParameters, var16 })
	reactModule.useEffect(function()
		-- upvalues: sendModalActionEventModule (copy), var3 (ref), appScreensModule (copy), featureName (ref)
		sendModalActionEventModule(var3, appScreensModule.AmpWizardContainer, featureName, "Shown")
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), featureName (ref), nameSpace (ref)
		var21(featureName, nameSpace)
	end, { var7, featureName, var21, nameSpace })
	reactModule.useEffect(function()
		-- upvalues: getFFlagEnableAmpWizardInlineVPCForFAEModule (copy), var13 (ref), VPCRequestTypeEnum (copy), var18 (ref), cryoModule (copy), recourseData (ref), VPCApiProviderModule (copy), var6 (ref), actionTypeEnum (copy), openUpsells (ref), getFFlagEnableAmpVPCPrologueModule (copy), selfContainedUpsells (ref), var12 (ref), var14 (ref)
		if getFFlagEnableAmpWizardInlineVPCForFAEModule() and var13 ~= nil then
			local function buildFAEProps(p3)
				-- upvalues: VPCRequestTypeEnum (copy), var18 (copy), cryoModule (copy), recourseData (copy)
				return cryoModule.Dictionary.join(var18(p3, {
					action = p3,
					parentConsentTypes = { VPCRequestTypeEnum.UpdateUserSetting }
				}), {
					recourseData = cryoModule.Dictionary.join(recourseData or {}, { allowFacialAgeEstimation = "Enabled" })
				})
			end
			
			VPCApiProviderModule.getLinkedParentEmails(var6):andThen(function(p3)
				-- upvalues: actionTypeEnum (copy), buildFAEProps (ref), openUpsells (copy), getFFlagEnableAmpVPCPrologueModule (copy), selfContainedUpsells (copy), var12 (copy), var14 (copy)
				local var22 = if (if p3.parentEmails then #p3.parentEmails else 0) > 0 then actionTypeEnum.ParentConsent else actionTypeEnum.ParentLink
				local var23 = buildFAEProps(var22)
				local var24 = openUpsells[var22]
				
				if getFFlagEnableAmpVPCPrologueModule() then
					if selfContainedUpsells ~= nil and selfContainedUpsells[var22] == true then
						var24(var23)
					else
						var12({
							action = var22,
							actionProps = var23,
							openUpsellFn = var24
						})
					end
					var14(nil)
				end
			end):catch(function(_)
				-- upvalues: buildFAEProps (ref), actionTypeEnum (copy), openUpsells (copy), var14 (copy)
				openUpsells[actionTypeEnum.ParentLink](buildFAEProps(actionTypeEnum.ParentLink))
				var14(nil)
			end)
			
			return
		end
	end, {
		var13, var6, var18, openUpsells, recourseData, selfContainedUpsells
	})
	
	return if getFFlagEnableAmpVPCPrologueModule() and var11 then reactModule.createElement(VPCPrologueController, {
		request = var11,
		recourseData = recourseData,
		handleCompletion = var16,
		actionsTaken = var7,
		options = p2.prologueOptions,
		onDone = function()
			-- upvalues: var12 (ref)
			var12(nil)
		end
	}) elseif var9 then reactModule.createElement(errorScreenModule, {
		featureName = featureName,
		onRetry = function()
			-- upvalues: var10 (ref), var21 (ref), featureName (ref)
			var10(false)
			var21(featureName)
		end,
		onCancel = function()
			-- upvalues: var16 (ref), accessResponseEnum (copy), var7 (ref)
			var16(accessResponseEnum.Denied, var7)
		end
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end