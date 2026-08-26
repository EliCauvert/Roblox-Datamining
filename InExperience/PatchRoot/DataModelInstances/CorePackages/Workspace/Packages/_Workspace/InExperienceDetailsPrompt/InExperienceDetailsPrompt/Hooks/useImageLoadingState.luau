local contentProviderService = game:GetService("ContentProvider")
local reactModule = require(script:FindFirstAncestor("InExperienceDetailsPrompt").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref), contentProviderService (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), contentProviderService (copy)
		if not p1 or p1 == "" then
			var2(false)
			
			return
		elseif contentProviderService:GetAssetFetchStatus(p1) == Enum.AssetFetchStatus.Success then
			var2(true)
			
			return
		end
		var2(false)
		local var3 = true
		task.spawn(function()
			-- upvalues: contentProviderService (copy), p1 (copy), var3 (write), var2 (copy)
			contentProviderService:PreloadAsync({ p1 }, function(p2, p3)
				-- upvalues: var3 (copy), p1 (copy), var2 (copy)
				if var3 and p2 == p1 and p3 == Enum.AssetFetchStatus.Success then
					var2(true)
				end
			end)
		end)
		
		return function()
			-- upvalues: var3 (write)
			var3 = false
		end
	end, { p1 })
	
	return var1
end