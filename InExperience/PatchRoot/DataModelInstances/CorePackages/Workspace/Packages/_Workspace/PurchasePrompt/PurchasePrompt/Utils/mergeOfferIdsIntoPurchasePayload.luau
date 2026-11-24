local HttpService = game:GetService("HttpService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(PurchasePrompt.types)
local FFlagEnableNotificationsBuyModalSurface = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableNotificationsBuyModalSurface

local function appendDiscountsToObjectText(Text: string, Discounts): string?
	-- upvalues: HttpService (copy)
	local Match: string? = string.match(Text, "^%s*({.*)}%s*$")
	
	if Match == nil then
		return nil
	end
	local Success, Result = pcall(HttpService.JSONEncode, HttpService, Discounts)
	
	if Success and type(Result) == "string" then
		local HasMatch = string.match(Match, "^{%s*$") ~= nil
		
		return Match .. (if HasMatch then "" else ",") .. "\"discounts\":" .. Result .. "}"
	else
		return nil
	end
end

return function(p1, p2)
	-- upvalues: HttpService (copy), FFlagEnableNotificationsBuyModalSurface (copy), appendDiscountsToObjectText (copy)
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
		
		if FFlagEnableNotificationsBuyModalSurface and Result.discounts == nil then
			local AppendDiscountsToObjectTextResult = appendDiscountsToObjectText(p1, Discounts)
			
			if AppendDiscountsToObjectTextResult ~= nil then
				return AppendDiscountsToObjectTextResult
			end
		end
	else
		t = {}
	end
	t.discounts = Discounts
	local Success1, Result1 = pcall(HttpService.JSONEncode, HttpService, t)
	
	return if Success1 and type(Result1) == "string" then Result1 else p1
end