local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local upsellCardModalActionModule = require(phoneUpsell.DuplicateAnalytics.upsellCardModalAction)
local upsellCardFormInteractionModule = require(phoneUpsell.DuplicateAnalytics.upsellCardFormInteraction)
local eventStreamConstantsModule = require(phoneUpsell.DuplicateAnalytics.EventStreamConstants)
local roactAnalytics = require(parent.RoactServiceTags).RoactAnalytics

return {
	get = function(p0) --[[ line: 16 ]]
		-- upvalues: roactAnalytics (ref), upsellCardModalActionModule (ref), eventStreamConstantsModule (ref), upsellCardFormInteractionModule (ref)
		local var4 = roactAnalytics.get(p0)
		
		return {
			reportModalShownWithSection = function(p1, p2, p3) --[[ line: 21 ]]
				-- upvalues: upsellCardModalActionModule (copy), var4 (ref), eventStreamConstantsModule (copy)
				upsellCardModalActionModule(var4.EventStream, p1, "", eventStreamConstantsModule.ActionType.Shown, p2, p3)
			end,
			reportModalShownWithSectionAndError = function(p4, p5, p6, p7, p8) --[[ line: 32 ]]
				-- upvalues: upsellCardModalActionModule (copy), var4 (ref), eventStreamConstantsModule (copy)
				upsellCardModalActionModule(var4.EventStream, p4, p5, eventStreamConstantsModule.ActionType.Shown, p6, p7, p8)
			end,
			reportModalDismissedWithSection = function(p9, p10, p11) --[[ line: 44 ]]
				-- upvalues: upsellCardModalActionModule (copy), var4 (ref), eventStreamConstantsModule (copy)
				upsellCardModalActionModule(var4.EventStream, p9, "", eventStreamConstantsModule.ActionType.Dismiss, p10, p11)
			end,
			reportModalActionWithSection = function(p12, p13, p14, p15, p16, p17) --[[ line: 55 ]]
				-- upvalues: upsellCardModalActionModule (copy), var4 (ref)
				upsellCardModalActionModule(var4.EventStream, p12, p13, p14, p15, p16, p17)
			end,
			reportInteractWithActionAndSection = function(p18, p19, p20, p21, p22, p23) --[[ line: 59 ]]
				-- upvalues: upsellCardFormInteractionModule (copy), var4 (ref)
				upsellCardFormInteractionModule(var4.EventStream, p18, p19, p20, p21, p22, p23)
			end
		}
	end
}