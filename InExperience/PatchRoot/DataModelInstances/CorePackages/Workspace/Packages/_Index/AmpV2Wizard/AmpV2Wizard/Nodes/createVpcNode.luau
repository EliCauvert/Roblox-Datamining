local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local _ = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(AmpV2Wizard.Types)
local CreateUpsellNodeModule = require(AmpV2Wizard.Nodes.createUpsellNode)
local OdpAnalyticsModule = require(AmpV2Wizard.OdpAnalytics)
local VpcEntryAnalyticsModule = require(AmpV2Wizard.VpcEntryAnalytics)
local FFlagLuaAppOdpRequestSentToast = require(Parent.SharedFlags).FFlagLuaAppOdpRequestSentToast
local FFlagLuaAppAmpWizardSendAnalyticsSessionId = require(Parent.SharedFlags).FFlagLuaAppAmpWizardSendAnalyticsSessionId

return function(RecourseAction)
	-- upvalues: CreateUpsellNodeModule (copy), OdpAnalyticsModule (copy), AppPage (copy), FFlagLuaAppAmpWizardSendAnalyticsSessionId (copy), VpcEntryAnalyticsModule (copy), FFlagLuaAppOdpRequestSentToast (copy)
	return CreateUpsellNodeModule(function(p1, p2, p3, Callback)
		-- upvalues: OdpAnalyticsModule (upval), AppPage (upval), RecourseAction (copy), FFlagLuaAppAmpWizardSendAnalyticsSessionId (upval), VpcEntryAnalyticsModule (upval), FFlagLuaAppOdpRequestSentToast (upval)
		local OdpAnalytics = OdpAnalyticsModule.createOdpAnalytics(p3.analyticsStrings)
		
		local function _(p4)
			-- upvalues: p1 (copy), Callback (copy)
			p1.navigation.pop()
			Callback(p4)
		end
		
		p1.navigation.push(AppPage.VPCUpsellContainer, {
			extraProps = {
				recourseAction = RecourseAction,
				parentConsentTypes = if p2.requestType then { p2.requestType } else nil,
				recourseData = p2.requestDetails,
				isInExperienceEntry = p2.isInExperienceEntry,
				entryPointEventCtx = p3.analytics.flowId,
				analyticsSessionId = if FFlagLuaAppAmpWizardSendAnalyticsSessionId then p3.analyticsSessionId else nil,
				vpcEntryAnalytics = if FFlagLuaAppAmpWizardSendAnalyticsSessionId then VpcEntryAnalyticsModule.createVpcEntryAnalytics(p3.analyticsStrings, p3.analyticsSessionId, p3.analytics.surface, p2.requestType) else nil,
				onRequestSent = if FFlagLuaAppOdpRequestSentToast then function(_)
					-- upvalues: OdpAnalytics (copy), p3 (copy)
					OdpAnalytics.remoteRequestSent(p3.odpEventContext, p3.analyticsSessionId, p3.launchProps)
				end else nil,
				onSuccess = function()
					-- upvalues: p1 (copy), Callback (copy)
					p1.navigation.pop()
					Callback("Success")
				end,
				onCancel = function()
					-- upvalues: p1 (copy), Callback (copy)
					p1.navigation.pop()
					Callback("Cancel")
				end,
				onRetryAmp = function()
					-- upvalues: p1 (copy), Callback (copy)
					p1.navigation.pop()
					Callback("RetryAmp")
				end
			}
		})
	end)
end