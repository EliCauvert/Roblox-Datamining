local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local LoaderContextModule = require(script.Parent.LoaderContext)

local function _(p1): boolean --[[ Line: 19 | Named "isLoadDescriptor" ]]
	return typeof(p1) == "table" and p1["$load"] ~= nil
end

local function cacheKey(Load, Params): string --[[ Line: 26 ]]
	if not Params then
		return Load .. "::{}"
	end
	local List = {}
	
	for param in pairs(Params) do
		table.insert(List, param)
	end
	table.sort(List)
	local List1 = {}
	
	for _, value in ipairs(List) do
		table.insert(List1, value .. "=" .. Params[value])
	end
	return Load .. "::" .. table.concat(List1, ",")
end

local function useLoader(Data) --[[ Line: 60 ]]
	-- upvalues: LoaderContextModule (copy), ReactModule (copy), cacheKey (copy)
	local UseLoaderContextResult = LoaderContextModule.useLoaderContext()
	local RegistryRef = UseLoaderContextResult.registryRef
	local CacheRef = UseLoaderContextResult.cacheRef
	local HasLoad: boolean = typeof(Data) == "table" and Data["$load"] ~= nil
	local Load = if HasLoad then Data["$load"] else nil
	local Params = if HasLoad then Data.params else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(if HasLoad then { data = nil, loading = true, error = nil } else { loading = false, error = nil, data = Data })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	ReactModule.useEffect(function() --[[ Line: 78 ]]
		-- upvalues: HasLoad (copy), UseStateResult2 (copy), Data (copy), RegistryRef (copy), Load (copy), cacheKey (upval), Params (copy), CacheRef (copy)
		if not HasLoad then
			UseStateResult2({ loading = false, error = nil, data = Data })
			
			return
		end
		local CurrentEntry = RegistryRef.current[Load]
		
		if not CurrentEntry then
			UseStateResult2({
				data = nil,
				loading = false,
				error = string.format("Loader \"%s\" not found in registry", Load)
			})
			
			return
		end
		local CacheKeyResult = cacheKey(Load, Params)
		local CurrentEntry1 = CacheRef.current[CacheKeyResult]
		
		if CurrentEntry1 then
			UseStateResult2({ loading = false, error = nil, data = CurrentEntry1 })
			
			return
		end
		local Flag = false
		UseStateResult2({ data = nil, loading = true, error = nil })
		CurrentEntry.fetch(Params or {}):andThen(function(Result) --[[ Line: 109 ]]
			-- upvalues: Flag (ref), CacheRef (upval), CacheKeyResult (copy), UseStateResult2 (upval)
			if not Flag then
				CacheRef.current[CacheKeyResult] = Result
				UseStateResult2({ loading = false, error = nil, data = Result })
				
				return
			end
		end):catch(function(Err) --[[ Line: 116 ]]
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if not Flag then
				UseStateResult2({ data = nil, loading = false, error = tostring(Err) })
				
				return
			end
		end)
		
		return function() --[[ Line: 127 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { Params, Data, UseStateResult1, HasLoad })
	
	return {
		data = UseStateResult.data,
		loading = UseStateResult.loading,
		error = UseStateResult.error,
		retry = ReactModule.useCallback(function() --[[ Line: 132 ]]
			-- upvalues: HasLoad (copy), CacheRef (copy), cacheKey (upval), Load (copy), Params (copy), UseStateResult2_1 (copy)
			if HasLoad then
				CacheRef.current[cacheKey(Load, Params)] = nil
				UseStateResult2_1(function(p1: number): number --[[ Line: 137 ]]
					return p1 + 1
				end)
				
				return
			end
		end, { Data, Params, HasLoad })
	}
end

return {
	useLoader = useLoader,
	useListLoader = function(p1) --[[ Line: 156 ]]
		-- upvalues: useLoader (copy)
		local UseLoaderResult = useLoader(p1)
		
		return {
			data = UseLoaderResult.data,
			loading = UseLoaderResult.loading,
			error = UseLoaderResult.error,
			retry = UseLoaderResult.retry
		}
	end,
	useGroupedListLoader = function(p1) --[[ Line: 172 ]]
		-- upvalues: useLoader (copy)
		local UseLoaderResult = useLoader(p1)
		
		return {
			data = UseLoaderResult.data,
			loading = UseLoaderResult.loading,
			error = UseLoaderResult.error,
			retry = UseLoaderResult.retry
		}
	end
}