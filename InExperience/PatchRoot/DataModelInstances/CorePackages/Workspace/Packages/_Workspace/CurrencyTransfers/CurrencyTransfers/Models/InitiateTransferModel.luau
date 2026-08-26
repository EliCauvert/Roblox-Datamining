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
	-- upvalues: t (ref)
	p1 = p1 or {}
	p1 = p1.robuxTransfer or {}
	
	return t.new({
		transferRequestId = p1.transferRequestId or "RXT-1234567890",
		robuxTransfer = {
			transferId = p1.transferId or 1234567890,
			sender = p1.sender or {
				targetDisplayName = "MockSender",
				targetId = 0,
				targetName = "mock",
				type = 1
			},
			recipient = p1.recipient or {
				targetDisplayName = "MockRecipient",
				targetId = 0,
				targetName = "mock",
				type = 1
			}
		},
		userRelationshipDetail = p1.userRelationshipDetail or {
			mutualFriendsCount = 0,
			userAccountSinceYear = 0,
			areFriends = false
		},
		senderRobuxBalance = p1.senderRobuxBalance or 0
	})
end

function t.format(p1)
	-- upvalues: t (ref)
	local robuxTransfer = p1.robuxTransfer
	local sender = robuxTransfer.sender
	
	return t.new({
		transferRequestId = p1.transferRequestId,
		robuxTransfer = {
			transferId = robuxTransfer.transferId,
			sender = if sender then {
				targetDisplayName = sender.targetDisplayName,
				targetId = sender.targetId,
				targetName = sender.targetName,
				type = sender.type
			} else {
				targetDisplayName = "",
				targetId = 0,
				targetName = "",
				type = 0
			},
			recipient = {
				targetDisplayName = robuxTransfer.recipient.targetDisplayName,
				targetId = robuxTransfer.recipient.targetId,
				targetName = robuxTransfer.recipient.targetName,
				type = robuxTransfer.recipient.type
			}
		},
		senderRobuxBalance = p1.senderRobuxBalance,
		minimumTransferAmount = p1.minimumTransferAmount,
		maximumTransferAmount = p1.maximumTransferAmount,
		userRelationshipDetail = {
			friendSinceYear = p1.userRelationshipDetail.friendSinceYear,
			friendSinceDate = p1.userRelationshipDetail.friendSinceDate,
			mutualFriendsCount = p1.userRelationshipDetail.mutualFriendsCount,
			userAccountSinceYear = p1.userRelationshipDetail.userAccountSinceYear,
			areFriends = p1.userRelationshipDetail.areFriends
		}
	})
end

t.isValid = tModule.strictInterface({
	transferRequestId = tModule.string,
	robuxTransfer = tModule.strictInterface({
		transferId = tModule.number,
		sender = tModule.strictInterface({
			targetDisplayName = tModule.string,
			targetId = tModule.number,
			targetName = tModule.string,
			type = tModule.number
		}),
		recipient = tModule.strictInterface({
			targetDisplayName = tModule.string,
			targetId = tModule.number,
			targetName = tModule.string,
			type = tModule.number
		})
	}),
	userRelationshipDetail = tModule.strictInterface({
		friendSinceYear = tModule.optional(tModule.number),
		friendSinceDate = tModule.optional(tModule.strictInterface({
			year = tModule.number,
			month = tModule.number,
			day = tModule.number
		})),
		mutualFriendsCount = tModule.number,
		userAccountSinceYear = tModule.number,
		areFriends = tModule.boolean
	}),
	senderRobuxBalance = tModule.number,
	minimumTransferAmount = tModule.optional(tModule.number),
	maximumTransferAmount = tModule.optional(tModule.number)
})

return t