local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)
local formatMessagesModule = require(script.Parent.formatMessages)
local separateRobloxUrlsFromTextModule = require(script.Parent.RobloxUrlUtils.separateRobloxUrlsFromText)

return function(p1, p2)
	-- upvalues: argCheckModule (ref), enumMessageTypesModule (ref), cryoModule (ref), formatMessagesModule (ref), separateRobloxUrlsFromTextModule (ref)
	argCheckModule.isType(p1, "table", "filterForLinks.text")
	argCheckModule.isType(p2, "table", "filterForLinks.whitelistedDomains")
	
	return if p1.messageType == enumMessageTypesModule.System then { p1 } elseif p1.messageType == enumMessageTypesModule.Link and (not p1.gameLink or not p1.gameLink.universeId) then {
		cryoModule.Dictionary.join(p1, { messageType = cryoModule.None })
	} elseif p1.content and not p1.moderated and (p1.content:lower():match("%/games[^%d]*(%d+)/?") or p1.content:match("%/share%?.*code=([%w%-]+)")) then formatMessagesModule(separateRobloxUrlsFromTextModule(p1.content), p1) else { p1 }
end