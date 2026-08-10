local getPresetIconRichText = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared).getPresetIconRichText

local function _(p0) --[[ line: 16 | named "getIconSuffix" ]]
	-- upvalues: getPresetIconRichText (ref)
	return ` {getPresetIconRichText(p0)}`
end

return {
	decorate = function(p1, p2) --[[ line: 20 ]]
		-- upvalues: getPresetIconRichText (ref)
		return p1 .. ` {getPresetIconRichText(p2)}`
	end,
	undecorate = function(p3, p4) --[[ line: 32 ]]
		-- upvalues: getPresetIconRichText (ref)
		local var0 = ` {getPresetIconRichText(p4)}`
		
		return if string.sub(p3, -#var0) == var0 then string.sub(p3, 1, #p3 - #var0) else p3
	end
}