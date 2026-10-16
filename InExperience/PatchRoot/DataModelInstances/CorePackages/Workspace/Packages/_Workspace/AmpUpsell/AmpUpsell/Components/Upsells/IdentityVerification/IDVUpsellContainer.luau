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

local function _(Expired): boolean --[[ Line: 65 | Named "isFailure" ]]
	-- upvalues: IDVSessionStatusEnum (copy)
	return Expired == IDVSessionStatusEnum.Failure or (Expired == IDVSessionStatusEnum.RequiresManualReview or (Expired == IDVSessionStatusEnum.RequiresRetry or Expired == IDVSessionStatusEnum.Expired))
end

local _ = function(Expired, p1) --[[ Line: 72 | Named "getErrorDescription" ]]
	-- upvalues: IDVSessionStatusEnum (copy)
	return if Expired == IDVSessionStatusEnum.Failure or Expired == IDVSessionStatusEnum.RequiresManualReview then p1.declined elseif Expired == IDVSessionStatusEnum.RequiresRetry then p1.retry elseif Expired == IDVSessionStatusEnum.Expired then p1.timeout else p1.retry
end

return function(p1) --[[ Line: 84 | Named "IDVUpsellContainer" ]]
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
	local UseRefResult = ReactModule.useRef(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(ActionStatusEnum.Unknown)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(UseLocalizationResult.retry)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(0)
	local IsAvailable = GetFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and FacialAgeEstimationServiceWrapperModule.isAvailable()
	local IsDeviceTypeMatch: boolean = GetFFlagEnableDirectLinkForTabletsModule() and DeviceType1 == DeviceType.Tablet or DeviceType1 == DeviceType.Phone
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworking)
	local SchedulePoll = p1.schedulePoll or function(Callback, p2) --[[ Line: 111 ]]
		spawn(function() --[[ Line: 112 ]]
			-- upvalues: p2 (copy), Callback (copy)
			wait(p2)
			Callback()
		end)
	end
	local OpenIdvLink = p1.openIdvLink or function(p2) --[[ Line: 118 ]]
		-- upvalues: UseRoactServiceResult (copy)
		UseRoactServiceResult:openURL(p2)
	end
	
	local function OpenPrivacyPolicyLink() --[[ Line: 122 ]]
		-- upvalues: UseNavigationResult (copy), AppScreensModule (upval), GetFStringBiometricPrivacyPolicyLinkModule (upval), UseLocalizationResult1 (copy)
		UseNavigationResult.navigate(AppScreensModule.GenericWebPage, {
			detail = GetFStringBiometricPrivacyPolicyLinkModule(),
			extraProps = {
				transitionAnimation = "SlideInFromBottom",
				title = UseLocalizationResult1.privacyPageHeader
			}
		})
	end
	
	local function updateChecklist(SessionStatus) --[[ Line: 132 ]]
		-- upvalues: IDVSessionStatusEnum (upval), UseStateResult2_4 (copy), IDVStep (upval)
		if SessionStatus == IDVSessionStatusEnum.Stored then
			UseStateResult2_4(IDVStep.UpdatedRobloxProfile)
			
			return
		end
		if SessionStatus == IDVSessionStatusEnum.Success then
			UseStateResult2_4(IDVStep.Verified)
			
			return
		end
		if SessionStatus == IDVSessionStatusEnum.Submitted then
			UseStateResult2_4(IDVStep.GotResults)
			
			return
		end
		if SessionStatus == IDVSessionStatusEnum.Started then
			UseStateResult2_4(IDVStep.ConnectedMobile)
		end
	end
	
	local function _(p2) --[[ Line: 146 | Named "reportErrorShown" ]]
		-- upvalues: GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthModalShownFunction (upval), EntryPointEventCtx (copy)
		if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
			AuthModalShownFunction(EntryPointEventCtx, p2, "idvFailed")
		end
	end
	
	local function pollIDVStatus(SessionIdentifier, FIntIDVMaxRetries, SessionId) --[[ Line: 152 ]]
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseLocalizationResult (copy), GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthModalShownFunction (upval), EntryPointEventCtx (copy), IdvApiProvider (copy), updateChecklist (copy), IDVSessionStatusEnum (upval), AuthMsgShownFunction (upval), UseStateResult2_1 (copy), ActionStatusEnum (upval), SchedulePoll (copy), UseRefResult (copy), pollIDVStatus (copy), FIntIDVPollDelay (upval)
		if FIntIDVMaxRetries == 0 then
			UseStateResult2_2(true)
			UseStateResult2_3(UseLocalizationResult.timeout)
			
			if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
				AuthModalShownFunction(EntryPointEventCtx, SessionId, "idvFailed")
				
				return
			end
		else
			IdvApiProvider.getVerifiedStatus(SessionIdentifier):andThen(function(Result) --[[ Line: 160 ]]
				-- upvalues: updateChecklist (upval), IDVSessionStatusEnum (upval), GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthMsgShownFunction (upval), EntryPointEventCtx (upval), SessionId (copy), UseStateResult2_1 (upval), ActionStatusEnum (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval), UseLocalizationResult (upval), AuthModalShownFunction (upval), SchedulePoll (upval), UseRefResult (upval), pollIDVStatus (upval), SessionIdentifier (copy), FIntIDVMaxRetries (copy), FIntIDVPollDelay (upval)
				local IsVerified = Result.isVerified
				local SessionStatus = Result.sessionStatus
				updateChecklist(SessionStatus)
				
				if IsVerified and SessionStatus == IDVSessionStatusEnum.Stored then
					if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
						AuthMsgShownFunction(EntryPointEventCtx, SessionId, "idvSuccess")
					end
					UseStateResult2_1(ActionStatusEnum.Success)
					
					return
				elseif SessionStatus == IDVSessionStatusEnum.Failure or (SessionStatus == IDVSessionStatusEnum.RequiresManualReview or (SessionStatus == IDVSessionStatusEnum.RequiresRetry or SessionStatus == IDVSessionStatusEnum.Expired)) then
					UseStateResult2_2(true)
					UseStateResult2_1(ActionStatusEnum.Failure)
					UseStateResult2_3(if SessionStatus == IDVSessionStatusEnum.Failure or SessionStatus == IDVSessionStatusEnum.RequiresManualReview then UseLocalizationResult.declined elseif SessionStatus == IDVSessionStatusEnum.RequiresRetry then UseLocalizationResult.retry elseif SessionStatus == IDVSessionStatusEnum.Expired then UseLocalizationResult.timeout else UseLocalizationResult.retry)
					
					if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
						AuthModalShownFunction(EntryPointEventCtx, SessionId, "idvFailed")
						
						return
					end
				else
					SchedulePoll(function() --[[ Line: 176 ]]
						-- upvalues: UseRefResult (upval), pollIDVStatus (upval), SessionIdentifier (upval), FIntIDVMaxRetries (upval), SessionId (upval)
						if UseRefResult.current then
							pollIDVStatus(SessionIdentifier, FIntIDVMaxRetries - 1, SessionId)
						end
					end, FIntIDVPollDelay)
				end
			end):catch(function(_) --[[ Line: 183 ]]
				-- upvalues: UseStateResult2_2 (upval), UseStateResult2_3 (upval), UseLocalizationResult (upval), SessionId (copy), GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthModalShownFunction (upval), EntryPointEventCtx (upval)
				UseStateResult2_2(true)
				UseStateResult2_3(UseLocalizationResult.retry)
				
				if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
					AuthModalShownFunction(EntryPointEventCtx, SessionId, "idvFailed")
				end
			end)
		end
	end
	
	ReactModule.useEffect(function() --[[ Line: 191 ]]
		-- upvalues: UseRefResult (copy), GetFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule (upval), FacialAgeEstimationServiceWrapperModule (upval), GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), SessionId (copy), AuthModalShownFunction (upval), EntryPointEventCtx (copy), pollIDVStatus (copy), FIntIDVMaxRetries (upval), IsDeviceTypeMatch (copy), UseStateResult2 (copy), PromiseModule (upval), GetFFlagEnableRoactNetworkingForChallengeInteceptionModule (upval), IdvApiProvider (copy), UseRoactServiceResult1 (copy), AuthFormInteractionFunction (upval), UseStateResult2_1 (copy), ActionStatusEnum (upval), UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseLocalizationResult (copy)
		UseRefResult.current = true
		local IsAvailable = GetFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and FacialAgeEstimationServiceWrapperModule.isAvailable()
		local FFlagEnableAmpIDVUpsellAnalyticsModule = GetFFlagEnableAmpIDVUpsellAnalyticsModule()
		local Text = SessionId;
		(if GetFFlagEnableRoactNetworkingForChallengeInteceptionModule() then IdvApiProvider.startVerificationWithWrappedNetworking(UseRoactServiceResult1) else IdvApiProvider.startVerification()):andThen(function(Result) --[[ Line: 198 | Named "afterStartVerification" ]]
			-- upvalues: FFlagEnableAmpIDVUpsellAnalyticsModule (copy), Text (ref), SessionId (upval), IsAvailable (copy), AuthModalShownFunction (upval), EntryPointEventCtx (upval), FacialAgeEstimationServiceWrapperModule (upval), pollIDVStatus (upval), FIntIDVMaxRetries (upval), IsDeviceTypeMatch (upval), UseStateResult2 (upval), PromiseModule (upval)
			local SessionIdentifier = Result.sessionIdentifier
			
			if FFlagEnableAmpIDVUpsellAnalyticsModule then
				Text = `{SessionId}_{SessionIdentifier}`
			end
			if IsAvailable then
				if FFlagEnableAmpIDVUpsellAnalyticsModule then
					AuthModalShownFunction(EntryPointEventCtx, Text, "nativeIDV")
				end
				return FacialAgeEstimationServiceWrapperModule.startFlow(SessionIdentifier, Result.sessionToken):andThen(function() --[[ Line: 209 ]]
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
		end):catch(function(Err) --[[ Line: 227 ]]
			-- upvalues: IsAvailable (copy), FFlagEnableAmpIDVUpsellAnalyticsModule (copy), AuthFormInteractionFunction (upval), EntryPointEventCtx (upval), Text (ref), UseStateResult2_1 (upval), ActionStatusEnum (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval), UseLocalizationResult (upval), AuthModalShownFunction (upval)
			if IsAvailable and Err and Err.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				if FFlagEnableAmpIDVUpsellAnalyticsModule then
					AuthFormInteractionFunction(EntryPointEventCtx, Text, "idvCancelled")
				end
				UseStateResult2_1(ActionStatusEnum.Cancelled)
				
				return
			else
				UseStateResult2_2(true)
				UseStateResult2_3(UseLocalizationResult.retry)
				
				if FFlagEnableAmpIDVUpsellAnalyticsModule then
					AuthModalShownFunction(EntryPointEventCtx, Text, "idvFailed")
				end
			end
		end)
		
		return function() --[[ Line: 242 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 248 ]]
		-- upvalues: UseStateResult1 (copy), ActionStatusEnum (upval), OnSuccessFunction (copy), OnCancelledFunction (copy)
		if UseStateResult1 == ActionStatusEnum.Success then
			OnSuccessFunction()
			
			return
		end
		if UseStateResult1 == ActionStatusEnum.Cancelled then
			OnCancelledFunction()
		end
	end, { UseStateResult1 })
	
	return if UseStateResult3 then ReactModule.createElement(IDVErrorScreenModule, {
		errorTitle = UseLocalizationResult.title,
		errorDescription = UseStateResult4,
		buttonText = UseLocalizationResult.close,
		onClose = function() --[[ Line: 261 ]]
			-- upvalues: OnFailureFunction (copy)
			OnFailureFunction()
		end
	}) elseif IsAvailable and UseStateResult1 == ActionStatusEnum.Cancelled then nil elseif IsAvailable and not UseStateResult3 and (UseStateResult1 == ActionStatusEnum.Unknown or UseStateResult1 == ActionStatusEnum.Success) then ReactModule.createElement(Loading, {
		size = IconSize.Large,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}) elseif IsDeviceTypeMatch then ReactModule.createElement(IDVDirectLinkUpsellModule, {
		featureName = FeatureName,
		idvLink = UseStateResult,
		openIdvLink = OpenIdvLink,
		onClose = function() --[[ Line: 283 ]]
			-- upvalues: GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthFormInteractionFunction (upval), EntryPointEventCtx (copy), SessionId (copy), UseStateResult2_1 (copy), ActionStatusEnum (upval)
			if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
				AuthFormInteractionFunction(EntryPointEventCtx, SessionId, "idvCancelled")
			end
			UseStateResult2_1(ActionStatusEnum.Cancelled)
		end,
		openPrivacyPolicyLink = OpenPrivacyPolicyLink,
		latestStepCompleted = UseStateResult5
	}) else ReactModule.createElement(IDVWithQRCodeUpsellModule, {
		qrCodeLink = UseStateResult,
		featureName = FeatureName,
		openPrivacyPolicyLink = OpenPrivacyPolicyLink,
		latestStepCompleted = UseStateResult5,
		onClose = function() --[[ Line: 298 ]]
			-- upvalues: GetFFlagEnableAmpIDVUpsellAnalyticsModule (upval), AuthFormInteractionFunction (upval), EntryPointEventCtx (copy), SessionId (copy), UseStateResult2_1 (copy), ActionStatusEnum (upval)
			if GetFFlagEnableAmpIDVUpsellAnalyticsModule() then
				AuthFormInteractionFunction(EntryPointEventCtx, SessionId, "idvCancelled")
			end
			UseStateResult2_1(ActionStatusEnum.Cancelled)
		end
	})
end