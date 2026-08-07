local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiUsageRecorderModule = require(sduiCoreSystem.Analytics.SduiUsageRecorder)

local function _(p0) --[[ line: 23 | named "unwrapOneofProp" ]]
	return if p0 and p0.oneof_prop and p0.oneof_prop.value then p0.oneof_prop.value else p0
end

local recordV2ActionPropDefinition = nil

local _ = function(p1) --[[ line: 37 | named "unwrapInnerActionConfig" ]]
	if typeof(p1) ~= "table" then
		return nil
	end
	local kind = p1.kind
	
	return if typeof(kind) == "table" and typeof(kind.value) == "table" then kind.value elseif typeof(p1.action_type) == "string" then p1 else nil
end

local function recordV2ActionConfig(p2, p3) --[[ line: 56 ]]
	-- upvalues: sduiCoreSystem (ref), sduiUsageRecorderModule (ref), recordV2ActionPropDefinition (write)
	if typeof(p3) ~= "table" then return end
	local actionType = p3.action_type
	
	if typeof(actionType) ~= "string" then return end
	local var4 = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper).mapActionTypeToLua(actionType)
	
	if not var4 then return end
	if sduiUsageRecorderModule.isTypeSamplingEnabled() then
		sduiUsageRecorderModule.recordActionType(p2, "v2", var4)
	end
	local actionParams = p3.action_params
	
	if typeof(actionParams) ~= "table" then return end
	local var5 = sduiUsageRecorderModule.isParamSamplingEnabled()
	
	for i, v in actionParams do
		if typeof(i) == "string" and var5 then
			sduiUsageRecorderModule.recordActionParam(p2, "v2", var4, i)
		end
		local var6 = if v and v.oneof_prop and v.oneof_prop.value then v.oneof_prop.value else v
		local descriptor = var6 and var6.descriptor
		
		if descriptor and descriptor.name == "ActionProp" then
			recordV2ActionPropDefinition(p2, var6)
		end
	end
end

recordV2ActionPropDefinition = function(p4, p5) --[[ line: 95 | named "recordV2ActionPropDefinition" ]]
	-- upvalues: recordV2ActionConfig (ref)
	local var12
	local kind = p5 and p5.kind
	local value = kind and kind.value
	
	if not value then return end
	if kind.type == "conditional" then
		local options = value.options
		
		if typeof(options) ~= "table" then return end
		for i, v in options do
			local var11
			local value_1 = v and (v.kind and v.kind.value)
			
			if typeof(value_1) == "table" then
				local kind_1 = value_1.kind
				var11 = if typeof(kind_1) == "table" and typeof(kind_1.value) == "table" then kind_1.value elseif typeof(value_1.action_type) == "string" then value_1 else nil
			else
				var11 = nil
			end
			if var11 then
				recordV2ActionConfig(p4, var11)
			end
		end
		return
	elseif typeof(value) == "table" then
		local kind_1 = value.kind
		var12 = if typeof(kind_1) == "table" and typeof(kind_1.value) == "table" then kind_1.value elseif typeof(value.action_type) == "string" then value else nil
	else
		var12 = nil
	end
	if var12 then
		recordV2ActionConfig(p4, var12)
	end
end

return function(p6, p7) --[[ line: 123 | named "recordTemplateUsage" ]]
	-- upvalues: sduiUsageRecorderModule (ref), sduiCoreSystem (ref), recordV2ActionPropDefinition (write)
	if not p7 then return end
	local var13 = sduiUsageRecorderModule.isTypeSamplingEnabled()
	local var14 = sduiUsageRecorderModule.isParamSamplingEnabled()
	
	if not var13 and not var14 then return end
	local value = p7.kind and p7.kind.value
	
	if not value then return end
	local componentType = value.shared and value.shared.component_type
	
	if not componentType then return end
	local var17 = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper).mapUiComponentTypeToLua(componentType)
	
	if not var17 then return end
	if var13 then
		sduiUsageRecorderModule.recordComponentType(p6, "v2", var17)
	end
	local props = value.props
	
	if not props then return end
	for i, v in props do
		if typeof(i) == "string" then
			if var14 then
				sduiUsageRecorderModule.recordProp(p6, "v2", var17, i)
			end
			local var18 = if v and v.oneof_prop and v.oneof_prop.value then v.oneof_prop.value else v
			local descriptor = var18 and var18.descriptor
			
			if descriptor and descriptor.name == "ActionProp" then
				recordV2ActionPropDefinition(p6, var18)
			end
		end
	end
end