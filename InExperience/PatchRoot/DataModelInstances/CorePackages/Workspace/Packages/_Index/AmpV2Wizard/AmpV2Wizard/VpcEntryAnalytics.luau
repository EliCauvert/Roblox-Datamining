local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local _ = require(AmpV2Wizard.Types)
local OdpAnalyticsModule = require(AmpV2Wizard.OdpAnalytics)
local OdpAnalyticsConstantsModule = require(AmpV2Wizard.OdpAnalyticsConstants)
local config = {
	WizardLaunch = "ampWizard",
	Prologue = "odpPrologue",
	RemoteParentRequest = "remoteParentEmailRequest"
}
local Remote = {
	associatedText = "Ask my parent",
	btn = OdpAnalyticsConstantsModule.Buttons.AskParent
}
local Cancel = {
	associatedText = "X icon",
	btn = OdpAnalyticsConstantsModule.Buttons.Close
}
local config1 = {
	odpAndRemote = {
		ODP = {
			associatedText = "Ask in person",
			btn = OdpAnalyticsConstantsModule.Buttons.AskInPerson
		},
		Remote = {
			associatedText = "Send an email",
			btn = OdpAnalyticsConstantsModule.Buttons.EmailParent
		},
		Cancel = Cancel
	},
	remoteOnly = { Remote = Remote, Cancel = Cancel },
	odpOnly = { ODP = Remote, Cancel = Cancel }
}

local function _(p1, p2, p3, p4)
	-- upvalues: OdpAnalyticsModule (copy)
	return OdpAnalyticsModule.joinTokens({
		p1,
		p2,
		OdpAnalyticsModule.childUserId(),
		p3,
		p4
	})
end

local function createVpcEntryAnalytics(AnalyticsStrings, AnalyticsSessionId, Surface, p1)
	-- upvalues: OdpAnalyticsConstantsModule (copy), OdpAnalyticsModule (copy), AuthButtonClickFunction (copy), AuthModalShownFunction (copy), config1 (copy), AuthFormInteractionFunction (copy), config (copy), AuthMsgShownFunction (copy)
	local AnalyticsString = if AnalyticsStrings == nil then nil else AnalyticsStrings[OdpAnalyticsConstantsModule.AGE_GROUP_KEY]
	
	local function _(p2)
		-- upvalues: OdpAnalyticsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), Surface (copy)
		return OdpAnalyticsModule.joinTokens({
			OdpAnalyticsModule.joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				OdpAnalyticsModule.childUserId(),
				Surface,
				nil
			}),
			p2
		})
	end
	
	local JoinTokensResult = OdpAnalyticsModule.joinTokens({
		AnalyticsSessionId,
		AnalyticsString,
		OdpAnalyticsModule.childUserId(),
		Surface,
		p1
	})
	
	local _ = function(p2, p3)
		-- upvalues: AuthButtonClickFunction (upval), JoinTokensResult (copy)
		AuthButtonClickFunction("remoteParentEmailRequest", p2, JoinTokensResult, nil, nil, nil, nil, p3)
	end
	
	return {
		prologueShown = function(p2)
			-- upvalues: AuthModalShownFunction (upval), OdpAnalyticsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), Surface (copy)
			AuthModalShownFunction("odpPrologue", OdpAnalyticsModule.joinTokens({
				OdpAnalyticsModule.joinTokens({
					AnalyticsSessionId,
					AnalyticsString,
					OdpAnalyticsModule.childUserId(),
					Surface,
					nil
				}),
				p2
			}), "askParent", nil, "Ask your parent - You need parent approval to {takeChildAction}.")
		end,
		prologueButtonClick = function(p2, p3)
			-- upvalues: config1 (upval), AuthButtonClickFunction (upval), OdpAnalyticsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), Surface (copy)
			local Entry = config1[p3]
			local Entry1 = if Entry == nil then nil else Entry[p2]
			
			if Entry1 ~= nil then
				AuthButtonClickFunction("odpPrologue", Entry1.btn, OdpAnalyticsModule.joinTokens({
					OdpAnalyticsModule.joinTokens({
						AnalyticsSessionId,
						AnalyticsString,
						OdpAnalyticsModule.childUserId(),
						Surface,
						nil
					}),
					p3
				}), nil, nil, nil, nil, Entry1.associatedText)
				
				return
			end
		end,
		remoteEmailShown = function()
			-- upvalues: AuthModalShownFunction (upval), JoinTokensResult (copy)
			AuthModalShownFunction("remoteParentEmailRequest", JoinTokensResult, "emailModal", nil, "Enter parent's email - Ask your parents to help you with this step. We'll send an email to your parent to verify their age and link them to your account. Parents, after linking, you'll get access to parental controls and insights on your child's screen time, spending, and more.")
		end,
		remoteEmailEntered = function()
			-- upvalues: AuthFormInteractionFunction (upval), JoinTokensResult (copy)
			AuthFormInteractionFunction("remoteParentEmailRequest", "email", JoinTokensResult, nil, nil, "Parent's email")
		end,
		remoteEmailSubmit = function()
			-- upvalues: AuthButtonClickFunction (upval), config (upval), JoinTokensResult (copy)
			AuthButtonClickFunction(config.RemoteParentRequest, "submit", JoinTokensResult, nil, nil, nil, nil, "Send Email")
		end,
		remoteRequestSent = function()
			-- upvalues: AuthMsgShownFunction (upval), JoinTokensResult (copy)
			AuthMsgShownFunction("remoteParentEmailRequest", JoinTokensResult, "requestSent", nil, "Email sent")
		end,
		remoteRequestOk = function()
			-- upvalues: AuthButtonClickFunction (upval), config (upval), JoinTokensResult (copy)
			AuthButtonClickFunction(config.RemoteParentRequest, "ok", JoinTokensResult, nil, nil, nil, nil, "Email sent > OK")
		end,
		remoteRequestError = function(p2)
			-- upvalues: AuthMsgShownFunction (upval), JoinTokensResult (copy)
			AuthMsgShownFunction("remoteParentEmailRequest", JoinTokensResult, "errorMessage", p2 or "unknown")
		end,
		remoteRequestRetry = function()
			-- upvalues: AuthButtonClickFunction (upval), config (upval), JoinTokensResult (copy)
			AuthButtonClickFunction(config.RemoteParentRequest, "retry", JoinTokensResult, nil, nil, nil, nil, "Something went wrong > Retry")
		end,
		remoteRequestCancel = function()
			-- upvalues: OdpAnalyticsConstantsModule (upval), AuthButtonClickFunction (upval), config (upval), JoinTokensResult (copy)
			AuthButtonClickFunction(config.RemoteParentRequest, OdpAnalyticsConstantsModule.Buttons.Cancel, JoinTokensResult, nil, nil, nil, nil, "Something went wrong > Cancel")
		end,
		remoteRequestClose = function()
			-- upvalues: OdpAnalyticsConstantsModule (upval), AuthButtonClickFunction (upval), config (upval), JoinTokensResult (copy)
			AuthButtonClickFunction(config.RemoteParentRequest, OdpAnalyticsConstantsModule.Buttons.Close, JoinTokensResult, nil, nil, nil, nil, "X icon")
		end
	}
end

return {
	getPrologueType = function(p1, p2): string
		return if p1 == 1 then if p2 == "ODP" then "odpOnly" else "remoteOnly" else "odpAndRemote"
	end,
	sendWizardLaunch = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: OdpAnalyticsConstantsModule (copy), OdpAnalyticsModule (copy), AuthPageloadFunction (copy)
		AuthPageloadFunction("ampWizard", OdpAnalyticsModule.joinTokens({
			p2, if p1 == nil then nil else p1[OdpAnalyticsConstantsModule.AGE_GROUP_KEY],
			OdpAnalyticsModule.childUserId(), p3, p4, p5, p6
		}), nil, nil, nil, "AMP wizard launch")
	end,
	createVpcEntryAnalytics = createVpcEntryAnalytics,
	useVpcEntryAnalytics = function(p1, p2)
		-- upvalues: ReactModule (copy), createVpcEntryAnalytics (copy)
		local Surface = p1.analytics.surface
		
		return ReactModule.useMemo(function()
			-- upvalues: createVpcEntryAnalytics (upval), p1 (copy), Surface (copy), p2 (copy)
			return (createVpcEntryAnalytics(p1.analyticsStrings, p1.analyticsSessionId, Surface, p2))
		end, {
			p1.analyticsStrings,
			p1.analyticsSessionId,
			Surface,
			p2
		})
	end
}