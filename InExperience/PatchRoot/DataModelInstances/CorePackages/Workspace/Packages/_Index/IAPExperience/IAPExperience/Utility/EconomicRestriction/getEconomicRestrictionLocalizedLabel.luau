local IAPExperience = script:FindFirstAncestor("IAPExperience")
local economicRestrictionsViolationTypeModule = require(IAPExperience.Enums.EconomicRestrictionsViolationType)
local loggerModule = require(IAPExperience.Utility.logger)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: economicRestrictionsViolationTypeModule (ref), loggerModule (ref)
	if p1 == economicRestrictionsViolationTypeModule.Chargeback then
		return p0.chargebackViolationLabel
	elseif p1 == economicRestrictionsViolationTypeModule.AbuseOfAffiliateSystem then
		return p0.fraudAbuseOfAffiliateSystemViolationLabel
	elseif p1 == economicRestrictionsViolationTypeModule.AttemptedUnauthorizedPaymentMethodUse then
		return p0.fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel
	elseif p1 == economicRestrictionsViolationTypeModule.PaymentAuthorizationAttempt then
		return p0.fraudPaymentAbuseViolationLabel
	elseif p1 == economicRestrictionsViolationTypeModule.RepeatedRefundRequests then
		return p0.fraudRepeatedRefundRequestsViolationLabel
	elseif p1 == economicRestrictionsViolationTypeModule.SuspiciousAccountPatterns then
		return p0.fraudSuspiciousAccountPatternsViolationLabel
	elseif p1 == economicRestrictionsViolationTypeModule.SuspiciousRefundRequests then
		return p0.fraudSuspiciousRefundRequestsViolationLabel
	elseif p1 == economicRestrictionsViolationTypeModule.UnauthorizedPurchase then
		return p0.fraudUnauthorizedPurchaseViolationLabel
	elseif p1 == economicRestrictionsViolationTypeModule.UseOfUnauthorizedOffPlatformTransactions then
		return p0.fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel
	elseif p1 == economicRestrictionsViolationTypeModule.VirtualEconomyAbuse then
		return p0.fraudVirtualEconomyAbuseViolationLabel
	end
	loggerModule.error({ message = "Invalid violation type", violationType = p1 })
	
	return ""
end