local PromiseModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Promise)
local HttpRequestModule = {}
HttpRequestModule.__index = HttpRequestModule

function HttpRequestModule.new(p1) --[[ Line: 9 ]]
	-- upvalues: HttpRequestModule (copy)
	local self = setmetatable({}, HttpRequestModule)
	self.http = p1 or game:GetService("HttpService")
	
	return self
end

function HttpRequestModule.get(p1, Url) --[[ Line: 15 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback, Callback1) --[[ Line: 16 ]]
		-- upvalues: p1 (copy), Url (copy)
		p1.http:RequestInternal({
			Method = "GET",
			Url = Url,
			Headers = { Accept = "application/json" }
		}):Start(function(_, p2) --[[ Line: 25 ]]
			-- upvalues: Callback (copy), p1 (upval), Callback1 (copy)
			if p2.StatusCode == 200 then
				Callback(p1.http:JSONDecode(p2.Body))
				
				return
			else
				Callback1({ status = p2.StatusCode, body = p2.Body })
			end
		end)
	end)
end

function HttpRequestModule.post(p1, Url, Input) --[[ Line: 38 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback1, Callback) --[[ Line: 39 ]]
		-- upvalues: p1 (copy), Url (copy), Input (copy)
		p1.http:RequestInternal({
			Method = "POST",
			Url = Url,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = p1.http:JSONEncode(Input)
		}):Start(function(_, p2) --[[ Line: 50 ]]
			-- upvalues: Callback1 (copy), p1 (upval), Callback (copy)
			if p2.StatusCode == 200 then
				Callback1(p1.http:JSONDecode(p2.Body))
				
				return
			else
				Callback({ status = p2.StatusCode, body = p2.Body })
			end
		end)
	end)
end

return HttpRequestModule