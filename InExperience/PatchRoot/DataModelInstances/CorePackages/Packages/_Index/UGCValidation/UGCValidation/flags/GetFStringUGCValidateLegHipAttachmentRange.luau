game:DefineFastString("UGCValidateLegHipAttachmentRange", "0.25")
local t = {
	asString = function()
		return game:GetFastString("UGCValidateLegHipAttachmentRange")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t