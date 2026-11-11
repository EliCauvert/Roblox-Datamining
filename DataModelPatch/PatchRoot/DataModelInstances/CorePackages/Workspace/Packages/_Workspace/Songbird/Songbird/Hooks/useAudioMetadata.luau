local Songbird = script:FindFirstAncestor("Songbird")
local ReactModule = require(Songbird.Parent.React)
local _ = require(Songbird.types)
local GetAudioMetadataAsyncModule = require(Songbird.Requests.getAudioMetadataAsync)
local UseAsyncFunction = require(Songbird.Parent.ReactUtils).useAsync
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect
local UseCallbackFunction = ReactModule.useCallback

return function(p1)
	-- upvalues: UseStateFunction (copy), UseAsyncFunction (copy), GetAudioMetadataAsyncModule (copy), UseCallbackFunction (copy), UseEffectFunction (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction({})
	local UseAsyncResult = UseAsyncFunction(function()
		-- upvalues: p1 (copy), GetAudioMetadataAsyncModule (upval)
		return if #p1 > 0 then GetAudioMetadataAsyncModule(p1) else {}
	end, { table.unpack(p1) })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult (copy)
		return UseStateResult
	end, { UseStateResult })
	local UseCallbackResult1 = UseCallbackFunction(function(p2)
		-- upvalues: UseStateResult (copy)
		return UseStateResult[tostring(p2)]
	end, { UseStateResult })
	UseEffectFunction(function()
		-- upvalues: UseAsyncResult (copy), UseStateResult2 (copy)
		if UseAsyncResult.status == "ok" and #UseAsyncResult.value > 0 then
			UseStateResult2(function(Tbl)
				-- upvalues: UseAsyncResult (upval)
				local Copy = table.clone(Tbl)
				
				for _, value in UseAsyncResult.value do
					Copy[value.AssetId] = value
				end
				return Copy
			end)
		end
	end, { UseAsyncResult })
	
	return {
		getAll = UseCallbackResult,
		getByAssetId = UseCallbackResult1
	}
end