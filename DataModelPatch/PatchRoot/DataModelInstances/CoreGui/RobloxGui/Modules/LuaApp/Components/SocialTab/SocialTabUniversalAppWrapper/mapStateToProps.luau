local CorePackages = game:GetService("CorePackages")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local SocialTabModule = require(script:FindFirstAncestor("Modules").LuaApp.Components.SocialTab.SocialTab)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor

return function(p1, _)
	-- upvalues: FFlagSignalsNavP3hMisc (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), SocialTabModule (copy), FormFactor (copy)
	local Name = nil
	local CanGoBack: boolean? = nil
	
	if not FFlagSignalsNavP3hMisc then
		local SelectLegacyHistoryResult = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history
		local SelectLegacyHistoryResultEntry = SelectLegacyHistoryResult[#SelectLegacyHistoryResult]
		Name = SelectLegacyHistoryResultEntry[#SelectLegacyHistoryResultEntry] and SelectLegacyHistoryResultEntry[#SelectLegacyHistoryResultEntry].name
		CanGoBack = #SelectLegacyHistoryResultEntry > 1
	end
	return {
		chatLoaded = p1.ChatAppReducer.AppLoaded,
		canGoBack = CanGoBack,
		retrievalStatus = SocialTabModule.Requests.FetchChatSettings.getStatus(p1),
		wideMode = p1.FormFactor == FormFactor.WIDE,
		notificationCount = p1.NotificationBadgeCounts.TopBarNotificationIcon,
		localUserId = p1.LocalUserId,
		currentAppPage = Name,
		bottomBarVisible = p1.TabBarVisible
	}
end