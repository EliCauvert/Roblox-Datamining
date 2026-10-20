local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppScreensModule = require(AmpUpsell.Common.AppScreens)
local IDVWithQRCodeUpsellModule = require(script.Parent.IDVWithQRCodeUpsell)
local IDVApiProvider = require(Parent.IdentityVerification).IDVApiProvider
local GetFStringBiometricPrivacyPolicyLinkModule = require(AmpUpsell.Flags.GetFStringBiometricPrivacyPolicyLink)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local EnumsModule = require(AmpUpsell.Common.Enums)
local IDVStep = EnumsModule.IDVStep
local IDVSessionStatusEnum = require(Parent.IdentityVerification).Enums.IDVSessionStatusEnum
local ActionStatusEnum = EnumsModule.ActionStatusEnum
local IDVErrorScreenModule = require(script.Parent.IDVErrorScreen)
local LocalizationStringsModule = require(AmpUpsell.Common.LocalizationStrings)
local IdvErrorScreenStrings = LocalizationStringsModule.idvErrorScreenStrings
local IdvWithQRCodeUpsellStrings = LocalizationStringsModule.idvWithQRCodeUpsellStrings
local IDVDirectLinkUpsellModule = require(script.Parent.IDVDirectLinkUpsell)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local UseDeviceTypeFunction = RobloxAppHooksModule.useDeviceType
local UseRoactServiceFunction = RobloxAppHooksModule.useRoactService
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local DeviceType = require(Parent.RobloxAppEnums).DeviceType
local GetFFlagEnableDirectLinkForTabletsModule = require(AmpUpsell.Flags.GetFFlagEnableDirectLinkForTablets)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local GetFFlagEnableRoactNetworkingForChallengeInteceptionModule = require(AmpUpsell.Flags.GetFFlagEnableRoactNetworkingForChallengeInteception)
local GetFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule = require(AmpUpsell.Flags.GetFFlagEnableNativePersonaInquiryForAmpIDVUpsell)
local GetFFlagEnableAmpIDVUpsellAnalyticsModule = require(AmpUpsell.Flags.GetFFlagEnableAmpIDVUpsellAnalytics)
local FacialAgeEstimationServiceWrapperModule = require(script.Parent.Parent.FacialAgeEstimation.FacialAgeEstimationServiceWrapper)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local FIntIDVPollDelay = require(Parent.IdentityVerification).GetFIntIDVPollDelay()
local FIntIDVMaxRetries = require(Parent.IdentityVerification).GetFIntIDVMaxRetries()

local function _(Expired): boolean
	-- upvalues: IDVSessionStatusEnum (copy)
	return Expired == IDVSessionStatusEnum.Failure or (Expired == IDVSessionStatusEnum.RequiresManualReview or (Expired == IDVSessionStatusEnum.RequiresRetry or Expired == IDVSessionStatusEnum.Expired))
end

local _ = function(Expired, p1)
	-- upvalues: IDVSessionStatusEnum (copy)
	return if Expired == IDVSessionStatusEnum.Failure or Expired == IDVSessionStatusEnum.RequiresManualReview then p1.declined elseif Expired == IDVSessionStatusEnum.RequiresRetry then p1.retry elseif Expired == IDVSessionStatusEnum.Expired then p1.timeout else p1.retry
end

return function(p1)
	-- upvalues: IDVApiProvider (copy), UseDeviceTypeFunction (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), IdvErrorScreenStrings (copy), IdvWithQRCodeUpsellStrings (copy), ReactModule (copy), ActionStatusEnum (copy), GetFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule (copy), FacialAgeEstimationServiceWrapperModule (copy), GetFFlagEnableDirectLinkForTabletsModule (copy), DeviceType (copy), UseRoactServiceFunction (copy), AppLinking (copy), RoactNetworking (copy), AppScreensModule (copy), GetFStringBiometricPrivacyPolicyLinkModule (copy), IDVSessionStatusEnum (copy), IDVStep (copy), GetFFlagEnableAmpIDVUpsellAnalyticsModule (copy), AuthModalShownFunction (copy), AuthMsgShownFunction (copy), FIntIDVPollDelay (copy), FIntIDVMaxRetries (copy), PromiseModule (copy), GetFFlagEnableRoactNetworkingForChallengeInteceptionModule (copy), AuthFormInteractionFunction (copy), IDVErrorScreenModule (copy), Loading (copy), IconSize (copy), IDVDirectLinkUpsellModule (copy), IDVWithQRCodeUpsellModule (copy)
	local FeatureName = p1.featureName
	local OnSuccessFunction = p1.onSuccess
	local OnFailureFunction = p1.onFailure
	local OnCancelledFunction = p1.onCancelled
	local IdvApiProvider = if p1.idvApiProvider then p1.idvApiProvider else IDVApiProvider
	local DeviceType1 = p1.deviceType or UseDeviceTypeFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction(IdvErrorScreenStrings)
	local UseLocalizationResult1 = UseLocalizationFunction(IdvWithQRCodeUpsellStrings)
	local EntryPointEventCtx = p1.entryPointEventCtx or ""
	local SessionId = p1.metadata and p1.metadata.sessionId or ""
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(ActionStatusEnum.Unknown)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(UseLocalizationResult.retry)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(0)
	local IsAvailable = GetFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and FacialAgeEstimationServiceWrapperModule.isAvailable()
	local IsDeviceTypeMatch: boolean = GetFFlagEnableDirectLinkForTabletsModule() and DeviceType1 == DeviceType.Tablet or DeviceType1 == DeviceType.Phone
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworking)
	local OpenIdvLink = p1.openIdvLink or function(p2)
		-- upvalues: UseRoactServiceResult (copy)
		UseRoactServiceResult:openURL(p2)
	end
	
	local function OpenPrivacyPolicyLink()
		-- upvalues: UseNavigationResult (copy), AppScreensModule (upval), GetFStringBiometricPrivacyPolicyLinkModule (upval), UseLocalizationResult1 (copy)
		UseNavigationResult.navigate(AppScreensModule.GenericWebPage, {
			detail = GetFStringBiometricPrivacyPolicyLinkModule(),
			extraProps = {
				transitionAnimation = "SlideInFromBottom",
				title = UseLocalizationResult1.privacyPageHeader
			}
		})
	end
	
	local function updateChecklist(SessionStatus)
		-- upvalues: IDVSessionStatusEnum (upval), UseStateResult2_5 (copy), IDVStep (upval)
		if SessionStatus == IDVSessionStatusEnum.Stored then
			UseStateResult2_5(IDVStep.UpdatedRobloxProfile)
			
			return
		end
		if SessionStatus == IDVSessionStatusEnum.Success then
			UseStateResult2_5(IDVStep.Verified)
			
			return
		end
		if SessionStatus == IDVSessionStatusEnum.Submitted then
			UseStateResult2_5(IDVStep.GotResults)
			
			return
		end
		if SessionStatus == IDVSessionStatusEnum.Started then
			UseStateResult2_5(IDVStep.ConnectedMobile)
		end
	end
	
	local function _(p2)
		-- upvalues: GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthModalShownFunction (upval), EntryPointEventCtx (copy)
		if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
			AuthModalShownFunction(EntryPointEventCtx, p2, "idvFailed")
		end
	end
	
	local function pollIDVStatus(SessionIdentifier, FIntIDVMaxRetries, SessionId)
		-- upvalues: UseStateResult2_3 (copy), UseStateResult2_4 (copy), UseLocalizationResult (copy), GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthModalShownFunction (upval), EntryPointEventCtx (copy), IdvApiProvider (copy), updateChecklist (copy), IDVSessionStatusEnum (upval), AuthMsgShownFunction (upval), UseStateResult2_2 (copy), ActionStatusEnum (upval), FIntIDVPollDelay (upval), UseStateResult1 (copy), pollIDVStatus (copy)
		if FIntIDVMaxRetries == 0 then
			UseStateResult2_3(true)
			UseStateResult2_4(UseLocalizationResult.timeout)
			
			if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
				AuthModalShownFunction(EntryPointEventCtx, SessionId, "idvFailed")
				
				return
			end
		else
			IdvApiProvider.getVerifiedStatus(SessionIdentifier):andThen(function(Result)
				-- upvalues: updateChecklist (upval), IDVSessionStatusEnum (upval), GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthMsgShownFunction (upval), EntryPointEventCtx (upval), SessionId (copy), UseStateResult2_2 (upval), ActionStatusEnum (upval), UseStateResult2_3 (upval), UseStateResult2_4 (upval), UseLocalizationResult (upval), AuthModalShownFunction (upval), FIntIDVPollDelay (upval), UseStateResult1 (upval), pollIDVStatus (upval), SessionIdentifier (copy), FIntIDVMaxRetries (copy)
				local IsVerified = Result.isVerified
				local SessionStatus = Result.sessionStatus
				updateChecklist(SessionStatus)
				
				if IsVerified and SessionStatus == IDVSessionStatusEnum.Stored then
					if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
						AuthMsgShownFunction(EntryPointEventCtx, SessionId, "idvSuccess")
					end
					UseStateResult2_2(ActionStatusEnum.Success)
					
					return
				elseif SessionStatus == IDVSessionStatusEnum.Failure or (SessionStatus == IDVSessionStatusEnum.RequiresManualReview or (SessionStatus == IDVSessionStatusEnum.RequiresRetry or SessionStatus == IDVSessionStatusEnum.Expired)) then
					UseStateResult2_3(true)
					UseStateResult2_2(ActionStatusEnum.Failure)
					UseStateResult2_4(if SessionStatus == IDVSessionStatusEnum.Failure or SessionStatus == IDVSessionStatusEnum.RequiresManualReview then UseLocalizationResult.declined elseif SessionStatus == IDVSessionStatusEnum.RequiresRetry then UseLocalizationResult.retry elseif SessionStatus == IDVSessionStatusEnum.Expired then UseLocalizationResult.timeout else UseLocalizationResult.retry)
					
					if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
						AuthModalShownFunction(EntryPointEventCtx, SessionId, "idvFailed")
						
						return
					end
				else
					spawn(function()
						-- upvalues: FIntIDVPollDelay (upval), UseStateResult1 (upval), pollIDVStatus (upval), SessionIdentifier (upval), FIntIDVMaxRetries (upval), SessionId (upval)
						wait(FIntIDVPollDelay)
						
						if UseStateResult1 then
							pollIDVStatus(SessionIdentifier, FIntIDVMaxRetries - 1, SessionId)
						end
					end)
				end
			end):catch(function(_)
				-- upvalues: UseStateResult2_3 (upval), UseStateResult2_4 (upval), UseLocalizationResult (upval), SessionId (copy), GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthModalShownFunction (upval), EntryPointEventCtx (upval)
				UseStateResult2_3(true)
				UseStateResult2_4(UseLocalizationResult.retry)
				
				if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
					AuthModalShownFunction(EntryPointEventCtx, SessionId, "idvFailed")
				end
			end)
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), GetFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule (upval), FacialAgeEstimationServiceWrapperModule (upval), GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), SessionId (copy), AuthModalShownFunction (upval), EntryPointEventCtx (copy), pollIDVStatus (copy), FIntIDVMaxRetries (upval), IsDeviceTypeMatch (copy), UseStateResult2 (copy), PromiseModule (upval), GetFFlagEnableRoactNetworkingForChallengeInteceptionModule (upval), IdvApiProvider (copy), UseRoactServiceResult1 (copy), AuthFormInteractionFunction (upval), UseStateResult2_2 (copy), ActionStatusEnum (upval), UseStateResult2_3 (copy), UseStateResult2_4 (copy), UseLocalizationResult (copy)
		UseStateResult2_1(true)
		local IsAvailable = GetFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and FacialAgeEstimationServiceWrapperModule.isAvailable()
		local FFlagEnableAmpIDVUpsellAnalyticsModule = GetFFlagEnableAmpIDVUpsellAnalyticsModule()
		local Text = SessionId;
		(if GetFFlagEnableRoactNetworkingForChallengeInteceptionModule() then IdvApiProvider.startVerificationWithWrappedNetworking(UseRoactServiceResult1) else IdvApiProvider.startVerification()):andThen(function(Result)
			-- upvalues: FFlagEnableAmpIDVUpsellAnalyticsModule (copy), Text (ref), SessionId (upval), IsAvailable (copy), AuthModalShownFunction (upval), EntryPointEventCtx (upval), FacialAgeEstimationServiceWrapperModule (upval), pollIDVStatus (upval), FIntIDVMaxRetries (upval), IsDeviceTypeMatch (upval), UseStateResult2 (upval), PromiseModule (upval)
			local SessionIdentifier = Result.sessionIdentifier
			
			if FFlagEnableAmpIDVUpsellAnalyticsModule then
				Text = `{SessionId}_{SessionIdentifier}`
			end
			if IsAvailable then
				if FFlagEnableAmpIDVUpsellAnalyticsModule then
					AuthModalShownFunction(EntryPointEventCtx, Text, "nativeIDV")
				end
				return FacialAgeEstimationServiceWrapperModule.startFlow(SessionIdentifier, Result.sessionToken):andThen(function()
					-- upvalues: pollIDVStatus (upval), SessionIdentifier (copy), FIntIDVMaxRetries (upval), Text (upval)
					pollIDVStatus(SessionIdentifier, FIntIDVMaxRetries, Text)
				end)
			else
				if FFlagEnableAmpIDVUpsellAnalyticsModule then
					AuthModalShownFunction(EntryPointEventCtx, Text, if IsDeviceTypeMatch then "idvDirectLink" else "idvQRCode")
				end
				pollIDVStatus(SessionIdentifier, FIntIDVMaxRetries, Text)
				UseStateResult2(Result.verificationLink)
				
				return PromiseModule.resolve()
			end
		end):catch(function(Err)
			-- upvalues: IsAvailable (copy), FFlagEnableAmpIDVUpsellAnalyticsModule (copy), AuthFormInteractionFunction (upval), EntryPointEventCtx (upval), Text (ref), UseStateResult2_2 (upval), ActionStatusEnum (upval), UseStateResult2_3 (upval), UseStateResult2_4 (upval), UseLocalizationResult (upval), AuthModalShownFunction (upval)
			if IsAvailable and Err and Err.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				if FFlagEnableAmpIDVUpsellAnalyticsModule then
					AuthFormInteractionFunction(EntryPointEventCtx, Text, "idvCancelled")
				end
				UseStateResult2_2(ActionStatusEnum.Cancelled)
				
				return
			else
				UseStateResult2_3(true)
				UseStateResult2_4(UseLocalizationResult.retry)
				
				if FFlagEnableAmpIDVUpsellAnalyticsModule then
					AuthModalShownFunction(EntryPointEventCtx, Text, "idvFailed")
				end
			end
		end)
		
		return function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(false)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult3 (copy), ActionStatusEnum (upval), OnSuccessFunction (copy), OnCancelledFunction (copy)
		if UseStateResult3 == ActionStatusEnum.Success then
			OnSuccessFunction()
			
			return
		end
		if UseStateResult3 == ActionStatusEnum.Cancelled then
			OnCancelledFunction()
		end
	end, { UseStateResult3 })
	
	return if UseStateResult4 then ReactModule.createElement(IDVErrorScreenModule, {
		errorTitle = UseLocalizationResult.title,
		errorDescription = UseStateResult5,
		buttonText = UseLocalizationResult.close,
		onClose = function()
			-- upvalues: OnFailureFunction (copy)
			OnFailureFunction()
		end
	}) elseif IsAvailable and UseStateResult3 == ActionStatusEnum.Cancelled then nil elseif IsAvailable and not UseStateResult4 and (UseStateResult3 == ActionStatusEnum.Unknown or UseStateResult3 == ActionStatusEnum.Success) then ReactModule.createElement(Loading, {
		size = IconSize.Large,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}) elseif IsDeviceTypeMatch then ReactModule.createElement(IDVDirectLinkUpsellModule, {
		featureName = FeatureName,
		idvLink = UseStateResult,
		openIdvLink = OpenIdvLink,
		onClose = function()
			-- upvalues: GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthFormInteractionFunction (upval), EntryPointEventCtx (copy), SessionId (copy), UseStateResult2_2 (copy), ActionStatusEnum (upval)
			if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
				AuthFormInteractionFunction(EntryPointEventCtx, SessionId, "idvCancelled")
			end
			UseStateResult2_2(ActionStatusEnum.Cancelled)
		end,
		openPrivacyPolicyLink = OpenPrivacyPolicyLink,
		latestStepCompleted = UseStateResult6
	}) else ReactModule.createElement(IDVWithQRCodeUpsellModule, {
		qrCodeLink = UseStateResult,
		featureName = FeatureName,
		openPrivacyPolicyLink = OpenPrivacyPolicyLink,
		latestStepCompleted = UseStateResult6,
		onClose = function()
			-- upvalues: GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthFormInteractionFunction (upval), EntryPointEventCtx (copy), SessionId (copy), UseStateResult2_2 (copy), ActionStatusEnum (upval)
			if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
				AuthFormInteractionFunction(EntryPointEventCtx, SessionId, "idvCancelled")
			end
			UseStateResult2_2(ActionStatusEnum.Cancelled)
		end
	})
end