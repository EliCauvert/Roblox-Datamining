local parent = script:FindFirstAncestor("FriendsChat").Parent
local foundationModule = require(parent.Foundation)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local computeNameColor = chatUIPrimitivesModule.Utils.computeNameColor
local formatInlineIcon = chatUIPrimitivesModule.Utils.formatInlineIcon
local escapeRichText = chatUIPrimitivesModule.Utils.escapeRichText
local getReplyLabelDescriptorModule = require(parent.AppChat.getReplyLabelDescriptor)
local getModeratedMaskTextModule = require(parent.AppChat.getModeratedMaskText)
local fFlagChatModeratedMaskRandomLength = require(parent.SharedFlags).FFlagChatModeratedMaskRandomLength
local _ = require(script.Parent.classifyMessage)
local iconName = foundationModule.Enums.IconName
local color = Color3.fromRGB(255, 255, 255)

local function _(value) --[[ line: 86 | named "ceilToEven" ]]
	local ceiled = math.ceil(value)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return math.max(0, ceiled)
end

local function getSystemIconAttributes(p0) --[[ line: 98 ]]
	if p0 == nil then
		return { weight = "600" }
	end
	local ceiled = math.ceil(p0 * 3 / 4)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return { weight = "600", size = tostring(math.max(0, ceiled)) }
end

local _ = function(p1) --[[ line: 119 | named "hashContent" ]]
	-- upvalues: fFlagChatModeratedMaskRandomLength (ref), getModeratedMaskTextModule (ref)
	return if fFlagChatModeratedMaskRandomLength then getModeratedMaskTextModule(p1.messageId or p1.body) else string.gsub(p1.body, "[^%s]", "#")
end

local _ = function(p2) --[[ line: 127 | named "isNameLoading" ]]
	return if p2.name ~= nil then p2.name == "" else true
end

local function makeSystemRow(p3) --[[ line: 134 ]]
	-- upvalues: escapeRichText (ref), formatInlineIcon (ref), getSystemIconAttributes (ref)
	local var12 = escapeRichText(p3.content)
	
	return {
		displayStyle = "system",
		content = if p3.icon ~= nil then var12 else `{formatInlineIcon(p3.icon, getSystemIconAttributes(p3.systemTextSize))} {var12}`,
		skeletonWidth = p3.skeletonWidth or "none"
	}
end

local function buildReplyHeader(p4, p5, p6) --[[ line: 146 ]]
	-- upvalues: makeSystemRow (ref), getReplyLabelDescriptorModule (ref), iconName (ref)
	local var19
	local localize = p6.localize
	local systemTextSize = p6.systemTextSize
	local localUserId = p5.localUserId
	local var13 = localUserId ~= nil and p4.senderUserId == localUserId
	local var14 = localUserId ~= nil and p4.repliedToUserId == localUserId
	local var15 = p4.senderUserId == p4.repliedToUserId
	local namesByUserId = p5.namesByUserId or {}
	local senderUserId = namesByUserId[p4.senderUserId] or {}
	local repliedToUserId = namesByUserId[p4.repliedToUserId] or {}
	
	if if senderUserId.name ~= nil then senderUserId.name == "" else true then
		var19 = not var13
		
		if not var19 then
			var19 = if repliedToUserId.name ~= nil then repliedToUserId.name == "" else true
			var19 = var19 and not var14
		end
		return if var19 then makeSystemRow({ content = "", skeletonWidth = "full" }) else makeSystemRow({
			content = if localize then localize(getReplyLabelDescriptorModule({
				senderIsLocalUser = var13,
				senderRepliedToSelf = var15,
				senderRepliedToLocalUser = var14,
				isGroup = p5.isGroup == true,
				senderName = senderUserId.name or "",
				repliedToName = repliedToUserId.name or ""
			})) else "",
			icon = iconName.ArrowCurlToLeft,
			systemTextSize = systemTextSize
		})
	end
end

local function buildHiddenUser(p7, p8) --[[ line: 187 ]]
	-- upvalues: makeSystemRow (ref), iconName (ref)
	if if p7.name ~= nil then p7.name == "" else true then
		return makeSystemRow({ content = "", skeletonWidth = "full" })
	end
	local localize = p8.localize
	
	return makeSystemRow({
		content = if localize then localize({
			"Feature.Chat.Message.CannotBeDisplayedThirdPerson",
			displayName = p7.name
		}) else "",
		icon = iconName.LockClosed,
		systemTextSize = p8.systemTextSize
	})
end

local function buildUserText(p9, p10) --[[ line: 202 ]]
	-- upvalues: fFlagChatModeratedMaskRandomLength (ref), getModeratedMaskTextModule (ref), escapeRichText (ref), computeNameColor (ref), color (ref)
	local var20 = if not p9.moderated then if fFlagChatModeratedMaskRandomLength then getModeratedMaskTextModule(p9.messageId or p9.body) else string.gsub(p9.body, "[^%s]", "#") else escapeRichText(p9.body)
	local name = p10.name
	
	if name == nil or name == "" then
		return {
			skeletonWidth = "prefix",
			displayStyle = "user",
			content = `: {var20}`
		}
	end
	local username = p10.username
	
	return {
		skeletonWidth = "none",
		displayStyle = "user",
		content = string.format("<font color=\"#%s\">%s</font>: %s", (if username == nil or username == "" then color else computeNameColor(username)):ToHex(), escapeRichText(name), var20)
	}
end

return function(p11, p12, p13) --[[ line: 235 | named "buildRowDisplay" ]]
	-- upvalues: iconName (ref), makeSystemRow (ref), buildHiddenUser (ref), buildReplyHeader (ref), buildUserText (ref)
	local localize = p13.localize
	local systemTextSize = p13.systemTextSize
	local namesByUserId = p12.namesByUserId or {}
	
	return if p11.kind == "systemMessage" then makeSystemRow({
		content = p11.body,
		icon = if p11.variant == "party" then iconName.TwoPeopleSpeechBubble else iconName.CircleI,
		systemTextSize = systemTextSize
	}) elseif p11.kind == "moderationNotice" then makeSystemRow({
		content = if localize then localize("Feature.Chat.Message.MessageContentModerated") else "",
		icon = iconName.TriangleExclamation,
		systemTextSize = systemTextSize
	}) elseif p11.kind == "hiddenUser" then buildHiddenUser(namesByUserId[p11.senderUserId] or {}, p13) elseif p11.kind == "replyHeader" then buildReplyHeader(p11, p12, p13) else buildUserText(p11, namesByUserId[p11.senderUserId] or {})
end