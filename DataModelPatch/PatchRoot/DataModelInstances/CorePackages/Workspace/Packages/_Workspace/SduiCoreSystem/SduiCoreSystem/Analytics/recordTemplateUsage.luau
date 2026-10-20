local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiUsageRecorderModule = require(SduiCoreSystem.Analytics.SduiUsageRecorder)

local function _(p1)
	return if p1 and p1.oneof_prop and p1.oneof_prop.value then p1.oneof_prop.value else p1
end

local Callback = nil

local _ = function(p1)
	if typeof(p1) == "table" then
		local Kind = p1.kind
		
		return if typeof(Kind) == "table" and typeof(Kind.value) == "table" then Kind.value elseif typeof(p1.action_type) == "string" then p1 else nil
	else
		return nil
	end
end

local function recordV2ActionConfig(p1, p2)
	-- upvalues: SduiCoreSystem (copy), SduiUsageRecorderModule (copy), Callback (ref)
	if typeof(p2) ~= "table" then return end
	local ActionType = p2.action_type
	
	if typeof(ActionType) ~= "string" then return end
	local MapActionTypeToLuaResult = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper).mapActionTypeToLua(ActionType)
	
	if not MapActionTypeToLuaResult then return end
	if SduiUsageRecorderModule.isTypeSamplingEnabled() then
		SduiUsageRecorderModule.recordActionType(p1, "v2", MapActionTypeToLuaResult)
	end
	local ActionParams = p2.action_params
	
	if typeof(ActionParams) ~= "table" then return end
	local IsParamSamplingEnabled = SduiUsageRecorderModule.isParamSamplingEnabled()
	
	for i, actionParam in ActionParams do
		if typeof(i) == "string" and IsParamSamplingEnabled then
			SduiUsageRecorderModule.recordActionParam(p1, "v2", MapActionTypeToLuaResult, i)
		end
		local Value = if actionParam and actionParam.oneof_prop and actionParam.oneof_prop.value then actionParam.oneof_prop.value else actionParam
		local Descriptor = Value and Value.descriptor
		
		if Descriptor and Descriptor.name == "ActionProp" then
			Callback(p1, Value)
		end
	end
end

Callback = function(p3, p4)
	-- upvalues: recordV2ActionConfig (copy)
	local Kind = p4 and p4.kind
	local Value = Kind and Kind.value
	
	if not Value then return end
	if Kind.type == "conditional" then
		local Options = Value.options
		
		if typeof(Options) ~= "table" then return end
		for _, option in Options do
			local Value1 = option and (option.kind and option.kind.value)
			local v1 = nil
			
			if typeof(Value1) == "table" then
				local Kind1 = Value1.kind
				v1 = if typeof(Kind1) == "table" and typeof(Kind1.value) == "table" then Kind1.value elseif typeof(Value1.action_type) == "string" then Value1 else nil
			else
				v1 = nil
			end
			if v1 then
				recordV2ActionConfig(p3, v1)
			end
		end
		return
	else
		local v2 = nil
		if typeof(Value) == "table" then
			local Kind2 = Value.kind
			v2 = if typeof(Kind2) == "table" and typeof(Kind2.value) == "table" then Kind2.value elseif typeof(Value.action_type) == "string" then Value else nil
		else
			v2 = nil
		end
		if v2 then
			recordV2ActionConfig(p3, v2)
		end
	end
end

return function(p5, p6)
	-- upvalues: SduiUsageRecorderModule (copy), SduiCoreSystem (copy), Callback (ref)
	if not p6 then return end
	local IsTypeSamplingEnabled = SduiUsageRecorderModule.isTypeSamplingEnabled()
	local IsParamSamplingEnabled = SduiUsageRecorderModule.isParamSamplingEnabled()
	
	if not IsTypeSamplingEnabled and not IsParamSamplingEnabled then return end
	local Value = p6.kind and p6.kind.value
	
	if not Value then return end
	local ComponentType = Value.shared and Value.shared.component_type
	
	if not ComponentType then return end
	local MapUiComponentTypeToLuaResult = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper).mapUiComponentTypeToLua(ComponentType)
	
	if not MapUiComponentTypeToLuaResult then return end
	if IsTypeSamplingEnabled then
		SduiUsageRecorderModule.recordComponentType(p5, "v2", MapUiComponentTypeToLuaResult)
	end
	local Props = Value.props
	
	if not Props then return end
	for i, prop in Props do
		if typeof(i) == "string" then
			if IsParamSamplingEnabled then
				SduiUsageRecorderModule.recordProp(p5, "v2", MapUiComponentTypeToLuaResult, i)
			end
			local Value1 = if prop and prop.oneof_prop and prop.oneof_prop.value then prop.oneof_prop.value else prop
			local Descriptor = Value1 and Value1.descriptor
			
			if Descriptor and Descriptor.name == "ActionProp" then
				Callback(p5, Value1)
			end
		end
	end
end