local contentProviderService = game:GetService("ContentProvider")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(value)
	-- upvalues: reactModule (ref), contentProviderService (ref)
	local var2, var3 = reactModule.useState(Enum.AssetFetchStatus.None)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), value (ref), contentProviderService (copy)
		var3(Enum.AssetFetchStatus.None)
		
		if value and value ~= "" then
			local var4 = contentProviderService:GetAssetFetchStatusChangedSignal(value):Connect(function(p0)
				-- upvalues: var3 (copy)
				var3(p0)
			end)
			var3(contentProviderService:GetAssetFetchStatus(value))
			
			return function()
				-- upvalues: var4 (ref)
				var4:Disconnect()
			end
		end
	end, { value })
	
	return var2
end