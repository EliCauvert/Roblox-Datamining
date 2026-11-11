local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local FormatMessagesModule = require(script.Parent.formatMessages)
local SeparateRobloxUrlsFromTextModule = require(script.Parent.RobloxUrlUtils.separateRobloxUrlsFromText)

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), EnumMessageTypesModule (copy), CryoModule (copy), FormatMessagesModule (copy), SeparateRobloxUrlsFromTextModule (copy)
	ArgCheckModule.isType(p1, "table", "filterForLinks.text")
	ArgCheckModule.isType(p2, "table", "filterForLinks.whitelistedDomains")
	
	return if p1.messageType == EnumMessageTypesModule.System then { p1 } elseif p1.messageType == EnumMessageTypesModule.Link and (not p1.gameLink or not p1.gameLink.universeId) then {
		CryoModule.Dictionary.join(p1, { messageType = CryoModule.None })
	} elseif p1.content and not p1.moderated and (p1.content:lower():match("%/games[^%d]*(%d+)/?") or p1.content:match("%/share%?.*code=([%w%-]+)")) then FormatMessagesModule(SeparateRobloxUrlsFromTextModule(p1.content), p1) else { p1 }
end