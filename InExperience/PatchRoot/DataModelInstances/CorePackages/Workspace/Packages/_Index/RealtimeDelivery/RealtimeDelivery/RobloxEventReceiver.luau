local signal = require(script:FindFirstAncestor("RealtimeDelivery").Parent.AppCommonLib).Signal
local httpService = game:GetService("HttpService")
local t = {}
t.__index = t

function t:observeEvent(p0, p1) --[[ line: 14 ]]
	-- upvalues: signal (ref)
	assert(type(p0) == "string", "Expected namespace to be a string")
	assert(type(p1) == "function", "Expected callback to be a function")
	local var2 = self.namespaceTable[p0]
	
	if var2 == nil then
		var2 = signal.new()
		self.namespaceTable[p0] = var2
	end
	return var2:connect(p1)
end

function t.new(p2) --[[ line: 27 ]]
	-- upvalues: t (ref), httpService (ref)
	local t_1 = { namespaceTable = {} }
	setmetatable(t_1, t)
	t_1.connections = {
		p2.RobloxEventReceived:Connect(function(p3) --[[ line: 34 ]]
			-- upvalues: t_1 (ref), httpService (copy)
			local namespace = t_1.namespaceTable[p3.namespace]
			
			if namespace == nil then return end
			local t
			local _ = nil
			
			if p3.detail and p3.detail ~= "" then
				local ok, status = pcall(function() --[[ line: 43 ]]
					-- upvalues: httpService (copy), p3 (ref)
					return httpService:JSONDecode(p3.detail)
				end)
				t = if ok then status else p3.detail
			else
				t = {}
			end
			namespace:fire(t, p3.detailType)
		end),
		p2.RobloxConnectionChanged:Connect(function(p4, p5, p6, p7) --[[ line: 60 ]]
			-- upvalues: t_1 (ref), httpService (copy)
			local var5 = t_1.namespaceTable[p4]
			
			if var5 == nil then return end
			local var6 = nil
			
			if p7 then
				local ok, status = pcall(function() --[[ line: 69 ]]
					-- upvalues: httpService (copy), p7 (ref)
					return httpService:JSONDecode(p7)
				end)
				var6 = if ok then status else {}
			end
			var5:fire(p5, p6, var6)
		end)
	}
	
	return t_1
end

return t