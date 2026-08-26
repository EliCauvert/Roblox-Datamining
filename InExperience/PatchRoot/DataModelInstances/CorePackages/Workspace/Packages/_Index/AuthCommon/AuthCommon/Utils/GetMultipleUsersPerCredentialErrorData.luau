local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: httpService (ref)
	if p1 ~= nil and p1.errors ~= nil and (p1.errors[1] and p1.errors[1].fieldData) then
		local fieldData = p1.errors[1].fieldData
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), fieldData (ref)
			return httpService:JSONDecode(fieldData)
		end)
		
		return if ok then status.users or {} else {}
	end
end