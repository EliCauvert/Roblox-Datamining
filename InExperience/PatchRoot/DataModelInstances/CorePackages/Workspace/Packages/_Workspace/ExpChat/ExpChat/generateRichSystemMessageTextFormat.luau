local expChat = script:FindFirstAncestor("ExpChat")
local UIBloxModule = require(expChat.Parent.UIBlox)
local fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule = require(expChat.Flags.FFlagExpChatEnablePostProcessRichSystemMessageTextFormat)

return function(p0, p1, p2) --[[ line: 9 | named "generateRichSystemMessageTextFormat" ]]
	-- upvalues: fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (ref), UIBloxModule (ref)
	if not fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then
		return string.format("<font color=\"#%s\">%s</font>", if p1 then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), p0)
	end
	local formattedText = string.format("<font color=\"#%s\">%s</font>", if p1 then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), p0)
	
	if p2 then
		formattedText = p2(formattedText)
	end
	return formattedText
end