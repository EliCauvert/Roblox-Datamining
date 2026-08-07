local httpService = game:GetService("HttpService")

return function(p0) --[[ line: 3 ]]
	-- upvalues: httpService (ref)
	if p0 == nil or p0.errors == nil or (not p0.errors[1] or not p0.errors[1].fieldData) then
		return "", ""
	end
	local fieldData = p0.errors[1].fieldData
	local ok, status = pcall(function() --[[ line: 11 ]]
		-- upvalues: httpService (copy), fieldData (ref)
		return httpService:JSONDecode(fieldData)
	end)
	
	if not ok then
		return "", fieldData
	end
	local var1 = ""
	local var2 = ""
	
	if status.unifiedCaptchaId then
		var1 = status.unifiedCaptchaId
	end
	if status.dxBlob then
		var2 = status.dxBlob
	end
	return var1, var2
end