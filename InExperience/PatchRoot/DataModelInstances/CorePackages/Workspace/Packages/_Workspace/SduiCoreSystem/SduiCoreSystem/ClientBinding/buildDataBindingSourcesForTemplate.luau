local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.ServiceContractsProto)
local TryGetPathFromDataModule = require(SduiCoreSystem.ClientBinding.tryGetPathFromData)
local SplitDottedPathModule = require(SduiCoreSystem.ClientBinding.splitDottedPath)
local _ = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local DefaultHydrationIdPathsModule = require(SduiCoreSystem.ClientBinding.defaultHydrationIdPaths)

return function(p1, List)
	-- upvalues: ProtoVariableMapperModule (copy), SplitDottedPathModule (copy), TryGetPathFromDataModule (copy), DefaultHydrationIdPathsModule (copy)
	local t = {}
	
	for _, value in List do
		local MapHydrationContentTypeToLuaResult = ProtoVariableMapperModule.mapHydrationContentTypeToLua(value.content_type)
		
		if not MapHydrationContentTypeToLuaResult then
			error(`Unsupported contentType {value.content_type}`)
		end
		local Type = value.id_binding and (value.id_binding.kind and value.id_binding.kind.type)
		local Value = value.id_binding and (value.id_binding.kind and value.id_binding.kind.value)
		local Id = nil
		
		if Type == "literal" and Value then
			Id = Value
		elseif Type == "input_path" and Value then
			local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(p1, (SplitDottedPathModule(Value)))
			
			if TryGetPathFromDataModuleResult and TryGetPathFromDataModuleResult2 ~= nil then
				Id = TryGetPathFromDataModuleResult2
			else
				error(`Unable to resolve path from inputPath: {Value} in data`)
			end
		else
			local DefaultHydrationIdPathsModuleEntry = DefaultHydrationIdPathsModule[MapHydrationContentTypeToLuaResult]
			
			if DefaultHydrationIdPathsModuleEntry then
				local TryGetPathFromDataModuleResult1, TryGetPathFromDataModuleResult2_1 = TryGetPathFromDataModule(p1, DefaultHydrationIdPathsModuleEntry)
				
				if TryGetPathFromDataModuleResult1 and TryGetPathFromDataModuleResult2_1 ~= nil then
					Id = TryGetPathFromDataModuleResult2_1
				else
					error(`Unable to resolve default path: {table.concat(DefaultHydrationIdPathsModuleEntry, ",")} in data for contentType {MapHydrationContentTypeToLuaResult}`)
				end
			else
				error(`Unable to find default for unknown contentType: {MapHydrationContentTypeToLuaResult}`)
			end
		end
		t[if value.alias and value.alias ~= "" then value.alias else MapHydrationContentTypeToLuaResult] = {
			contentType = MapHydrationContentTypeToLuaResult,
			id = Id,
			fetchIfMissing = value.client_fetch
		}
	end
	return t
end