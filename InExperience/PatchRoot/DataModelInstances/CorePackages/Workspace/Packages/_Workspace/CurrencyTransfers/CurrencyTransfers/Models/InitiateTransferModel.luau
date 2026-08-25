local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.types)
local tModule = require(currencyTransfers.Parent.t)
local t = {}

function t.new(p0)
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
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

function t.format(p2)
	-- upvalues: t (ref)
	local robuxTransfer = p2.robuxTransfer
	local sender = robuxTransfer.sender
	
	return t.new({
		transferRequestId = p2.transferRequestId,
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
		senderRobuxBalance = p2.senderRobuxBalance,
		minimumTransferAmount = p2.minimumTransferAmount,
		maximumTransferAmount = p2.maximumTransferAmount,
		userRelationshipDetail = {
			friendSinceYear = p2.userRelationshipDetail.friendSinceYear,
			friendSinceDate = p2.userRelationshipDetail.friendSinceDate,
			mutualFriendsCount = p2.userRelationshipDetail.mutualFriendsCount,
			userAccountSinceYear = p2.userRelationshipDetail.userAccountSinceYear,
			areFriends = p2.userRelationshipDetail.areFriends
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