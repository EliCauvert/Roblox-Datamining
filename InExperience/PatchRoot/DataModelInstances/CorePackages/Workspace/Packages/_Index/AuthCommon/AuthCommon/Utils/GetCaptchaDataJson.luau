local HttpService = game:GetService("HttpService")

return function(p1) --[[ Line: 3 ]]
	-- upvalues: HttpService (copy)
	if p1 == nil or p1.errors == nil or not p1.errors[1] or not p1.errors[1].fieldData then
		return "", ""
	end
	local FieldData = p1.errors[1].fieldData
	local Success, Result = pcall(function() --[[ Line: 11 ]]
		-- upvalues: HttpService (upval), FieldData (copy)
		return HttpService:JSONDecode(FieldData)
	end)
	
	if not Success then
		return "", FieldData
	end
	local UnifiedCaptchaId = ""
	local DxBlob = ""
	
	if Result.unifiedCaptchaId then
		UnifiedCaptchaId = Result.unifiedCaptchaId
	end
	if Result.dxBlob then
		DxBlob = Result.dxBlob
	end
	return UnifiedCaptchaId, DxBlob
end