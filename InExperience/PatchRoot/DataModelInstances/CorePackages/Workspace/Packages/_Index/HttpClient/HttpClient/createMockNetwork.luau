local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function noopCancel() end

local function normalizeResponse(p0)
	-- upvalues: httpService (ref)
	return if typeof(p0) == "string" then { statusCode = 200, responseBody = p0 } elseif typeof(p0) == "table" then if p0.statusCode == nil then {
		statusCode = 200,
		responseBody = httpService:JSONEncode(p0)
	} else p0 else { statusCode = 200, responseBody = nil }
end

return function(p1)
	-- upvalues: httpService (ref), noopCancel (ref), normalizeResponse (ref)
	p1 = p1 or {}
	local routes = p1.routes or {}
	
	return {
		request = function(p2, p3)
			-- upvalues: routes (ref), p1 (ref), httpService (copy), noopCancel (copy), normalizeResponse (copy)
			local respond = nil
			
			for i, v in routes do
				if string.find(p2.url, v.pattern, 1, true) then
					respond = v.respond
					break
				end
			end
			local ok = respond or p1.fallback
			
			if ok == nil then
				p3(true, {
					statusCode = 404,
					responseBody = httpService:JSONEncode({
						code = 5,
						message = "createMockNetwork: no route matched " .. p2.url
					})
				})
				
				return noopCancel
			end
			ok, status = pcall(ok, p2)
			
			if ok then
				p3(true, normalizeResponse(status))
			else
				p3(false, tostring(status))
			end
			return noopCancel
		end
	}
end