local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local loaderContextModule = require(script.Parent.LoaderContext)

local function _(p0) --[[ line: 20 | named "isLoadDescriptor" ]]
	return typeof(p0) == "table" and p0["$load"] ~= nil
end

local function cacheKey(p1, p2) --[[ line: 27 ]]
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

local function useLoader(p3) --[[ line: 61 ]]
	-- upvalues: loaderContextModule (ref), reactModule (ref), cacheKey (ref)
	local var7 = loaderContextModule.useLoaderContext()
	local registryRef = var7.registryRef
	local cacheRef = var7.cacheRef
	local var8 = typeof(p3) == "table" and p3["$load"] ~= nil
	local var9 = if var8 then p3["$load"] else nil
	local var10 = if var8 then p3.params else nil
	local var11, var12 = reactModule.useState(if var8 then { data = nil, loading = true, error = nil } else { loading = false, error = nil, data = p3 })
	local var13, var14 = reactModule.useState(0)
	reactModule.useEffect(function() --[[ line: 77 ]]
		-- upvalues: var8 (ref), var12 (ref), p3 (ref), registryRef (ref), var9 (ref), cacheKey (copy), var10 (ref), cacheRef (ref)
		if not var8 then
			var12({ loading = false, error = nil, data = p3 })
			
			return
		end
		local var15 = registryRef.current[var9]
		
		if not var15 then
			var12({
				data = nil,
				loading = false,
				error = string.format("Loader \"%s\" not found in registry", var9)
			})
			
			return
		end
		local var16 = cacheKey(var9, var10)
		local var17 = cacheRef.current[var16]
		
		if var17 then
			var12({ loading = false, error = nil, data = var17 })
			
			return
		end
		local var18 = false
		var12({ data = nil, loading = true, error = nil })
		var15.fetch(var10 or {}):andThen(function(p5) --[[ line: 108 ]]
			-- upvalues: var18 (write), cacheRef (copy), var16 (ref), var12 (copy)
			if var18 then
				return
			end
			cacheRef.current[var16] = p5
			var12({ loading = false, error = nil, data = p5 })
		end):catch(function(p4) --[[ line: 115 ]]
			-- upvalues: var18 (write), var12 (copy)
			if var18 then
				return
			end
			var12({ data = nil, loading = false, error = tostring(p4) })
		end)
		
		return function() --[[ line: 126 ]]
			-- upvalues: var18 (write)
			var18 = true
		end
	end, { var10, p3, var13, var8 })
	
	return {
		data = var11.data,
		loading = var11.loading,
		error = var11.error,
		retry = reactModule.useCallback(function() --[[ line: 132 ]]
			-- upvalues: var8 (ref), cacheRef (ref), cacheKey (copy), var9 (ref), var10 (ref), var14 (ref)
			if var8 then
				cacheRef.current[cacheKey(var9, var10)] = nil
				var14(function(p6) --[[ line: 137 ]]
					return p6 + 1
				end)
				
				return
			end
		end, { p3, var10, var8 })
	}
end

return {
	useLoader = useLoader,
	useListLoader = function(p7) --[[ line: 157 ]]
		-- upvalues: useLoader (ref), reactModule (ref), dashModule (ref)
		local var19 = useLoader(p7)
		
		return {
			data = reactModule.useMemo(function() --[[ line: 159 ]]
				-- upvalues: var19 (ref), dashModule (copy)
				return if var19.data then dashModule.values(var19.data) else nil
			end, { var19.data }),
			loading = var19.loading,
			error = var19.error,
			retry = var19.retry
		}
	end,
	useGroupedListLoader = function(p8) --[[ line: 181 ]]
		-- upvalues: useLoader (ref), reactModule (ref), dashModule (ref)
		local var20 = useLoader(p8)
		
		return {
			data = reactModule.useMemo(function() --[[ line: 183 ]]
				-- upvalues: var20 (ref), dashModule (copy)
				return if var20.data then dashModule.map(dashModule.values(var20.data), function(p9) --[[ line: 187 ]]
					-- upvalues: dashModule (copy)
					return if p9.items then dashModule.join(p9, { items = dashModule.values(p9.items) }) else p9
				end) else nil
			end, { var20.data }),
			loading = var20.loading,
			error = var20.error,
			retry = var20.retry
		}
	end
}