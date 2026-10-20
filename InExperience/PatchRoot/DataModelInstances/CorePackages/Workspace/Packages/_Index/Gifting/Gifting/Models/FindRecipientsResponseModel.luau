local Gifting = script:FindFirstAncestor("Gifting")
local TModule = require(Gifting.Parent.t)
local UserRelationshipModule = require(Gifting.Enums.UserRelationship)
local GiftModelUtilsModule = require(Gifting.Models.GiftModelUtils)
local _ = require(Gifting.Types)
local InterfaceResult = TModule.interface({ userId = TModule.number })

local function formatRecipientResult(p1)
	-- upvalues: InterfaceResult (copy), UserRelationshipModule (copy), GiftModelUtilsModule (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	
	if not InterfaceResultResult then
		return nil, `recipient: {InterfaceResultResult2}`
	end
	local FromValueResult = UserRelationshipModule.fromValue(p1.userRelationship)
	
	if FromValueResult == nil then
		return nil, GiftModelUtilsModule.invalidField("recipient.userRelationship", p1.userRelationship)
	else
		return {
			userId = p1.userId,
			username = p1.username or "",
			displayName = p1.displayName or "",
			thumbnailUrl = p1.thumbnailUrl or "",
			userRelationship = FromValueResult
		}
	end
end

return {
	format = function(p1)
		-- upvalues: GiftModelUtilsModule (copy), formatRecipientResult (copy)
		local Recipients, Recipients2 = GiftModelUtilsModule.formatList("recipients", p1.recipients or {}, formatRecipientResult)
		
		if Recipients == nil then
			return nil, Recipients2
		else
			return { recipients = Recipients, nextCursor = p1.nextCursor }
		end
	end
}