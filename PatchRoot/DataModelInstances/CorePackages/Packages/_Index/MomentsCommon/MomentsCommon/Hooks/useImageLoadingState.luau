-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

local contentProviderService = game:GetService("ContentProvider")
local reactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)

return function(p0) --[[ line: 8 ]]
	-- upvalues: reactModule (ref), contentProviderService (ref)
	local var2, var3 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 11 ]]
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
		task.spawn(function() --[[ line: 26 ]]
			-- upvalues: contentProviderService (copy), p0 (copy), var4 (write), var3 (copy)
			contentProviderService:PreloadAsync({ p0 }, function(p1, p2) --[[ line: 27 ]]
				-- upvalues: var4 (copy), p0 (copy), var3 (copy)
				if var4 and p1 == p0 and p2 == Enum.AssetFetchStatus.Success then
					var3(true)
				end
			end)
		end)
		
		return function() --[[ line: 36 ]]
			-- upvalues: var4 (write)
			var4 = false
		end
	end, { p0 })
	
	return var2
end