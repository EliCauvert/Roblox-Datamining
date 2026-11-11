local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local UpsellCardModalActionModule = require(PhoneUpsell.DuplicateAnalytics.upsellCardModalAction)
local UpsellCardFormInteractionModule = require(PhoneUpsell.DuplicateAnalytics.upsellCardFormInteraction)
local EventStreamConstantsModule = require(PhoneUpsell.DuplicateAnalytics.EventStreamConstants)
local RoactAnalytics = require(PhoneUpsell.Parent.RoactServiceTags).RoactAnalytics

return {
	get = function(p1)
		-- upvalues: RoactAnalytics (copy), UpsellCardModalActionModule (copy), EventStreamConstantsModule (copy), UpsellCardFormInteractionModule (copy)
		local GetResult = RoactAnalytics.get(p1)
		
		return {
			reportModalShownWithSection = function(p2, p3, p4)
				-- upvalues: UpsellCardModalActionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				UpsellCardModalActionModule(GetResult.EventStream, p2, "", EventStreamConstantsModule.ActionType.Shown, p3, p4)
			end,
			reportModalShownWithSectionAndError = function(p2, p3, p4, p5, p6)
				-- upvalues: UpsellCardModalActionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				UpsellCardModalActionModule(GetResult.EventStream, p2, p3, EventStreamConstantsModule.ActionType.Shown, p4, p5, p6)
			end,
			reportModalDismissedWithSection = function(p2, p3, p4)
				-- upvalues: UpsellCardModalActionModule (upval), GetResult (copy), EventStreamConstantsModule (upval)
				UpsellCardModalActionModule(GetResult.EventStream, p2, "", EventStreamConstantsModule.ActionType.Dismiss, p3, p4)
			end,
			reportModalActionWithSection = function(p2, p3, p4, p5, p6, p7)
				-- upvalues: UpsellCardModalActionModule (upval), GetResult (copy)
				UpsellCardModalActionModule(GetResult.EventStream, p2, p3, p4, p5, p6, p7)
			end,
			reportInteractWithActionAndSection = function(p2, p3, p4, p5, p6, p7)
				-- upvalues: UpsellCardFormInteractionModule (upval), GetResult (copy)
				UpsellCardFormInteractionModule(GetResult.EventStream, p2, p3, p4, p5, p6, p7)
			end
		}
	end
}