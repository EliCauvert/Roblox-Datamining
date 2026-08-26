local songbird = script:FindFirstAncestor("Songbird")
local reactUtilsModule = require(songbird.Parent.ReactUtils)
local reactModule = require(songbird.Parent.React)
local _ = require(songbird.types)
local getAudioMetadataAsyncModule = require(songbird.Requests.getAudioMetadataAsync)
local useAsync = reactUtilsModule.useAsync
local useState = reactModule.useState
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback

return function(p1)
	-- upvalues: useState (ref), useAsync (ref), getAudioMetadataAsyncModule (ref), useCallback (ref), useEffect (ref)
	local var1, var2 = useState({})
	local var3 = useAsync(function()
		-- upvalues: p1 (ref), getAudioMetadataAsyncModule (copy)
		return if #p1 > 0 then getAudioMetadataAsyncModule(p1) else {}
	end, { table.unpack(p1) })
	local var4 = useCallback(function()
		-- upvalues: var1 (ref)
		return var1
	end, { var1 })
	local var5 = useCallback(function(p2)
		-- upvalues: var1 (ref)
		return var1[tostring(p2)]
	end, { var1 })
	useEffect(function()
		-- upvalues: var3 (ref), var2 (ref)
		if var3.status == "ok" and #var3.value > 0 then
			var2(function(p2)
				-- upvalues: var3 (copy)
				local cloned = table.clone(p2)
				
				for i, v in var3.value do
					cloned[v.AssetId] = v
				end
				return cloned
			end)
		end
	end, { var3 })
	
	return { getAll = var4, getByAssetId = var5 }
end