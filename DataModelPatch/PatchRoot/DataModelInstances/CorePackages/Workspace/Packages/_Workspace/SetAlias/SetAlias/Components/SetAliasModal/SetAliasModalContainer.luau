local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local DependenciesModule = require(Parent.dependencies)
local SetAliasModalModule = require(script.Parent.SetAliasModal)
local ConstantsModule = require(Parent.Common.Constants)
local AnalyticsModule = require(Parent.Analytics)
local EventNames = AnalyticsModule.EventNames
local UseAnalyticsFunction = AnalyticsModule.useAnalytics
local LoadingStages = require(Parent1.SocialLuaAnalytics).Analytics.Enums.LoadingStages
local React = DependenciesModule.React
local NetworkingAliases = DependenciesModule.NetworkingAliases
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseEffectOnMountFunction = DependenciesModule.Hooks.useEffectOnMount
local UseUserProfilesFetchFunction = DependenciesModule.UserProfiles.Hooks.useUserProfilesFetch
local UserProfilesAllNamesByUserIds = DependenciesModule.UserProfiles.Queries.userProfilesAllNamesByUserIds
local WriteNamesQueryFunction = DependenciesModule.UserProfiles.Mutations.writeNamesQuery
local UseEffectOnceFunction = require(Parent1.RoactUtils).Hooks.useEffectOnce

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ConstantsModule (copy), React (copy), UseUserProfilesFetchFunction (copy), UserProfilesAllNamesByUserIds (copy), UseAnalyticsFunction (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), UseEffectOnMountFunction (copy), EventNames (copy), SocialStopwatchModule (copy), LoadingStages (copy), UseEffectOnceFunction (copy), NetworkingAliases (copy), WriteNamesQueryFunction (copy), SetAliasModalModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Param = p1.navigation.getParam(ConstantsModule.PROFILE_USER_ID)
	local UseStateResult, UseStateResult2 = React.useState(false)
	local UseUserProfilesFetchResult = UseUserProfilesFetchFunction({
		userIds = { Param },
		query = UserProfilesAllNamesByUserIds
	})
	local UseAnalyticsResult = UseAnalyticsFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local DataUserProfile = (GetDeepValueFunction(UseUserProfilesFetchResult, "data.userProfiles") or {})[1] or {}
	local NamesAlias = GetDeepValueFunction(DataUserProfile, "names.alias")
	local NamesDisplayName = GetDeepValueFunction(DataUserProfile, "names.displayName")
	UseEffectOnMountFunction(function()
		-- upvalues: UseAnalyticsResult (copy), EventNames (upval)
		if UseAnalyticsResult then
			UseAnalyticsResult.fireAnalyticsEvent(EventNames.CustomizeNameModalOpened)
		end
	end)
	React.useEffect(function()
		-- upvalues: SocialStopwatchModule (upval), UseAnalyticsResult (copy), EventNames (upval), LoadingStages (upval)
		local GetResult = SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.CustomizeNameOpened)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.CustomizeNameLoadingStage, {
			status = LoadingStages.Fetching,
			statValue = GetResult and GetResult.timeElapsed
		})
		
		return function()
			-- upvalues: SocialStopwatchModule (upval)
			SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.CustomizeNameOpened)
		end
	end, {})
	UseEffectOnceFunction(function()
		-- upvalues: SocialStopwatchModule (upval), UseAnalyticsResult (copy), EventNames (upval), UseUserProfilesFetchResult (copy), LoadingStages (upval)
		local GetResult = SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.CustomizeNameOpened)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.CustomizeNameLoadingStage, {
			status = if UseUserProfilesFetchResult.data then LoadingStages.Done else LoadingStages.Failed,
			statValue = GetResult and GetResult.timeElapsed
		})
	end, UseUserProfilesFetchResult.data or UseUserProfilesFetchResult.error)
	
	return React.createElement(SetAliasModalModule, {
		screenSize = UseSelectorResult,
		alias = NamesAlias,
		displayName = NamesDisplayName,
		cancelOnActivated = function()
			-- upvalues: p1 (copy)
			p1.navigation.pop()
		end,
		saveOnActivated = function(Alias)
			-- upvalues: UseDispatchResult (copy), NetworkingAliases (upval), Param (copy), GetDeepValueFunction (upval), UseStateResult2 (copy), UseAnalyticsResult (copy), EventNames (upval), WriteNamesQueryFunction (upval), UseUserProfilesFetchResult (copy), UserProfilesAllNamesByUserIds (upval), DataUserProfile (copy), p1 (copy)
			return UseDispatchResult(NetworkingAliases.SetUserTag.API(Param, Alias)):andThen(function(Result)
				-- upvalues: GetDeepValueFunction (upval), UseStateResult2 (upval), UseAnalyticsResult (upval), EventNames (upval), Alias (copy), WriteNamesQueryFunction (upval), UseUserProfilesFetchResult (upval), UserProfilesAllNamesByUserIds (upval), Param (upval), DataUserProfile (upval), p1 (upval)
				if GetDeepValueFunction(Result, "responseBody.status") == "Moderated" then
					UseStateResult2(true)
					
					if UseAnalyticsResult then
						UseAnalyticsResult.fireAnalyticsEvent(EventNames.CustomizeNameSaveAttemptInvalidInput, { alias = Alias })
					end
					return
				else
					if UseAnalyticsResult then
						UseAnalyticsResult.fireAnalyticsEvent(EventNames.CustomizeNameSaved, { alias = Alias })
					end
					WriteNamesQueryFunction({
						client = UseUserProfilesFetchResult.client,
						query = UserProfilesAllNamesByUserIds,
						userId = Param,
						names = {
							alias = Alias,
							contactName = GetDeepValueFunction(DataUserProfile, "names.contactName"),
							displayName = GetDeepValueFunction(DataUserProfile, "names.displayName"),
							username = GetDeepValueFunction(DataUserProfile, "names.username")
						}
					})
					p1.navigation.pop()
				end
			end)
		end,
		hasSaveAliasError = UseStateResult,
		onTextChanged = function()
			-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
			if UseStateResult then
				UseStateResult2(false)
			end
		end,
		isLoading = UseUserProfilesFetchResult.loading
	})
end