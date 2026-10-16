local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local AppStorageService = game:GetService("AppStorageService")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseEffectOnceFunction = require(Parent.RoactUtils).Hooks.useEffectOnce
local CryoModule = require(Parent.Cryo)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local SignalsModule = require(Parent.Signals)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local SocialIdentityModule = require(ProfilePlatform.Components.UserProfileHeader.SocialIdentity)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local GetResult = require(Parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get()

return function(p1) --[[ Line: 45 | Named "SocialIdentityContainer" ]]
	-- upvalues: UseProfileWrapperContextModule (copy), UseLocalUserIdFunction (copy), AppStorageService (copy), ReactModule (copy), UseEffectOnceFunction (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), SignalsModule (copy), GetResult (copy), UseSignalStateFunction (copy), SocialIdentityModule (copy), CryoModule (copy)
	local ProfileId = UseProfileWrapperContextModule().profileId
	local IsProfileIdMatch = ProfileId == UseLocalUserIdFunction()
	local NamesDisplayNameTooltipImpressionCount: string = if IsProfileIdMatch then "NamesDisplayNameTooltipImpressionCount" else "NamesProfileTooltip"
	local UseRefResult = ReactModule.useRef(tonumber(AppStorageService:GetItem(NamesDisplayNameTooltipImpressionCount)) or 0)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 58 ]]
		-- upvalues: AppStorageService (upval), NamesDisplayNameTooltipImpressionCount (copy)
		AppStorageService:SetItem(NamesDisplayNameTooltipImpressionCount, (tostring(p2 or 0)))
		AppStorageService:Flush()
	end)
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 63 ]]
		-- upvalues: UseRefResult (copy), UseResult (copy)
		UseRefResult.current = 3
		UseResult(3)
	end)
	UseEffectOnceFunction(function() --[[ Line: 68 ]]
		-- upvalues: UseRefResult (copy), UseResult (copy)
		if UseRefResult.current then
			UseResult(UseRefResult.current + 1)
		end
	end, false)
	local UseIsRobloxSubscriberResult = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberFunction(ProfileId or nil) else nil
	
	return ReactModule.createElement(SocialIdentityModule, (CryoModule.Dictionary.union(p1, {
		isTooltipActive = false,
		isLocalUser = IsProfileIdMatch,
		dismissTooltip = UseResult1,
		isTrustedConnection = UseSignalStateFunction((ReactModule.useMemo(function() --[[ Line: 80 ]]
			-- upvalues: SignalsModule (upval), ProfileId (copy), GetResult (upval)
			return SignalsModule.createComputed(function(p2) --[[ Line: 81 ]]
				-- upvalues: ProfileId (upval), GetResult (upval)
				return if ProfileId and ProfileId ~= "" then GetResult.getIsTrustedConnection(ProfileId).data(p2) else nil
			end)
		end, { ProfileId }))),
		isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil
	})))
end