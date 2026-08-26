local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local loaderContextModule = require(script.Parent.LoaderContext)
local fFlagAbuseReportDensifyResolvedArraysModule = require(genericAbuseReporting.Flags.FFlagAbuseReportDensifyResolvedArrays)

local function _(p1)
	return typeof(p1) == "table" and p1["$load"] ~= nil
end

local function cacheKey(p1, p2)
	if not p2 then
		return p1 .. "::{}"
	end
	local t = {}
	
	for i in pairs(p2) do
		table.insert(t, i)
	end
	table.sort(t)
	local t_1 = {}
	
	for i_1, v in ipairs(t) do
		table.insert(t_1, v .. "=" .. p2[v])
	end
	return p1 .. "::" .. table.concat(t_1, ",")
end

local function useLoader(p3)
	-- upvalues: loaderContextModule (ref), reactModule (ref), cacheKey (ref)
	local var1 = loaderContextModule.useLoaderContext()
	local registryRef = var1.registryRef
	local cacheRef = var1.cacheRef
	local var2 = typeof(p3) == "table" and p3["$load"] ~= nil
	local var3 = if var2 then p3["$load"] else nil
	local var4 = if var2 then p3.params else nil
	local var5, var6 = reactModule.useState(if var2 then { data = nil, loading = true, error = nil } else { loading = false, error = nil, data = p3 })
	local var7, var8 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var6 (ref), p3 (ref), registryRef (ref), var3 (ref), cacheKey (copy), var4 (ref), cacheRef (ref)
		if not var2 then
			var6({ loading = false, error = nil, data = p3 })
			
			return
		end
		local var9 = registryRef.current[var3]
		
		if not var9 then
			var6({
				data = nil,
				loading = false,
				error = string.format("Loader \"%s\" not found in registry", var3)
			})
			
			return
		end
		local var10 = cacheKey(var3, var4)
		local var11 = cacheRef.current[var10]
		
		if var11 then
			var6({ loading = false, error = nil, data = var11 })
			
			return
		end
		local var12 = false
		var6({ data = nil, loading = true, error = nil })
		var9.fetch(var4 or {}):andThen(function(p4)
			-- upvalues: var12 (write), cacheRef (copy), var10 (ref), var6 (copy)
			if var12 then
				return
			end
			cacheRef.current[var10] = p4
			var6({ loading = false, error = nil, data = p4 })
		end):catch(function(p4)
			-- upvalues: var12 (write), var6 (copy)
			if var12 then
				return
			end
			var6({ data = nil, loading = false, error = tostring(p4) })
		end)
		
		return function()
			-- upvalues: var12 (write)
			var12 = true
		end
	end, { var4, p3, var7, var2 })
	
	return {
		data = var5.data,
		loading = var5.loading,
		error = var5.error,
		retry = reactModule.useCallback(function()
			-- upvalues: var2 (ref), cacheRef (ref), cacheKey (copy), var3 (ref), var4 (ref), var8 (ref)
			if var2 then
				cacheRef.current[cacheKey(var3, var4)] = nil
				var8(function(p4)
					return p4 + 1
				end)
				
				return
			end
		end, { p3, var4, var2 })
	}
end

return {
	useLoader = useLoader,
	useListLoader = function(p3)
		-- upvalues: useLoader (ref), reactModule (ref), fFlagAbuseReportDensifyResolvedArraysModule (ref), dashModule (ref)
		local var1 = useLoader(p3)
		
		return {
			data = reactModule.useMemo(function()
				-- upvalues: var1 (ref), fFlagAbuseReportDensifyResolvedArraysModule (copy), dashModule (copy)
				if not var1.data then
					return nil
				end
				local data = var1.data
				
				return if fFlagAbuseReportDensifyResolvedArraysModule then data else dashModule.values(data)
			end, { var1.data }),
			loading = var1.loading,
			error = var1.error,
			retry = var1.retry
		}
	end,
	useGroupedListLoader = function(p3)
		-- upvalues: useLoader (ref), reactModule (ref), fFlagAbuseReportDensifyResolvedArraysModule (ref), dashModule (ref)
		local var1 = useLoader(p3)
		
		return {
			data = reactModule.useMemo(function()
				-- upvalues: var1 (ref), fFlagAbuseReportDensifyResolvedArraysModule (copy), dashModule (copy)
				if not var1.data then
					return nil
				end
				local data = var1.data
				
				return if fFlagAbuseReportDensifyResolvedArraysModule then data else dashModule.map(dashModule.values(data), function(p4)
					-- upvalues: dashModule (copy)
					return if p4.items then dashModule.join(p4, { items = dashModule.values(p4.items) }) else p4
				end)
			end, { var1.data }),
			loading = var1.loading,
			error = var1.error,
			retry = var1.retry
		}
	end
}