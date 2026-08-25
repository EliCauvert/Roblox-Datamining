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

return function(p0)
	-- upvalues: userProfilesFilterInvalidUserIds (ref), reactModule (ref), cryoModule (ref), useQuery (ref), userProfilesEnableRetries (ref), useApolloAutoRetry (ref), userProfileDefaultRetryCount (ref), fFlagUserProfilesLogCancelledRequestsModule (ref), setupFireDiagModule (ref), userProfilesAnalyticsModule (ref), useEffectOnMount (ref), eventNamesModule (ref), useEffectOnce (ref), fFlagUserProfilesLogErrorCodesModule (ref), getDeepValue (ref)
	local var13
	local var12 = if userProfilesFilterInvalidUserIds then reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p0 (ref)
		return cryoModule.List.filter(p0.userIds, function(p1)
			return tonumber(p1) ~= nil
		end)
	end, { p0.userIds }) else nil
	
	if userProfilesFilterInvalidUserIds then
		var13 = #var12 == 0
		var13 = nil
	else
		var13 = #p0.userIds == 0
	end
	local var14 = useQuery(p0.query, {
		errorPolicy = "all",
		skip = var13 or p0.skip,
		variables = {
			userIds = if userProfilesFilterInvalidUserIds then var12 else p0.userIds
		}
	})
	local var15 = if userProfilesEnableRetries then useApolloAutoRetry(var14, {
		retryCount = if p0.overrideRetryCount then p0.overrideRetryCount else userProfileDefaultRetryCount
	}) else var14
	local var16 = reactModule.useRef(var15.loading or var15.isRetrying)
	
	if fFlagUserProfilesLogCancelledRequestsModule then
		var16.current = var15.loading or var15.isRetrying
	end
	local var17 = reactModule.useMemo(function()
		-- upvalues: setupFireDiagModule (copy), userProfilesAnalyticsModule (copy)
		return setupFireDiagModule({ analytics = { Diag = userProfilesAnalyticsModule.Diag } })
	end, {})
	local var18 = reactModule.useRef(DateTime.now())
	useEffectOnMount(function()
		-- upvalues: var18 (ref), var17 (ref), eventNamesModule (copy)
		var18.current = DateTime.now()
		var17(eventNamesModule.UserProfilesRequestBegin)
	end)
	
	if userProfilesEnableRetries then
		useEffectOnce(function()
			-- upvalues: var18 (ref), var17 (ref), eventNamesModule (copy), userProfilesAnalyticsModule (copy), fFlagUserProfilesLogErrorCodesModule (copy), getDeepValue (copy), var15 (write)
			local _ = nil
			
			if var18.current then
				local var19 = DateTime.now().UnixTimestampMillis - var18.current.UnixTimestampMillis
				var17(eventNamesModule.UserProfilesRequestFail)
				userProfilesAnalyticsModule.Diag:reportStats(eventNamesModule.UserProfilesRequestFailDuration, var19)
				
				if fFlagUserProfilesLogErrorCodesModule then
					local var20 = getDeepValue(var15, "error.graphQLErrors")
					
					if var20 then
						var17(eventNamesModule.UserProfilesErrorCode, {
							status = getDeepValue(var20[1] or {}, "extensions.status")
						})
					end
				end
			end
		end, var15.error)
		useEffectOnce(function()
			-- upvalues: var18 (ref), var15 (write), var17 (ref), eventNamesModule (copy), userProfilesAnalyticsModule (copy), fFlagUserProfilesLogErrorCodesModule (copy), getDeepValue (copy)
			local _ = nil
			
			if var18.current then
				local var21 = DateTime.now().UnixTimestampMillis - var18.current.UnixTimestampMillis
				
				if var15.data and var15.retryCount == 0 then
					var17(eventNamesModule.UserProfilesRequestSuccess)
					userProfilesAnalyticsModule.Diag:reportStats(eventNamesModule.UserProfilesRequestSuccessDuration, var21)
					
					return
				elseif var15.data then
					var17(eventNamesModule.UserProfilesRequestSuccessAfterRetry)
					userProfilesAnalyticsModule.Diag:reportStats(eventNamesModule.UserProfilesRequestSuccessAfterRetry, var21)
					
					return
				end
				var17(eventNamesModule.UserProfilesRequestFailAfterRetry)
				userProfilesAnalyticsModule.Diag:reportStats(eventNamesModule.UserProfilesRequestFailAfterRetryDuration, var21)
				
				if fFlagUserProfilesLogErrorCodesModule then
					local var22 = getDeepValue(var15, "error.graphQLErrors")
					
					if var22 then
						var17(eventNamesModule.UserProfilesErrorCode, {
							status = getDeepValue(var22[1] or {}, "extensions.status")
						})
					end
				end
			end
		end, if fFlagUserProfilesLogCancelledRequestsModule then not var16.current else var15.loading == false and var15.isRetrying == false)
	end
	if fFlagUserProfilesLogCancelledRequestsModule then
		reactModule.useEffect(function()
			-- upvalues: var16 (ref), var17 (ref), eventNamesModule (copy)
			return function()
				-- upvalues: var16 (copy), var17 (copy), eventNamesModule (copy)
				if var16.current then
					var17(eventNamesModule.UserProfilesUnmountEarly)
				end
			end
		end, {})
	end
	return var15
end