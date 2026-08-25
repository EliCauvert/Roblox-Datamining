local expChat = script:FindFirstAncestor("ExpChat")
local UIBloxModule = require(expChat.Parent.UIBlox)
local summaryMessageRichTextModule = require(expChat.summaryMessageRichText)
local expChatAlignSystemMessageStyling = game:DefineFastFlag("ExpChatAlignSystemMessageStyling", false)

return function(p0, p1, p2)
	-- upvalues: expChatAlignSystemMessageStyling (ref), summaryMessageRichTextModule (ref), UIBloxModule (ref)
	if expChatAlignSystemMessageStyling and not p1 and p2 == nil then
		return summaryMessageRichTextModule.wrapInSummaryMutedStyle(p0)
	end
	local formattedText = string.format("<font color=\"#%s\">%s</font>", if p1 then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), p0)
	
	if p2 then
		formattedText = p2(formattedText)
	end
	return formattedText
end