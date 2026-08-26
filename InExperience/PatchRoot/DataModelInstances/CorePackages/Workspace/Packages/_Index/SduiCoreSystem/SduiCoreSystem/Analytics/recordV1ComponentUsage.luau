local sduiUsageRecorderModule = require(script:FindFirstAncestor("SduiCoreSystem").Analytics.SduiUsageRecorder)

local function recordV1ComponentUsage(p1, p2)
	-- upvalues: sduiUsageRecorderModule (ref), recordV1ComponentUsage (ref)
	if not p2 then return end
	local var1 = sduiUsageRecorderModule.isTypeSamplingEnabled()
	local var2 = sduiUsageRecorderModule.isParamSamplingEnabled()
	
	if not var1 and not var2 then return end
	local componentType = p2.componentType
	
	if typeof(componentType) ~= "string" then return end
	if var1 then
		sduiUsageRecorderModule.recordComponentType(p1, "v1", componentType)
	end
	local recordActionConfig = nil
	
	local function visitValueForActions(p3)
		-- upvalues: recordActionConfig (write), visitValueForActions (ref)
		if typeof(p3) ~= "table" then return end
		if typeof(p3.actionType) == "string" then
			recordActionConfig(p3)
			
			return
		end
		for i, v in p3 do
			if typeof(v) == "table" then
				visitValueForActions(v)
			end
		end
	end
	
	recordActionConfig = function(p4)
		-- upvalues: var1 (ref), sduiUsageRecorderModule (copy), p1 (ref), var2 (ref), visitValueForActions (ref)
		local actionType = p4.actionType
		
		if typeof(actionType) ~= "string" then return end
		if var1 then
			sduiUsageRecorderModule.recordActionType(p1, "v1", actionType)
		end
		local actionParams = p4.actionParams
		
		if typeof(actionParams) ~= "table" then return end
		for i, v in actionParams do
			if typeof(i) == "string" and var2 then
				sduiUsageRecorderModule.recordActionParam(p1, "v1", actionType, i)
			end
			visitValueForActions(v)
		end
	end
	
	local function walkProps(p5)
		-- upvalues: var2 (ref), sduiUsageRecorderModule (copy), p1 (ref), componentType (ref), visitValueForActions (ref)
		if typeof(p5) ~= "table" then return end
		for i, v in p5 do
			if typeof(i) == "string" and var2 then
				sduiUsageRecorderModule.recordProp(p1, "v1", componentType, i)
			end
			visitValueForActions(v)
		end
	end
	
	walkProps(p2.props)
	
	if typeof(p2.conditionalProps) == "table" then
		for i, v in p2.conditionalProps do
			if typeof(v) == "table" then
				walkProps(v.propOverrides)
			end
		end
	end
	if typeof(p2.children) == "table" then
		for i, v in p2.children do
			recordV1ComponentUsage(p1, v)
		end
	end
end

return recordV1ComponentUsage