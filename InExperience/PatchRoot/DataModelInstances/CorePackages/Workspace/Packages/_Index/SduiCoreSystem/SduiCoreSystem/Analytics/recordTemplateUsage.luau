local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiUsageRecorderModule = require(sduiCoreSystem.Analytics.SduiUsageRecorder)

local function _(p1)
	return if p1 and p1.oneof_prop and p1.oneof_prop.value then p1.oneof_prop.value else p1
end

local recordV2ActionPropDefinition = nil

local _ = function(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local kind = p1.kind
	
	return if typeof(kind) == "table" and typeof(kind.value) == "table" then kind.value elseif typeof(p1.action_type) == "string" then p1 else nil
end

local function recordV2ActionConfig(p1, p2)
	-- upvalues: sduiCoreSystem (ref), sduiUsageRecorderModule (ref), recordV2ActionPropDefinition (write)
	if typeof(p2) ~= "table" then return end
	local actionType = p2.action_type
	
	if typeof(actionType) ~= "string" then return end
	local var1 = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper).mapActionTypeToLua(actionType)
	
	if not var1 then return end
	if sduiUsageRecorderModule.isTypeSamplingEnabled() then
		sduiUsageRecorderModule.recordActionType(p1, "v2", var1)
	end
	local actionParams = p2.action_params
	
	if typeof(actionParams) ~= "table" then return end
	local var2 = sduiUsageRecorderModule.isParamSamplingEnabled()
	
	for i, v in actionParams do
		if typeof(i) == "string" and var2 then
			sduiUsageRecorderModule.recordActionParam(p1, "v2", var1, i)
		end
		local var3 = if v and v.oneof_prop and v.oneof_prop.value then v.oneof_prop.value else v
		local descriptor = var3 and var3.descriptor
		
		if descriptor and descriptor.name == "ActionProp" then
			recordV2ActionPropDefinition(p1, var3)
		end
	end
end

recordV2ActionPropDefinition = function(p3, p4)
	-- upvalues: recordV2ActionConfig (ref)
	local var4
	local kind = p4 and p4.kind
	local value = kind and kind.value
	
	if not value then return end
	if kind.type == "conditional" then
		local options = value.options
		
		if typeof(options) ~= "table" then return end
		for i, v in options do
			local var5
			local value_1 = v and (v.kind and v.kind.value)
			
			if typeof(value_1) == "table" then
				local kind_1 = value_1.kind
				var5 = if typeof(kind_1) == "table" and typeof(kind_1.value) == "table" then kind_1.value elseif typeof(value_1.action_type) == "string" then value_1 else nil
			else
				var5 = nil
			end
			if var5 then
				recordV2ActionConfig(p3, var5)
			end
		end
		return
	elseif typeof(value) == "table" then
		local kind_1 = value.kind
		var4 = if typeof(kind_1) == "table" and typeof(kind_1.value) == "table" then kind_1.value elseif typeof(value.action_type) == "string" then value else nil
	else
		var4 = nil
	end
	if var4 then
		recordV2ActionConfig(p3, var4)
	end
end

return function(p5, p6)
	-- upvalues: sduiUsageRecorderModule (ref), sduiCoreSystem (ref), recordV2ActionPropDefinition (write)
	if not p6 then return end
	local var6 = sduiUsageRecorderModule.isTypeSamplingEnabled()
	local var7 = sduiUsageRecorderModule.isParamSamplingEnabled()
	
	if not var6 and not var7 then return end
	local value = p6.kind and p6.kind.value
	
	if not value then return end
	local componentType = value.shared and value.shared.component_type
	
	if not componentType then return end
	local var8 = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper).mapUiComponentTypeToLua(componentType)
	
	if not var8 then return end
	if var6 then
		sduiUsageRecorderModule.recordComponentType(p5, "v2", var8)
	end
	local props = value.props
	
	if not props then return end
	for i, v in props do
		if typeof(i) == "string" then
			if var7 then
				sduiUsageRecorderModule.recordProp(p5, "v2", var8, i)
			end
			local var9 = if v and v.oneof_prop and v.oneof_prop.value then v.oneof_prop.value else v
			local descriptor = var9 and var9.descriptor
			
			if descriptor and descriptor.name == "ActionProp" then
				recordV2ActionPropDefinition(p5, var9)
			end
		end
	end
end