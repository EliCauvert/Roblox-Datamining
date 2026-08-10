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

local function convertToLuaEnum(p0, p1, p2) --[[ line: 48 ]]
	local match = string.match(p0, "^" .. p1 .. "(.*)")
	
	if not match then
		return p0
	end
	local var7 = match:lower():gsub("_(%l)", function(p3) --[[ line: 62 ]]
		return p3:upper()
	end)
	
	return if p2 then var7:gsub("^%l", string.upper) else var7
end

return {
	mapProtoEnumFormatToLua = function(p4, p5, p6) --[[ line: 80 ]]
		-- upvalues: t (ref), convertToLuaEnum (ref)
		local var8 = t[p4]
		
		if not var8 then
			var8 = convertToLuaEnum(p4, p5, p6)
			t[p4] = var8
		end
		return var8
	end,
	mapUiComponentTypeToLua = function(p7) --[[ line: 114 ]]
		-- upvalues: t (ref), convertToLuaEnum (ref), sduiComponentTypeModule (ref)
		if p7 == nil then
			return nil
		end
		local var9 = t[p7]
		
		if not var9 then
			var9 = convertToLuaEnum(p7, "UI_COMPONENT_TYPE_", true)
			t[p7] = var9
		end
		return if sduiComponentTypeModule[var9] then sduiComponentTypeModule[var9] else nil
	end,
	mapHydrationContentTypeToLua = function(p8) --[[ line: 148 ]]
		-- upvalues: t (ref), sduiDataBindingContentTypeModule (ref)
		if p8 == nil then
			return nil
		end
		local var10 = t[p8]
		
		if not var10 then
			local match = string.match(p8, "^HYDRATION_CONTENT_TYPE_(.*)")
			var10 = if not match then p8 else match:lower():gsub("_(%l)", function(p9) --[[ line: 62 ]]
				return p9:upper()
			end)
			t[p8] = var10
		end
		return if sduiDataBindingContentTypeModule[var10] then sduiDataBindingContentTypeModule[var10] else nil
	end,
	mapActionTypeToLua = function(p10) --[[ line: 131 ]]
		-- upvalues: t (ref), convertToLuaEnum (ref), sduiActionTypeModule (ref)
		if p10 == nil then
			return nil
		end
		local var12 = t[p10]
		
		if not var12 then
			var12 = convertToLuaEnum(p10, "ACTION_TYPE_", true)
			t[p10] = var12
		end
		return if sduiActionTypeModule[var12] then sduiActionTypeModule[var12] else nil
	end,
	mapPropName = function(p11) --[[ line: 168 ]]
		-- upvalues: t (ref), snakeToCamel (ref)
		if p11 == nil then
			return nil
		elseif typeof(p11) == "number" then
			return p11
		end
		local var13 = t[p11]
		
		if not var13 then
			var13 = snakeToCamel(p11)
			t[p11] = var13
		end
		return var13
	end,
	camelCaseKeys = function(p12) --[[ line: 189 ]]
		-- upvalues: t (ref), snakeToCamel (ref)
		if type(p12) ~= "table" then
			return p12
		end
		local t_1 = {}
		
		for i, v in p12 do
			local var15
			if type(i) ~= "string" then
				var15 = i
			elseif i == nil then
				var15 = nil
			elseif typeof(i) == "number" then
				var15 = i
			else
				local var16 = t[i]
				
				if not var16 then
					var16 = snakeToCamel(i)
					t[i] = var16
				end
				var15 = var16
			end
			t_1[var15] = v
		end
		return t_1
	end,
	mapProtoEngineEnumToLua = function(p13, p14, p15) --[[ line: 93 ]]
		-- upvalues: t (ref), convertToLuaEnum (ref)
		if p13 == nil then
			return nil
		end
		local var17 = t[p13]
		
		if not var17 then
			var17 = convertToLuaEnum(p13, p14, true)
			t[p13] = var17
		end
		return if var17 then p15(var17) else nil
	end
}