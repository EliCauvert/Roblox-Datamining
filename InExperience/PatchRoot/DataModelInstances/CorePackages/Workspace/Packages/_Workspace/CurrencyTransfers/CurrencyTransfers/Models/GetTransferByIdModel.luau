local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.types)
local tModule = require(currencyTransfers.Parent.t)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: currencyTransfers (ref), t (ref)
	return t.new({
		transfer = (p1 or {}).transfer or {
			transferId = 123456,
			transferAmount = 100,
			creationTime = "2025-01-01T00:00:00Z",
			requireRecipientAction = false,
			sender = {
				type = 1,
				targetId = 100,
				targetName = "SenderUser",
				targetDisplayName = "Sender Display"
			},
			recipient = {
				type = 1,
				targetId = 200,
				targetName = "RecipientUser",
				targetDisplayName = "Recipient Display"
			},
			status = require(currencyTransfers.Enums.TransferStatus).Completed
		}
	})
end

local function formatRobuxTransfer(p1)
	-- upvalues: currencyTransfers (ref)
	local transferStatusModule = require(currencyTransfers.Enums.TransferStatus)
	local sender = p1.sender
	local recipient = p1.recipient
	
	return {
		transferId = p1.transferId,
		sender = {
			type = sender.type,
			targetId = sender.targetId,
			targetName = sender.targetName,
			targetDisplayName = sender.targetDisplayName
		},
		recipient = {
			type = recipient.type,
			targetId = recipient.targetId,
			targetName = recipient.targetName,
			targetDisplayName = recipient.targetDisplayName
		},
		transferAmount = p1.transferAmount,
		creationTime = p1.creationTime,
		requireRecipientAction = p1.requireRecipientAction,
		status = transferStatusModule.fromValue(p1.status) or transferStatusModule.Completed
	}
end

function t.format(p1)
	-- upvalues: t (ref), formatRobuxTransfer (ref)
	local transfer = p1.transfer
	
	if not transfer then
		error("GetTransferByIdModel.format: transfer is missing from response")
	end
	return t.new({ transfer = formatRobuxTransfer(transfer) })
end

t.isValid = tModule.strictInterface({ transfer = tModule.table })

return t