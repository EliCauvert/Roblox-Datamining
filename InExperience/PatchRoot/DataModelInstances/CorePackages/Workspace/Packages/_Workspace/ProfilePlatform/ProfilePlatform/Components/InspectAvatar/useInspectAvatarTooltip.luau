local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local appStorageService = game:GetService("AppStorageService")
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local getInspectAvatarTooltipStoreModule = require(profilePlatform.Stores.GetInspectAvatarTooltipStore)
local fFlagProfileInspectAndBuyRefactorTooltipModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyRefactorTooltip)
local profilePlatformInspectAvatarTooltipMaxImpressions = game:DefineFastInt("ProfilePlatformInspectAvatarTooltipMaxImpressions", 3)
local var6 = getInspectAvatarTooltipStoreModule(false)

return function() --[[ line: 16 | named "useInspectAvatarTooltip" ]]
	-- upvalues: fFlagProfileInspectAndBuyRefactorTooltipModule (ref), useSignalState (ref), var6 (ref), reactModule (ref), appStorageService (ref), profilePlatformInspectAvatarTooltipMaxImpressions (ref)
	if fFlagProfileInspectAndBuyRefactorTooltipModule then
		local var7 = useSignalState(var6.getIsOpen)
		reactModule.useEffect(function() --[[ line: 20 ]]
			-- upvalues: var6 (copy)
			var6.tryShow()
			
			return function() --[[ line: 23 ]]
				-- upvalues: var6 (copy)
				var6.hide()
			end
		end, {})
		
		return { showTooltip = var7, onDismiss = var6.permanentlyDismiss }
	end
	local var8, var9 = reactModule.useState(false)
	local var10 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: var10 (ref), appStorageService (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy), var9 (ref)
		if var10.current then return end
		local ok, status = pcall(function() --[[ line: 42 ]]
			-- upvalues: appStorageService (copy)
			return tonumber(appStorageService:GetItem("ProfileInspectAndBuyImpressionCount")) or 0
		end)
		
		if ok and profilePlatformInspectAvatarTooltipMaxImpressions > status then
			pcall(function() --[[ line: 48 ]]
				-- upvalues: appStorageService (copy), status (ref)
				appStorageService:SetItem("ProfileInspectAndBuyImpressionCount", tostring(status + 1))
				appStorageService:Flush()
			end)
			var10.current = true
			var9(true)
			
			return
		end
	end, {})
	
	return {
		showTooltip = var8,
		onDismiss = reactModule.useCallback(function() --[[ line: 57 ]]
			-- upvalues: appStorageService (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy), var9 (ref)
			pcall(function() --[[ line: 58 ]]
				-- upvalues: appStorageService (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy)
				appStorageService:SetItem("ProfileInspectAndBuyImpressionCount", tostring(profilePlatformInspectAvatarTooltipMaxImpressions))
				appStorageService:Flush()
			end)
			var9(false)
		end, {})
	}
end