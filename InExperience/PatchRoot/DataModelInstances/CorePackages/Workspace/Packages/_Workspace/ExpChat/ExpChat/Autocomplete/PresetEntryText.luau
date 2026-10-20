local GetPresetIconRichTextFunction = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared).getPresetIconRichText

local function _(p1): string
	-- upvalues: GetPresetIconRichTextFunction (copy)
	return ` {GetPresetIconRichTextFunction(p1)}`
end

return {
	decorate = function(Text, p1): string
		-- upvalues: GetPresetIconRichTextFunction (copy)
		return Text .. ` {GetPresetIconRichTextFunction(p1)}`
	end,
	undecorate = function(Text: string, p1): string
		-- upvalues: GetPresetIconRichTextFunction (copy)
		local Text1: string = ` {GetPresetIconRichTextFunction(p1)}`
		
		return if string.sub(Text, -#Text1) == Text1 then string.sub(Text, 1, #Text - #Text1) else Text
	end
}