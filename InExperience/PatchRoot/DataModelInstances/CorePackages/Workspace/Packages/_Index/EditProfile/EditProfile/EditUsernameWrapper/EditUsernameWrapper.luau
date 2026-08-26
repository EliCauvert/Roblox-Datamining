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

return roactNavigationModule.withNavigation(function(p1)
	-- upvalues: useLocalUserId (ref), userProfilesModule (ref), useLocalization (ref), textKeysModule (ref), useAnalytics (ref), javascriptHybrid (ref), eventNames (ref), reactModule (ref), urlBuilder (ref), httpService (ref)
	local var1 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { useLocalUserId() },
		query = userProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	local var2 = useLocalization({ updated = textKeysModule.UsernameUpdated })
	local var3 = useAnalytics()
	
	local function _(p2)
		-- upvalues: javascriptHybrid (copy)
		return if p2.moduleID == javascriptHybrid.Module.Navigation and p2.functionName == javascriptHybrid.Function.navigateToFeature and (p2.params and p2.params.params) then p2.params.params.feature else nil
	end
	
	local _ = function(p2)
		-- upvalues: javascriptHybrid (copy)
		return (if p2.moduleID == javascriptHybrid.Module.Navigation and p2.functionName == javascriptHybrid.Function.navigateToFeature and (p2.params and p2.params.params) then p2.params.params.feature else nil) == javascriptHybrid.Feature.CloseUpdateUsernameModal
	end
	
	local _ = function(p2)
		-- upvalues: javascriptHybrid (copy)
		return (if p2.moduleID == javascriptHybrid.Module.Navigation and p2.functionName == javascriptHybrid.Function.navigateToFeature and (p2.params and p2.params.params) then p2.params.params.feature else nil) == javascriptHybrid.Feature.UpdateUsernameModalSuccess
	end
	
	local _ = function()
		-- upvalues: var1 (ref), var3 (ref), eventNames (copy)
		var1.refetch()
		var3.fireAnalyticsEvent(eventNames.UsernameSaved)
	end
	
	return reactModule.createElement(p1.BrowserWrapperComponent, {
		isVisible = true,
		webViewVisible = true,
		modal = false,
		isGenericWebview = true,
		url = urlBuilder.static.settings.account() .. "?changeusername",
		javaScriptCallback = function(p2)
			-- upvalues: httpService (copy), javascriptHybrid (copy), var1 (ref), var3 (ref), eventNames (copy), p1 (ref), var2 (ref)
			local var4 = httpService:JSONDecode(p2)
			
			if (if var4.moduleID == javascriptHybrid.Module.Navigation and var4.functionName == javascriptHybrid.Function.navigateToFeature and (var4.params and var4.params.params) then var4.params.params.feature else nil) == javascriptHybrid.Feature.UpdateUsernameModalSuccess then
				var1.refetch()
				var3.fireAnalyticsEvent(eventNames.UsernameSaved)
				
				if p1.onUsernameChanged then
					p1.onUsernameChanged()
				end
				p1.navigation.goBack()
				p1.showToast(var2.updated)
				
				return
			elseif (if var4.moduleID == javascriptHybrid.Module.Navigation and var4.functionName == javascriptHybrid.Function.navigateToFeature and (var4.params and var4.params.params) then var4.params.params.feature else nil) == javascriptHybrid.Feature.CloseUpdateUsernameModal then
				p1.navigation.goBack()
			end
		end
	})
end)