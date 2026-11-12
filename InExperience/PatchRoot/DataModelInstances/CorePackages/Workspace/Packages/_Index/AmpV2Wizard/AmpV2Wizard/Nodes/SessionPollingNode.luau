local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local ReactModule = require(AmpV2Wizard.Parent.React)
local _ = require(AmpV2Wizard.Types)
local WizardSpinnerModule = require(AmpV2Wizard.WizardSpinner)
local AuthorizationLoadingModalModule = require(AmpV2Wizard.AuthorizationLoadingModal)
local FFlagAmpV2WizardAuthorizationModalModule = require(AmpV2Wizard.FFlagAmpV2WizardAuthorizationModal)

return function(p1)
	-- upvalues: ReactModule (copy), FFlagAmpV2WizardAuthorizationModalModule (copy), AuthorizationLoadingModalModule (copy), WizardSpinnerModule (copy)
	local ReportFunction = p1.report
	local Props = p1.props
	local PollIntervalMs = Props.pollIntervalMs or 2000
	ReactModule.useEffect(function()
		-- upvalues: PollIntervalMs (copy), ReportFunction (copy)
		local DelayedThread = task.delay(PollIntervalMs / 1000, function()
			-- upvalues: ReportFunction (upval)
			ReportFunction("Poll")
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { Props, PollIntervalMs, ReportFunction })
	
	return if FFlagAmpV2WizardAuthorizationModalModule and p1.dismiss ~= nil then ReactModule.createElement(AuthorizationLoadingModalModule, { onCancel = p1.dismiss }) else ReactModule.createElement(WizardSpinnerModule)
end