local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local _ = require(currencyTransfers.Stores.createTransferStore)

return function(p0, p1) --[[ line: 10 | named "getCounterUserId" ]]
	-- upvalues: transferDirectionModule (ref)
	if p1 == transferDirectionModule.Send then
		local recipient = p0.getRecipient(false)
		
		if recipient then
			return recipient.targetId
		end
	else
		local sender = p0.getSender(false)
		
		return if sender then sender.targetId else nil
	end
end