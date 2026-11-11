local EditProfile = script:FindFirstAncestor("EditProfile")
local HttpService = game:GetService("HttpService")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local JavascriptHybrid = require(EditProfile.Common.Constants).JavascriptHybrid
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local SocialToastModule = require(Parent.SocialToast)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local UserProfilesModule = require(Parent.UserProfiles)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(EditProfile.Common.TextKeys)
local AnalyticsModule = require(EditProfile.Analytics)
local EventNames = AnalyticsModule.EventNames
local UseAnalyticsFunction = AnalyticsModule.useAnalytics
local FFlagEditProfileMigration = require(EditProfile.Flags).FFlagEditProfileMigration

return require(Parent.RoactNavigation).withNavigation(function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), SocialToastModule (copy), UseAnalyticsFunction (copy), JavascriptHybrid (copy), EventNames (copy), ReactModule (copy), UrlBuilder (copy), HttpService (copy), FFlagEditProfileMigration (copy), Images (copy)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { (UseLocalUserIdFunction()) },
		query = UserProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	local UseLocalizationResult = UseLocalizationFunction({ updated = TextKeysModule.UsernameUpdated })
	local UseOpenToastResult = SocialToastModule.useOpenToast()
	local UseAnalyticsResult = UseAnalyticsFunction()
	
	local function _(p2)
		-- upvalues: JavascriptHybrid (upval)
		return if p2.moduleID == JavascriptHybrid.Module.Navigation and p2.functionName == JavascriptHybrid.Function.navigateToFeature and p2.params and p2.params.params then p2.params.params.feature else nil
	end
	
	local _ = function(p2): boolean
		-- upvalues: JavascriptHybrid (upval)
		return (if p2.moduleID == JavascriptHybrid.Module.Navigation and p2.functionName == JavascriptHybrid.Function.navigateToFeature and p2.params and p2.params.params then p2.params.params.feature else nil) == JavascriptHybrid.Feature.CloseUpdateUsernameModal
	end
	
	local _ = function(p2): boolean
		-- upvalues: JavascriptHybrid (upval)
		return (if p2.moduleID == JavascriptHybrid.Module.Navigation and p2.functionName == JavascriptHybrid.Function.navigateToFeature and p2.params and p2.params.params then p2.params.params.feature else nil) == JavascriptHybrid.Feature.UpdateUsernameModalSuccess
	end
	
	local _ = function()
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
		javaScriptCallback = function(Input)
			-- upvalues: HttpService (upval), JavascriptHybrid (upval), UseUserProfilesFetchResult (copy), UseAnalyticsResult (copy), EventNames (upval), p1 (copy), FFlagEditProfileMigration (upval), UseLocalizationResult (copy), UseOpenToastResult (copy), Images (upval)
			local Data = HttpService:JSONDecode(Input)
			
			if (if Data.moduleID == JavascriptHybrid.Module.Navigation and Data.functionName == JavascriptHybrid.Function.navigateToFeature and Data.params and Data.params.params then Data.params.params.feature else nil) == JavascriptHybrid.Feature.UpdateUsernameModalSuccess then
				UseUserProfilesFetchResult.refetch()
				UseAnalyticsResult.fireAnalyticsEvent(EventNames.UsernameSaved)
				
				if p1.onUsernameChanged then
					p1.onUsernameChanged()
				end
				p1.navigation.goBack()
				
				if FFlagEditProfileMigration then
					p1.showToast(UseLocalizationResult.updated)
					
					return
				else
					UseOpenToastResult({
						toastTitle = UseLocalizationResult.updated,
						iconImage = Images["icons/actions/accept"]
					})
					
					return
				end
			elseif (if Data.moduleID == JavascriptHybrid.Module.Navigation and Data.functionName == JavascriptHybrid.Function.navigateToFeature and Data.params and Data.params.params then Data.params.params.feature else nil) == JavascriptHybrid.Feature.CloseUpdateUsernameModal then
				p1.navigation.goBack()
			end
		end
	})
end)