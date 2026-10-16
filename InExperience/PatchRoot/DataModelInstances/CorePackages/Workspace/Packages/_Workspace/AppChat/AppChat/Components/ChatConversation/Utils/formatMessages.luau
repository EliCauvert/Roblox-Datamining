local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local ArgCheckModule = require(Parent.ArgCheck)

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: ArgCheckModule (copy), CryoModule (copy), EnumMessageTypesModule (copy)
	ArgCheckModule.isType(p1, "table", "formatMessages.messages")
	ArgCheckModule.isType(p2, "table", "formatMessages.messageData")
	
	return CryoModule.List.map(p1, function(p3) --[[ Line: 12 ]]
		-- upvalues: CryoModule (upval), p2 (copy), EnumMessageTypesModule (upval)
		return if p3.placeId or p3.shareLink then CryoModule.Dictionary.join(p2, p3, {
			messageType = EnumMessageTypesModule.Link,
			content = CryoModule.None
		}) else CryoModule.Dictionary.join(p2, p3)
	end)
end