local editProfile = script:FindFirstAncestor("EditProfile")
local httpService = game:GetService("HttpService")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local javascriptHybrid = require(editProfile.Common.Constants).JavascriptHybrid
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local socialToastModule = require(parent.SocialToast)
local images = require(parent.UIBlox).App.ImageSet.Images
local userProfilesModule = require(parent.UserProfiles)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(editProfile.Common.TextKeys)
local analyticsModule = require(editProfile.Analytics)
local eventNames = analyticsModule.EventNames
local useAnalytics = analyticsModule.useAnalytics
local fFlagEditProfileMigration = require(editProfile.Flags).FFlagEditProfileMigration

return roactNavigationModule.withNavigation(function(p0) --[[ line: 36 | named "EditUsernameWrapper" ]]
	-- upvalues: useLocalUserId (ref), userProfilesModule (ref), useLocalization (ref), textKeysModule (ref), socialToastModule (ref), useAnalytics (ref), javascriptHybrid (ref), eventNames (ref), reactModule (ref), urlBuilder (ref), httpService (ref), fFlagEditProfileMigration (ref), images (ref)
	local var8 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { useLocalUserId() },
		query = userProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	local var9 = useLocalization({ updated = textKeysModule.UsernameUpdated })
	local var10 = socialToastModule.useOpenToast()
	local var11 = useAnalytics()
	
	local function _(p1) --[[ line: 50 | named "getFeatureStringFromHybridEvent" ]]
		-- upvalues: javascriptHybrid (copy)
		return if p1.moduleID == javascriptHybrid.Module.Navigation and p1.functionName == javascriptHybrid.Function.navigateToFeature and (p1.params and p1.params.params) then p1.params.params.feature else nil
	end
	
	local _ = function(p2) --[[ line: 75 | named "isCloseEditUsername" ]]
		-- upvalues: javascriptHybrid (copy)
		return (if p2.moduleID == javascriptHybrid.Module.Navigation and p2.functionName == javascriptHybrid.Function.navigateToFeature and (p2.params and p2.params.params) then p2.params.params.feature else nil) == javascriptHybrid.Feature.CloseUpdateUsernameModal
	end
	
	local _ = function(p3) --[[ line: 80 | named "isCompletedEditUsername" ]]
		-- upvalues: javascriptHybrid (copy)
		return (if p3.moduleID == javascriptHybrid.Module.Navigation and p3.functionName == javascriptHybrid.Function.navigateToFeature and (p3.params and p3.params.params) then p3.params.params.feature else nil) == javascriptHybrid.Feature.UpdateUsernameModalSuccess
	end
	
	local _ = function() --[[ line: 85 | named "updateUsername" ]]
		-- upvalues: var8 (ref), var11 (ref), eventNames (copy)
		var8.refetch()
		var11.fireAnalyticsEvent(eventNames.UsernameSaved)
	end
	
	return reactModule.createElement(p0.BrowserWrapperComponent, {
		isVisible = true,
		webViewVisible = true,
		modal = false,
		isGenericWebview = true,
		url = urlBuilder.static.settings.account() .. "?changeusername",
		javaScriptCallback = function(p4) --[[ line: 97 ]]
			-- upvalues: httpService (copy), javascriptHybrid (copy), var8 (ref), var11 (ref), eventNames (copy), p0 (ref), fFlagEditProfileMigration (copy), var9 (ref), var10 (ref), images (copy)
			local var12 = httpService:JSONDecode(p4)
			
			if (if var12.moduleID == javascriptHybrid.Module.Navigation and var12.functionName == javascriptHybrid.Function.navigateToFeature and (var12.params and var12.params.params) then var12.params.params.feature else nil) == javascriptHybrid.Feature.UpdateUsernameModalSuccess then
				var8.refetch()
				var11.fireAnalyticsEvent(eventNames.UsernameSaved)
				
				if p0.onUsernameChanged then
					p0.onUsernameChanged()
				end
				p0.navigation.goBack()
				
				if fFlagEditProfileMigration then
					p0.showToast(var9.updated)
					
					return
				end
				var10({
					toastTitle = var9.updated,
					iconImage = images["icons/actions/accept"]
				})
				
				return
			elseif (if var12.moduleID == javascriptHybrid.Module.Navigation and var12.functionName == javascriptHybrid.Function.navigateToFeature and (var12.params and var12.params.params) then var12.params.params.feature else nil) == javascriptHybrid.Feature.CloseUpdateUsernameModal then
				p0.navigation.goBack()
			end
		end
	})
end)