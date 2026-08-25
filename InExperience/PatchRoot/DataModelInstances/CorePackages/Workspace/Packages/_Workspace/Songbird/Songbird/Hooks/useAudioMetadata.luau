local songbird = script:FindFirstAncestor("Songbird")
local reactUtilsModule = require(songbird.Parent.ReactUtils)
local reactModule = require(songbird.Parent.React)
local _ = require(songbird.types)
local getAudioMetadataAsyncModule = require(songbird.Requests.getAudioMetadataAsync)
local useAsync = reactUtilsModule.useAsync
local useState = reactModule.useState
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback

return function(p0)
	-- upvalues: useState (ref), useAsync (ref), getAudioMetadataAsyncModule (ref), useCallback (ref), useEffect (ref)
	local var4, var5 = useState({})
	local var6 = useAsync(function()
		-- upvalues: p0 (ref), getAudioMetadataAsyncModule (copy)
		return if #p0 > 0 then getAudioMetadataAsyncModule(p0) else {}
	end, { table.unpack(p0) })
	local var7 = useCallback(function()
		-- upvalues: var4 (ref)
		return var4
	end, { var4 })
	local var8 = useCallback(function(p1)
		-- upvalues: var4 (ref)
		return var4[tostring(p1)]
	end, { var4 })
	useEffect(function()
		-- upvalues: var6 (ref), var5 (ref)
		if var6.status == "ok" and #var6.value > 0 then
			var5(function(p2)
				-- upvalues: var6 (copy)
				local cloned = table.clone(p2)
				
				for i, v in var6.value do
					cloned[v.AssetId] = v
				end
				return cloned
			end)
		end
	end, { var6 })
	
	return { getAll = var7, getByAssetId = var8 }
end