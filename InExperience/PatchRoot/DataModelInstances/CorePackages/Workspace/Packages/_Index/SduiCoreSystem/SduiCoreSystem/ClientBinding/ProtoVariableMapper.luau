local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.ServiceContractsProto)
local sduiActionTypeModule = require(sduiCoreSystem.SduiActionType)
local sduiComponentTypeModule = require(sduiCoreSystem.SduiComponentType)
local sduiDataBindingContentTypeModule = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local snakeToCamel = require(sduiCoreSystem.ClientBinding.SduiDataBinderTransformUtils).snakeToCamel
local t = {
	AUTOMATIC_SIZE_XY = "XY",
	SIZE_CONSTRAINT_RELATIVE_XY = "RelativeXY",
	SIZE_CONSTRAINT_RELATIVE_XX = "RelativeXX",
	SIZE_CONSTRAINT_RELATIVE_YY = "RelativeYY"
}

local function convertToLuaEnum(p1, p2, p3)
	local match = string.match(p1, "^" .. p1 .. "(.*)")
	
	if not match then
		return p1
	end
	local var1 = match:lower():gsub("_(%l)", function(p4)
		return p4:upper()
	end)
	
	return if p3 then var1:gsub("^%l", string.upper) else var1
end

return {
	mapProtoEnumFormatToLua = function(p1, p2, p3)
		-- upvalues: t (ref), convertToLuaEnum (ref)
		local var1 = t[p1]
		
		if not var1 then
			var1 = convertToLuaEnum(p1, p2, p3)
			t[p1] = var1
		end
		return var1
	end,
	mapUiComponentTypeToLua = function(p1)
		-- upvalues: t (ref), convertToLuaEnum (ref), sduiComponentTypeModule (ref)
		if p1 == nil then
			return nil
		end
		local var1 = t[p1]
		
		if not var1 then
			var1 = convertToLuaEnum(p1, "UI_COMPONENT_TYPE_", true)
			t[p1] = var1
		end
		return if sduiComponentTypeModule[var1] then sduiComponentTypeModule[var1] else nil
	end,
	mapHydrationContentTypeToLua = function(p1)
		-- upvalues: t (ref), sduiDataBindingContentTypeModule (ref)
		if p1 == nil then
			return nil
		end
		local var1 = t[p1]
		
		if not var1 then
			local match = string.match(p1, "^HYDRATION_CONTENT_TYPE_(.*)")
			var1 = if not match then p1 else match:lower():gsub("_(%l)", function(p2)
				return p2:upper()
			end)
			t[p1] = var1
		end
		return if sduiDataBindingContentTypeModule[var1] then sduiDataBindingContentTypeModule[var1] else nil
	end,
	mapActionTypeToLua = function(p1)
		-- upvalues: t (ref), convertToLuaEnum (ref), sduiActionTypeModule (ref)
		if p1 == nil then
			return nil
		end
		local var1 = t[p1]
		
		if not var1 then
			var1 = convertToLuaEnum(p1, "ACTION_TYPE_", true)
			t[p1] = var1
		end
		return if sduiActionTypeModule[var1] then sduiActionTypeModule[var1] else nil
	end,
	mapPropName = function(p1)
		-- upvalues: t (ref), snakeToCamel (ref)
		if p1 == nil then
			return nil
		elseif typeof(p1) == "number" then
			return p1
		end
		local var1 = t[p1]
		
		if not var1 then
			var1 = snakeToCamel(p1)
			t[p1] = var1
		end
		return var1
	end,
	camelCaseKeys = function(p1)
		-- upvalues: t (ref), snakeToCamel (ref)
		if type(p1) ~= "table" then
			return p1
		end
		local t_1 = {}
		
		for i, v in p1 do
			local var1
			if type(i) ~= "string" then
				var1 = i
			elseif i == nil then
				var1 = nil
			elseif typeof(i) == "number" then
				var1 = i
			else
				local var2 = t[i]
				
				if not var2 then
					var2 = snakeToCamel(i)
					t[i] = var2
				end
				var1 = var2
			end
			t_1[var1] = v
		end
		return t_1
	end,
	mapProtoEngineEnumToLua = function(p2, p3, p4)
		-- upvalues: t (ref), convertToLuaEnum (ref)
		if p2 == nil then
			return nil
		end
		local var3 = t[p2]
		
		if not var3 then
			var3 = convertToLuaEnum(p2, p3, true)
			t[p2] = var3
		end
		return if var3 then p4(var3) else nil
	end
}