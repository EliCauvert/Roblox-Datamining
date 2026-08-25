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

return function(p0)
	-- upvalues: useDispatch (ref), constantsModule (ref), react (ref), useUserProfilesFetch (ref), userProfilesAllNamesByUserIds (ref), useAnalytics (ref), useSelector (ref), getDeepValue (ref), useEffectOnMount (ref), eventNames (ref), socialStopwatchModule (ref), loadingStages (ref), useEffectOnce (ref), networkingAliases (ref), writeNamesQuery (ref), setAliasModalModule (ref)
	local var7 = useDispatch()
	local param = p0.navigation.getParam(constantsModule.PROFILE_USER_ID)
	local var9, var10 = react.useState(false)
	local var11 = useUserProfilesFetch({
		userIds = { param },
		query = userProfilesAllNamesByUserIds
	})
	local var12 = useAnalytics()
	local var13 = useSelector(function(p1)
		return p1.ScreenSize
	end)
	local var14 = (getDeepValue(var11, "data.userProfiles") or {})[1] or {}
	local var15 = getDeepValue(var14, "names.alias")
	local var16 = getDeepValue(var14, "names.displayName")
	useEffectOnMount(function()
		-- upvalues: var12 (ref), eventNames (copy)
		if var12 then
			var12.fireAnalyticsEvent(eventNames.CustomizeNameModalOpened)
		end
	end)
	react.useEffect(function()
		-- upvalues: socialStopwatchModule (copy), var12 (ref), eventNames (copy), loadingStages (copy)
		local var17 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CustomizeNameOpened)
		var12.fireAnalyticsEvent(eventNames.CustomizeNameLoadingStage, {
			status = loadingStages.Fetching,
			statValue = var17 and var17.timeElapsed
		})
		
		return function()
			-- upvalues: socialStopwatchModule (copy)
			socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CustomizeNameOpened)
		end
	end, {})
	useEffectOnce(function()
		-- upvalues: socialStopwatchModule (copy), var12 (ref), eventNames (copy), var11 (ref), loadingStages (copy)
		local var18 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CustomizeNameOpened)
		var12.fireAnalyticsEvent(eventNames.CustomizeNameLoadingStage, {
			status = if var11.data then loadingStages.Done else loadingStages.Failed,
			statValue = var18 and var18.timeElapsed
		})
	end, var11.data or var11.error)
	
	return react.createElement(setAliasModalModule, {
		screenSize = var13,
		alias = var15,
		displayName = var16,
		cancelOnActivated = function()
			-- upvalues: p0 (ref)
			p0.navigation.pop()
		end,
		saveOnActivated = function(p2)
			-- upvalues: var7 (ref), networkingAliases (copy), param (ref), getDeepValue (copy), var10 (ref), var12 (ref), eventNames (copy), writeNamesQuery (copy), var11 (ref), userProfilesAllNamesByUserIds (copy), var14 (ref), p0 (ref)
			return var7(networkingAliases.SetUserTag.API(param, p2)):andThen(function(p3)
				-- upvalues: getDeepValue (copy), var10 (copy), var12 (copy), eventNames (copy), p2 (ref), writeNamesQuery (copy), var11 (copy), userProfilesAllNamesByUserIds (copy), param (copy), var14 (copy), p0 (copy)
				if getDeepValue(p3, "responseBody.status") == "Moderated" then
					var10(true)
					
					if var12 then
						var12.fireAnalyticsEvent(eventNames.CustomizeNameSaveAttemptInvalidInput, { alias = p2 })
					end
					return
				elseif var12 then
					var12.fireAnalyticsEvent(eventNames.CustomizeNameSaved, { alias = p2 })
				end
				writeNamesQuery({
					client = var11.client,
					query = userProfilesAllNamesByUserIds,
					userId = param,
					names = {
						alias = p2,
						contactName = getDeepValue(var14, "names.contactName"),
						displayName = getDeepValue(var14, "names.displayName"),
						username = getDeepValue(var14, "names.username")
					}
				})
				p0.navigation.pop()
			end)
		end,
		hasSaveAliasError = var9,
		onTextChanged = function()
			-- upvalues: var9 (ref), var10 (ref)
			if var9 then
				var10(false)
			end
		end,
		isLoading = var11.loading
	})
end