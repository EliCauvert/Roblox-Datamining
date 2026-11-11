local AppStorageService = game:GetService("AppStorageService")
local ReactModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.React)
local ProfilePlatformInspectAvatarTooltipMaxImpressions = game:DefineFastInt("ProfilePlatformInspectAvatarTooltipMaxImpressions", 3)

return function()
	-- upvalues: ReactModule (copy), AppStorageService (copy), ProfilePlatformInspectAvatarTooltipMaxImpressions (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), AppStorageService (upval), ProfilePlatformInspectAvatarTooltipMaxImpressions (upval), UseStateResult2 (copy)
		if UseRefResult.current then return end
		local Success, Result = pcall(function(): number
			-- upvalues: AppStorageService (upval)
			return tonumber(AppStorageService:GetItem("ProfileInspectAndBuyImpressionCount")) or 0
		end)
		
		if Success and ProfilePlatformInspectAvatarTooltipMaxImpressions > Result then
			pcall(function()
				-- upvalues: AppStorageService (upval), Result (copy)
				AppStorageService:SetItem("ProfileInspectAndBuyImpressionCount", (tostring(Result + 1)))
				AppStorageService:Flush()
			end)
			UseRefResult.current = true
			UseStateResult2(true)
			
			return
		end
	end, {})
	
	return {
		showTooltip = UseStateResult,
		onDismiss = ReactModule.useCallback(function()
			-- upvalues: AppStorageService (upval), ProfilePlatformInspectAvatarTooltipMaxImpressions (upval), UseStateResult2 (copy)
			pcall(function()
				-- upvalues: AppStorageService (upval), ProfilePlatformInspectAvatarTooltipMaxImpressions (upval)
				AppStorageService:SetItem("ProfileInspectAndBuyImpressionCount", (tostring(ProfilePlatformInspectAvatarTooltipMaxImpressions)))
				AppStorageService:Flush()
			end)
			UseStateResult2(false)
		end, {})
	}
end