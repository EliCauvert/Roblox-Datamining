local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)
local formatMessagesModule = require(script.Parent.formatMessages)
local separateRobloxUrlsFromTextModule = require(script.Parent.RobloxUrlUtils.separateRobloxUrlsFromText)

return function(p0, p1) --[[ line: 15 ]]
	-- upvalues: argCheckModule (ref), enumMessageTypesModule (ref), cryoModule (ref), formatMessagesModule (ref), separateRobloxUrlsFromTextModule (ref)
	argCheckModule.isType(p0, "table", "filterForLinks.text")
	argCheckModule.isType(p1, "table", "filterForLinks.whitelistedDomains")
	
	return if p0.messageType == enumMessageTypesModule.System then { p0 } elseif p0.messageType == enumMessageTypesModule.Link and (not p0.gameLink or not p0.gameLink.universeId) then {
		cryoModule.Dictionary.join(p0, { messageType = cryoModule.None })
	} elseif p0.content and not p0.moderated and (p0.content:lower():match("%/games[^%d]*(%d+)/?") or p0.content:match("%/share%?.*code=([%w%-]+)")) then formatMessagesModule(separateRobloxUrlsFromTextModule(p0.content), p0) else { p0 }
end