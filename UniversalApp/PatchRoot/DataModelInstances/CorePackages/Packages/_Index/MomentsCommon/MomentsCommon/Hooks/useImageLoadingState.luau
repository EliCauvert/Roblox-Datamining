local ContentProvider = game:GetService("ContentProvider")
local ReactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)

return function(ContentId) --[[ Line: 8 ]]
	-- upvalues: ReactModule (copy), ContentProvider (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: ContentId (copy), UseStateResult2 (copy), ContentProvider (upval)
		if not ContentId or ContentId == "" then
			UseStateResult2(false)
			
			return
		end
		if ContentProvider:GetAssetFetchStatus(ContentId) == Enum.AssetFetchStatus.Success then
			UseStateResult2(true)
			
			return
		end
		UseStateResult2(false)
		local Flag = true
		task.spawn(function() --[[ Line: 26 ]]
			-- upvalues: ContentProvider (upval), ContentId (upval), Flag (ref), UseStateResult2 (upval)
			ContentProvider:PreloadAsync({ ContentId }, function(ContentId1, AssetFetchStatus) --[[ Line: 27 ]]
				-- upvalues: Flag (upval), ContentId (upval), UseStateResult2 (upval)
				if Flag and ContentId1 == ContentId and AssetFetchStatus == Enum.AssetFetchStatus.Success then
					UseStateResult2(true)
				end
			end)
		end)
		
		return function() --[[ Line: 36 ]]
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, { ContentId })
	
	return UseStateResult
end