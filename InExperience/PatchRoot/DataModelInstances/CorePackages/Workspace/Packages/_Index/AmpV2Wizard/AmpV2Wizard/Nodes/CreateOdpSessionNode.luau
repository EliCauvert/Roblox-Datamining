local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local ReactModule = require(AmpV2Wizard.Parent.React)
local _ = require(AmpV2Wizard.Types)
local WizardSpinnerModule = require(AmpV2Wizard.WizardSpinner)
local OdpSessionApiContextModule = require(AmpV2Wizard.OdpSessionApiContext)

return function(p1)
	-- upvalues: ReactModule (copy), OdpSessionApiContextModule (copy), WizardSpinnerModule (copy)
	local ReportFunction = p1.report
	local Props = p1.props
	local UseContextResult = ReactModule.useContext(OdpSessionApiContextModule)
	ReactModule.useEffect(function()
		-- upvalues: Props (copy), UseContextResult (copy), ReportFunction (copy)
		local Flag = false
		UseContextResult.startOdpSession({
			requestType = Props.requestType,
			requestDetails = Props.requestDetails,
			isOdpInitiatedRequest = Props.isOdpInitiated,
			odpProfileId = Props.odpProfileId
		}):andThen(function(Result)
			-- upvalues: Flag (ref), ReportFunction (upval)
			if not Flag then
				ReportFunction("Success", { odpSessionId = Result.odpSessionId })
			end
		end):catch(function()
			-- upvalues: Flag (ref), ReportFunction (upval)
			if not Flag then
				ReportFunction("Error")
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {})
	
	return ReactModule.createElement(WizardSpinnerModule)
end