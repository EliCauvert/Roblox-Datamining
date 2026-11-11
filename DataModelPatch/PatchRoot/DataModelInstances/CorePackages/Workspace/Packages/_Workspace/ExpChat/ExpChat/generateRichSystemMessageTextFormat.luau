local ExpChat = script:FindFirstAncestor("ExpChat")
local UIBloxModule = require(ExpChat.Parent.UIBlox)
local FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule = require(ExpChat.Flags.FFlagExpChatEnablePostProcessRichSystemMessageTextFormat)

return function(p1, p2, Callback)
	-- upvalues: FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (copy), UIBloxModule (copy)
	if not FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then
		return string.format("<font color=\"#%s\">%s</font>", if p2 then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), p1)
	end
	local Formatted = string.format("<font color=\"#%s\">%s</font>", if p2 then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), p1)
	
	if Callback then
		Formatted = Callback(Formatted)
	end
	return Formatted
end