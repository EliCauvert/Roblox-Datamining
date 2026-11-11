local ContentProvider = game:GetService("ContentProvider")
local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(ContentId)
	-- upvalues: ReactModule (copy), ContentProvider (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Enum.AssetFetchStatus.None)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), ContentId (copy), ContentProvider (upval)
		UseStateResult2(Enum.AssetFetchStatus.None)
		
		if not ContentId or ContentId == "" then return end
		local Connection = ContentProvider:GetAssetFetchStatusChangedSignal(ContentId):Connect(function(p1)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(p1)
		end)
		UseStateResult2((ContentProvider:GetAssetFetchStatus(ContentId)))
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { ContentId })
	
	return UseStateResult
end