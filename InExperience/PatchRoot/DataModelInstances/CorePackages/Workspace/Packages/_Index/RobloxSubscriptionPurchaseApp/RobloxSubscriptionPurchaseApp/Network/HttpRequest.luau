local promiseModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Promise)
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.http = p0 or game:GetService("HttpService")
	
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

function t.post(p6, p7, p8)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p9, p10)
		-- upvalues: p6 (ref), p7 (ref), p8 (ref)
		p6.http:RequestInternal({
			Method = "POST",
			Url = p7,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = p6.http:JSONEncode(p8)
		}):Start(function(_, p11)
			-- upvalues: p9 (ref), p6 (copy), p10 (ref)
			if p11.StatusCode == 200 then
				p9(p6.http:JSONDecode(p11.Body))
				
				return
			end
			p10({ status = p11.StatusCode, body = p11.Body })
		end)
	end)
end

return t