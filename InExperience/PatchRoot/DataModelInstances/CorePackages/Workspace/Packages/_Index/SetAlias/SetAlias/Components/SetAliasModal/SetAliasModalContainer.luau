local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local fFlagUserProfilePlatformProfile = require(parent_1.SharedFlags).FFlagUserProfilePlatformProfile
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
local var1 = if fFlagUserProfilePlatformProfile then dependenciesModule.UserProfiles.Queries.userProfilesBasicNamesByUserIds else dependenciesModule.UserProfiles.Queries.userProfilesAllNamesByUserIds
local writeNamesQuery = dependenciesModule.UserProfiles.Mutations.writeNamesQuery
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local _ = { Moderated = "Moderated", Success = "Success" }

return function(p1)
	-- upvalues: useDispatch (ref), constantsModule (ref), react (ref), useUserProfilesFetch (ref), var1 (ref), useAnalytics (ref), useSelector (ref), getDeepValue (ref), useEffectOnMount (ref), eventNames (ref), socialStopwatchModule (ref), loadingStages (ref), useEffectOnce (ref), networkingAliases (ref), writeNamesQuery (ref), setAliasModalModule (ref)
	local var2 = useDispatch()
	local param = p1.navigation.getParam(constantsModule.PROFILE_USER_ID)
	local var3, var4 = react.useState(false)
	local var5 = useUserProfilesFetch({ userIds = { param }, query = var1 })
	local var6 = useAnalytics()
	local var7 = useSelector(function(p2)
		return p2.ScreenSize
	end)
	local var8 = (getDeepValue(var5, "data.userProfiles") or {})[1] or {}
	local var9 = getDeepValue(var8, "names.alias")
	local var10 = getDeepValue(var8, "names.displayName")
	useEffectOnMount(function()
		-- upvalues: var6 (ref), eventNames (copy)
		if var6 then
			var6.fireAnalyticsEvent(eventNames.CustomizeNameModalOpened)
		end
	end)
	react.useEffect(function()
		-- upvalues: socialStopwatchModule (copy), var6 (ref), eventNames (copy), loadingStages (copy)
		local var11 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CustomizeNameOpened)
		var6.fireAnalyticsEvent(eventNames.CustomizeNameLoadingStage, {
			status = loadingStages.Fetching,
			statValue = var11 and var11.timeElapsed
		})
		
		return function()
			-- upvalues: socialStopwatchModule (copy)
			socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CustomizeNameOpened)
		end
	end, {})
	useEffectOnce(function()
		-- upvalues: socialStopwatchModule (copy), var6 (ref), eventNames (copy), var5 (ref), loadingStages (copy)
		local var11 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CustomizeNameOpened)
		var6.fireAnalyticsEvent(eventNames.CustomizeNameLoadingStage, {
			status = if var5.data then loadingStages.Done else loadingStages.Failed,
			statValue = var11 and var11.timeElapsed
		})
	end, var5.data or var5.error)
	
	return react.createElement(setAliasModalModule, {
		screenSize = var7,
		alias = var9,
		displayName = var10,
		cancelOnActivated = function()
			-- upvalues: p1 (ref)
			p1.navigation.pop()
		end,
		saveOnActivated = function(p2)
			-- upvalues: var2 (ref), networkingAliases (copy), param (ref), getDeepValue (copy), var4 (ref), var6 (ref), eventNames (copy), writeNamesQuery (copy), var5 (ref), var1 (copy), var8 (ref), p1 (ref)
			return var2(networkingAliases.SetUserTag.API(param, p2)):andThen(function(p3)
				-- upvalues: getDeepValue (copy), var4 (copy), var6 (copy), eventNames (copy), p2 (ref), writeNamesQuery (copy), var5 (copy), var1 (copy), param (copy), var8 (copy), p1 (copy)
				if getDeepValue(p3, "responseBody.status") == "Moderated" then
					var4(true)
					
					if var6 then
						var6.fireAnalyticsEvent(eventNames.CustomizeNameSaveAttemptInvalidInput, { alias = p2 })
					end
					return
				elseif var6 then
					var6.fireAnalyticsEvent(eventNames.CustomizeNameSaved, { alias = p2 })
				end
				writeNamesQuery({
					client = var5.client,
					query = var1,
					userId = param,
					names = {
						alias = p2,
						contactName = getDeepValue(var8, "names.contactName"),
						displayName = getDeepValue(var8, "names.displayName"),
						username = getDeepValue(var8, "names.username")
					}
				})
				p1.navigation.pop()
			end)
		end,
		hasSaveAliasError = var3,
		onTextChanged = function()
			-- upvalues: var3 (ref), var4 (ref)
			if var3 then
				var4(false)
			end
		end,
		isLoading = var5.loading
	})
end