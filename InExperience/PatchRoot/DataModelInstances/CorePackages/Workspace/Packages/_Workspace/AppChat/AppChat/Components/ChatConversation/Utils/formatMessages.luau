local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)
local argCheckModule = require(parent.ArgCheck)

return function(p1, p2)
	-- upvalues: argCheckModule (ref), cryoModule (ref), enumMessageTypesModule (ref)
	argCheckModule.isType(p1, "table", "formatMessages.messages")
	argCheckModule.isType(p2, "table", "formatMessages.messageData")
	
	return cryoModule.List.map(p1, function(p3)
		-- upvalues: cryoModule (copy), p2 (ref), enumMessageTypesModule (copy)
		return if p3.placeId or p3.shareLink then cryoModule.Dictionary.join(p2, p3, {
			messageType = enumMessageTypesModule.Link,
			content = cryoModule.None
		}) else cryoModule.Dictionary.join(p2, p3)
	end)
end