local EditProfile = script:FindFirstAncestor("EditProfile")
local HttpService = game:GetService("HttpService")
local Parent = EditProfile.Parent
local FFlagUserProfilePlatformProfile = require(Parent.SharedFlags).FFlagUserProfilePlatformProfile
local ReactModule = require(Parent.React)
local JavascriptHybrid = require(EditProfile.Common.Constants).JavascriptHybrid
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UserProfilesModule = require(Parent.UserProfiles)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(EditProfile.Common.TextKeys)
local AnalyticsModule = require(EditProfile.Analytics)
local EventNames = AnalyticsModule.EventNames
local UseAnalyticsFunction = AnalyticsModule.useAnalytics

return require(Parent.RoactNavigation).withNavigation(function(p1) --[[ Line: 30 | Named "EditUsernameWrapper" ]]
	-- upvalues: UseLocalUserIdFunction (copy), UserProfilesModule (copy), FFlagUserProfilePlatformProfile (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseAnalyticsFunction (copy), JavascriptHybrid (copy), EventNames (copy), ReactModule (copy), UrlBuilder (copy), HttpService (copy)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { (UseLocalUserIdFunction()) },
		query = if FFlagUserProfilePlatformProfile then UserProfilesModule.Queries.userProfilesBasicNamesByUserIds else UserProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	local UseLocalizationResult = UseLocalizationFunction({ updated = TextKeysModule.UsernameUpdated })
	local UseAnalyticsResult = UseAnalyticsFunction()
	
	local function _(p2) --[[ Line: 44 | Named "getFeatureStringFromHybridEvent" ]]
		-- upvalues: JavascriptHybrid (upval)
		return if p2.moduleID == JavascriptHybrid.Module.Navigation and p2.functionName == JavascriptHybrid.Function.navigateToFeature and p2.params and p2.params.params then p2.params.params.feature else nil
	end
	
	local _ = function(p2): boolean --[[ Line: 69 | Named "isCloseEditUsername" ]]
		-- upvalues: JavascriptHybrid (upval)
		return (if p2.moduleID == JavascriptHybrid.Module.Navigation and p2.functionName == JavascriptHybrid.Function.navigateToFeature and p2.params and p2.params.params then p2.params.params.feature else nil) == JavascriptHybrid.Feature.CloseUpdateUsernameModal
	end
	
	local _ = function(p2): boolean --[[ Line: 74 | Named "isCompletedEditUsername" ]]
		-- upvalues: JavascriptHybrid (upval)
		return (if p2.moduleID == JavascriptHybrid.Module.Navigation and p2.functionName == JavascriptHybrid.Function.navigateToFeature and p2.params and p2.params.params then p2.params.params.feature else nil) == JavascriptHybrid.Feature.UpdateUsernameModalSuccess
	end
	
	local _ = function() --[[ Line: 79 | Named "updateUsername" ]]
		-- upvalues: UseUserProfilesFetchResult (copy), UseAnalyticsResult (copy), EventNames (upval)
		UseUserProfilesFetchResult.refetch()
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.UsernameSaved)
	end
	
	return ReactModule.createElement(p1.BrowserWrapperComponent, {
		isVisible = true,
		webViewVisible = true,
		modal = false,
		isGenericWebview = true,
		url = UrlBuilder.static.settings.account() .. "?changeusername",
		javaScriptCallback = function(Input) --[[ Line: 91 ]]
			-- upvalues: HttpService (upval), JavascriptHybrid (upval), UseUserProfilesFetchResult (copy), UseAnalyticsResult (copy), EventNames (upval), p1 (copy), UseLocalizationResult (copy)
			local Data = HttpService:JSONDecode(Input)
			
			if (if Data.moduleID == JavascriptHybrid.Module.Navigation and Data.functionName == JavascriptHybrid.Function.navigateToFeature and Data.params and Data.params.params then Data.params.params.feature else nil) == JavascriptHybrid.Feature.UpdateUsernameModalSuccess then
				UseUserProfilesFetchResult.refetch()
				UseAnalyticsResult.fireAnalyticsEvent(EventNames.UsernameSaved)
				
				if p1.onUsernameChanged then
					p1.onUsernameChanged()
				end
				p1.navigation.goBack()
				p1.showToast(UseLocalizationResult.updated)
				
				return
			elseif (if Data.moduleID == JavascriptHybrid.Module.Navigation and Data.functionName == JavascriptHybrid.Function.navigateToFeature and Data.params and Data.params.params then Data.params.params.feature else nil) == JavascriptHybrid.Feature.CloseUpdateUsernameModal then
				p1.navigation.goBack()
			end
		end
	})
end)