local contentProviderService = game:GetService("ContentProvider")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(value)
	-- upvalues: reactModule (ref), contentProviderService (ref)
	local var1, var2 = reactModule.useState(Enum.AssetFetchStatus.None)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), value (ref), contentProviderService (copy)
		var2(Enum.AssetFetchStatus.None)
		
		if value and value ~= "" then
			local var3 = contentProviderService:GetAssetFetchStatusChangedSignal(value):Connect(function(p1)
				-- upvalues: var2 (copy)
				var2(p1)
			end)
			var2(contentProviderService:GetAssetFetchStatus(value))
			
			return function()
				-- upvalues: var3 (ref)
				var3:Disconnect()
			end
		end
	end, { value })
	
	return var1
end