local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local VPCApiProviderModule = require(AmpUpsell.Common.VPCApiProvider)
local AmpApiProviderModule = require(AmpUpsell.Common.AmpApiProvider)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local VpcConfirmationScreenStrings = require(AmpUpsell.Common.LocalizationStrings).vpcConfirmationScreenStrings
local VpcUpsellGatherEmailStrings = require(AmpUpsell.Common.LocalizationStrings).vpcUpsellGatherEmailStrings
local VPCErrorScreenModule = require(script.Parent.VPCErrorScreen)
local VPCConfirmationScreenModule = require(script.Parent.VPCConfirmationScreen)
local VPCNewParentUpsellModule = require(script.Parent.VPCNewParentUpsell)
local IsStringEmailFunction = require(Parent.AuthCommon).Utils.isStringEmail
local AppScreensModule = require(AmpUpsell.Common.AppScreens)
local GetFStringPrivacyPolicyLinkModule = require(AmpUpsell.Flags.GetFStringPrivacyPolicyLink)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local EnumsModule = require(AmpUpsell.Common.Enums)
local ActionTypeEnum = EnumsModule.ActionTypeEnum
local VPCStepEnum = EnumsModule.VPCStepEnum
local VPCRetryBehaviorEnum = EnumsModule.VPCRetryBehaviorEnum
local GetRetryBehaviorFromErrorCodeAndRetryNumFunction = require(AmpUpsell.Common.VPCErrorUtils).getRetryBehaviorFromErrorCodeAndRetryNum
local AccessResponseEnum = EnumsModule.AccessResponseEnum
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local VpcEventConstants = require(AmpUpsell.Common.EventConstants).vpcEventConstants
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local ArgCheckModule = require(Parent.ArgCheck)
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local GetFFlagEnableExternalBrowserForVPCPrivacyPolicyModule = require(AmpUpsell.Flags.GetFFlagEnableExternalBrowserForVPCPrivacyPolicy)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FFlagLuaAppOdpRequestSentToast = require(Parent.SharedFlags).FFlagLuaAppOdpRequestSentToast
local FFlagLuaAppAmpWizardSendAnalyticsSessionId = require(Parent.SharedFlags).FFlagLuaAppAmpWizardSendAnalyticsSessionId

return function(p1)
	-- upvalues: VPCApiProviderModule (copy), AmpApiProviderModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), GetFFlagEnableExternalBrowserForVPCPrivacyPolicyModule (copy), UseAppPolicyFunction (copy), AppLinking (copy), ReactModule (copy), ActionTypeEnum (copy), VPCStepEnum (copy), UseLocalizationFunction (copy), VpcUpsellGatherEmailStrings (copy), UseNavigationFunction (copy), ArgCheckModule (copy), GetFStringPrivacyPolicyLinkModule (copy), AppScreensModule (copy), IsStringEmailFunction (copy), FFlagLuaAppOdpRequestSentToast (copy), AccessResponseEnum (copy), FFlagLuaAppAmpWizardSendAnalyticsSessionId (copy), GetRetryBehaviorFromErrorCodeAndRetryNumFunction (copy), VPCRetryBehaviorEnum (copy), AuthMsgShownFunction (copy), VpcEventConstants (copy), VPCConfirmationScreenModule (copy), VpcConfirmationScreenStrings (copy), AuthButtonClickFunction (copy), VPCNewParentUpsellModule (copy), AuthFormInteractionFunction (copy), VPCErrorScreenModule (copy)
	local OnCancelFunction = p1.onCancel
	local OnSuccessFunction = p1.onSuccess
	local VpcApiProvider = if p1.vpcApiProvider then p1.vpcApiProvider else VPCApiProviderModule
	local AmpApiProvider = if p1.ampApiProvider then p1.ampApiProvider else AmpApiProviderModule
	local RecourseAction = p1.recourseAction
	local RecourseData = p1.recourseData
	local EntryPointEventCtx = if p1.entryPointEventCtx then p1.entryPointEventCtx else ""
	local ParentConsentTypes = p1.parentConsentTypes
	local DisablePortal = if p1.disablePortal then p1.disablePortal else false
	local IsInExperienceEntry = if p1.isInExperienceEntry then p1.isInExperienceEntry else false
	local OnRequestSent = p1.onRequestSent
	local AnalyticsSessionId = p1.analyticsSessionId
	local VpcEntryAnalytics = p1.vpcEntryAnalytics
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local v1 = false
	local v2 = nil
	
	if GetFFlagEnableExternalBrowserForVPCPrivacyPolicyModule() then
		v1 = UseAppPolicyFunction(function(p2)
			return p2.shouldUseExternalBrowserForDisclaimerLinks()
		end)
		v2 = UseRoactServiceFunction(AppLinking)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(if RecourseAction == ActionTypeEnum.ParentLink then VPCStepEnum.NewParentLoading else VPCStepEnum.AlreadyLinkedSendRequest)
	local Unknown, Unknown2 = ReactModule.useState("Unknown")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseLocalizationResult = UseLocalizationFunction(VpcUpsellGatherEmailStrings)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState("")
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState("")
	local UseNavigationResult = UseNavigationFunction()
	
	local function _(p2, p3)
		-- upvalues: ArgCheckModule (upval)
		ArgCheckModule.isNotNil(p2, "linking")
		ArgCheckModule.isType(p3, "string", "url")
		p2:openURL(p3)
	end
	
	local function OpenPrivacyPolicyLink()
		-- upvalues: GetFFlagEnableExternalBrowserForVPCPrivacyPolicyModule (upval), v1 (ref), v2 (ref), GetFStringPrivacyPolicyLinkModule (upval), ArgCheckModule (upval), UseNavigationResult (copy), AppScreensModule (upval), UseLocalizationResult (copy)
		if GetFFlagEnableExternalBrowserForVPCPrivacyPolicyModule() and v1 then
			local v3 = v2
			local FStringPrivacyPolicyLinkModule = GetFStringPrivacyPolicyLinkModule()
			ArgCheckModule.isNotNil(v3, "linking")
			ArgCheckModule.isType(FStringPrivacyPolicyLinkModule, "string", "url")
			v3:openURL(FStringPrivacyPolicyLinkModule)
			
			return
		else
			UseNavigationResult.navigate(AppScreensModule.GenericWebPage, {
				detail = GetFStringPrivacyPolicyLinkModule(),
				extraProps = {
					transitionAnimation = "SlideInFromBottom",
					title = UseLocalizationResult.privacyLinkText
				}
			})
		end
	end
	
	local function handleEmailInput(p2)
		-- upvalues: UseStateResult2_4 (copy), IsStringEmailFunction (upval), UseStateResult2_3 (copy), UseStateResult2_5 (copy), UseLocalizationResult (copy)
		UseStateResult2_4(p2)
		
		if IsStringEmailFunction(p2) then
			UseStateResult2_3(true)
			UseStateResult2_5("")
			
			return
		end
		UseStateResult2_3(false)
		
		if p2 == "" then
			UseStateResult2_5("")
			
			return
		else
			UseStateResult2_5(UseLocalizationResult.errorText)
		end
	end
	
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(0)
	local OnRetryAmpFunction = p1.onRetryAmp
	
	local function onRetryVPC()
		-- upvalues: UseStateResult2_6 (copy), UseStateResult7 (copy), UseStateResult2_1 (copy), Unknown2 (copy), UseStateResult2_4 (copy), IsStringEmailFunction (upval), UseStateResult2_3 (copy), UseStateResult2_5 (copy), UseStateResult2 (copy), RecourseAction (copy), ActionTypeEnum (upval), VPCStepEnum (upval)
		UseStateResult2_6(UseStateResult7 + 1)
		UseStateResult2_1({})
		Unknown2("Unknown")
		UseStateResult2_4("")
		
		if IsStringEmailFunction("") then
			UseStateResult2_3(true)
			UseStateResult2_5("")
		else
			UseStateResult2_3(false)
			UseStateResult2_5("")
		end
		UseStateResult2(if RecourseAction == ActionTypeEnum.ParentLink then VPCStepEnum.NewParentCollectEmail else VPCStepEnum.AlreadyLinkedSendRequest)
	end
	
	local function finishSuccessfulRequest(Result)
		-- upvalues: UseStateResult2 (copy), VPCStepEnum (upval), FFlagLuaAppOdpRequestSentToast (upval), OnRequestSent (copy)
		UseStateResult2(VPCStepEnum.RequestSent)
		
		if FFlagLuaAppOdpRequestSentToast and OnRequestSent then
			pcall(OnRequestSent, if Result then Result.sessionId else nil)
		end
	end
	
	local function getLinkedParentEmailsAndSendRequestToAllParents()
		-- upvalues: VpcApiProvider (copy), UseRoactServiceResult (copy), UseStateResult2_1 (copy), ParentConsentTypes (copy), RecourseData (copy), AnalyticsSessionId (copy), finishSuccessfulRequest (copy), Unknown2 (copy), UseStateResult2 (copy), VPCStepEnum (upval)
		VpcApiProvider.getLinkedParentEmails(UseRoactServiceResult):andThen(function(Result)
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(Result.parentEmails)
		end):catch(function(_) end)
		VpcApiProvider.sendRequestToAllParents(UseRoactServiceResult, ParentConsentTypes, RecourseData, AnalyticsSessionId):andThen(finishSuccessfulRequest):catch(function(Err)
			-- upvalues: Unknown2 (upval), UseStateResult2 (upval), VPCStepEnum (upval)
			Unknown2(Err.code)
			UseStateResult2(VPCStepEnum.Error)
		end)
	end
	
	local function sendRequestToNewParent(p2)
		-- upvalues: VpcApiProvider (copy), UseRoactServiceResult (copy), ParentConsentTypes (copy), RecourseData (copy), AnalyticsSessionId (copy), finishSuccessfulRequest (copy), Unknown2 (copy), UseStateResult2 (copy), VPCStepEnum (upval)
		VpcApiProvider.sendRequestToNewParent(UseRoactServiceResult, p2, ParentConsentTypes, RecourseData, AnalyticsSessionId):andThen(finishSuccessfulRequest):catch(function(Err)
			-- upvalues: Unknown2 (upval), UseStateResult2 (upval), VPCStepEnum (upval)
			Unknown2(Err.code)
			UseStateResult2(VPCStepEnum.Error)
		end)
	end
	
	local function getIsChildSubjectToParentalControls()
		-- upvalues: AmpApiProvider (copy), AccessResponseEnum (upval), UseStateResult2_2 (copy), UseStateResult2 (copy), VPCStepEnum (upval)
		local FeatureAccess = AmpApiProvider.getFeatureAccess({ "IsChildSubjectToParentalControls" })
		UseStateResult2_2(not FeatureAccess.featureAccessList or not FeatureAccess.featureAccessList[1] or FeatureAccess.featureAccessList[1].access ~= AccessResponseEnum.Denied)
		UseStateResult2(VPCStepEnum.NewParentCollectEmail)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: RecourseAction (copy), ActionTypeEnum (upval), getLinkedParentEmailsAndSendRequestToAllParents (copy), getIsChildSubjectToParentalControls (copy)
		if RecourseAction == ActionTypeEnum.ParentConsent then
			getLinkedParentEmailsAndSendRequestToAllParents()
			
			return
		end
		if RecourseAction == ActionTypeEnum.ParentLink then
			getIsChildSubjectToParentalControls()
		end
	end, { UseStateResult7 })
	local UseRefResult = if FFlagLuaAppAmpWizardSendAnalyticsSessionId then ReactModule.useRef(nil) else nil
	local UseRefResult1 = if FFlagLuaAppAmpWizardSendAnalyticsSessionId then ReactModule.useRef(false) else nil
	
	if FFlagLuaAppAmpWizardSendAnalyticsSessionId then
		ReactModule.useEffect(function()
			-- upvalues: VpcEntryAnalytics (copy), UseRefResult (copy), UseStateResult (copy), VPCStepEnum (upval), UseRefResult1 (copy), GetRetryBehaviorFromErrorCodeAndRetryNumFunction (upval), Unknown (copy), UseStateResult7 (copy), VPCRetryBehaviorEnum (upval)
			if VpcEntryAnalytics == nil or UseRefResult == nil or UseRefResult.current == UseStateResult then return end
			UseRefResult.current = UseStateResult
			
			if UseStateResult == VPCStepEnum.NewParentCollectEmail then
				if UseRefResult1 then
					UseRefResult1.current = false
				end
				VpcEntryAnalytics.remoteEmailShown()
				
				return
			elseif UseStateResult == VPCStepEnum.RequestSent then
				VpcEntryAnalytics.remoteRequestSent()
				
				return
			else
				if UseStateResult == VPCStepEnum.Error then
					if GetRetryBehaviorFromErrorCodeAndRetryNumFunction(Unknown, UseStateResult7) == VPCRetryBehaviorEnum.Success then
						VpcEntryAnalytics.remoteRequestSent()
						
						return
					end
					VpcEntryAnalytics.remoteRequestError(Unknown)
				end
			end
		end, {
			UseStateResult,
			Unknown,
			UseStateResult7,
			VpcEntryAnalytics
		})
	end
	if UseStateResult == VPCStepEnum.RequestSent then
		AuthMsgShownFunction(EntryPointEventCtx, "", VpcEventConstants.confirmationPageLoadField, "")
		
		return ReactModule.createElement(VPCConfirmationScreenModule, {
			messageStrings = VpcConfirmationScreenStrings,
			parentEmails = UseStateResult1,
			onAck = function()
				-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), VpcEventConstants (upval), VpcEntryAnalytics (copy), OnSuccessFunction (copy)
				AuthButtonClickFunction(EntryPointEventCtx, VpcEventConstants.confirmationPageButton)
				
				if VpcEntryAnalytics then
					VpcEntryAnalytics.remoteRequestOk()
				end
				OnSuccessFunction()
			end,
			onClose = if VpcEntryAnalytics then function()
				-- upvalues: VpcEntryAnalytics (copy), AuthButtonClickFunction (upval), EntryPointEventCtx (copy), VpcEventConstants (upval), OnSuccessFunction (copy)
				VpcEntryAnalytics.remoteRequestClose()
				AuthButtonClickFunction(EntryPointEventCtx, VpcEventConstants.confirmationPageButton)
				OnSuccessFunction()
			end else nil,
			disablePortal = DisablePortal,
			isInExperienceEntry = IsInExperienceEntry
		})
	elseif UseStateResult == VPCStepEnum.NewParentCollectEmail then
		AuthMsgShownFunction(EntryPointEventCtx, "", VpcEventConstants.collectEmailPageLoadField, "")
		
		return ReactModule.createElement(VPCNewParentUpsellModule, {
			onCancel = function()
				-- upvalues: VpcEntryAnalytics (copy), OnCancelFunction (copy)
				if VpcEntryAnalytics then
					VpcEntryAnalytics.remoteRequestClose()
				end
				OnCancelFunction()
			end,
			onCollectEmailAndSendRequest = function(p2)
				-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), VpcEventConstants (upval), VpcEntryAnalytics (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), VPCStepEnum (upval), sendRequestToNewParent (copy)
				AuthButtonClickFunction(EntryPointEventCtx, VpcEventConstants.collectEmailPageSubmitButton)
				
				if VpcEntryAnalytics then
					VpcEntryAnalytics.remoteEmailSubmit()
				end
				UseStateResult2_1({ p2 })
				UseStateResult2(VPCStepEnum.NewParentSendRequest)
				sendRequestToNewParent(p2)
			end,
			onTextChange = function(p2)
				-- upvalues: AuthFormInteractionFunction (upval), EntryPointEventCtx (copy), VpcEventConstants (upval), VpcEntryAnalytics (copy), UseRefResult1 (copy), handleEmailInput (copy)
				AuthFormInteractionFunction(EntryPointEventCtx, VpcEventConstants.collectEmailPageInteractFormField)
				
				if VpcEntryAnalytics and UseRefResult1 and not UseRefResult1.current and p2 ~= "" then
					UseRefResult1.current = true
					VpcEntryAnalytics.remoteEmailEntered()
				end
				handleEmailInput(p2)
			end,
			canSendRequest = UseStateResult4,
			textInput = UseStateResult5,
			openPrivacyPolicyLink = OpenPrivacyPolicyLink,
			errorText = UseStateResult6,
			messageStrings = VpcUpsellGatherEmailStrings,
			isChildSubjectToParentalControls = UseStateResult3,
			disablePortal = DisablePortal,
			isInExperienceEntry = IsInExperienceEntry
		})
	elseif UseStateResult == VPCStepEnum.AlreadyLinkedSendRequest then
		return nil
	elseif UseStateResult == VPCStepEnum.NewParentSendRequest then
		return nil
	elseif UseStateResult == VPCStepEnum.NewParentLoading then
		return nil
	else
		AuthMsgShownFunction(EntryPointEventCtx, "", VpcEventConstants.errorPageLoadField, Unknown)
		
		return ReactModule.createElement(VPCErrorScreenModule, {
			errorCode = Unknown,
			onRetryAmp = function()
				-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), VpcEventConstants (upval), VpcEntryAnalytics (copy), OnRetryAmpFunction (copy)
				AuthButtonClickFunction(EntryPointEventCtx, VpcEventConstants.errorPageRetryButton)
				
				if VpcEntryAnalytics then
					VpcEntryAnalytics.remoteRequestRetry()
				end
				OnRetryAmpFunction()
			end,
			onRetryVPC = function()
				-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), VpcEventConstants (upval), VpcEntryAnalytics (copy), onRetryVPC (copy)
				AuthButtonClickFunction(EntryPointEventCtx, VpcEventConstants.errorPageRetryButton)
				
				if VpcEntryAnalytics then
					VpcEntryAnalytics.remoteRequestRetry()
				end
				onRetryVPC()
			end,
			onCancel = function()
				-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), VpcEventConstants (upval), VpcEntryAnalytics (copy), OnCancelFunction (copy)
				AuthButtonClickFunction(EntryPointEventCtx, VpcEventConstants.errorPageCancelButton)
				
				if VpcEntryAnalytics then
					VpcEntryAnalytics.remoteRequestCancel()
				end
				OnCancelFunction()
			end,
			onClose = if VpcEntryAnalytics then function()
				-- upvalues: VpcEntryAnalytics (copy), AuthButtonClickFunction (upval), EntryPointEventCtx (copy), VpcEventConstants (upval), OnCancelFunction (copy)
				VpcEntryAnalytics.remoteRequestClose()
				AuthButtonClickFunction(EntryPointEventCtx, VpcEventConstants.errorPageCancelButton)
				OnCancelFunction()
			end else nil,
			onSuccess = function()
				-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), VpcEventConstants (upval), VpcEntryAnalytics (copy), OnSuccessFunction (copy)
				AuthButtonClickFunction(EntryPointEventCtx, VpcEventConstants.confirmationPageButton)
				
				if VpcEntryAnalytics then
					VpcEntryAnalytics.remoteRequestOk()
				end
				OnSuccessFunction()
			end,
			retryNum = UseStateResult7,
			disablePortal = DisablePortal,
			isInExperienceEntry = IsInExperienceEntry
		})
	end
end