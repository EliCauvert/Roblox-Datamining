local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.AccountInfoReceived).name] = function(p1, p2)
		return {
			balance = p1.balance,
			membershipType = if p2.accountInfo.isPremium then 4 else 0
		}
	end,
	[require(PurchasePrompt.Actions.BalanceInfoRecieved).name] = function(p1, p2)
		local BalanceInfo = p2.balanceInfo
		
		return {
			balance = BalanceInfo.robux,
			hasFailed = BalanceInfo.hasFailed,
			membershipType = p1.membershipType
		}
	end
}))