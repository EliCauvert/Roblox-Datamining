local UserProfiles = script:FindFirstAncestor("UserProfiles")
local Parent = UserProfiles.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SetupFireDiagModule = require(UserProfiles.Analytics.setupFireDiag)
local EventNamesModule = require(UserProfiles.Analytics.EventNames)
local UserProfilesAnalyticsModule = require(UserProfiles.Analytics.UserProfilesAnalytics)
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UseApolloAutoRetryFunction = require(Parent.SocialCommon).Hooks.useApolloAutoRetry
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local UseEffectOnMountFunction = RoactUtilsModule.Hooks.useEffectOnMount
local UseQueryFunction = require(Parent.ApolloClient).useQuery
local UserProfilesEnableRetries = game:DefineFastFlag("UserProfilesEnableRetries", false)
local FFlagUserProfilesLogCancelledRequestsModule = require(UserProfiles.Flags.FFlagUserProfilesLogCancelledRequests)
local FFlagUserProfilesLogErrorCodesModule = require(UserProfiles.Flags.FFlagUserProfilesLogErrorCodes)
local UserProfileDefaultRetryCount = game:DefineFastInt("UserProfileDefaultRetryCount", 2)
local UserProfilesFilterInvalidUserIds = game:DefineFastFlag("UserProfilesFilterInvalidUserIds", false)

return function(p1)
	-- upvalues: UserProfilesFilterInvalidUserIds (copy), ReactModule (copy), CryoModule (copy), UseQueryFunction (copy), UserProfilesEnableRetries (copy), UseApolloAutoRetryFunction (copy), UserProfileDefaultRetryCount (copy), FFlagUserProfilesLogCancelledRequestsModule (copy), SetupFireDiagModule (copy), UserProfilesAnalyticsModule (copy), UseEffectOnMountFunction (copy), EventNamesModule (copy), UseEffectOnceFunction (copy), FFlagUserProfilesLogErrorCodesModule (copy), GetDeepValueFunction (copy)
	local UseMemoResult = if UserProfilesFilterInvalidUserIds then ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy)
		return CryoModule.List.filter(p1.userIds, function(p2): boolean
			return tonumber(p2) ~= nil
		end)
	end, { p1.userIds }) else nil
	local UseQueryResult = UseQueryFunction(p1.query, {
		errorPolicy = "all",
		skip = (if UserProfilesFilterInvalidUserIds then #UseMemoResult == 0 else #p1.userIds == 0) or p1.skip,
		variables = {
			userIds = if UserProfilesFilterInvalidUserIds then UseMemoResult else p1.userIds
		}
	})
	local UseApolloAutoRetryResult = if UserProfilesEnableRetries then UseApolloAutoRetryFunction(UseQueryResult, {
		retryCount = if p1.overrideRetryCount then p1.overrideRetryCount else UserProfileDefaultRetryCount
	}) else UseQueryResult
	local UseRefResult = ReactModule.useRef(UseApolloAutoRetryResult.loading or UseApolloAutoRetryResult.isRetrying)
	
	if FFlagUserProfilesLogCancelledRequestsModule then
		UseRefResult.current = UseApolloAutoRetryResult.loading or UseApolloAutoRetryResult.isRetrying
	end
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SetupFireDiagModule (upval), UserProfilesAnalyticsModule (upval)
		return SetupFireDiagModule({ analytics = { Diag = UserProfilesAnalyticsModule.Diag } })
	end, {})
	local UseRefResult1 = ReactModule.useRef(DateTime.now())
	UseEffectOnMountFunction(function()
		-- upvalues: UseRefResult1 (copy), UseMemoResult1 (copy), EventNamesModule (upval)
		UseRefResult1.current = DateTime.now()
		UseMemoResult1(EventNamesModule.UserProfilesRequestBegin)
	end)
	
	if UserProfilesEnableRetries then
		UseEffectOnceFunction(function()
			-- upvalues: UseRefResult1 (copy), UseMemoResult1 (copy), EventNamesModule (upval), UserProfilesAnalyticsModule (upval), FFlagUserProfilesLogErrorCodesModule (upval), GetDeepValueFunction (upval), UseApolloAutoRetryResult (ref)
			if UseRefResult1.current then
				local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - UseRefResult1.current.UnixTimestampMillis
				UseMemoResult1(EventNamesModule.UserProfilesRequestFail)
				UserProfilesAnalyticsModule.Diag:reportStats(EventNamesModule.UserProfilesRequestFailDuration, UnixTimestampMillisDelta)
				
				if FFlagUserProfilesLogErrorCodesModule then
					local ErrorGraphQLErrors = GetDeepValueFunction(UseApolloAutoRetryResult, "error.graphQLErrors")
					
					if ErrorGraphQLErrors then
						UseMemoResult1(EventNamesModule.UserProfilesErrorCode, {
							status = GetDeepValueFunction(ErrorGraphQLErrors[1] or {}, "extensions.status")
						})
					end
				end
			end
		end, UseApolloAutoRetryResult.error)
		UseEffectOnceFunction(function()
			-- upvalues: UseRefResult1 (copy), UseApolloAutoRetryResult (ref), UseMemoResult1 (copy), EventNamesModule (upval), UserProfilesAnalyticsModule (upval), FFlagUserProfilesLogErrorCodesModule (upval), GetDeepValueFunction (upval)
			if UseRefResult1.current then
				local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - UseRefResult1.current.UnixTimestampMillis
				
				if UseApolloAutoRetryResult.data and UseApolloAutoRetryResult.retryCount == 0 then
					UseMemoResult1(EventNamesModule.UserProfilesRequestSuccess)
					UserProfilesAnalyticsModule.Diag:reportStats(EventNamesModule.UserProfilesRequestSuccessDuration, UnixTimestampMillisDelta)
					
					return
				end
				if UseApolloAutoRetryResult.data then
					UseMemoResult1(EventNamesModule.UserProfilesRequestSuccessAfterRetry)
					UserProfilesAnalyticsModule.Diag:reportStats(EventNamesModule.UserProfilesRequestSuccessAfterRetry, UnixTimestampMillisDelta)
					
					return
				end
				UseMemoResult1(EventNamesModule.UserProfilesRequestFailAfterRetry)
				UserProfilesAnalyticsModule.Diag:reportStats(EventNamesModule.UserProfilesRequestFailAfterRetryDuration, UnixTimestampMillisDelta)
				
				if FFlagUserProfilesLogErrorCodesModule then
					local ErrorGraphQLErrors = GetDeepValueFunction(UseApolloAutoRetryResult, "error.graphQLErrors")
					
					if ErrorGraphQLErrors then
						UseMemoResult1(EventNamesModule.UserProfilesErrorCode, {
							status = GetDeepValueFunction(ErrorGraphQLErrors[1] or {}, "extensions.status")
						})
					end
				end
			end
		end, if FFlagUserProfilesLogCancelledRequestsModule then not UseRefResult.current else UseApolloAutoRetryResult.loading == false and UseApolloAutoRetryResult.isRetrying == false)
	end
	if FFlagUserProfilesLogCancelledRequestsModule then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), UseMemoResult1 (copy), EventNamesModule (upval)
			return function()
				-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), EventNamesModule (upval)
				if UseRefResult.current then
					UseMemoResult1(EventNamesModule.UserProfilesUnmountEarly)
				end
			end
		end, {})
	end
	return UseApolloAutoRetryResult
end