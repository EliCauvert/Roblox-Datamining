local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local ContextModule = require(AmpV2Wizard.OdpVerification.Context)
local TypesModule = require(AmpV2Wizard.OdpVerification.Types)
local ResolveVerificationPresentationModule = require(AmpV2Wizard.OdpVerification.resolveVerificationPresentation)
local VerificationDiagnosticsModule = require(AmpV2Wizard.OdpVerification.VerificationDiagnostics)
local FFlagAmpV2WizardVerificationDiagnosticsModule = require(AmpV2Wizard.FFlagAmpV2WizardVerificationDiagnostics)
local VerificationPresentation = ResolveVerificationPresentationModule.VerificationPresentation
local VendorFailure = TypesModule.VendorFailure
local VendorOutcome = TypesModule.VendorOutcome

return function(p1)
	-- upvalues: ReactModule (copy), ContextModule (copy), UseAppPolicyFunction (copy), ResolveVerificationPresentationModule (copy), FFlagAmpV2WizardVerificationDiagnosticsModule (copy), VerificationDiagnosticsModule (copy), VendorOutcome (copy), VendorFailure (copy), VerificationPresentation (copy)
	local UseContextResult = ReactModule.useContext(ContextModule)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getHasWebViewSupportForFAE()
	end)
	local UseRefResult = ReactModule.useRef(p1.onSettled)
	UseRefResult.current = p1.onSettled
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), ResolveVerificationPresentationModule (upval), UseAppPolicyResult (copy), FFlagAmpV2WizardVerificationDiagnosticsModule (upval), VerificationDiagnosticsModule (upval), p1 (copy), VendorOutcome (upval), UseRefResult (copy), VendorFailure (upval), VerificationPresentation (upval)
		local Api = UseContextResult.api
		local PersonaInquiryService = UseContextResult.personaInquiryService
		local OpenWebViewFunction = UseContextResult.openWebView
		local ExternalBrowser = UseContextResult.externalBrowser
		local ResolveVerificationPresentationResult = ResolveVerificationPresentationModule.resolveVerificationPresentation(PersonaInquiryService.isAvailable(), UseAppPolicyResult == true)
		local Flag = false
		local Flag1 = false
		local Callback = nil
		local v1 = nil
		local v2 = "start_request"
		local SessionIdentifier = nil
		local ClockTime = nil
		local v3 = nil
		local DebugMessage = nil
		
		if FFlagAmpV2WizardVerificationDiagnosticsModule then
			local Success, Result = pcall(VerificationDiagnosticsModule.beginAttempt, p1.sessionId, p1.method, ResolveVerificationPresentationResult, p1.flowId, p1.analyticsSessionId)
			
			if Success then
				v1 = Result
			end
		end
		local function settle(Failed, StartFailed)
			-- upvalues: Flag1 (ref), Flag (ref), FFlagAmpV2WizardVerificationDiagnosticsModule (upval), VendorOutcome (upval), v1 (ref), VerificationDiagnosticsModule (upval), v2 (ref), SessionIdentifier (ref), ClockTime (ref), v3 (ref), DebugMessage (ref), UseRefResult (upval)
			if Flag1 or Flag then return end
			Flag1 = true
			local config = { outcome = Failed, failure = StartFailed }
			
			if FFlagAmpV2WizardVerificationDiagnosticsModule and Failed == VendorOutcome.Failed and v1 then
				local Success, Result = pcall(VerificationDiagnosticsModule.completeFailure, v1, v2, SessionIdentifier, ClockTime, v3, DebugMessage)
				
				if Success then
					config.diagnostic = Result
				end
			end
			UseRefResult.current(config)
		end
		
		local function startNative(SessionIdentifier1)
			-- upvalues: FFlagAmpV2WizardVerificationDiagnosticsModule (upval), SessionIdentifier (ref), ClockTime (ref), v2 (ref), PersonaInquiryService (copy), DebugMessage (ref), v3 (ref), settle (copy), VendorOutcome (upval), VendorFailure (upval)
			if FFlagAmpV2WizardVerificationDiagnosticsModule then
				SessionIdentifier = SessionIdentifier1
				ClockTime = os.clock()
				v2 = "inquiry_invocation"
			end
			PersonaInquiryService.startInquiry(SessionIdentifier1):andThen(function(Result)
				-- upvalues: FFlagAmpV2WizardVerificationDiagnosticsModule (upval), DebugMessage (upval), v3 (upval), v2 (upval), settle (upval), VendorOutcome (upval), VendorFailure (upval)
				local FacialAgeEstimationResultType = Result
				
				if FFlagAmpV2WizardVerificationDiagnosticsModule then
					if typeof(Result) == "table" then
						FacialAgeEstimationResultType = Result.resultType
						DebugMessage = Result.debugMessage
					end
					v3 = FacialAgeEstimationResultType
					v2 = "native_result"
				end
				if FacialAgeEstimationResultType == Enum.FacialAgeEstimationResultType.Complete then
					settle(VendorOutcome.Submitted)
					
					return
				end
				if FacialAgeEstimationResultType == Enum.FacialAgeEstimationResultType.Cancel then
					settle(VendorOutcome.Cancelled)
					
					return
				else
					settle(VendorOutcome.Failed, VendorFailure.VendorError)
				end
			end):catch(function(Err)
				-- upvalues: FFlagAmpV2WizardVerificationDiagnosticsModule (upval), v2 (upval), DebugMessage (upval), settle (upval), VendorOutcome (upval), VendorFailure (upval)
				if FFlagAmpV2WizardVerificationDiagnosticsModule then
					v2 = "inquiry_rejection"
					DebugMessage = Err
				end
				settle(VendorOutcome.Failed, VendorFailure.VendorError)
			end)
		end
		
		Api.startOdpVerification({ sessionId = p1.sessionId, verificationType = p1.method }):andThen(function(Result)
			-- upvalues: Flag (ref), FFlagAmpV2WizardVerificationDiagnosticsModule (upval), v2 (ref), SessionIdentifier (ref), ResolveVerificationPresentationResult (copy), VerificationPresentation (upval), settle (copy), VendorOutcome (upval), VendorFailure (upval), startNative (copy), Callback (ref), OpenWebViewFunction (copy), ExternalBrowser (copy)
			if Flag then return end
			if FFlagAmpV2WizardVerificationDiagnosticsModule then
				v2 = "start_response"
				SessionIdentifier = Result.sessionIdentifier
			end
			if ResolveVerificationPresentationResult == VerificationPresentation.Native then
				if Result.sessionIdentifier ~= nil then
					startNative(Result.sessionIdentifier)
					
					return
				end
				if FFlagAmpV2WizardVerificationDiagnosticsModule then
					v2 = "missing_inquiry_id"
				end
				settle(VendorOutcome.Failed, VendorFailure.StartFailed)
				
				return
			elseif Result.verificationLink == nil then
				if FFlagAmpV2WizardVerificationDiagnosticsModule then
					v2 = "missing_verification_link"
				end
				settle(VendorOutcome.Failed, VendorFailure.StartFailed)
				
				return
			elseif ResolveVerificationPresentationResult == VerificationPresentation.InAppWebView then
				if FFlagAmpV2WizardVerificationDiagnosticsModule then
					v2 = "webview_presentation"
				end
				Callback = OpenWebViewFunction(Result.verificationLink, "", function()
					-- upvalues: settle (upval), VendorOutcome (upval)
					settle(VendorOutcome.Submitted)
				end)
				
				return
			else
				if FFlagAmpV2WizardVerificationDiagnosticsModule then
					v2 = "external_presentation"
				end
				ExternalBrowser.open(Result.verificationLink)
				settle(VendorOutcome.Submitted)
			end
		end):catch(function(Err)
			-- upvalues: FFlagAmpV2WizardVerificationDiagnosticsModule (upval), DebugMessage (ref), settle (copy), VendorOutcome (upval), VendorFailure (upval)
			if FFlagAmpV2WizardVerificationDiagnosticsModule then
				DebugMessage = Err
			end
			settle(VendorOutcome.Failed, VendorFailure.StartFailed)
		end)
		
		return function()
			-- upvalues: Flag (ref), Callback (ref)
			Flag = true
			
			if Callback then
				Callback()
			end
		end
	end, { p1.sessionId, p1.method, UseAppPolicyResult })
end