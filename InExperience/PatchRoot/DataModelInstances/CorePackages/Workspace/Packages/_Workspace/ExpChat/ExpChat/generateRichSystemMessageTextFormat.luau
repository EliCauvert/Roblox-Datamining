local ExpChat = script:FindFirstAncestor("ExpChat")
local UIBloxModule = require(ExpChat.Parent.UIBlox)
local SummaryMessageRichTextModule = require(ExpChat.summaryMessageRichText)
local ExpChatAlignSystemMessageStyling = game:DefineFastFlag("ExpChatAlignSystemMessageStyling", false)

return function(p1, p2, Callback)
	-- upvalues: ExpChatAlignSystemMessageStyling (copy), SummaryMessageRichTextModule (copy), UIBloxModule (copy)
	if ExpChatAlignSystemMessageStyling and not p2 and Callback == nil then
		return SummaryMessageRichTextModule.wrapInSummaryMutedStyle(p1)
	end
	local Formatted = string.format("<font color=\"#%s\">%s</font>", if p2 then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), p1)
	
	if Callback then
		Formatted = Callback(Formatted)
	end
	return Formatted
end