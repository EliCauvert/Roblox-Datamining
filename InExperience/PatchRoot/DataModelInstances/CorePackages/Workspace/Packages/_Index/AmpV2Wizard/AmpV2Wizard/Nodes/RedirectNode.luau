local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(AmpV2Wizard.Types)
local WizardSpinnerModule = require(AmpV2Wizard.WizardSpinner)
local WithAnalyticsSessionIdModule = require(AmpV2Wizard.withAnalyticsSessionId)

return function(p1)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), WithAnalyticsSessionIdModule (copy), AppPage (copy), WizardSpinnerModule (copy)
	local ReportFunction = p1.report
	local Props = p1.props
	local AnalyticsSessionId = p1.ctx.analyticsSessionId
	local UseNavigationResult = UseNavigationFunction()
	ReactModule.useEffect(function()
		-- upvalues: Props (copy), ReportFunction (copy), p1 (copy), WithAnalyticsSessionIdModule (upval), AnalyticsSessionId (copy), UseNavigationResult (copy), AppPage (upval)
		local Url = Props.url
		
		if type(Url) ~= "string" or Url == "" then
			ReportFunction("__invalidRedirect__")
			
			return
		end
		local OnTerminalRedirectFunction: (any, any) -> () = p1.ctx.onTerminalRedirect
		
		if OnTerminalRedirectFunction == nil or p1.transitions == nil or p1.transitions.Done == nil or p1.transitions.Done.kind ~= "Exit" then
			UseNavigationResult.push(AppPage.GenericWebPage, {
				detail = WithAnalyticsSessionIdModule(Url, AnalyticsSessionId),
				extraProps = {
					title = Props.title or "",
					onClose = function()
						-- upvalues: ReportFunction (upval)
						ReportFunction("Done")
					end
				}
			})
			
			return
		else
			OnTerminalRedirectFunction(WithAnalyticsSessionIdModule(Url, AnalyticsSessionId), Props.title or "")
			ReportFunction("Done")
		end
	end, { Props, ReportFunction })
	
	return ReactModule.createElement(WizardSpinnerModule)
end