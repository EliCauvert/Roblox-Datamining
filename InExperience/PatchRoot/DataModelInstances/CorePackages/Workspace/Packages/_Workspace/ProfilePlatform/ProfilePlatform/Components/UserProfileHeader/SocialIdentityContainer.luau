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
local var8 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p0) --[[ line: 45 | named "SocialIdentityContainer" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useLocalUserId (ref), appStorageService (ref), reactModule (ref), useEffectOnce (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), signalsModule (ref), var8 (ref), useSignalState (ref), socialIdentityModule (ref), cryoModule (ref)
	local profileId = useProfileWrapperContextModule().profileId
	local var9 = profileId == useLocalUserId()
	local var10 = if var9 then "NamesDisplayNameTooltipImpressionCount" else "NamesProfileTooltip"
	local var11 = reactModule.useRef(tonumber(appStorageService:GetItem(var10)) or 0)
	local var12 = reactModule.useCallback(function(p1) --[[ line: 58 ]]
		-- upvalues: appStorageService (copy), var10 (ref)
		appStorageService:SetItem(var10, tostring(p1 or 0))
		appStorageService:Flush()
	end)
	local var13 = reactModule.useCallback(function() --[[ line: 63 ]]
		-- upvalues: var11 (ref), var12 (ref)
		var11.current = 3
		var12(3)
	end)
	useEffectOnce(function() --[[ line: 68 ]]
		-- upvalues: var11 (ref), var12 (ref)
		if var11.current then
			var12(var11.current + 1)
		end
	end, false)
	local _ = nil
	
	return reactModule.createElement(socialIdentityModule, cryoModule.Dictionary.union(p0, {
		isTooltipActive = false,
		isLocalUser = var9,
		dismissTooltip = var13,
		isTrustedConnection = useSignalState(reactModule.useMemo(function() --[[ line: 80 ]]
			-- upvalues: signalsModule (copy), profileId (ref), var8 (copy)
			return signalsModule.createComputed(function(p2) --[[ line: 81 ]]
				-- upvalues: profileId (copy), var8 (copy)
				return if profileId and profileId ~= "" then var8.getIsTrustedConnection(profileId).data(p2) else nil
			end)
		end, { profileId })),
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(profileId or nil) else nil else nil
	}))
end