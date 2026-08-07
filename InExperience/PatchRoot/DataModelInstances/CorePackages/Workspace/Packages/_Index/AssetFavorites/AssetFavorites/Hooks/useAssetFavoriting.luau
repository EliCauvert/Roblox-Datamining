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
local var10 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("UseAssetFavoritingHttpRetryCount", 4) else nil
})

return function(value) --[[ line: 32 | named "useAssetFavoriting" ]]
	-- upvalues: useLocalUserIdModule (ref), useState (ref), useRef (ref), useCallback (ref), loggerModule (ref), promiseModule (ref), deleteFavoriteForAssetModule (ref), var10 (ref), postFavoriteForAssetModule (ref), useMemo (ref), cryoModule (ref), useEffect (ref), getFavoriteForAssetModule (ref), statusCodes (ref)
	local var11 = useLocalUserIdModule()
	local var12, var13 = useState({})
	local var14 = useRef({})
	local var15 = useCallback(function(p0) --[[ line: 42 ]]
		-- upvalues: loggerModule (copy), var11 (ref)
		if not p0 then
			return false
		elseif p0 <= 0 or p0 % 1 ~= 0 then
			loggerModule:warning(`validation failed (assetId must be a positive int, got {p0})`)
			
			return false
		elseif var11 and var11 > 0 then
			return true
		end
		loggerModule:warning(`validation failed (userId must be a positive int, got {var11})`)
		
		return false
	end, { var11 })
	local var16 = useCallback(function() --[[ line: 62 ]]
		-- upvalues: var12 (ref)
		return var12
	end, { var12 })
	local var17 = useCallback(function(p1) --[[ line: 66 ]]
		-- upvalues: var12 (ref)
		local var23 = var12[tostring(p1)]
		
		return if var23 == nil then false else var23
	end, { var12 })
	local var18 = useCallback(function(p2) --[[ line: 71 ]]
		-- upvalues: var12 (ref)
		return var12[tostring(p2)] ~= nil
	end, { var12 })
	local var19 = useCallback(function(p3) --[[ line: 75 ]]
		-- upvalues: var14 (ref)
		return var14.current[tostring(p3)] ~= nil
	end, {})
	local var20 = useCallback(function(p4, p5) --[[ line: 79 ]]
		-- upvalues: var13 (ref)
		var13(function(p6) --[[ line: 80 ]]
			-- upvalues: p4 (ref), p5 (ref)
			local cloned = table.clone(p6)
			cloned[tostring(p4)] = p5
			
			return cloned
		end)
	end, {})
	local var21 = useCallback(function(p7) --[[ line: 87 ]]
		-- upvalues: var15 (ref), promiseModule (copy), var17 (ref), var20 (ref), deleteFavoriteForAssetModule (copy), var10 (copy), var11 (ref), postFavoriteForAssetModule (copy), loggerModule (copy)
		if var15(p7) then
			local var25 = var17(p7)
			local _ = nil
			var20(p7, not var25)
			
			return (if var25 then deleteFavoriteForAssetModule(var10, tostring(var11), tostring(p7)) else postFavoriteForAssetModule(var10, tostring(var11), tostring(p7))):catch(function(p8) --[[ line: 106 ]]
				-- upvalues: var20 (copy), p7 (ref), var25 (ref), loggerModule (copy)
				var20(p7, var25)
				loggerModule:warning(p8.StatusMessage)
			end):andThenReturn(not var25)
		end
		return promiseModule.resolve(nil)
	end, { var11, var15, var17 })
	local var22 = useMemo(function() --[[ line: 114 ]]
		-- upvalues: cryoModule (copy), value (ref), var15 (ref), var18 (ref), var19 (ref)
		return cryoModule.List.filter(value, function(p9) --[[ line: 115 ]]
			-- upvalues: var15 (copy), var18 (copy), var19 (copy)
			return var15(p9) and (not var18(p9) and not var19(p9))
		end)
	end, cryoModule.List.join(value, { var18, var19, var15 }))
	useEffect(function() --[[ line: 120 ]]
		-- upvalues: var22 (ref), var14 (ref), var20 (ref), loggerModule (copy), getFavoriteForAssetModule (copy), var10 (copy), var11 (ref), statusCodes (copy)
		for i, v in var22 do
			local var26 = tostring(v)
			var14.current[var26] = true
			var20(v, false)
			loggerModule:debug(`fetching initial favorite status for asset {v}`)
			getFavoriteForAssetModule(var10, tostring(var11), var26):andThen(function(p11) --[[ line: 129 ]]
				-- upvalues: statusCodes (copy), var20 (copy), v (ref)
				if p11.responseCode == statusCodes.OK and p11.responseBody then
					var20(v, true)
				end
			end):catch(function(p10) --[[ line: 138 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:warning(p10.StatusMessage)
			end):finally(function() --[[ line: 141 ]]
				-- upvalues: var14 (copy), var26 (ref)
				var14.current[var26] = nil
			end)
		end
	end, { var22, var11 })
	
	return {
		getAll = var16,
		getByAssetId = var17,
		toggleFavorite = var21,
		isLoading = var19
	}
end