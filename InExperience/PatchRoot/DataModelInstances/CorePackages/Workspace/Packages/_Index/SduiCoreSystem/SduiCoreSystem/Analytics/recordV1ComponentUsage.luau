local sduiUsageRecorderModule = require(script:FindFirstAncestor("SduiCoreSystem").Analytics.SduiUsageRecorder)

local function recordV1ComponentUsage(p0, p1) --[[ line: 21 ]]
	-- upvalues: sduiUsageRecorderModule (ref), recordV1ComponentUsage (ref)
	if not p1 then return end
	local var2 = sduiUsageRecorderModule.isTypeSamplingEnabled()
	local var3 = sduiUsageRecorderModule.isParamSamplingEnabled()
	
	if not var2 and not var3 then return end
	local componentType = p1.componentType
	
	if typeof(componentType) ~= "string" then return end
	if var2 then
		sduiUsageRecorderModule.recordComponentType(p0, "v1", componentType)
	end
	local recordActionConfig = nil
	
	local function visitValueForActions(p2) --[[ line: 45 ]]
		-- upvalues: recordActionConfig (write), visitValueForActions (ref)
		if typeof(p2) ~= "table" then return end
		if typeof(p2.actionType) == "string" then
			recordActionConfig(p2)
			
			return
		end
		for i, v in p2 do
			if typeof(v) == "table" then
				visitValueForActions(v)
			end
		end
	end
	
	recordActionConfig = function(p3) --[[ line: 60 | named "recordActionConfig" ]]
		-- upvalues: var2 (ref), sduiUsageRecorderModule (copy), p0 (ref), var3 (ref), visitValueForActions (ref)
		local actionType = p3.actionType
		
		if typeof(actionType) ~= "string" then return end
		if var2 then
			sduiUsageRecorderModule.recordActionType(p0, "v1", actionType)
		end
		local actionParams = p3.actionParams
		
		if typeof(actionParams) ~= "table" then return end
		for i, v in actionParams do
			if typeof(i) == "string" and var3 then
				sduiUsageRecorderModule.recordActionParam(p0, "v1", actionType, i)
			end
			visitValueForActions(v)
		end
	end
	
	local function walkProps(p4) --[[ line: 80 ]]
		-- upvalues: var3 (ref), sduiUsageRecorderModule (copy), p0 (ref), componentType (ref), visitValueForActions (ref)
		if typeof(p4) ~= "table" then return end
		for i, v in p4 do
			if typeof(i) == "string" and var3 then
				sduiUsageRecorderModule.recordProp(p0, "v1", componentType, i)
			end
			visitValueForActions(v)
		end
	end
	
	walkProps(p1.props)
	
	if typeof(p1.conditionalProps) == "table" then
		for i, v in p1.conditionalProps do
			if typeof(v) == "table" then
				walkProps(v.propOverrides)
			end
		end
	end
	if typeof(p1.children) == "table" then
		for i, v in p1.children do
			recordV1ComponentUsage(p0, v)
		end
	end
end

return recordV1ComponentUsage