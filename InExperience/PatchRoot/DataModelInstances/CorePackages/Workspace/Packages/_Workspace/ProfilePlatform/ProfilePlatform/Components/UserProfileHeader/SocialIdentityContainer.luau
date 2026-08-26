local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local appStorageService = game:GetService("AppStorageService")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useEffectOnce = require(parent.RoactUtils).Hooks.useEffectOnce
local cryoModule = require(parent.Cryo)
local dataHydrationModule = require(parent.DataHydration)
local useSignalState = require(parent.SignalsReact).useSignalState
local signalsModule = require(parent.Signals)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local socialIdentityModule = require(profilePlatform.Components.UserProfileHeader.SocialIdentity)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local var1 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useLocalUserId (ref), appStorageService (ref), reactModule (ref), useEffectOnce (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), signalsModule (ref), var1 (ref), useSignalState (ref), socialIdentityModule (ref), cryoModule (ref)
	local profileId = useProfileWrapperContextModule().profileId
	local var2 = profileId == useLocalUserId()
	local var3 = if var2 then "NamesDisplayNameTooltipImpressionCount" else "NamesProfileTooltip"
	local var4 = reactModule.useRef(tonumber(appStorageService:GetItem(var3)) or 0)
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: appStorageService (copy), var3 (ref)
		appStorageService:SetItem(var3, tostring(p2 or 0))
		appStorageService:Flush()
	end)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var5 (ref)
		var4.current = 3
		var5(3)
	end)
	useEffectOnce(function()
		-- upvalues: var4 (ref), var5 (ref)
		if var4.current then
			var5(var4.current + 1)
		end
	end, false)
	local _ = nil
	
	return reactModule.createElement(socialIdentityModule, cryoModule.Dictionary.union(p1, {
		isTooltipActive = false,
		isLocalUser = var2,
		dismissTooltip = var6,
		isTrustedConnection = useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), profileId (ref), var1 (copy)
			return signalsModule.createComputed(function(p2)
				-- upvalues: profileId (copy), var1 (copy)
				return if profileId and profileId ~= "" then var1.getIsTrustedConnection(profileId).data(p2) else nil
			end)
		end, { profileId })),
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(profileId or nil) else nil else nil
	}))
end