local gifting = script:FindFirstAncestor("Gifting")
local tModule = require(gifting.Parent.t)
local userRelationshipModule = require(gifting.Enums.UserRelationship)
local giftModelUtilsModule = require(gifting.Models.GiftModelUtils)
local _ = require(gifting.Types)
local var1 = tModule.interface({ userId = tModule.number })

local function formatRecipientResult(p1)
	-- upvalues: var1 (ref), userRelationshipModule (ref), giftModelUtilsModule (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		return nil, `recipient: {var3}`
	end
	local var4 = userRelationshipModule.fromValue(p1.userRelationship)
	
	if var4 == nil then
		return nil, giftModelUtilsModule.invalidField("recipient.userRelationship", p1.userRelationship)
	end
	return {
		userId = p1.userId,
		username = p1.username or "",
		displayName = p1.displayName or "",
		thumbnailUrl = p1.thumbnailUrl or "",
		userRelationship = var4
	}
end

return {
	format = function(p1)
		-- upvalues: giftModelUtilsModule (ref), formatRecipientResult (ref)
		local recipients, recipients_1 = giftModelUtilsModule.formatList("recipients", p1.recipients or {}, formatRecipientResult)
		
		if recipients == nil then
			return nil, recipients_1
		end
		return { recipients = recipients, nextCursor = p1.nextCursor }
	end
}