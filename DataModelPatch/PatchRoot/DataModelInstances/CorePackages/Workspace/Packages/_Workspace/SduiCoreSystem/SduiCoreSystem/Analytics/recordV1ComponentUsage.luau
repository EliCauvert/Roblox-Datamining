local SduiUsageRecorderModule = require(script:FindFirstAncestor("SduiCoreSystem").Analytics.SduiUsageRecorder)

local function recordV1ComponentUsage(p1, p2)
	-- upvalues: SduiUsageRecorderModule (copy), recordV1ComponentUsage (copy)
	if not p2 then return end
	local IsTypeSamplingEnabled = SduiUsageRecorderModule.isTypeSamplingEnabled()
	local IsParamSamplingEnabled = SduiUsageRecorderModule.isParamSamplingEnabled()
	
	if not IsTypeSamplingEnabled and not IsParamSamplingEnabled then return end
	local ComponentType = p2.componentType
	
	if typeof(ComponentType) ~= "string" then return end
	if IsTypeSamplingEnabled then
		SduiUsageRecorderModule.recordComponentType(p1, "v1", ComponentType)
	end
	local Callback = nil
	
	local function visitValueForActions(List)
		-- upvalues: Callback (ref), visitValueForActions (copy)
		if typeof(List) ~= "table" then return end
		if typeof(List.actionType) == "string" then
			Callback(List)
			
			return
		end
		for _, value in List do
			if typeof(value) == "table" then
				visitValueForActions(value)
			end
		end
	end
	
	Callback = function(p3)
		-- upvalues: IsTypeSamplingEnabled (copy), SduiUsageRecorderModule (upval), p1 (copy), IsParamSamplingEnabled (copy), visitValueForActions (copy)
		local ActionType = p3.actionType
		
		if typeof(ActionType) ~= "string" then return end
		if IsTypeSamplingEnabled then
			SduiUsageRecorderModule.recordActionType(p1, "v1", ActionType)
		end
		local ActionParams = p3.actionParams
		
		if typeof(ActionParams) ~= "table" then return end
		for i, actionParam in ActionParams do
			if typeof(i) == "string" and IsParamSamplingEnabled then
				SduiUsageRecorderModule.recordActionParam(p1, "v1", ActionType, i)
			end
			visitValueForActions(actionParam)
		end
	end
	
	local function walkProps(PropOverrides)
		-- upvalues: IsParamSamplingEnabled (copy), SduiUsageRecorderModule (upval), p1 (copy), ComponentType (copy), visitValueForActions (copy)
		if typeof(PropOverrides) ~= "table" then return end
		for i, propOverride in PropOverrides do
			if typeof(i) == "string" and IsParamSamplingEnabled then
				SduiUsageRecorderModule.recordProp(p1, "v1", ComponentType, i)
			end
			visitValueForActions(propOverride)
		end
	end
	
	walkProps(p2.props)
	
	if typeof(p2.conditionalProps) == "table" then
		for _, conditionalProp in p2.conditionalProps do
			if typeof(conditionalProp) == "table" then
				walkProps(conditionalProp.propOverrides)
			end
		end
	end
	if typeof(p2.children) == "table" then
		for _, child in p2.children do
			recordV1ComponentUsage(p1, child)
		end
	end
end

return recordV1ComponentUsage