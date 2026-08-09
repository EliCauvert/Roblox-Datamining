local promiseModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Promise)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 9 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.http = p0 or game:GetService("HttpService")
	
	return tbl
end

function t.post(p1, p2, p3) --[[ line: 15 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p4, p5) --[[ line: 16 ]]
		-- upvalues: p1 (ref), p2 (ref), p3 (ref)
		p1.http:RequestInternal({
			Method = "POST",
			Url = p2,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = p1.http:JSONEncode(p3)
		}):Start(function(_, p6) --[[ line: 27 ]]
			-- upvalues: p4 (ref), p1 (copy), p5 (ref)
			if p6.StatusCode == 200 then
				p4(p1.http:JSONDecode(p6.Body))
				
				return
			end
			p5({ status = p6.StatusCode, body = p6.Body })
		end)
	end)
end

return t