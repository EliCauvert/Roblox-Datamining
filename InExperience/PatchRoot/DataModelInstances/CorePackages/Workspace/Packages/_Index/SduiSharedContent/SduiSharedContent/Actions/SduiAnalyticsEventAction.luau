local _ = require(script:FindFirstAncestor("SduiSharedContent").Parent.SduiCoreSystem)

local function _(p0)
	local var2 = typeof(p0)
	
	return if var2 ~= "string" then if var2 ~= "number" then var2 == "boolean" else true else true
end

local function mergeScalars(p1, p2, p3)
	if p2 == nil then return end
	for i, v in p2 do
		if not p3 or not p3[i] then
			local var3 = typeof(v)
			
			if if var3 ~= "string" then if var3 ~= "number" then var3 == "boolean" else true else true then
				p1[i] = v
			end
		end
	end
end

local t = { eventName = true, eventFields = true }

return function(p4, p5, p6)
	-- upvalues: mergeScalars (ref), t (ref)
	local var4 = if p4 then p4.actionParams else nil
	
	if var4 == nil then return end
	local eventName = var4.eventName
	
	if typeof(eventName) ~= "string" or eventName == "" then return end
	local t_1 = {}
	local ancestorAnalyticsData = p5.ancestorAnalyticsData
	
	if ancestorAnalyticsData ~= nil then
		for i, v in ancestorAnalyticsData do
			local var6 = typeof(v)
			
			if if var6 ~= "string" then if var6 ~= "number" then var6 == "boolean" else true else true then
				t_1[i] = v
			end
		end
	end
	local analyticsData = p5.analyticsData
	
	if analyticsData ~= nil then
		for i, v in analyticsData do
			local var7 = typeof(v)
			
			if if var7 ~= "string" then if var7 ~= "number" then var7 == "boolean" else true else true then
				t_1[i] = v
			end
		end
	end
	mergeScalars(t_1, var4, t)
	local eventFields = var4.eventFields
	
	if typeof(eventFields) == "table" and eventFields ~= nil then
		for i, v in eventFields do
			local var8 = typeof(v)
			
			if if var8 ~= "string" then if var8 ~= "number" then var8 == "boolean" else true else true then
				t_1[i] = v
			end
		end
	end
	p6.dependencies.eventIngest:sendEventDeferred(p6.appPage, eventName, t_1)
end