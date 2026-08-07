game:DefineFastString("UGCValidateLegHipAttachmentRange", "0.25")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidateLegHipAttachmentRange")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t