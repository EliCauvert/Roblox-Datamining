local editProfile = script:FindFirstAncestor("EditProfile")
local httpService = game:GetService("HttpService")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local javascriptHybrid = require(editProfile.Common.Constants).JavascriptHybrid
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local userProfilesModule = require(parent.UserProfiles)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(editProfile.Common.TextKeys)
local analyticsModule = require(editProfile.Analytics)
local eventNames = analyticsModule.EventNames
local useAnalytics = analyticsModule.useAnalytics

return roactNavigationModule.withNavigation(function(p0)
	-- upvalues: useLocalUserId (ref), userProfilesModule (ref), useLocalization (ref), textKeysModule (ref), useAnalytics (ref), javascriptHybrid (ref), eventNames (ref), reactModule (ref), urlBuilder (ref), httpService (ref)
	local var7 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { useLocalUserId() },
		query = userProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	local var8 = useLocalization({ updated = textKeysModule.UsernameUpdated })
	local var9 = useAnalytics()
	
	local function _(p1)
		-- upvalues: javascriptHybrid (copy)
		return if p1.moduleID == javascriptHybrid.Module.Navigation and p1.functionName == javascriptHybrid.Function.navigateToFeature and (p1.params and p1.params.params) then p1.params.params.feature else nil
	end
	
	local _ = function(p2)
		-- upvalues: javascriptHybrid (copy)
		return (if p2.moduleID == javascriptHybrid.Module.Navigation and p2.functionName == javascriptHybrid.Function.navigateToFeature and (p2.params and p2.params.params) then p2.params.params.feature else nil) == javascriptHybrid.Feature.CloseUpdateUsernameModal
	end
	
	local _ = function(p3)
		-- upvalues: javascriptHybrid (copy)
		return (if p3.moduleID == javascriptHybrid.Module.Navigation and p3.functionName == javascriptHybrid.Function.navigateToFeature and (p3.params and p3.params.params) then p3.params.params.feature else nil) == javascriptHybrid.Feature.UpdateUsernameModalSuccess
	end
	
	local _ = function()
		-- upvalues: var7 (ref), var9 (ref), eventNames (copy)
		var7.refetch()
		var9.fireAnalyticsEvent(eventNames.UsernameSaved)
	end
	
	return reactModule.createElement(p0.BrowserWrapperComponent, {
		isVisible = true,
		webViewVisible = true,
		modal = false,
		isGenericWebview = true,
		url = urlBuilder.static.settings.account() .. "?changeusername",
		javaScriptCallback = function(p4)
			-- upvalues: httpService (copy), javascriptHybrid (copy), var7 (ref), var9 (ref), eventNames (copy), p0 (ref), var8 (ref)
			local var10 = httpService:JSONDecode(p4)
			
			if (if var10.moduleID == javascriptHybrid.Module.Navigation and var10.functionName == javascriptHybrid.Function.navigateToFeature and (var10.params and var10.params.params) then var10.params.params.feature else nil) == javascriptHybrid.Feature.UpdateUsernameModalSuccess then
				var7.refetch()
				var9.fireAnalyticsEvent(eventNames.UsernameSaved)
				
				if p0.onUsernameChanged then
					p0.onUsernameChanged()
				end
				p0.navigation.goBack()
				p0.showToast(var8.updated)
				
				return
			elseif (if var10.moduleID == javascriptHybrid.Module.Navigation and var10.functionName == javascriptHybrid.Function.navigateToFeature and (var10.params and var10.params.params) then var10.params.params.feature else nil) == javascriptHybrid.Feature.CloseUpdateUsernameModal then
				p0.navigation.goBack()
			end
		end
	})
end)