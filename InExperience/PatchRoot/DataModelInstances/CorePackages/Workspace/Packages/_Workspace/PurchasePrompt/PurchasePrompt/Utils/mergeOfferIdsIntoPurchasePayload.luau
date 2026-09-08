local httpService = game:GetService("HttpService")

return function(p1, p2)
	-- upvalues: httpService (ref)
	if p2 == nil or p2.Offers == nil then
		return p1
	end
	local t = {}
	
	for i, v in p2.Offers do
		if type(v) == "table" and type(v.Id) == "string" and v.Id ~= "" then
			table.insert(t, { source = "Offer", discountId = v.Id })
		end
	end
	if #t == 0 then
		return p1
	end
	local t_1, ok
	local _ = nil
	
	if type(p1) == "string" and p1 ~= "" then
		ok, status = pcall(httpService.JSONDecode, httpService, p1)
		
		if not ok or type(status) ~= "table" then
			return p1
		end
		t_1 = status
	else
		t_1 = {}
	end
	t_1.discounts = t
	ok, status = pcall(httpService.JSONEncode, httpService, t_1)
	
	return if ok and type(status) == "string" then status else p1
end