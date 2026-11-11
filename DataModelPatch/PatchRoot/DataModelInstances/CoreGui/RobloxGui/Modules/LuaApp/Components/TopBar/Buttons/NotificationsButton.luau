local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactModule = require(CorePackages.Packages.React)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactAnalyticsTopBarModule = require(Modules.LuaApp.Services.RoactAnalyticsTopBar)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local GetFFlagReportNotificationStreamCTAModule = require(Modules.LuaApp.Flags.GetFFlagReportNotificationStreamCTA)
local StreamNotificationsBellIcon = require(CorePackages.Workspace.Packages.StreamNotifications).StreamNotificationsBellIcon
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local FFlagStreamNotificationBellEntryPoint = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStreamNotificationBellEntryPoint
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3bTopBar = SharedFlagsModule.FFlagSignalsNavP3bTopBar
local FFlagStreamNotificationDropdownSingleOwner = SharedFlagsModule.FFlagStreamNotificationDropdownSingleOwner
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3bTopBar then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local NotificationsButton = RoactModule.PureComponent:extend("NotificationsButton")
NotificationsButton.validateProps = TModule.strictInterface({
	formFactor = TModule.string,
	isCompactView = TModule.boolean,
	isSearching = TModule.boolean,
	isSecondary = TModule.optional(TModule.boolean),
	setVisible = DashModule.isCallable,
	cancelSearch = DashModule.isCallable,
	activateSearch = DashModule.isCallable,
	buttonRef = TModule.optional(TModule.table),
	numberOfNotifications = TModule.integer,
	entryPoint = if FFlagStreamNotificationBellEntryPoint then TModule.optional(TModule.string) else nil,
	analytics = TModule.table,
	enableNotifications = TModule.boolean
})

local function _(p1): boolean
	return p1.enableNotifications and not p1.isSearching
end

function NotificationsButton.updateVisibility(p1, NoIsSearching)
	local Props = p1.props
	local NoIsSearching1: boolean = Props.enableNotifications and not Props.isSearching
	
	if NoIsSearching1 ~= NoIsSearching then
		p1.props.setVisible(NoIsSearching1)
	end
end

function NotificationsButton.reportCTAIfNecessary(p1, p2)
	-- upvalues: GetFFlagReportNotificationStreamCTAModule (copy)
	if GetFFlagReportNotificationStreamCTAModule() then
		local Number: number? = tonumber(p1.props.numberOfNotifications)
		local Number1: number = p2 and tonumber(p2.numberOfNotifications) or 0
		
		if Number > 0 and Number1 == 0 then
			p1.props.analytics.reportNSOpenCTAShown(Number)
		end
	end
end

function NotificationsButton.didMount(p1)
	p1:updateVisibility(nil)
end

function NotificationsButton.didUpdate(p1, p2, _)
	p1:updateVisibility(p2.enableNotifications and not p2.isSearching)
	p1:reportCTAIfNecessary(p2)
end

function NotificationsButton.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), StreamNotificationsBellIcon (copy), FormFactor (copy), FFlagStreamNotificationBellEntryPoint (copy), FFlagStreamNotificationDropdownSingleOwner (copy)
	return WithStyleFunction(function(_)
		-- upvalues: p1 (copy), RoactModule (upval), StreamNotificationsBellIcon (upval), FormFactor (upval), FFlagStreamNotificationBellEntryPoint (upval), FFlagStreamNotificationDropdownSingleOwner (upval)
		local NumberOfNotifications = p1.props.numberOfNotifications
		
		return RoactModule.createElement(StreamNotificationsBellIcon, {
			notificationCount = NumberOfNotifications and tonumber(NumberOfNotifications),
			compactWidth = p1.props.formFactor == FormFactor.COMPACT,
			buttonRef = p1.props.buttonRef,
			entryPoint = if FFlagStreamNotificationBellEntryPoint then p1.props.entryPoint else nil,
			isPrimary = if FFlagStreamNotificationDropdownSingleOwner then true else nil
		})
	end)
end

local v1 = if FFlagSignalsNavP3bTopBar then function(p1)
	-- upvalues: FFlagStreamNotificationBellEntryPoint (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	local Joined: string? = nil
	
	if FFlagStreamNotificationBellEntryPoint then
		local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
		
		if UseSignalStateResult then
			local List = {}
			
			for _, value in ipairs(UseSignalStateResult) do
				if value.name then
					table.insert(List, value.name)
				end
			end
			Joined = table.concat(List, "/")
		end
	end
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		entryPoint = if FFlagStreamNotificationBellEntryPoint then Joined else nil
	}))
end else RoactRoduxModule.connect(function(p2, _)
	-- upvalues: FFlagStreamNotificationBellEntryPoint (copy), FFlagSignalsNavP3bTopBar (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	local Joined: string? = nil
	
	if FFlagStreamNotificationBellEntryPoint and not FFlagSignalsNavP3bTopBar then
		local SelectCurrentLegacyRouteResult = if FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p2) else p2.Navigation.history[#p2.Navigation.history]
		
		if SelectCurrentLegacyRouteResult then
			local List = {}
			
			for _, value in ipairs(SelectCurrentLegacyRouteResult) do
				if value.name then
					table.insert(List, value.name)
				end
			end
			Joined = table.concat(List, "/")
		end
	end
	return {
		numberOfNotifications = p2.NotificationBadgeCounts.TopBarNotificationIcon or 0,
		entryPoint = if FFlagStreamNotificationBellEntryPoint then Joined else nil
	}
end)(NotificationsButton)

return (RoactAppPolicy.connect(function(p3, _)
	return { enableNotifications = p3.getNotifications() }
end)((RoactServices.connect({ analytics = RoactAnalyticsTopBarModule })(v1))))