local assetFavorites = script:FindFirstAncestor("AssetFavorites")
local cryoModule = require(assetFavorites.Parent.Cryo)
local reactModule = require(assetFavorites.Parent.React)
local statusCodes = require(assetFavorites.Parent.Http).StatusCodes
local httpRequestModule = require(assetFavorites.Parent.HttpRequest)
local fFlagLuaAppDefaultHttpRetry = require(assetFavorites.Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local useLocalUserIdModule = require(assetFavorites.Hooks.useLocalUserId)
local getFavoriteForAssetModule = require(assetFavorites.Requests.GetFavoriteForAsset)
local postFavoriteForAssetModule = require(assetFavorites.Requests.PostFavoriteForAsset)
local deleteFavoriteForAssetModule = require(assetFavorites.Requests.DeleteFavoriteForAsset)
local _ = require(assetFavorites.Parent.LuauPolyfill)
local promiseModule = require(assetFavorites.Parent.Promise)
local loggerModule = require(assetFavorites.logger)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local useRef = reactModule.useRef
local useMemo = reactModule.useMemo
local var1 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("UseAssetFavoritingHttpRetryCount", 4) else nil
})

return function(value)
	-- upvalues: useLocalUserIdModule (ref), useState (ref), useRef (ref), useCallback (ref), loggerModule (ref), promiseModule (ref), deleteFavoriteForAssetModule (ref), var1 (ref), postFavoriteForAssetModule (ref), useMemo (ref), cryoModule (ref), useEffect (ref), getFavoriteForAssetModule (ref), statusCodes (ref)
	local var2 = useLocalUserIdModule()
	local var3, var4 = useState({})
	local var5 = useRef({})
	local var6 = useCallback(function(p1)
		-- upvalues: loggerModule (copy), var2 (ref)
		if not p1 then
			return false
		elseif p1 <= 0 or p1 % 1 ~= 0 then
			loggerModule:warning(`validation failed (assetId must be a positive int, got {p1})`)
			
			return false
		elseif var2 and var2 > 0 then
			return true
		end
		loggerModule:warning(`validation failed (userId must be a positive int, got {var2})`)
		
		return false
	end, { var2 })
	local var7 = useCallback(function()
		-- upvalues: var3 (ref)
		return var3
	end, { var3 })
	local var8 = useCallback(function(p1)
		-- upvalues: var3 (ref)
		local var9 = var3[tostring(p1)]
		
		return if var9 == nil then false else var9
	end, { var3 })
	local var9 = useCallback(function(p1)
		-- upvalues: var3 (ref)
		return var3[tostring(p1)] ~= nil
	end, { var3 })
	local var10 = useCallback(function(p1)
		-- upvalues: var5 (ref)
		return var5.current[tostring(p1)] ~= nil
	end, {})
	local var11 = useCallback(function(p1, p2)
		-- upvalues: var4 (ref)
		var4(function(p3)
			-- upvalues: p1 (ref), p2 (ref)
			local cloned = table.clone(p3)
			cloned[tostring(p1)] = p2
			
			return cloned
		end)
	end, {})
	local var12 = useCallback(function(p1)
		-- upvalues: var6 (ref), promiseModule (copy), var8 (ref), var11 (ref), deleteFavoriteForAssetModule (copy), var1 (copy), var2 (ref), postFavoriteForAssetModule (copy), loggerModule (copy)
		if var6(p1) then
			local var13 = var8(p1)
			local _ = nil
			var11(p1, not var13)
			
			return (if var13 then deleteFavoriteForAssetModule(var1, tostring(var2), tostring(p1)) else postFavoriteForAssetModule(var1, tostring(var2), tostring(p1))):catch(function(p2)
				-- upvalues: var11 (copy), p1 (ref), var13 (ref), loggerModule (copy)
				var11(p1, var13)
				loggerModule:warning(p2.StatusMessage)
			end):andThenReturn(not var13)
		end
		return promiseModule.resolve(nil)
	end, { var2, var6, var8 })
	local var13 = useMemo(function()
		-- upvalues: cryoModule (copy), value (ref), var6 (ref), var9 (ref), var10 (ref)
		return cryoModule.List.filter(value, function(p1)
			-- upvalues: var6 (copy), var9 (copy), var10 (copy)
			return var6(p1) and (not var9(p1) and not var10(p1))
		end)
	end, cryoModule.List.join(value, { var9, var10, var6 }))
	useEffect(function()
		-- upvalues: var13 (ref), var5 (ref), var11 (ref), loggerModule (copy), getFavoriteForAssetModule (copy), var1 (copy), var2 (ref), statusCodes (copy)
		for i, v in var13 do
			local var14 = tostring(v)
			var5.current[var14] = true
			var11(v, false)
			loggerModule:debug(`fetching initial favorite status for asset {v}`)
			getFavoriteForAssetModule(var1, tostring(var2), var14):andThen(function(p1)
				-- upvalues: statusCodes (copy), var11 (copy), v (ref)
				if p1.responseCode == statusCodes.OK and p1.responseBody then
					var11(v, true)
				end
			end):catch(function(p1)
				-- upvalues: loggerModule (copy)
				loggerModule:warning(p1.StatusMessage)
			end):finally(function()
				-- upvalues: var5 (copy), var14 (ref)
				var5.current[var14] = nil
			end)
		end
	end, { var13, var2 })
	
	return {
		getAll = var7,
		getByAssetId = var8,
		toggleFavorite = var12,
		isLoading = var10
	}
end