local promiseModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Promise)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.http = p1 or game:GetService("HttpService")
	
	return tbl
end

function t.get(p1, p2)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p3, p4)
		-- upvalues: p1 (ref), p2 (ref)
		p1.http:RequestInternal({
			Method = "GET",
			Url = p2,
			Headers = { Accept = "application/json" }
		}):Start(function(_, p5)
			-- upvalues: p3 (ref), p1 (copy), p4 (ref)
			if p5.StatusCode == 200 then
				p3(p1.http:JSONDecode(p5.Body))
				
				return
			end
			p4({ status = p5.StatusCode, body = p5.Body })
		end)
	end)
end

function t.post(p1, p2, p3)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p4, p5)
		-- upvalues: p1 (ref), p2 (ref), p3 (ref)
		p1.http:RequestInternal({
			Method = "POST",
			Url = p2,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = p1.http:JSONEncode(p3)
		}):Start(function(_, p6)
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