local HttpService = game:GetService("HttpService")

return function(p1, Number)
	-- upvalues: HttpService (copy)
	local List = {}
	local P0 = p1 or {}
	for _, value in P0 do
		local Number1: number? = tonumber(if typeof(value) == "table" then value.id else value)
		
		if Number1 ~= nil and Number1 ~= Number then
			table.insert(List, Number1)
		end
	end
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), List (copy)
		return HttpService:JSONEncode(List)
	end)
	
	return if Success then Result else "[]"
end