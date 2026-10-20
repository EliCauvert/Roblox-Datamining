local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local EnumsModule = require(AmpUpsell.Common.Enums)
local ActionTypeEnum = EnumsModule.ActionTypeEnum
local ActionStatusEnum = EnumsModule.ActionStatusEnum
local AccessResponseEnum = EnumsModule.AccessResponseEnum
local UserSettingsSettingNameEnum = EnumsModule.UserSettingsSettingNameEnum
local _ = require(AmpUpsell.Common.Types)
local AccountSettingsUpsellStringsFnFunction = require(AmpUpsell.Common.LocalizationStrings).accountSettingsUpsellStringsFn
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local CryoModule = require(Parent.Cryo)
local AnalyticsServiceModule = require(AmpUpsell.Analytics.AnalyticsService)
local SendModalActionEventModule = require(AmpUpsell.Analytics.sendModalActionEvent)
local AmpApiProviderModule = require(AmpUpsell.Common.AmpApiProvider)
local AppScreensModule = require(AmpUpsell.Common.AppScreens)
local ErrorScreenModule = require(AmpUpsell.Components.ErrorScreen)
local UseCompletionCallbackWithReturnPageModule = require(AmpUpsell.Common.useCompletionCallbackWithReturnPage)
local UseApolloClientFunction = require(Parent.ApolloClient).useApolloClient
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAmpWizardEntryPointEventCtxFallback = SharedFlagsModule.FFlagAmpWizardEntryPointEventCtxFallback
local FFlagEnableAmpWizardDeepLink = SharedFlagsModule.FFlagEnableAmpWizardDeepLink
local GetFFlagEnableAmpUpsellGqlModule = require(AmpUpsell.Flags.GetFFlagEnableAmpUpsellGql)
local GetFFlagEnableAmpEmailUpsellSupportModule = require(AmpUpsell.Flags.GetFFlagEnableAmpEmailUpsellSupport)
local GetFFlagEnableAmpIDVUpsellSupportModule = require(AmpUpsell.Flags.GetFFlagEnableAmpIDVUpsellSupport)
local GetFFlagEnableAmpIDVUpsellPopOnCompletionModule = require(AmpUpsell.Flags.GetFFlagEnableAmpIDVUpsellPopOnCompletion)
local GetFFlagEnableAmpSubscriptionUpsellModule = require(AmpUpsell.Flags.GetFFlagEnableAmpSubscriptionUpsell)
local GetFFlagEnableAmpVPCPrologueModule = require(AmpUpsell.Flags.GetFFlagEnableAmpVPCPrologue)
local GetFFlagEnableAmpWizardInlineVPCForFAEModule = require(AmpUpsell.Flags.GetFFlagEnableAmpWizardInlineVPCForFAE)
local GetFFlagEnableAmpWizardVPCNavigationFixModule = require(AmpUpsell.Flags.GetFFlagEnableAmpWizardVPCNavigationFix)
local FFlagAmpWizardRetryKeepsNameSpaceModule = require(AmpUpsell.Flags.FFlagAmpWizardRetryKeepsNameSpace)
local VPCPrologueModule = require(AmpUpsell.Components.Prologues.VPCPrologue)
local LogEventOnceIfEnabledFunction = require(AmpUpsell.Common.LoggingUtils).logEventOnceIfEnabled
local VPCApiProviderModule = require(AmpUpsell.Common.VPCApiProvider)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local VPCRequestTypeEnum = EnumsModule.VPCRequestTypeEnum

local function VPCPrologueController(p1)
	-- upvalues: ReactModule (copy), AccessResponseEnum (copy), CryoModule (copy), ActionStatusEnum (copy), VPCPrologueModule (copy)
	local Options = p1.options
	
	return ReactModule.createElement(VPCPrologueModule, {
		recourseData = p1.recourseData,
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), Options (copy)
			local ActionProps = p1.request.actionProps
			p1.onDone()
			
			if Options and Options.onConfirm then
				Options.onConfirm()
			end
			if p1.request.openUpsellFn then
				p1.request.openUpsellFn(ActionProps)
			end
		end, { p1.request, p1.onDone, Options }),
		onCancel = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), Options (copy), AccessResponseEnum (upval), CryoModule (upval), ActionStatusEnum (upval)
			p1.onDone()
			
			if Options and Options.onCancel then
				Options.onCancel()
			end
			p1.handleCompletion(AccessResponseEnum.Denied, CryoModule.Dictionary.join(p1.actionsTaken, { [p1.request.action] = ActionStatusEnum.Cancelled }))
		end, {
			p1.handleCompletion,
			p1.actionsTaken,
			p1.onDone,
			p1.request,
			Options
		}),
		config = if Options then Options.config else nil
	})
end

local function getSuccessfulActions(ActionsTaken)
	-- upvalues: ActionStatusEnum (copy)
	local List = {}
	
	for i, value in pairs(ActionsTaken) do
		if value == ActionStatusEnum.Success then
			table.insert(List, i)
		end
	end
	return List
end

local function _(p1, List, p2): boolean
	-- upvalues: ActionTypeEnum (copy)
	local Action = p2.action
	
	if p1 == nil or Action ~= ActionTypeEnum.ParentConsent and Action ~= ActionTypeEnum.ParentLink then
		return false
	else
		local ParentConsentTypes = p2.parentConsentTypes
		local Value = if ParentConsentTypes then ParentConsentTypes[1] else nil
		
		return Value == nil or (List == nil or table.find(List, Value) == nil)
	end
end

return function(p1)
	-- upvalues: UseNavigationFunction (copy), FFlagAmpWizardEntryPointEventCtxFallback (copy), AmpApiProviderModule (copy), AnalyticsServiceModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), UseApolloClientFunction (copy), UseCompletionCallbackWithReturnPageModule (copy), FFlagEnableAmpWizardDeepLink (copy), ActionTypeEnum (copy), AppScreensModule (copy), CryoModule (copy), ActionStatusEnum (copy), AccessResponseEnum (copy), GetFFlagEnableAmpEmailUpsellSupportModule (copy), GetFFlagEnableAmpIDVUpsellSupportModule (copy), GetFFlagEnableAmpIDVUpsellPopOnCompletionModule (copy), GetFFlagEnableAmpWizardVPCNavigationFixModule (copy), LogEventOnceIfEnabledFunction (copy), GetFFlagEnableAmpSubscriptionUpsellModule (copy), UserSettingsSettingNameEnum (copy), GetFFlagEnableAmpVPCPrologueModule (copy), GetFFlagEnableAmpWizardInlineVPCForFAEModule (copy), AccountSettingsUpsellStringsFnFunction (copy), GetFFlagEnableAmpUpsellGqlModule (copy), getSuccessfulActions (copy), SendModalActionEventModule (copy), VPCRequestTypeEnum (copy), VPCApiProviderModule (copy), VPCPrologueController (copy), ErrorScreenModule (copy), FFlagAmpWizardRetryKeepsNameSpaceModule (copy), Loading (copy), IconSize (copy)
	local UseNavigationResult = UseNavigationFunction()
	local FeatureName = p1.featureName
	local NameSpace = p1.nameSpace
	local RecourseData = p1.recourseData
	local ExtraParameters = p1.extraParameters
	local DefaultLuaContext = if FFlagAmpWizardEntryPointEventCtxFallback and (p1.entryPointEventCtx == nil or p1.entryPointEventCtx == "") then "defaultLuaContext" else p1.entryPointEventCtx
	local OpenUpsells = p1.openUpsells
	local VpcV2Launcher = p1.vpcV2Launcher
	local VpcExcludedRequestTypes = p1.vpcExcludedRequestTypes
	local CompletionCallback = p1.completionCallback
	local Metadata = p1.metadata
	local AmpApiProvider = if p1.ampApiProvider then p1.ampApiProvider else AmpApiProviderModule
	local AnalyticsService = if p1.analyticsService then p1.analyticsService else AnalyticsServiceModule.EventStream
	local OpenAccountSettingsUpsell = if p1.openAccountSettingsUpsell then p1.openAccountSettingsUpsell else UseNavigationResult.push
	local IsInExperienceEntry = if p1.isInExperienceEntry then p1.isInExperienceEntry else false
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseApolloClientResult = UseApolloClientFunction()
	local UseCompletionCallbackWithReturnPageModuleResult = UseCompletionCallbackWithReturnPageModule(UseNavigationResult, CompletionCallback, Metadata)
	local Callback = if FFlagEnableAmpWizardDeepLink then UseCompletionCallbackWithReturnPageModuleResult else CompletionCallback
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: VpcV2Launcher (copy), VpcExcludedRequestTypes (copy), ActionTypeEnum (upval), UseNavigationResult (copy)
		local Action = p2.action
		local v1 = nil
		
		if VpcV2Launcher == nil or Action ~= ActionTypeEnum.ParentConsent and Action ~= ActionTypeEnum.ParentLink then
			v1 = false
		else
			local ParentConsentTypes = p2.parentConsentTypes
			local Value = if ParentConsentTypes then ParentConsentTypes[1] else nil
			v1 = Value == nil or (VpcExcludedRequestTypes == nil or table.find(VpcExcludedRequestTypes, Value) == nil)
		end
		if not v1 then
			UseNavigationResult.pop()
		end
	end, {
		UseNavigationResult.pop,
		VpcV2Launcher,
		VpcExcludedRequestTypes
	})
	local UseResult1 = ReactModule.useCallback(function(_, p2)
		-- upvalues: ActionTypeEnum (upval), AppScreensModule (upval), UseStateResult2 (copy), CryoModule (upval), UseStateResult (copy), ActionStatusEnum (upval), Callback (copy), AccessResponseEnum (upval), GetFFlagEnableAmpEmailUpsellSupportModule (upval), GetFFlagEnableAmpIDVUpsellSupportModule (upval), FeatureName (copy), DefaultLuaContext (copy), Metadata (copy), GetFFlagEnableAmpIDVUpsellPopOnCompletionModule (upval), UseNavigationResult (copy), RecourseData (copy), IsInExperienceEntry (copy), GetFFlagEnableAmpWizardVPCNavigationFixModule (upval), UseResult (copy), p1 (copy), LogEventOnceIfEnabledFunction (upval), GetFFlagEnableAmpSubscriptionUpsellModule (upval)
		local Action = p2.action
		
		return if Action == ActionTypeEnum.Phone then {
			eventContext = "AmpUpsell",
			origin = AppScreensModule.AmpWizardContainer,
			onSuccess = function()
				-- upvalues: UseStateResult2 (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				UseStateResult2(CryoModule.Dictionary.join(UseStateResult, { [ActionTypeEnum.Phone] = ActionStatusEnum.Success }))
			end,
			onFailure = function()
				-- upvalues: Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, { [ActionTypeEnum.Phone] = ActionStatusEnum.Failure }))
			end,
			onCancelled = function()
				-- upvalues: Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, { [ActionTypeEnum.Phone] = ActionStatusEnum.Cancelled }))
			end
		} elseif GetFFlagEnableAmpEmailUpsellSupportModule() and Action == ActionTypeEnum.AddedEmail then {
			eventContext = "AmpUpsell",
			closeOnEmailUpdate = true,
			addEmailOver13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText",
			addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText",
			addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail",
			successCallback = function(_)
				-- upvalues: UseStateResult2 (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				UseStateResult2(CryoModule.Dictionary.join(UseStateResult, { [ActionTypeEnum.Email] = ActionStatusEnum.Success }))
			end,
			failureCallback = function()
				-- upvalues: Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, { [ActionTypeEnum.Phone] = ActionStatusEnum.Failure }))
			end,
			closeCentralOverlay = function() end
		} elseif GetFFlagEnableAmpIDVUpsellSupportModule() and Action == ActionTypeEnum.GovernmentId then {
			featureName = FeatureName,
			entryPointEventCtx = DefaultLuaContext,
			metadata = Metadata,
			onSuccess = function()
				-- upvalues: GetFFlagEnableAmpIDVUpsellPopOnCompletionModule (upval), UseNavigationResult (upval), UseStateResult2 (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				if GetFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
					UseNavigationResult.pop()
				end
				UseStateResult2(CryoModule.Dictionary.join(UseStateResult, { [ActionTypeEnum.GovernmentId] = ActionStatusEnum.Success }))
			end,
			onFailure = function()
				-- upvalues: GetFFlagEnableAmpIDVUpsellPopOnCompletionModule (upval), UseNavigationResult (upval), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				if GetFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
					UseNavigationResult.pop()
				end
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, { [ActionTypeEnum.GovernmentId] = ActionStatusEnum.Failure }))
			end,
			onCancelled = function()
				-- upvalues: GetFFlagEnableAmpIDVUpsellPopOnCompletionModule (upval), UseNavigationResult (upval), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				if GetFFlagEnableAmpIDVUpsellPopOnCompletionModule() then
					UseNavigationResult.pop()
				end
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, {
					[ActionTypeEnum.GovernmentId] = ActionStatusEnum.Cancelled
				}))
			end
		} elseif Action == ActionTypeEnum.ParentConsent or Action == ActionTypeEnum.ParentLink then {
			recourseAction = p2.action,
			parentConsentTypes = p2.parentConsentTypes,
			recourseData = RecourseData,
			entryPointEventCtx = DefaultLuaContext,
			isInExperienceEntry = IsInExperienceEntry,
			onCancel = function()
				-- upvalues: GetFFlagEnableAmpWizardVPCNavigationFixModule (upval), UseResult (upval), p2 (copy), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), Action (copy), ActionStatusEnum (upval)
				if GetFFlagEnableAmpWizardVPCNavigationFixModule() then
					UseResult(p2)
				end
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, { [Action] = ActionStatusEnum.Cancelled }))
			end,
			onSuccess = function()
				-- upvalues: GetFFlagEnableAmpWizardVPCNavigationFixModule (upval), UseResult (upval), p2 (copy), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), Action (copy), ActionStatusEnum (upval)
				if GetFFlagEnableAmpWizardVPCNavigationFixModule() then
					UseResult(p2)
				end
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, { [Action] = ActionStatusEnum.Success }))
			end,
			onRetryAmp = function()
				-- upvalues: UseResult (upval), p2 (copy), UseStateResult2 (upval), CryoModule (upval), UseStateResult (upval), Action (copy), ActionStatusEnum (upval)
				UseResult(p2)
				UseStateResult2(CryoModule.Dictionary.join(UseStateResult, { [Action] = ActionStatusEnum.RetryRequested }))
			end
		} elseif Action == ActionTypeEnum.AgeEstimation then {
			featureName = FeatureName,
			entryPointEventCtx = DefaultLuaContext,
			metadata = Metadata,
			skipFacialAgeEstimationWebLinkModal = p1.skipFacialAgeEstimationWebLinkModal,
			onSuccess = function()
				-- upvalues: LogEventOnceIfEnabledFunction (upval), UseNavigationResult (upval), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				LogEventOnceIfEnabledFunction("complete_flow_with_success")
				UseNavigationResult.pop()
				Callback(AccessResponseEnum.Granted, CryoModule.Dictionary.join(UseStateResult, {
					[ActionTypeEnum.AgeEstimation] = ActionStatusEnum.Success
				}))
			end,
			onFailure = function()
				-- upvalues: LogEventOnceIfEnabledFunction (upval), UseNavigationResult (upval), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				LogEventOnceIfEnabledFunction("complete_flow_with_error")
				UseNavigationResult.pop()
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, {
					[ActionTypeEnum.AgeEstimation] = ActionStatusEnum.Failure
				}))
			end,
			onCancel = function()
				-- upvalues: LogEventOnceIfEnabledFunction (upval), UseNavigationResult (upval), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				LogEventOnceIfEnabledFunction("complete_flow_with_cancel")
				UseNavigationResult.pop()
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, {
					[ActionTypeEnum.AgeEstimation] = ActionStatusEnum.Cancelled
				}))
			end,
			onRetry = function()
				-- upvalues: UseNavigationResult (upval), UseStateResult2 (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				UseNavigationResult.pop()
				UseStateResult2(CryoModule.Dictionary.join(UseStateResult, {
					[ActionTypeEnum.AgeEstimation] = ActionStatusEnum.RetryRequested
				}))
			end
		} elseif GetFFlagEnableAmpSubscriptionUpsellModule() and Action == ActionTypeEnum.Subscription then {
			purchaseUIOptions = RecourseData and RecourseData.purchaseUIOptions,
			surfaceName = RecourseData and RecourseData.surfaceName,
			surfaceContext = RecourseData and RecourseData.surfaceContext,
			analyticsContext = RecourseData and RecourseData.analyticsContext,
			onSuccess = function()
				-- upvalues: UseNavigationResult (upval), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				UseNavigationResult.pop()
				Callback(AccessResponseEnum.Granted, CryoModule.Dictionary.join(UseStateResult, { [ActionTypeEnum.Subscription] = ActionStatusEnum.Success }))
			end,
			onFailure = function()
				-- upvalues: UseNavigationResult (upval), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				UseNavigationResult.pop()
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, { [ActionTypeEnum.Subscription] = ActionStatusEnum.Failure }))
			end,
			onCancel = function()
				-- upvalues: UseNavigationResult (upval), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), ActionTypeEnum (upval), ActionStatusEnum (upval)
				UseNavigationResult.pop()
				Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, {
					[ActionTypeEnum.Subscription] = ActionStatusEnum.Cancelled
				}))
			end
		} else {}
	end, { UseStateResult, Callback, UseResult })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: VpcV2Launcher (copy), VpcExcludedRequestTypes (copy), ActionTypeEnum (upval), UserSettingsSettingNameEnum (upval), OpenUpsells (copy)
		local Action = p2.action
		local v1 = nil
		
		if VpcV2Launcher == nil or Action ~= ActionTypeEnum.ParentConsent and Action ~= ActionTypeEnum.ParentLink then
			v1 = false
		else
			local ParentConsentTypes = p2.parentConsentTypes
			local Value = if ParentConsentTypes then ParentConsentTypes[1] else nil
			v1 = Value == nil or (VpcExcludedRequestTypes == nil or table.find(VpcExcludedRequestTypes, Value) == nil)
		end
		if v1 then
			return VpcV2Launcher
		end
		local Action1 = p2.action
		
		if Action1 == ActionTypeEnum.UserSettings then
			local UserSettings = p2.userSettings
			
			if UserSettings and UserSettings.settingName == UserSettingsSettingNameEnum.AllowFacialAgeEstimation then
				return nil
			end
		end
		return OpenUpsells[Action1]
	end, { OpenUpsells, VpcV2Launcher, VpcExcludedRequestTypes })
	local UseResult3 = ReactModule.useCallback(function(_, Entry)
		-- upvalues: UseStateResult2_1 (copy), UseResult2 (copy), UseResult1 (copy), ActionTypeEnum (upval), p1 (copy), GetFFlagEnableAmpVPCPrologueModule (upval), VpcV2Launcher (copy), VpcExcludedRequestTypes (copy), UseStateResult2_2 (copy), GetFFlagEnableAmpWizardInlineVPCForFAEModule (upval), UserSettingsSettingNameEnum (upval), UseStateResult2_3 (copy), Callback (copy), AccessResponseEnum (upval), UseStateResult (copy), AccountSettingsUpsellStringsFnFunction (upval), OpenAccountSettingsUpsell (copy), FeatureName (copy), UseNavigationResult (copy), CryoModule (upval), ActionStatusEnum (upval)
		if Entry == nil or #Entry == 0 then
			UseStateResult2_1(true)
			
			return
		end
		local Entry1 = Entry[1]
		local Action = Entry1.action
		local UseResultResult: (any) -> () = UseResult2(Entry1)
		
		if UseResultResult == nil then
			if GetFFlagEnableAmpWizardInlineVPCForFAEModule() and Action == ActionTypeEnum.UserSettings then
				local UserSettings = Entry1.userSettings
				
				if UserSettings and UserSettings.settingName == UserSettingsSettingNameEnum.AllowFacialAgeEstimation then
					UseStateResult2_3(Entry1)
					
					return
				end
			end
			if Action == ActionTypeEnum.Subscription then
				Callback(AccessResponseEnum.Denied, UseStateResult)
				
				return
			end
			local AccountSettingsUpsellStringsFnResult = AccountSettingsUpsellStringsFnFunction(Entry1)
			
			if AccountSettingsUpsellStringsFnResult then
				OpenAccountSettingsUpsell({
					featureName = FeatureName,
					localizationStrings = AccountSettingsUpsellStringsFnResult,
					onCloseModal = function()
						-- upvalues: UseNavigationResult (upval), Callback (upval), AccessResponseEnum (upval), CryoModule (upval), UseStateResult (upval), Action (copy), ActionStatusEnum (upval)
						UseNavigationResult.pop()
						Callback(AccessResponseEnum.Denied, CryoModule.Dictionary.join(UseStateResult, { [Action] = ActionStatusEnum.Cancelled }))
					end
				})
				
				return
			else
				Callback(AccessResponseEnum.Error, UseStateResult)
				
				return
			end
		else
			local UseResultResult1 = UseResult1(Action, Entry1)
			local IsActionMatch: boolean = Action == ActionTypeEnum.ParentConsent or Action == ActionTypeEnum.ParentLink
			
			if p1.usePrologue and IsActionMatch and GetFFlagEnableAmpVPCPrologueModule() then
				local Action1 = Entry1.action
				local v1 = nil
				
				if VpcV2Launcher == nil or Action1 ~= ActionTypeEnum.ParentConsent and Action1 ~= ActionTypeEnum.ParentLink then
					v1 = false
				else
					local ParentConsentTypes = Entry1.parentConsentTypes
					local Value = if ParentConsentTypes then ParentConsentTypes[1] else nil
					v1 = Value == nil or (VpcExcludedRequestTypes == nil or table.find(VpcExcludedRequestTypes, Value) == nil)
				end
				if not v1 then
					UseStateResult2_2({
						action = Action,
						actionProps = UseResultResult1,
						openUpsellFn = UseResultResult
					})
					
					return
				end
			end
			UseResultResult(UseResultResult1)
		end
	end, {
		UseStateResult, Callback, FeatureName, UseResult1, UseNavigationResult.pop,
		OpenAccountSettingsUpsell, UseResult2, p1.usePrologue, VpcV2Launcher,
		VpcExcludedRequestTypes, UseStateResult2_3
	})
	local UseResult4 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseStateResult2_1 (copy), LogEventOnceIfEnabledFunction (upval), GetFFlagEnableAmpUpsellGqlModule (upval), AmpApiProvider (copy), UseApolloClientResult (copy), getSuccessfulActions (upval), UseStateResult (copy), ExtraParameters (copy), AccessResponseEnum (upval), UseResult3 (copy), Callback (copy)
		UseStateResult2_1(false)
		LogEventOnceIfEnabledFunction("amp_feature_access_init")
		local UpsellFeatureAccessGqlResult = if GetFFlagEnableAmpUpsellGqlModule() then AmpApiProvider.upsellFeatureAccessGql(UseApolloClientResult, p2, getSuccessfulActions(UseStateResult), p3, ExtraParameters) else AmpApiProvider.upsellFeatureAccess(p2, getSuccessfulActions(UseStateResult), p3, ExtraParameters)
		
		if UpsellFeatureAccessGqlResult.access == AccessResponseEnum.Error then
			UseStateResult2_1(true)
			
			return
		end
		if UpsellFeatureAccessGqlResult.access == AccessResponseEnum.Actionable then
			LogEventOnceIfEnabledFunction("amp_feature_access_actionable")
			UseResult3(UpsellFeatureAccessGqlResult.recourse, UpsellFeatureAccessGqlResult.recourses)
			
			return
		end
		if UpsellFeatureAccessGqlResult.access == AccessResponseEnum.Granted then
			LogEventOnceIfEnabledFunction("amp_feature_access_granted")
			Callback(AccessResponseEnum.Granted, UseStateResult)
			
			return
		end
		if UpsellFeatureAccessGqlResult.access == AccessResponseEnum.Denied then
			LogEventOnceIfEnabledFunction("amp_feature_access_denied")
			Callback(AccessResponseEnum.Denied, UseStateResult)
			
			return
		else
			Callback(AccessResponseEnum.Pending, UseStateResult)
		end
	end, { AmpApiProvider, ExtraParameters, Callback })
	ReactModule.useEffect(function()
		-- upvalues: SendModalActionEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy)
		SendModalActionEventModule(AnalyticsService, AppScreensModule.AmpWizardContainer, FeatureName, "Shown")
	end, { AnalyticsService })
	ReactModule.useEffect(function()
		-- upvalues: UseResult4 (copy), FeatureName (copy), NameSpace (copy)
		UseResult4(FeatureName, NameSpace)
	end, { UseStateResult, FeatureName, UseResult4, NameSpace })
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagEnableAmpWizardInlineVPCForFAEModule (upval), UseStateResult4 (copy), VPCRequestTypeEnum (upval), UseResult1 (copy), CryoModule (upval), RecourseData (copy), VPCApiProviderModule (upval), UseRoactServiceResult (copy), ActionTypeEnum (upval), UseResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy), GetFFlagEnableAmpVPCPrologueModule (upval), VpcV2Launcher (copy), VpcExcludedRequestTypes (copy), UseStateResult2_2 (copy)
		if GetFFlagEnableAmpWizardInlineVPCForFAEModule() and UseStateResult4 ~= nil then
			local function _(Action)
				-- upvalues: VPCRequestTypeEnum (upval)
				return {
					action = Action,
					parentConsentTypes = { VPCRequestTypeEnum.UpdateUserSetting }
				}
			end
			
			local function buildFAEProps(p2)
				-- upvalues: UseResult1 (upval), CryoModule (upval), RecourseData (upval)
				return CryoModule.Dictionary.join(UseResult1(p2.action, p2), {
					recourseData = CryoModule.Dictionary.join(RecourseData or {}, { allowFacialAgeEstimation = "Enabled" })
				})
			end
			
			VPCApiProviderModule.getLinkedParentEmails(UseRoactServiceResult):andThen(function(Result)
				-- upvalues: ActionTypeEnum (upval), VPCRequestTypeEnum (upval), buildFAEProps (copy), UseResult2 (upval), UseStateResult2_1 (upval), UseStateResult2_3 (upval), GetFFlagEnableAmpVPCPrologueModule (upval), VpcV2Launcher (upval), VpcExcludedRequestTypes (upval), UseStateResult2_2 (upval)
				local CountParentEmails: number = Result.parentEmails and #Result.parentEmails or 0
				local ParentConsent = if CountParentEmails > 0 then ActionTypeEnum.ParentConsent else ActionTypeEnum.ParentLink
				local config = {
					action = ParentConsent,
					parentConsentTypes = { VPCRequestTypeEnum.UpdateUserSetting }
				}
				local FAEProps = buildFAEProps(config)
				local UseResultResult: (any) -> () = UseResult2(config)
				
				if UseResultResult == nil then
					UseStateResult2_1(true)
					UseStateResult2_3(nil)
					
					return
				end
				repeat
					if GetFFlagEnableAmpVPCPrologueModule() then
						local Action = config.action
						local v1 = nil
						
						if VpcV2Launcher == nil or Action ~= ActionTypeEnum.ParentConsent and Action ~= ActionTypeEnum.ParentLink then
							v1 = false
						else
							local ParentConsentTypes = config.parentConsentTypes
							local Value = if ParentConsentTypes then ParentConsentTypes[1] else nil
							v1 = Value == nil or (VpcExcludedRequestTypes == nil or table.find(VpcExcludedRequestTypes, Value) == nil)
						end
						if not v1 then
							UseStateResult2_2({
								action = ParentConsent,
								actionProps = FAEProps,
								openUpsellFn = UseResultResult
							})
							break
						end
					end
					UseResultResult(FAEProps)
				until true
				UseStateResult2_3(nil)
			end):catch(function(_)
				-- upvalues: ActionTypeEnum (upval), VPCRequestTypeEnum (upval), buildFAEProps (copy), UseResult2 (upval), UseStateResult2_1 (upval), GetFFlagEnableAmpVPCPrologueModule (upval), VpcV2Launcher (upval), VpcExcludedRequestTypes (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval)
				local config = {
					action = ActionTypeEnum.ParentLink,
					parentConsentTypes = { VPCRequestTypeEnum.UpdateUserSetting }
				}
				local FAEProps = buildFAEProps(config)
				local UseResultResult: (any) -> () = UseResult2(config)
				repeat
					if UseResultResult == nil then
						UseStateResult2_1(true)
						break
					end
					if GetFFlagEnableAmpVPCPrologueModule() then
						local Action = config.action
						local v1 = nil
						
						if VpcV2Launcher == nil or Action ~= ActionTypeEnum.ParentConsent and Action ~= ActionTypeEnum.ParentLink then
							v1 = false
						else
							local ParentConsentTypes = config.parentConsentTypes
							local Value = if ParentConsentTypes then ParentConsentTypes[1] else nil
							v1 = Value == nil or (VpcExcludedRequestTypes == nil or table.find(VpcExcludedRequestTypes, Value) == nil)
						end
						if not v1 then
							UseStateResult2_2({
								action = ActionTypeEnum.ParentLink,
								actionProps = FAEProps,
								openUpsellFn = UseResultResult
							})
							break
						end
					end
					UseResultResult(FAEProps)
				until true
				UseStateResult2_3(nil)
			end)
			
			return
		end
	end, {
		UseStateResult4, UseRoactServiceResult, UseResult1, OpenUpsells, RecourseData,
		UseResult2, VpcV2Launcher, VpcExcludedRequestTypes
	})
	
	return if GetFFlagEnableAmpVPCPrologueModule() and UseStateResult3 then ReactModule.createElement(VPCPrologueController, {
		request = UseStateResult3,
		recourseData = RecourseData,
		handleCompletion = Callback,
		actionsTaken = UseStateResult,
		options = p1.prologueOptions,
		onDone = function()
			-- upvalues: UseStateResult2_2 (copy)
			UseStateResult2_2(nil)
		end
	}) elseif UseStateResult1 then ReactModule.createElement(ErrorScreenModule, {
		featureName = FeatureName,
		onRetry = function()
			-- upvalues: UseStateResult2_1 (copy), FFlagAmpWizardRetryKeepsNameSpaceModule (upval), UseResult4 (copy), FeatureName (copy), NameSpace (copy)
			UseStateResult2_1(false)
			
			if FFlagAmpWizardRetryKeepsNameSpaceModule then
				UseResult4(FeatureName, NameSpace)
				
				return
			else
				UseResult4(FeatureName)
			end
		end,
		onCancel = function()
			-- upvalues: Callback (copy), AccessResponseEnum (upval), UseStateResult (copy)
			Callback(AccessResponseEnum.Denied, UseStateResult)
		end
	}) else ReactModule.createElement(Loading, {
		size = IconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end