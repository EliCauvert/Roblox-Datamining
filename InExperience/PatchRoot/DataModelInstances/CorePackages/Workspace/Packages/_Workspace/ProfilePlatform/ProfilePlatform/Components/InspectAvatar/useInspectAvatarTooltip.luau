local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local appStorageService = game:GetService("AppStorageService")
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local getInspectAvatarTooltipStoreModule = require(profilePlatform.Stores.GetInspectAvatarTooltipStore)
local fFlagProfileInspectAndBuyRefactorTooltipModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyRefactorTooltip)
local profilePlatformInspectAvatarTooltipMaxImpressions = game:DefineFastInt("ProfilePlatformInspectAvatarTooltipMaxImpressions", 3)
local var1 = getInspectAvatarTooltipStoreModule(false)

return function()
	-- upvalues: fFlagProfileInspectAndBuyRefactorTooltipModule (ref), useSignalState (ref), var1 (ref), reactModule (ref), appStorageService (ref), profilePlatformInspectAvatarTooltipMaxImpressions (ref)
	if fFlagProfileInspectAndBuyRefactorTooltipModule then
		local var2 = useSignalState(var1.getIsOpen)
		reactModule.useEffect(function()
			-- upvalues: var1 (copy)
			var1.tryShow()
			
			return function()
				-- upvalues: var1 (copy)
				var1.hide()
			end
		end, {})
		
		return { showTooltip = var2, onDismiss = var1.permanentlyDismiss }
	end
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), appStorageService (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy), var4 (ref)
		if var5.current then return end
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy)
			return tonumber(appStorageService:GetItem("ProfileInspectAndBuyImpressionCount")) or 0
		end)
		
		if ok and profilePlatformInspectAvatarTooltipMaxImpressions > status then
			pcall(function()
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
		onDismiss = reactModule.useCallback(function()
			-- upvalues: appStorageService (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy), var4 (ref)
			pcall(function()
				-- upvalues: appStorageService (copy), profilePlatformInspectAvatarTooltipMaxImpressions (copy)
				appStorageService:SetItem("ProfileInspectAndBuyImpressionCount", tostring(profilePlatformInspectAvatarTooltipMaxImpressions))
				appStorageService:Flush()
			end)
			var4(false)
		end, {})
	}
end