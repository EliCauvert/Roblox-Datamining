local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.AccountInfoReceived).name] = function(p0, p1)
		return {
			balance = p0.balance,
			membershipType = if p1.accountInfo.isPremium then 4 else 0
		}
	end,
	[require(purchasePrompt.Actions.BalanceInfoRecieved).name] = function(p2, p3)
		local balanceInfo = p3.balanceInfo
		
		return {
			balance = balanceInfo.robux,
			hasFailed = balanceInfo.hasFailed,
			membershipType = p2.membershipType
		}
	end
})