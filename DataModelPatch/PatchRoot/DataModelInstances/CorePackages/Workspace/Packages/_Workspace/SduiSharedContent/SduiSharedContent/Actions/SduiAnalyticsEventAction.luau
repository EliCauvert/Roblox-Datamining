local _ = require(script:FindFirstAncestor("SduiSharedContent").Parent.SduiCoreSystem)

local function _(p1): boolean
	local ValueType = typeof(p1)
	
	return ValueType == "string" or (ValueType == "number" or ValueType == "boolean")
end

local function mergeScalars(p1, ActionParams, p2)
	if ActionParams == nil then return end
	for i, actionParam in ActionParams do
		if not p2 or not p2[i] then
			local ValueType = typeof(actionParam)
			
			if ValueType == "string" or (ValueType == "number" or ValueType == "boolean") then
				p1[i] = actionParam
			end
		end
	end
end

local config = { eventName = true, eventFields = true }

return function(p3, p4, p5)
	-- upvalues: mergeScalars (copy), config (copy)
	local ActionParams = p3 and p3.actionParams or nil
	
	if ActionParams == nil then return end
	local EventName = ActionParams.eventName
	
	if typeof(EventName) ~= "string" or EventName == "" then return end
	local t = {}
	local AncestorAnalyticsData = p4.ancestorAnalyticsData
	
	if AncestorAnalyticsData ~= nil then
		for i, value in AncestorAnalyticsData do
			local ValueType = typeof(value)
			
			if ValueType == "string" or (ValueType == "number" or ValueType == "boolean") then
				t[i] = value
			end
		end
	end
	local AnalyticsData = p4.analyticsData
	
	if AnalyticsData ~= nil then
		for i1, value1 in AnalyticsData do
			local ValueType = typeof(value1)
			
			if ValueType == "string" or (ValueType == "number" or ValueType == "boolean") then
				t[i1] = value1
			end
		end
	end
	mergeScalars(t, ActionParams, config)
	local EventFields = ActionParams.eventFields
	
	if typeof(EventFields) == "table" and EventFields ~= nil then
		for i2, eventField in EventFields do
			local ValueType = typeof(eventField)
			
			if ValueType == "string" or (ValueType == "number" or ValueType == "boolean") then
				t[i2] = eventField
			end
		end
	end
	p5.dependencies.eventIngest:sendEventDeferred(p5.appPage, EventName, t)
end