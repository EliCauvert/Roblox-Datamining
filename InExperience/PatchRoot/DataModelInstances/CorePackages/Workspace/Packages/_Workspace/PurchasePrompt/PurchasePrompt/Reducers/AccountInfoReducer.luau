local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.AccountInfoReceived).name] = function(p1, p2)
		return {
			balance = p1.balance,
			membershipType = if p2.accountInfo.isPremium then 4 else 0
		}
	end,
	[require(purchasePrompt.Actions.BalanceInfoRecieved).name] = function(p1, p2)
		local balanceInfo = p2.balanceInfo
		
		return {
			balance = balanceInfo.robux,
			hasFailed = balanceInfo.hasFailed,
			membershipType = p1.membershipType
		}
	end
})