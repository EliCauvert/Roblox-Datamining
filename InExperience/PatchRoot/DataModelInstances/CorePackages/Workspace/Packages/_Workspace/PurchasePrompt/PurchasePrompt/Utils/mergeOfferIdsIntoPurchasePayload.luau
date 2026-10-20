local HttpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("PurchasePrompt").types)

return function(p1, p2)
	-- upvalues: HttpService (copy)
	if p2 == nil or p2.Offers == nil then
		return p1
	end
	local Discounts = {}
	
	for _, offer in p2.Offers do
		if type(offer) == "table" and type(offer.Id) == "string" and offer.Id ~= "" then
			table.insert(Discounts, { source = "Offer", discountId = offer.Id })
		end
	end
	if #Discounts == 0 then
		return p1
	end
	local t = nil
	if type(p1) == "string" and p1 ~= "" then
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1)
		
		if not Success or type(Result) ~= "table" then
			return p1
		end
		t = Result
	else
		t = {}
	end
	t.discounts = Discounts
	local Success1, Result1 = pcall(HttpService.JSONEncode, HttpService, t)
	
	return if Success1 and type(Result1) == "string" then Result1 else p1
end