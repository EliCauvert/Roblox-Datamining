local _ = require(script:FindFirstAncestor("SduiSharedContent").Parent.SduiCoreSystem)

local function _(p1)
	local var1 = typeof(p1)
	
	return if var1 ~= "string" then if var1 ~= "number" then var1 == "boolean" else true else true
end

local function mergeScalars(p1, p2, p3)
	if p2 == nil then return end
	for i, v in p2 do
		if not p3 or not p3[i] then
			local var1 = typeof(v)
			
			if if var1 ~= "string" then if var1 ~= "number" then var1 == "boolean" else true else true then
				p1[i] = v
			end
		end
	end
end

local t = { eventName = true, eventFields = true }

return function(p4, p5, p6)
	-- upvalues: mergeScalars (ref), t (ref)
	local var2 = if p4 then p4.actionParams else nil
	
	if var2 == nil then return end
	local eventName = var2.eventName
	
	if typeof(eventName) ~= "string" or eventName == "" then return end
	local t_1 = {}
	local ancestorAnalyticsData = p5.ancestorAnalyticsData
	
	if ancestorAnalyticsData ~= nil then
		for i, v in ancestorAnalyticsData do
			local var3 = typeof(v)
			
			if if var3 ~= "string" then if var3 ~= "number" then var3 == "boolean" else true else true then
				t_1[i] = v
			end
		end
	end
	local analyticsData = p5.analyticsData
	
	if analyticsData ~= nil then
		for i, v in analyticsData do
			local var4 = typeof(v)
			
			if if var4 ~= "string" then if var4 ~= "number" then var4 == "boolean" else true else true then
				t_1[i] = v
			end
		end
	end
	mergeScalars(t_1, var2, t)
	local eventFields = var2.eventFields
	
	if typeof(eventFields) == "table" and eventFields ~= nil then
		for i, v in eventFields do
			local var5 = typeof(v)
			
			if if var5 ~= "string" then if var5 ~= "number" then var5 == "boolean" else true else true then
				t_1[i] = v
			end
		end
	end
	p6.dependencies.eventIngest:sendEventDeferred(p6.appPage, eventName, t_1)
end