local Parent = script:FindFirstAncestor("NotApprovedPage").Parent
local NewResult = require(Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local INTERVENTIONTYPES = require(Parent.NotApprovedPageShared).Constants.INTERVENTION_TYPES

return function(p1, Deleted, List)
	-- upvalues: INTERVENTIONTYPES (copy), NewResult (copy)
	return if Deleted == INTERVENTIONTYPES.Deleted then NewResult:Format("Feature.NotApproved.Description.BrokeRulesBanned") elseif #List > 0 then if p1 and p1 ~= "" then NewResult:Format("Feature.NotApproved.Description.BrokeRulesTypePolicy.V2", {
		type = p1,
		policy = string.lower(table.concat(List, ", "))
	}) else NewResult:Format("Feature.NotApproved.Description.BrokeRulesPolicy.V2", { policy = string.lower(table.concat(List, ", ")) }) elseif p1 and p1 ~= "" then NewResult:Format("Feature.NotApproved.Description.BrokeRulesType", { type = p1 }) else NewResult:Format("Feature.NotApproved.Description.BrokeRulesGeneric")
end