local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local ReactModule = require(AmpV2Wizard.Parent.React)
local _ = require(AmpV2Wizard.Types)
local OdpAnalyticsModule = require(AmpV2Wizard.OdpAnalytics)
local WizardSpinnerModule = require(AmpV2Wizard.WizardSpinner)
local UseOdpVerificationModule = require(AmpV2Wizard.OdpVerification.useOdpVerification)
local FFlagAmpV2WizardVerificationDiagnosticsModule = require(AmpV2Wizard.FFlagAmpV2WizardVerificationDiagnostics)
local VendorOutcome = require(AmpV2Wizard.OdpVerification.Types).VendorOutcome

return function(Method)
	-- upvalues: OdpAnalyticsModule (copy), UseOdpVerificationModule (copy), FFlagAmpV2WizardVerificationDiagnosticsModule (copy), VendorOutcome (copy), ReactModule (copy), WizardSpinnerModule (copy)
	return function(p1)
		-- upvalues: OdpAnalyticsModule (upval), UseOdpVerificationModule (upval), Method (copy), FFlagAmpV2WizardVerificationDiagnosticsModule (upval), VendorOutcome (upval), ReactModule (upval), WizardSpinnerModule (upval)
		local ReportFunction = p1.report
		local UseOdpAnalyticsResult = OdpAnalyticsModule.useOdpAnalytics(p1.ctx)
		UseOdpVerificationModule({
			sessionId = p1.props.sessionId or "",
			method = Method,
			flowId = if FFlagAmpV2WizardVerificationDiagnosticsModule and p1.ctx.analytics then p1.ctx.analytics.flowId else nil,
			analyticsSessionId = if FFlagAmpV2WizardVerificationDiagnosticsModule then p1.ctx.analyticsSessionId else nil,
			onSettled = function(p2)
				-- upvalues: VendorOutcome (upval), ReportFunction (copy), UseOdpAnalyticsResult (copy), Method (upval), FFlagAmpV2WizardVerificationDiagnosticsModule (upval)
				if p2.outcome == VendorOutcome.Submitted then
					ReportFunction("Submitted")
					
					return
				end
				if p2.outcome == VendorOutcome.Cancelled then
					ReportFunction("Cancel")
					
					return
				end
				UseOdpAnalyticsResult.verificationFailed(Method, p2.failure)
				
				if FFlagAmpV2WizardVerificationDiagnosticsModule then
					ReportFunction("Failure", { reason = p2.failure, diagnostic = p2.diagnostic })
					
					return
				else
					ReportFunction("Failure", { reason = p2.failure })
				end
			end
		})
		
		return ReactModule.createElement(WizardSpinnerModule)
	end
end