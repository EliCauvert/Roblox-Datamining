game:DefineFastString("UGCValidateLegHipAttachmentRange", "0.25")
local GetFStringUGCValidateLegHipAttachmentRangeModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidateLegHipAttachmentRange")
	end
}

function GetFStringUGCValidateLegHipAttachmentRangeModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidateLegHipAttachmentRangeModule (copy)
	return (tonumber(GetFStringUGCValidateLegHipAttachmentRangeModule.asString()))
end

return GetFStringUGCValidateLegHipAttachmentRangeModule