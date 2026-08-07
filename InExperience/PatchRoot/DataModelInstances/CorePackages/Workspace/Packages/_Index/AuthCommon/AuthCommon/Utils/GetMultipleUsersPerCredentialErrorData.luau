local httpService = game:GetService("HttpService")

return function(p0) --[[ line: 18 ]]
	-- upvalues: httpService (ref)
	if p0 ~= nil and p0.errors ~= nil and (p0.errors[1] and p0.errors[1].fieldData) then
		local fieldData = p0.errors[1].fieldData
		local ok, status = pcall(function() --[[ line: 26 ]]
			-- upvalues: httpService (copy), fieldData (ref)
			return httpService:JSONDecode(fieldData)
		end)
		
		return if ok then status.users or {} else {}
	end
end