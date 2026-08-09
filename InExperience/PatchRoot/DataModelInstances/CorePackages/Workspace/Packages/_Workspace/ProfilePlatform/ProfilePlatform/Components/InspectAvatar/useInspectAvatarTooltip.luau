local appStorageService = game:GetService("AppStorageService")
local reactModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.React)
local profilePlatformInspectAvatarTooltipMaxImpressions = game:DefineFastInt("ProfilePlatformInspectAvatarTooltipMaxImpressions", 3)

return function() --[[ line: 10 | named "useInspectAvatarTooltip" ]]
	-- upvalues: reactModule (ref), appStorageService (ref), profilePlatformInspectAvatarTooltipMaxImpressions (ref)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 14 ]]
		-- upvalues: var5 (ref), appStorageService (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy), var4 (ref)
		if var5.current then return end
		local ok, status = pcall(function() --[[ line: 19 ]]
			-- upvalues: appStorageService (copy)
			return tonumber(appStorageService:GetItem("ProfileInspectAndBuyImpressionCount")) or 0
		end)
		
		if ok and profilePlatformInspectAvatarTooltipMaxImpressions > status then
			pcall(function() --[[ line: 25 ]]
				-- upvalues: appStorageService (copy), status (ref)
				appStorageService:SetItem("ProfileInspectAndBuyImpressionCount", tostring(status + 1))
				appStorageService:Flush()
			end)
			var5.current = true
			var4(true)
			
			return
		end
	end, {})
	
	return {
		showTooltip = var3,
		onDismiss = reactModule.useCallback(function() --[[ line: 34 ]]
			-- upvalues: appStorageService (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy), var4 (ref)
			pcall(function() --[[ line: 35 ]]
				-- upvalues: appStorageService (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy)
				appStorageService:SetItem("ProfileInspectAndBuyImpressionCount", tostring(profilePlatformInspectAvatarTooltipMaxImpressions))
				appStorageService:Flush()
			end)
			var4(false)
		end, {})
	}
end