local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)
local argCheckModule = require(parent.ArgCheck)

return function(p0, p1) --[[ line: 8 ]]
	-- upvalues: argCheckModule (ref), cryoModule (ref), enumMessageTypesModule (ref)
	argCheckModule.isType(p0, "table", "formatMessages.messages")
	argCheckModule.isType(p1, "table", "formatMessages.messageData")
	
	return cryoModule.List.map(p0, function(p2) --[[ line: 12 ]]
		-- upvalues: cryoModule (copy), p1 (ref), enumMessageTypesModule (copy)
		return if p2.placeId or p2.shareLink then cryoModule.Dictionary.join(p1, p2, {
			messageType = enumMessageTypesModule.Link,
			content = cryoModule.None
		}) else cryoModule.Dictionary.join(p1, p2)
	end)
end