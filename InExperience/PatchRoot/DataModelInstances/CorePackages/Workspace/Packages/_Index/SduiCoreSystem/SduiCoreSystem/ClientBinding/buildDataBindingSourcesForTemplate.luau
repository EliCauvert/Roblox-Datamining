local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.ServiceContractsProto)
local tryGetPathFromDataModule = require(sduiCoreSystem.ClientBinding.tryGetPathFromData)
local splitDottedPathModule = require(sduiCoreSystem.ClientBinding.splitDottedPath)
local _ = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
local defaultHydrationIdPathsModule = require(sduiCoreSystem.ClientBinding.defaultHydrationIdPaths)

return function(p1, p2)
	-- upvalues: protoVariableMapperModule (ref), splitDottedPathModule (ref), tryGetPathFromDataModule (ref), defaultHydrationIdPathsModule (ref)
	local t = {}
	
	for i, v in p2 do
		local var1 = protoVariableMapperModule.mapHydrationContentTypeToLua(v.content_type)
		
		if not var1 then
			error(`Unsupported contentType {v.content_type}`)
		end
		local var2
		local type = v.id_binding and (v.id_binding.kind and v.id_binding.kind.type)
		local value = v.id_binding and (v.id_binding.kind and v.id_binding.kind.value)
		local var3 = nil
		
		if type == "literal" and value then
			var3 = value
		elseif type == "input_path" and value then
			var2, var13 = tryGetPathFromDataModule(p1, splitDottedPathModule(value))
			
			if var2 and var13 ~= nil then
				var3 = var13
			else
				error(`Unable to resolve path from inputPath: {value} in data`)
			end
		else
			local var4 = defaultHydrationIdPathsModule[var1]
			
			if var4 then
				var2, var12 = tryGetPathFromDataModule(p1, var4)
				
				if var2 and var12 ~= nil then
					var3 = var12
				else
					error(`Unable to resolve default path: {table.concat(var4, ",")} in data for contentType {var1}`)
				end
			else
				error(`Unable to find default for unknown contentType: {var1}`)
			end
		end
		t[if v.alias and v.alias ~= "" then v.alias else var1] = {
			contentType = var1,
			id = var3,
			fetchIfMissing = v.client_fetch
		}
	end
	return t
end