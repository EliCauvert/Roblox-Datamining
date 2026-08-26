local getPresetIconRichText = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared).getPresetIconRichText

local function _(p1)
	-- upvalues: getPresetIconRichText (ref)
	return ` {getPresetIconRichText(p1)}`
end

return {
	decorate = function(p1, p2)
		-- upvalues: getPresetIconRichText (ref)
		return p1 .. ` {getPresetIconRichText(p2)}`
	end,
	undecorate = function(p1, p2)
		-- upvalues: getPresetIconRichText (ref)
		local var1 = ` {getPresetIconRichText(p2)}`
		
		return if string.sub(p1, -#var1) == var1 then string.sub(p1, 1, #p1 - #var1) else p1
	end
}