local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local socialStopwatchModule = require(parent_1.SocialStopwatch)
local socialLuaAnalyticsModule = require(parent_1.SocialLuaAnalytics)
local roactUtilsModule = require(parent_1.RoactUtils)
local dependenciesModule = require(parent.dependencies)
local setAliasModalModule = require(script.Parent.SetAliasModal)
local constantsModule = require(parent.Common.Constants)
local analyticsModule = require(parent.Analytics)
local eventNames = analyticsModule.EventNames
local useAnalytics = analyticsModule.useAnalytics
local loadingStages = socialLuaAnalyticsModule.Analytics.Enums.LoadingStages
local react = dependenciesModule.React
local networkingAliases = dependenciesModule.NetworkingAliases
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local useSelector = dependenciesModule.Hooks.useSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useEffectOnMount = dependenciesModule.Hooks.useEffectOnMount
local useUserProfilesFetch = dependenciesModule.UserProfiles.Hooks.useUserProfilesFetch
local userProfilesAllNamesByUserIds = dependenciesModule.UserProfiles.Queries.userProfilesAllNamesByUserIds
local writeNamesQuery = dependenciesModule.UserProfiles.Mutations.writeNamesQuery
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local _ = { Moderated = "Moderated", Success = "Success" }

return function(p1)
	-- upvalues: useDispatch (ref), constantsModule (ref), react (ref), useUserProfilesFetch (ref), userProfilesAllNamesByUserIds (ref), useAnalytics (ref), useSelector (ref), getDeepValue (ref), useEffectOnMount (ref), eventNames (ref), socialStopwatchModule (ref), loadingStages (ref), useEffectOnce (ref), networkingAliases (ref), writeNamesQuery (ref), setAliasModalModule (ref)
	local var1 = useDispatch()
	local param = p1.navigation.getParam(constantsModule.PROFILE_USER_ID)
	local var2, var3 = react.useState(false)
	local var4 = useUserProfilesFetch({
		userIds = { param },
		query = userProfilesAllNamesByUserIds
	})
	local var5 = useAnalytics()
	local var6 = useSelector(function(p2)
		return p2.ScreenSize
	end)
	local var7 = (getDeepValue(var4, "data.userProfiles") or {})[1] or {}
	local var8 = getDeepValue(var7, "names.alias")
	local var9 = getDeepValue(var7, "names.displayName")
	useEffectOnMount(function()
		-- upvalues: var5 (ref), eventNames (copy)
		if var5 then
			var5.fireAnalyticsEvent(eventNames.CustomizeNameModalOpened)
		end
	end)
	react.useEffect(function()
		-- upvalues: socialStopwatchModule (copy), var5 (ref), eventNames (copy), loadingStages (copy)
		local var10 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CustomizeNameOpened)
		var5.fireAnalyticsEvent(eventNames.CustomizeNameLoadingStage, {
			status = loadingStages.Fetching,
			statValue = var10 and var10.timeElapsed
		})
		
		return function()
			-- upvalues: socialStopwatchModule (copy)
			socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CustomizeNameOpened)
		end
	end, {})
	useEffectOnce(function()
		-- upvalues: socialStopwatchModule (copy), var5 (ref), eventNames (copy), var4 (ref), loadingStages (copy)
		local var10 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CustomizeNameOpened)
		var5.fireAnalyticsEvent(eventNames.CustomizeNameLoadingStage, {
			status = if var4.data then loadingStages.Done else loadingStages.Failed,
			statValue = var10 and var10.timeElapsed
		})
	end, var4.data or var4.error)
	
	return react.createElement(setAliasModalModule, {
		screenSize = var6,
		alias = var8,
		displayName = var9,
		cancelOnActivated = function()
			-- upvalues: p1 (ref)
			p1.navigation.pop()
		end,
		saveOnActivated = function(p2)
			-- upvalues: var1 (ref), networkingAliases (copy), param (ref), getDeepValue (copy), var3 (ref), var5 (ref), eventNames (copy), writeNamesQuery (copy), var4 (ref), userProfilesAllNamesByUserIds (copy), var7 (ref), p1 (ref)
			return var1(networkingAliases.SetUserTag.API(param, p2)):andThen(function(p3)
				-- upvalues: getDeepValue (copy), var3 (copy), var5 (copy), eventNames (copy), p2 (ref), writeNamesQuery (copy), var4 (copy), userProfilesAllNamesByUserIds (copy), param (copy), var7 (copy), p1 (copy)
				if getDeepValue(p3, "responseBody.status") == "Moderated" then
					var3(true)
					
					if var5 then
						var5.fireAnalyticsEvent(eventNames.CustomizeNameSaveAttemptInvalidInput, { alias = p2 })
					end
					return
				elseif var5 then
					var5.fireAnalyticsEvent(eventNames.CustomizeNameSaved, { alias = p2 })
				end
				writeNamesQuery({
					client = var4.client,
					query = userProfilesAllNamesByUserIds,
					userId = param,
					names = {
						alias = p2,
						contactName = getDeepValue(var7, "names.contactName"),
						displayName = getDeepValue(var7, "names.displayName"),
						username = getDeepValue(var7, "names.username")
					}
				})
				p1.navigation.pop()
			end)
		end,
		hasSaveAliasError = var2,
		onTextChanged = function()
			-- upvalues: var2 (ref), var3 (ref)
			if var2 then
				var3(false)
			end
		end,
		isLoading = var4.loading
	})
end