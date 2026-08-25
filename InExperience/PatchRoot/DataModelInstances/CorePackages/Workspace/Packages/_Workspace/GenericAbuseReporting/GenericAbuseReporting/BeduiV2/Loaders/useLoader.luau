local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local loaderContextModule = require(script.Parent.LoaderContext)
local fFlagAbuseReportDensifyResolvedArraysModule = require(genericAbuseReporting.Flags.FFlagAbuseReportDensifyResolvedArrays)

local function _(p0)
	return typeof(p0) == "table" and p0["$load"] ~= nil
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
	local var9 = loaderContextModule.useLoaderContext()
	local registryRef = var9.registryRef
	local cacheRef = var9.cacheRef
	local var10 = typeof(p3) == "table" and p3["$load"] ~= nil
	local var11 = if var10 then p3["$load"] else nil
	local var12 = if var10 then p3.params else nil
	local var13, var14 = reactModule.useState(if var10 then { data = nil, loading = true, error = nil } else { loading = false, error = nil, data = p3 })
	local var15, var16 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var14 (ref), p3 (ref), registryRef (ref), var11 (ref), cacheKey (copy), var12 (ref), cacheRef (ref)
		if not var10 then
			var14({ loading = false, error = nil, data = p3 })
			
			return
		end
		local var17 = registryRef.current[var11]
		
		if not var17 then
			var14({
				data = nil,
				loading = false,
				error = string.format("Loader \"%s\" not found in registry", var11)
			})
			
			return
		end
		local var18 = cacheKey(var11, var12)
		local var19 = cacheRef.current[var18]
		
		if var19 then
			var14({ loading = false, error = nil, data = var19 })
			
			return
		end
		local var20 = false
		var14({ data = nil, loading = true, error = nil })
		var17.fetch(var12 or {}):andThen(function(p5)
			-- upvalues: var20 (write), cacheRef (copy), var18 (ref), var14 (copy)
			if var20 then
				return
			end
			cacheRef.current[var18] = p5
			var14({ loading = false, error = nil, data = p5 })
		end):catch(function(p4)
			-- upvalues: var20 (write), var14 (copy)
			if var20 then
				return
			end
			var14({ data = nil, loading = false, error = tostring(p4) })
		end)
		
		return function()
			-- upvalues: var20 (write)
			var20 = true
		end
	end, { var12, p3, var15, var10 })
	
	return {
		data = var13.data,
		loading = var13.loading,
		error = var13.error,
		retry = reactModule.useCallback(function()
			-- upvalues: var10 (ref), cacheRef (ref), cacheKey (copy), var11 (ref), var12 (ref), var16 (ref)
			if var10 then
				cacheRef.current[cacheKey(var11, var12)] = nil
				var16(function(p6)
					return p6 + 1
				end)
				
				return
			end
		end, { p3, var12, var10 })
	}
end

return {
	useLoader = useLoader,
	useListLoader = function(p7)
		-- upvalues: useLoader (ref), reactModule (ref), fFlagAbuseReportDensifyResolvedArraysModule (ref), dashModule (ref)
		local var21 = useLoader(p7)
		
		return {
			data = reactModule.useMemo(function()
				-- upvalues: var21 (ref), fFlagAbuseReportDensifyResolvedArraysModule (copy), dashModule (copy)
				if not var21.data then
					return nil
				end
				local data = var21.data
				
				return if fFlagAbuseReportDensifyResolvedArraysModule then data else dashModule.values(data)
			end, { var21.data }),
			loading = var21.loading,
			error = var21.error,
			retry = var21.retry
		}
	end,
	useGroupedListLoader = function(p8)
		-- upvalues: useLoader (ref), reactModule (ref), fFlagAbuseReportDensifyResolvedArraysModule (ref), dashModule (ref)
		local var22 = useLoader(p8)
		
		return {
			data = reactModule.useMemo(function()
				-- upvalues: var22 (ref), fFlagAbuseReportDensifyResolvedArraysModule (copy), dashModule (copy)
				if not var22.data then
					return nil
				end
				local data = var22.data
				
				return if fFlagAbuseReportDensifyResolvedArraysModule then data else dashModule.map(dashModule.values(data), function(p9)
					-- upvalues: dashModule (copy)
					return if p9.items then dashModule.join(p9, { items = dashModule.values(p9.items) }) else p9
				end)
			end, { var22.data }),
			loading = var22.loading,
			error = var22.error,
			retry = var22.retry
		}
	end
}