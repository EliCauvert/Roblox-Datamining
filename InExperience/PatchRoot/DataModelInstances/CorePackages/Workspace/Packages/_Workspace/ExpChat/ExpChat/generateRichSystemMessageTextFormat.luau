local expChat = script:FindFirstAncestor("ExpChat")
local UIBloxModule = require(expChat.Parent.UIBlox)
local summaryMessageRichTextModule = require(expChat.summaryMessageRichText)
local expChatAlignSystemMessageStyling = game:DefineFastFlag("ExpChatAlignSystemMessageStyling", false)

return function(p1, p2, p3)
	-- upvalues: expChatAlignSystemMessageStyling (ref), summaryMessageRichTextModule (ref), UIBloxModule (ref)
	if expChatAlignSystemMessageStyling and not p2 and p3 == nil then
		return summaryMessageRichTextModule.wrapInSummaryMutedStyle(p1)
	end
	local formattedText = string.format("<font color=\"#%s\">%s</font>", if p2 then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), p1)
	
	if p3 then
		formattedText = p3(formattedText)
	end
	return formattedText
end