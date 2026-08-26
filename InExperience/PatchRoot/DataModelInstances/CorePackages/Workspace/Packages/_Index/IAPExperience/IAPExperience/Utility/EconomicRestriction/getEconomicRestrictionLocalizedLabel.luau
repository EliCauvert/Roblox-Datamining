local IAPExperience = script:FindFirstAncestor("IAPExperience")
local economicRestrictionsViolationTypeModule = require(IAPExperience.Enums.EconomicRestrictionsViolationType)
local loggerModule = require(IAPExperience.Utility.logger)

return function(p1, p2)
	-- upvalues: economicRestrictionsViolationTypeModule (ref), loggerModule (ref)
	if p2 == economicRestrictionsViolationTypeModule.Chargeback then
		return p1.chargebackViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.AbuseOfAffiliateSystem then
		return p1.fraudAbuseOfAffiliateSystemViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.AttemptedUnauthorizedPaymentMethodUse then
		return p1.fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.PaymentAuthorizationAttempt then
		return p1.fraudPaymentAbuseViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.RepeatedRefundRequests then
		return p1.fraudRepeatedRefundRequestsViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.SuspiciousAccountPatterns then
		return p1.fraudSuspiciousAccountPatternsViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.SuspiciousRefundRequests then
		return p1.fraudSuspiciousRefundRequestsViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.UnauthorizedPurchase then
		return p1.fraudUnauthorizedPurchaseViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.UseOfUnauthorizedOffPlatformTransactions then
		return p1.fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.VirtualEconomyAbuse then
		return p1.fraudVirtualEconomyAbuseViolationLabel
	end
	loggerModule.error({ message = "Invalid violation type", violationType = p2 })
	
	return ""
end