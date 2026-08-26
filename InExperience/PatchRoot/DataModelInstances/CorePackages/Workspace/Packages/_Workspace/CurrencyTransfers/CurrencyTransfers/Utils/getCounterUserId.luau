local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local _ = require(currencyTransfers.Stores.createTransferStore)

return function(p1, p2)
	-- upvalues: transferDirectionModule (ref)
	if p2 == transferDirectionModule.Send then
		local recipient = p1.getRecipient(false)
		
		if recipient then
			return recipient.targetId
		end
	else
		local sender = p1.getSender(false)
		
		return if sender then sender.targetId else nil
	end
end