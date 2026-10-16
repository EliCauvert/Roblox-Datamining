local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.ServiceContractsProto)
local SduiActionTypeModule = require(SduiCoreSystem.SduiActionType)
local SduiComponentTypeModule = require(SduiCoreSystem.SduiComponentType)
local SduiDataBindingContentTypeModule = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local SnakeToCamelFunction = require(SduiCoreSystem.ClientBinding.SduiDataBinderTransformUtils).snakeToCamel
local config = {
	AUTOMATIC_SIZE_XY = "XY",
	SIZE_CONSTRAINT_RELATIVE_XY = "RelativeXY",
	SIZE_CONSTRAINT_RELATIVE_XX = "RelativeXX",
	SIZE_CONSTRAINT_RELATIVE_YY = "RelativeYY"
}
local t = {}

local function convertToLuaEnum(Text: string, Text1, p1): string --[[ Line: 50 ]]
	local Match: string? = string.match(Text, "^" .. Text1 .. "(.*)")
	
	if Match then
		local L: string = Match:lower():gsub("_(%l)", function(Text: string): string --[[ Line: 64 ]]
			return Text:upper()
		end)
		
		return if p1 then L:gsub("^%l", string.upper) else L
	else
		return Text
	end
end

return {
	mapProtoEnumFormatToLua = function(Key, p1, p2) --[[ Line: 82 ]]
		-- upvalues: config (copy), convertToLuaEnum (copy)
		local Entry = config[Key]
		
		if not Entry then
			Entry = convertToLuaEnum(Key, p1, p2)
			config[Key] = Entry
		end
		return Entry
	end,
	mapLuaEnumFormatToProto = function(Text: string, Text1, p1) --[[ Line: 95 ]]
		-- upvalues: t (copy)
		local Text2 = Text1 .. Text
		local Entry = t[Text2]
		
		if Entry == false then
			return nil
		elseif Entry == nil then
			local FromNameResult = p1.fromName(Text1 .. string.upper((Text:gsub("(%l)(%u)", "%1_%2"))))
			t[Text2] = FromNameResult or false
			
			return FromNameResult
		else
			return Entry
		end
	end,
	mapUiComponentTypeToLua = function(Key) --[[ Line: 132 ]]
		-- upvalues: config (copy), convertToLuaEnum (copy), SduiComponentTypeModule (copy)
		if Key == nil then
			return nil
		end
		local Entry = config[Key]
		
		if not Entry then
			Entry = convertToLuaEnum(Key, "UI_COMPONENT_TYPE_", true)
			config[Key] = Entry
		end
		return if SduiComponentTypeModule[Entry] then SduiComponentTypeModule[Entry] else nil
	end,
	mapHydrationContentTypeToLua = function(Text: string) --[[ Line: 166 ]]
		-- upvalues: config (copy), SduiDataBindingContentTypeModule (copy)
		if Text == nil then
			return nil
		end
		local Entry = config[Text]
		
		if not Entry then
			local Match: string? = string.match(Text, "^HYDRATION_CONTENT_TYPE_(.*)")
			Entry = if Match then Match:lower():gsub("_(%l)", function(Text: string): string --[[ Line: 64 ]]
				return Text:upper()
			end) else Text
			config[Text] = Entry
		end
		return if SduiDataBindingContentTypeModule[Entry] then SduiDataBindingContentTypeModule[Entry] else nil
	end,
	mapActionTypeToLua = function(Key) --[[ Line: 149 ]]
		-- upvalues: config (copy), convertToLuaEnum (copy), SduiActionTypeModule (copy)
		if Key == nil then
			return nil
		end
		local Entry = config[Key]
		
		if not Entry then
			Entry = convertToLuaEnum(Key, "ACTION_TYPE_", true)
			config[Key] = Entry
		end
		return if SduiActionTypeModule[Entry] then SduiActionTypeModule[Entry] else nil
	end,
	mapPropName = function(Key) --[[ Line: 186 ]]
		-- upvalues: config (copy), SnakeToCamelFunction (copy)
		if Key == nil then
			return nil
		end
		if typeof(Key) == "number" then
			return Key
		end
		local Entry = config[Key]
		
		if not Entry then
			Entry = SnakeToCamelFunction(Key)
			config[Key] = Entry
		end
		return Entry
	end,
	camelCaseKeys = function(List) --[[ Line: 207 ]]
		-- upvalues: config (copy), SnakeToCamelFunction (copy)
		if type(List) ~= "table" then
			return List
		end
		local t = {}
		
		for i, value in List do
			local i1 = nil
			if type(i) == "string" then
				if i == nil then
					i1 = nil
				elseif typeof(i) == "number" then
					i1 = i
				else
					local Entry = config[i]
					
					if not Entry then
						Entry = SnakeToCamelFunction(i)
						config[i] = Entry
					end
					i1 = Entry
				end
			else
				i1 = i
			end
			t[i1] = value
		end
		return t
	end,
	mapProtoEngineEnumToLua = function(Key, p1, Callback) --[[ Line: 111 ]]
		-- upvalues: config (copy), convertToLuaEnum (copy)
		if Key == nil then
			return nil
		end
		local Entry = config[Key]
		
		if not Entry then
			Entry = convertToLuaEnum(Key, p1, true)
			config[Key] = Entry
		end
		return if Entry then Callback(Entry) else nil
	end
}