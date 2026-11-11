local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local _ = require(CurrencyTransfers.Stores.createTransferStore)

return function(p1, Send)
	-- upvalues: TransferDirectionModule (copy)
	if Send == TransferDirectionModule.Send then
		local Recipient = p1.getRecipient(false)
		
		if Recipient then
			return Recipient.targetId
		end
	else
		local Sender = p1.getSender(false)
		
		if Sender then
			return Sender.targetId
		end
	end
	return nil
end