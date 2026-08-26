local signal = require(script:FindFirstAncestor("RealtimeDelivery").Parent.AppCommonLib).Signal
local httpService = game:GetService("HttpService")
local t = {}
t.__index = t

function t:observeEvent(p1, p2)
	-- upvalues: signal (ref)
	assert(type(p1) == "string", "Expected namespace to be a string")
	assert(type(p2) == "function", "Expected callback to be a function")
	local var1 = self.namespaceTable[p1]
	
	if var1 == nil then
		var1 = signal.new()
		self.namespaceTable[p1] = var1
	end
	return var1:connect(p2)
end

function t.new(p1)
	-- upvalues: t (ref), httpService (ref)
	local t_1 = { namespaceTable = {} }
	setmetatable(t_1, t)
	t_1.connections = {
		p1.RobloxEventReceived:Connect(function(p2)
			-- upvalues: t_1 (ref), httpService (copy)
			local namespace = t_1.namespaceTable[p2.namespace]
			
			if namespace == nil then return end
			local t
			local _ = nil
			
			if p2.detail and p2.detail ~= "" then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p2 (ref)
					return httpService:JSONDecode(p2.detail)
				end)
				t = if ok then status else p2.detail
			else
				t = {}
			end
			namespace:fire(t, p2.detailType)
		end),
		p1.RobloxConnectionChanged:Connect(function(p2, p3, p4, p5)
			-- upvalues: t_1 (ref), httpService (copy)
			local var1 = t_1.namespaceTable[p2]
			
			if var1 == nil then return end
			local var2 = nil
			
			if p5 then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p5 (ref)
					return httpService:JSONDecode(p5)
				end)
				var2 = if ok then status else {}
			end
			var1:fire(p3, p4, var2)
		end)
	}
	
	return t_1
end

return t