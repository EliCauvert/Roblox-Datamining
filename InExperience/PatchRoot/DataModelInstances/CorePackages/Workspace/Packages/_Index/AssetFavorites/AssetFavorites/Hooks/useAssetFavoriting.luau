local AssetFavorites = script:FindFirstAncestor("AssetFavorites")
local CryoModule = require(AssetFavorites.Parent.Cryo)
local ReactModule = require(AssetFavorites.Parent.React)
local StatusCodes = require(AssetFavorites.Parent.Http).StatusCodes
local HttpRequestModule = require(AssetFavorites.Parent.HttpRequest)
local UseLocalUserIdModule = require(AssetFavorites.Hooks.useLocalUserId)
local GetFavoriteForAssetModule = require(AssetFavorites.Requests.GetFavoriteForAsset)
local PostFavoriteForAssetModule = require(AssetFavorites.Requests.PostFavoriteForAsset)
local DeleteFavoriteForAssetModule = require(AssetFavorites.Requests.DeleteFavoriteForAsset)
local _ = require(AssetFavorites.Parent.LuauPolyfill)
local PromiseModule = require(AssetFavorites.Parent.Promise)
local LoggerModule = require(AssetFavorites.logger)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState
local UseRefFunction = ReactModule.useRef
local UseMemoFunction = ReactModule.useMemo
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = if require(AssetFavorites.Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("UseAssetFavoritingHttpRetryCount", 4) else nil
})

return function(p1)
	-- upvalues: UseLocalUserIdModule (copy), UseStateFunction (copy), UseRefFunction (copy), UseCallbackFunction (copy), LoggerModule (copy), PromiseModule (copy), DeleteFavoriteForAssetModule (copy), ConfigResult (copy), PostFavoriteForAssetModule (copy), UseMemoFunction (copy), CryoModule (copy), UseEffectFunction (copy), GetFavoriteForAssetModule (copy), StatusCodes (copy)
	local UseLocalUserIdModuleResult = UseLocalUserIdModule()
	local UseStateResult, UseStateResult2 = UseStateFunction({})
	local UseRefResult = UseRefFunction({})
	local UseCallbackResult = UseCallbackFunction(function(p2: number): boolean
		-- upvalues: LoggerModule (upval), UseLocalUserIdModuleResult (copy)
		if not p2 then
			return false
		elseif p2 <= 0 or p2 % 1 ~= 0 then
			LoggerModule:warning(`validation failed (assetId must be a positive int, got {p2})`)
			
			return false
		elseif UseLocalUserIdModuleResult and UseLocalUserIdModuleResult > 0 then
			return true
		else
			LoggerModule:warning(`validation failed (userId must be a positive int, got {UseLocalUserIdModuleResult})`)
			
			return false
		end
	end, { UseLocalUserIdModuleResult })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseStateResult (copy)
		return UseStateResult
	end, { UseStateResult })
	local UseCallbackResult2 = UseCallbackFunction(function(p2)
		-- upvalues: UseStateResult (copy)
		local UseStateResultEntry = UseStateResult[tostring(p2)]
		
		return UseStateResultEntry ~= nil and UseStateResultEntry
	end, { UseStateResult })
	local UseCallbackResult3 = UseCallbackFunction(function(p2): boolean
		-- upvalues: UseStateResult (copy)
		return UseStateResult[tostring(p2)] ~= nil
	end, { UseStateResult })
	local UseCallbackResult4 = UseCallbackFunction(function(p2): boolean
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current[tostring(p2)] ~= nil
	end, {})
	local UseCallbackResult5 = UseCallbackFunction(function(p2, p3)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(Tbl)
			-- upvalues: p2 (copy), p3 (copy)
			local Copy = table.clone(Tbl)
			Copy[tostring(p2)] = p3
			
			return Copy
		end)
	end, {})
	local UseCallbackResult6 = UseCallbackFunction(function(p2)
		-- upvalues: UseCallbackResult (copy), PromiseModule (upval), UseCallbackResult2 (copy), UseCallbackResult5 (copy), DeleteFavoriteForAssetModule (upval), ConfigResult (upval), UseLocalUserIdModuleResult (copy), PostFavoriteForAssetModule (upval), LoggerModule (upval)
		if UseCallbackResult(p2) then
			local UseCallbackResultResult = UseCallbackResult2(p2)
			UseCallbackResult5(p2, not UseCallbackResultResult)
			
			return (if UseCallbackResultResult then DeleteFavoriteForAssetModule(ConfigResult, tostring(UseLocalUserIdModuleResult), (tostring(p2))) else PostFavoriteForAssetModule(ConfigResult, tostring(UseLocalUserIdModuleResult), (tostring(p2)))):catch(function(Err)
				-- upvalues: UseCallbackResult5 (upval), p2 (copy), UseCallbackResultResult (copy), LoggerModule (upval)
				UseCallbackResult5(p2, UseCallbackResultResult)
				LoggerModule:warning(Err.StatusMessage)
			end):andThenReturn(not UseCallbackResultResult)
		else
			return PromiseModule.resolve(nil)
		end
	end, {
		UseLocalUserIdModuleResult,
		UseCallbackResult,
		UseCallbackResult2
	})
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: CryoModule (upval), p1 (copy), UseCallbackResult (copy), UseCallbackResult3 (copy), UseCallbackResult4 (copy)
		return CryoModule.List.filter(p1, function(p2): boolean
			-- upvalues: UseCallbackResult (upval), UseCallbackResult3 (upval), UseCallbackResult4 (upval)
			return UseCallbackResult(p2) and (not UseCallbackResult3(p2) and not UseCallbackResult4(p2))
		end)
	end, CryoModule.List.join(p1, {
		UseCallbackResult3,
		UseCallbackResult4,
		UseCallbackResult
	}))
	UseEffectFunction(function()
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), UseCallbackResult5 (copy), LoggerModule (upval), GetFavoriteForAssetModule (upval), ConfigResult (upval), UseLocalUserIdModuleResult (copy), StatusCodes (upval)
		for _, value in UseMemoResult do
			local Text = tostring(value)
			UseRefResult.current[Text] = true
			UseCallbackResult5(value, false)
			LoggerModule:debug(`fetching initial favorite status for asset {value}`)
			GetFavoriteForAssetModule(ConfigResult, tostring(UseLocalUserIdModuleResult), Text):andThen(function(Result)
				-- upvalues: StatusCodes (upval), UseCallbackResult5 (upval), value (copy)
				if Result.responseCode == StatusCodes.OK and Result.responseBody then
					UseCallbackResult5(value, true)
				end
			end):catch(function(Err)
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning(Err.StatusMessage)
			end):finally(function()
				-- upvalues: UseRefResult (upval), Text (copy)
				UseRefResult.current[Text] = nil
			end)
		end
	end, { UseMemoResult, UseLocalUserIdModuleResult })
	
	return {
		getAll = UseCallbackResult1,
		getByAssetId = UseCallbackResult2,
		toggleFavorite = UseCallbackResult6,
		isLoading = UseCallbackResult4
	}
end