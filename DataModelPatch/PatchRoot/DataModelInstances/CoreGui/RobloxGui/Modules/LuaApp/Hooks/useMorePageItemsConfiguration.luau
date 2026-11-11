local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local AppPageModule = require(Modules.LuaApp.AppPage)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local GetFFlagForceEnableReportLogsButtonModule = require(Modules.LuaApp.Flags.GetFFlagForceEnableReportLogsButton)
local GetFFlagPlatformEventEnabledFunction = SharedFlagsModule.GetFFlagPlatformEventEnabled
local GetFStringPlatformEventUrlFunction = SharedFlagsModule.GetFStringPlatformEventUrl
local FFlagEnableRMOnMorePageGUAC = SharedFlagsModule.FFlagEnableRMOnMorePageGUAC
local FFlagEnableRMOnMorePageForAll = SharedFlagsModule.FFlagEnableRMOnMorePageForAll
local FStringRMDefinition = SharedFlagsModule.FStringRMDefinition
local FFlagEnableBlackbird = SharedFlagsModule.FFlagEnableBlackbird
local FFlagEnableBlackbirdOnMorePage = SharedFlagsModule.FFlagEnableBlackbirdOnMorePage
local FFlagLuaAppFixNotificationBadgeCountsSync = SharedFlagsModule.FFlagLuaAppFixNotificationBadgeCountsSync
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local GuacDisableBlackbirdOnMorePage = game:DefineFastFlag("GuacDisableBlackbirdOnMorePage", false)
local UseMomentsGatingFunction = require(CorePackages.Workspace.Packages.MomentsCommon).Hooks.useMomentsGating
local config = { Navigation = { "About_Terms" }, Action = { "LogOut" } }

local function shouldAddToMorePageItem(p1, Enabled, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: MorePageSettingsModule (copy), GetFFlagPlatformEventEnabledFunction (copy), GetFStringPlatformEventUrlFunction (copy), GetFFlagForceEnableReportLogsButtonModule (copy), FFlagEnableRMOnMorePageForAll (copy), AppPageModule (copy)
	local ItemTypeEntry = MorePageSettingsModule.ItemType[p1]
	
	if ItemTypeEntry == nil then
		return nil
	end
	local Item = MorePageSettingsModule.ItemInfo[ItemTypeEntry]
	
	if Item == nil then
		return nil
	end
	if Item.itemType == MorePageSettingsModule.ItemType.BuildersClub and p7 then
		return nil
	end
	if Item.itemType == MorePageSettingsModule.ItemType.Trades and Enabled == false then
		return nil
	end
	if Item.itemType == MorePageSettingsModule.ItemType.TheHunt and (not GetFFlagPlatformEventEnabledFunction() or #GetFStringPlatformEventUrlFunction() <= 0) then
		return nil
	end
	if Item.itemType == MorePageSettingsModule.ItemType.ReportLogs and (not GetFFlagForceEnableReportLogsButtonModule() and not p2) then
		return nil
	end
	if Item.itemType == MorePageSettingsModule.ItemType.VRFTUX and not p3 then
		return nil
	end
	if Item.itemType == MorePageSettingsModule.ItemType.AdjustScreen and not p4 then
		return nil
	end
	if Item.itemType == MorePageSettingsModule.ItemType.RM then
		if p8 ~= nil and p8.isFlyoutEntryEnabled then
			if p8.platformIntegrationEnabled then
				Item = table.clone(Item)
				Item.context = { page = AppPageModule.Moments }
			end
		elseif not FFlagEnableRMOnMorePageForAll and not p5 then
			return nil
		end
	end
	return if Item.itemType == MorePageSettingsModule.ItemType.Redeem and not p6 then nil elseif Item.itemType == MorePageSettingsModule.ItemType.Blackbird and not p7 then nil else Item
end

local function updateMoreItemBadgeCount(p1, p2, p3, p4)
	-- upvalues: MorePageSettingsModule (copy), FFlagLuaAppFixNotificationBadgeCountsSync (copy)
	local BadgeCount = 0
	
	if p1.itemType == MorePageSettingsModule.ItemType.Friends then
		BadgeCount = if FFlagLuaAppFixNotificationBadgeCountsSync then p3 else p2.MorePageFriends
	elseif p1.itemType == MorePageSettingsModule.ItemType.Messages then
		BadgeCount = if FFlagLuaAppFixNotificationBadgeCountsSync then p4 else p2.MorePageMessages
	elseif p1.itemType == MorePageSettingsModule.ItemType.Settings or p1.itemType == MorePageSettingsModule.ItemType.Settings_AccountInfo then
		BadgeCount = p2.MorePageSettings
	elseif p1.itemType == MorePageSettingsModule.ItemType.TencentNoticeCenter then
		BadgeCount = p2.MorePageTencentUnreadNotice
	end
	if p1.badgeCount ~= BadgeCount then
		p1.badgeCount = BadgeCount
	end
end

return function()
	-- upvalues: UseAppPolicyModule (copy), config (copy), UseSelectorFunction (copy), FFlagLuaAppFixNotificationBadgeCountsSync (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), FFlagEnableArgus (copy), UseMomentsGatingFunction (copy), FFlagEnableRMOnMorePageGUAC (copy), FStringRMDefinition (copy), UseIsSpatialFunction (copy), GuacDisableBlackbirdOnMorePage (copy), FFlagEnableBlackbird (copy), FFlagEnableBlackbirdOnMorePage (copy), ReactModule (copy), CryoModule (copy), shouldAddToMorePageItem (copy), updateMoreItemBadgeCount (copy)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p1)
		return p1.getMorePageContent()
	end) or config
	local UseAppPolicyModuleResult1 = UseAppPolicyModule(function(p1)
		return p1.getSupportsOverscan()
	end)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.NotificationBadgeCounts
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: FFlagLuaAppFixNotificationBadgeCountsSync (upval)
		if FFlagLuaAppFixNotificationBadgeCountsSync then
			local FriendsCarousel = p1.FriendsCarousel
			local Requests = FriendsCarousel and (FriendsCarousel.Friends and FriendsCarousel.Friends.requests)
			
			return Requests and Requests.receivedCount or 0
		else
			return 0
		end
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: FFlagLuaAppFixNotificationBadgeCountsSync (upval)
		return FFlagLuaAppFixNotificationBadgeCountsSync and (p1.SocialTab and p1.SocialTab.UnreadConversationCount) or 0
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p1): boolean
		local User = p1.Users[p1.LocalUserId]
		
		return if User then User.membership == Enum.MembershipType.Premium else false
	end)
	local UseUserExperimentResult = UseUserExperimentFunction({ AppUserLayers.AppHealthReportLogs }, function(p1)
		-- upvalues: AppUserLayers (upval)
		return (p1[AppUserLayers.AppHealthReportLogs] or {}).ReportLogsButtonEnabled or nil
	end)
	local UseMomentsGatingResult = if FFlagEnableArgus then UseMomentsGatingFunction() else nil
	local UseAppPolicyModuleResult2 = if FFlagEnableRMOnMorePageGUAC then UseAppPolicyModule(function(p1)
		return p1.getDisplayMomentsMoreTabTile()
	end) else UseUserExperimentFunction({ AppUserLayers.RMLayer }, function(p1)
		-- upvalues: AppUserLayers (upval), FStringRMDefinition (upval)
		return (p1[AppUserLayers.RMLayer] or {})[FStringRMDefinition] or nil
	end)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseAppPolicyModuleResult3 = UseAppPolicyModule(function(p1)
		return p1.getRedeemTileEnabled()
	end)
	local UseAppPolicyModuleResult4 = if GuacDisableBlackbirdOnMorePage then UseAppPolicyModule(function(p1)
		return p1.getDisableBlackbirdEntrypoints()
	end) else false
	local NoUseAppPolicyModuleResult4: boolean = FFlagEnableBlackbird and (FFlagEnableBlackbirdOnMorePage and not UseAppPolicyModuleResult4)
	
	return ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseAppPolicyModuleResult (copy), shouldAddToMorePageItem (upval), UseSelectorResult3 (copy), UseUserExperimentResult (copy), UseIsSpatialResult (copy), UseAppPolicyModuleResult1 (copy), UseAppPolicyModuleResult2 (copy), UseAppPolicyModuleResult3 (copy), NoUseAppPolicyModuleResult4 (copy), UseMomentsGatingResult (copy), updateMoreItemBadgeCount (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), UseSelectorResult2 (copy)
		return CryoModule.Dictionary.values(CryoModule.Dictionary.map(UseAppPolicyModuleResult, function(p1, p2)
			-- upvalues: CryoModule (upval), shouldAddToMorePageItem (upval), UseSelectorResult3 (upval), UseUserExperimentResult (upval), UseIsSpatialResult (upval), UseAppPolicyModuleResult1 (upval), UseAppPolicyModuleResult2 (upval), UseAppPolicyModuleResult3 (upval), NoUseAppPolicyModuleResult4 (upval), UseMomentsGatingResult (upval), updateMoreItemBadgeCount (upval), UseSelectorResult (upval), UseSelectorResult1 (upval), UseSelectorResult2 (upval)
			return {
				contents = CryoModule.Dictionary.values(CryoModule.Dictionary.map(p1, function(p3)
					-- upvalues: shouldAddToMorePageItem (upval), UseSelectorResult3 (upval), UseUserExperimentResult (upval), UseIsSpatialResult (upval), UseAppPolicyModuleResult1 (upval), UseAppPolicyModuleResult2 (upval), UseAppPolicyModuleResult3 (upval), NoUseAppPolicyModuleResult4 (upval), UseMomentsGatingResult (upval), updateMoreItemBadgeCount (upval), UseSelectorResult (upval), UseSelectorResult1 (upval), UseSelectorResult2 (upval)
					local ShouldAddToMorePageItem = shouldAddToMorePageItem(p3, UseSelectorResult3, UseUserExperimentResult, UseIsSpatialResult, UseAppPolicyModuleResult1, UseAppPolicyModuleResult2, UseAppPolicyModuleResult3, NoUseAppPolicyModuleResult4, UseMomentsGatingResult)
					
					if ShouldAddToMorePageItem then
						updateMoreItemBadgeCount(ShouldAddToMorePageItem, UseSelectorResult, UseSelectorResult1, UseSelectorResult2)
					end
					return ShouldAddToMorePageItem
				end)),
				type = p2
			}
		end))
	end, {
		UseAppPolicyModuleResult, UseSelectorResult, UseSelectorResult3,
		UseIsSpatialResult, UseUserExperimentResult, NoUseAppPolicyModuleResult4,
		if FFlagLuaAppFixNotificationBadgeCountsSync then UseSelectorResult1 else nil,
		if FFlagLuaAppFixNotificationBadgeCountsSync then UseSelectorResult2 else nil,
		UseMomentsGatingResult, UseAppPolicyModuleResult2
	})
end