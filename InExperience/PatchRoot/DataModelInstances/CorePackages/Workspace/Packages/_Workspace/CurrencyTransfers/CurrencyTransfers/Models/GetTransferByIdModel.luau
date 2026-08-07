local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.types)
local tModule = require(currencyTransfers.Parent.t)
local t = {}

function t.new(p0) --[[ line: 14 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 26 ]]
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

local function formatRobuxTransfer(p2) --[[ line: 56 ]]
	-- upvalues: currencyTransfers (ref)
	local transferStatusModule = require(currencyTransfers.Enums.TransferStatus)
	local sender = p2.sender
	local recipient = p2.recipient
	
	return {
		transferId = p2.transferId,
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
		transferAmount = p2.transferAmount,
		creationTime = p2.creationTime,
		requireRecipientAction = p2.requireRecipientAction,
		status = transferStatusModule.fromValue(p2.status) or transferStatusModule.Completed
	}
end

function t.format(p3) --[[ line: 81 ]]
	-- upvalues: t (ref), formatRobuxTransfer (ref)
	local transfer = p3.transfer
	
	if not transfer then
		error("GetTransferByIdModel.format: transfer is missing from response")
	end
	return t.new({ transfer = formatRobuxTransfer(transfer) })
end

t.isValid = tModule.strictInterface({ transfer = tModule.table })

return t