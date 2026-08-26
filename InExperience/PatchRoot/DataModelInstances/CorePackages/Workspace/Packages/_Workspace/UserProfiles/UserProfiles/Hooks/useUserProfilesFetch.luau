local userProfiles = script:FindFirstAncestor("UserProfiles")
local parent = userProfiles.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local setupFireDiagModule = require(userProfiles.Analytics.setupFireDiag)
local eventNamesModule = require(userProfiles.Analytics.EventNames)
local userProfilesAnalyticsModule = require(userProfiles.Analytics.UserProfilesAnalytics)
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useApolloAutoRetry = require(parent.SocialCommon).Hooks.useApolloAutoRetry
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local useEffectOnMount = roactUtilsModule.Hooks.useEffectOnMount
local useQuery = require(parent.ApolloClient).useQuery
local userProfilesEnableRetries = game:DefineFastFlag("UserProfilesEnableRetries", false)
local fFlagUserProfilesLogCancelledRequestsModule = require(userProfiles.Flags.FFlagUserProfilesLogCancelledRequests)
local fFlagUserProfilesLogErrorCodesModule = require(userProfiles.Flags.FFlagUserProfilesLogErrorCodes)
local userProfileDefaultRetryCount = game:DefineFastInt("UserProfileDefaultRetryCount", 2)
local userProfilesFilterInvalidUserIds = game:DefineFastFlag("UserProfilesFilterInvalidUserIds", false)

return function(p1)
	-- upvalues: userProfilesFilterInvalidUserIds (ref), reactModule (ref), cryoModule (ref), useQuery (ref), userProfilesEnableRetries (ref), useApolloAutoRetry (ref), userProfileDefaultRetryCount (ref), fFlagUserProfilesLogCancelledRequestsModule (ref), setupFireDiagModule (ref), userProfilesAnalyticsModule (ref), useEffectOnMount (ref), eventNamesModule (ref), useEffectOnce (ref), fFlagUserProfilesLogErrorCodesModule (ref), getDeepValue (ref)
	local var1
	local var2 = if userProfilesFilterInvalidUserIds then reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref)
		return cryoModule.List.filter(p1.userIds, function(p2)
			return tonumber(p2) ~= nil
		end)
	end, { p1.userIds }) else nil
	
	if userProfilesFilterInvalidUserIds then
		var1 = #var2 == 0
		var1 = nil
	else
		var1 = #p1.userIds == 0
	end
	local var3 = useQuery(p1.query, {
		errorPolicy = "all",
		skip = var1 or p1.skip,
		variables = {
			userIds = if userProfilesFilterInvalidUserIds then var2 else p1.userIds
		}
	})
	local var4 = if userProfilesEnableRetries then useApolloAutoRetry(var3, {
		retryCount = if p1.overrideRetryCount then p1.overrideRetryCount else userProfileDefaultRetryCount
	}) else var3
	local var5 = reactModule.useRef(var4.loading or var4.isRetrying)
	
	if fFlagUserProfilesLogCancelledRequestsModule then
		var5.current = var4.loading or var4.isRetrying
	end
	local var6 = reactModule.useMemo(function()
		-- upvalues: setupFireDiagModule (copy), userProfilesAnalyticsModule (copy)
		return setupFireDiagModule({ analytics = { Diag = userProfilesAnalyticsModule.Diag } })
	end, {})
	local var7 = reactModule.useRef(DateTime.now())
	useEffectOnMount(function()
		-- upvalues: var7 (ref), var6 (ref), eventNamesModule (copy)
		var7.current = DateTime.now()
		var6(eventNamesModule.UserProfilesRequestBegin)
	end)
	
	if userProfilesEnableRetries then
		useEffectOnce(function()
			-- upvalues: var7 (ref), var6 (ref), eventNamesModule (copy), userProfilesAnalyticsModule (copy), fFlagUserProfilesLogErrorCodesModule (copy), getDeepValue (copy), var4 (write)
			local _ = nil
			
			if var7.current then
				local var8 = DateTime.now().UnixTimestampMillis - var7.current.UnixTimestampMillis
				var6(eventNamesModule.UserProfilesRequestFail)
				userProfilesAnalyticsModule.Diag:reportStats(eventNamesModule.UserProfilesRequestFailDuration, var8)
				
				if fFlagUserProfilesLogErrorCodesModule then
					local var9 = getDeepValue(var4, "error.graphQLErrors")
					
					if var9 then
						var6(eventNamesModule.UserProfilesErrorCode, {
							status = getDeepValue(var9[1] or {}, "extensions.status")
						})
					end
				end
			end
		end, var4.error)
		useEffectOnce(function()
			-- upvalues: var7 (ref), var4 (write), var6 (ref), eventNamesModule (copy), userProfilesAnalyticsModule (copy), fFlagUserProfilesLogErrorCodesModule (copy), getDeepValue (copy)
			local _ = nil
			
			if var7.current then
				local var8 = DateTime.now().UnixTimestampMillis - var7.current.UnixTimestampMillis
				
				if var4.data and var4.retryCount == 0 then
					var6(eventNamesModule.UserProfilesRequestSuccess)
					userProfilesAnalyticsModule.Diag:reportStats(eventNamesModule.UserProfilesRequestSuccessDuration, var8)
					
					return
				elseif var4.data then
					var6(eventNamesModule.UserProfilesRequestSuccessAfterRetry)
					userProfilesAnalyticsModule.Diag:reportStats(eventNamesModule.UserProfilesRequestSuccessAfterRetry, var8)
					
					return
				end
				var6(eventNamesModule.UserProfilesRequestFailAfterRetry)
				userProfilesAnalyticsModule.Diag:reportStats(eventNamesModule.UserProfilesRequestFailAfterRetryDuration, var8)
				
				if fFlagUserProfilesLogErrorCodesModule then
					local var9 = getDeepValue(var4, "error.graphQLErrors")
					
					if var9 then
						var6(eventNamesModule.UserProfilesErrorCode, {
							status = getDeepValue(var9[1] or {}, "extensions.status")
						})
					end
				end
			end
		end, if fFlagUserProfilesLogCancelledRequestsModule then not var5.current else var4.loading == false and var4.isRetrying == false)
	end
	if fFlagUserProfilesLogCancelledRequestsModule then
		reactModule.useEffect(function()
			-- upvalues: var5 (ref), var6 (ref), eventNamesModule (copy)
			return function()
				-- upvalues: var5 (copy), var6 (copy), eventNamesModule (copy)
				if var5.current then
					var6(eventNamesModule.UserProfilesUnmountEarly)
				end
			end
		end, {})
	end
	return var4
end