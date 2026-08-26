local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: httpService (ref)
	if p1 == nil or p1.errors == nil or (not p1.errors[1] or not p1.errors[1].fieldData) then
		return "", ""
	end
	local fieldData = p1.errors[1].fieldData
	local ok, status = pcall(function()
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