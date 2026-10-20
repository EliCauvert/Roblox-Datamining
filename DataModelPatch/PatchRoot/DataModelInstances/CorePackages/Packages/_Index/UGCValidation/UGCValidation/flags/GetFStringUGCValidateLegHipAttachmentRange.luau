game:DefineFastString("UGCValidateLegHipAttachmentRange", "0.25")
local GetFStringUGCValidateLegHipAttachmentRangeModule = {
	asString = function()
		return game:GetFastString("UGCValidateLegHipAttachmentRange")
	end
}

function GetFStringUGCValidateLegHipAttachmentRangeModule.asNumber(): number
	-- upvalues: GetFStringUGCValidateLegHipAttachmentRangeModule (copy)
	return (tonumber(GetFStringUGCValidateLegHipAttachmentRangeModule.asString()))
end

return GetFStringUGCValidateLegHipAttachmentRangeModule