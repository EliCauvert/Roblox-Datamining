local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local upsellCardModalActionModule = require(phoneUpsell.DuplicateAnalytics.upsellCardModalAction)
local upsellCardFormInteractionModule = require(phoneUpsell.DuplicateAnalytics.upsellCardFormInteraction)
local eventStreamConstantsModule = require(phoneUpsell.DuplicateAnalytics.EventStreamConstants)
local roactAnalytics = require(parent.RoactServiceTags).RoactAnalytics

return {
	get = function(p1)
		-- upvalues: roactAnalytics (ref), upsellCardModalActionModule (ref), eventStreamConstantsModule (ref), upsellCardFormInteractionModule (ref)
		local var1 = roactAnalytics.get(p1)
		
		return {
			reportModalShownWithSection = function(p2, p3, p4)
				-- upvalues: upsellCardModalActionModule (copy), var1 (ref), eventStreamConstantsModule (copy)
				upsellCardModalActionModule(var1.EventStream, p2, "", eventStreamConstantsModule.ActionType.Shown, p3, p4)
			end,
			reportModalShownWithSectionAndError = function(p2, p3, p4, p5, p6)
				-- upvalues: upsellCardModalActionModule (copy), var1 (ref), eventStreamConstantsModule (copy)
				upsellCardModalActionModule(var1.EventStream, p2, p3, eventStreamConstantsModule.ActionType.Shown, p4, p5, p6)
			end,
			reportModalDismissedWithSection = function(p2, p3, p4)
				-- upvalues: upsellCardModalActionModule (copy), var1 (ref), eventStreamConstantsModule (copy)
				upsellCardModalActionModule(var1.EventStream, p2, "", eventStreamConstantsModule.ActionType.Dismiss, p3, p4)
			end,
			reportModalActionWithSection = function(p2, p3, p4, p5, p6, p7)
				-- upvalues: upsellCardModalActionModule (copy), var1 (ref)
				upsellCardModalActionModule(var1.EventStream, p2, p3, p4, p5, p6, p7)
			end,
			reportInteractWithActionAndSection = function(p2, p3, p4, p5, p6, p7)
				-- upvalues: upsellCardFormInteractionModule (copy), var1 (ref)
				upsellCardFormInteractionModule(var1.EventStream, p2, p3, p4, p5, p6, p7)
			end
		}
	end
}