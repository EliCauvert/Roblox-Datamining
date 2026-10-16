local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function noopCancel() --[[ Line: 12 ]] end

local function normalizeResponse(ResponseBody) --[[ Line: 14 ]]
	-- upvalues: HttpService (copy)
	return if typeof(ResponseBody) == "string" then { statusCode = 200, responseBody = ResponseBody } elseif typeof(ResponseBody) == "table" then if ResponseBody.statusCode == nil then {
		statusCode = 200,
		responseBody = HttpService:JSONEncode(ResponseBody)
	} else ResponseBody else { statusCode = 200, responseBody = nil }
end

return function(p1) --[[ Line: 27 | Named "createMockNetwork" ]]
	-- upvalues: HttpService (copy), noopCancel (copy), normalizeResponse (copy)
	local P1 = p1 or {}
	local Routes = P1.routes or {}
	
	return {
		request = function(p2, Callback: (any, any) -> ()) --[[ Line: 31 ]]
			-- upvalues: Routes (copy), P1 (copy), HttpService (upval), noopCancel (upval), normalizeResponse (upval)
			local Respond = nil
			
			for _, route in Routes do
				if string.find(p2.url, route.pattern, 1, true) then
					Respond = route.respond
					break
				end
			end
			local Respond1 = Respond or P1.fallback
			
			if Respond1 == nil then
				Callback(true, {
					statusCode = 404,
					responseBody = HttpService:JSONEncode({
						code = 5,
						message = "createMockNetwork: no route matched " .. p2.url
					})
				})
				
				return noopCancel
			end
			local Success, Result = pcall(Respond1, p2)
			
			if Success then
				Callback(true, (normalizeResponse(Result)))
			else
				Callback(false, (tostring(Result)))
			end
			return noopCancel
		end
	}
end