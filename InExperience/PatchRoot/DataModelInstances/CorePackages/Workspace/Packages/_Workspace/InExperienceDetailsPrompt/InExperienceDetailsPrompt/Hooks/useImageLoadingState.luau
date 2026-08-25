local contentProviderService = game:GetService("ContentProvider")
local reactModule = require(script:FindFirstAncestor("InExperienceDetailsPrompt").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref), contentProviderService (ref)
	local var2, var3 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var3 (ref), contentProviderService (copy)
		if not p0 or p0 == "" then
			var3(false)
			
			return
		elseif contentProviderService:GetAssetFetchStatus(p0) == Enum.AssetFetchStatus.Success then
			var3(true)
			
			return
		end
		var3(false)
		local var4 = true
		task.spawn(function()
			-- upvalues: contentProviderService (copy), p0 (copy), var4 (write), var3 (copy)
			contentProviderService:PreloadAsync({ p0 }, function(p1, p2)
				-- upvalues: var4 (copy), p0 (copy), var3 (copy)
				if var4 and p1 == p0 and p2 == Enum.AssetFetchStatus.Success then
					var3(true)
				end
			end)
		end)
		
		return function()
			-- upvalues: var4 (write)
			var4 = false
		end
	end, { p0 })
	
	return var2
end