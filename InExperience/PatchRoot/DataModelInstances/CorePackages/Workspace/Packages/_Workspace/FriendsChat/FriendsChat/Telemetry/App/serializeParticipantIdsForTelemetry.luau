local httpService = game:GetService("HttpService")

return function(p1, p2)
	-- upvalues: httpService (ref)
	local t = {}
	
	for i, v in p1 or {} do
		local var1 = tonumber(if typeof(v) == "table" then v.id else v)
		
		if var1 ~= nil and var1 ~= p2 then
			table.insert(t, var1)
		end
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), t (ref)
		return httpService:JSONEncode(t)
	end)
	
	return if ok then status else "[]"
end