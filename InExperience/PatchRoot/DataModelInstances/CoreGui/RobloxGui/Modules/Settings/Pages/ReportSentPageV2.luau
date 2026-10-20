local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local EventIngestService = game:GetService("EventIngestService")
local NewResult = require(CorePackages.Workspace.Packages.Analytics).Analytics.new(RbxAnalyticsService)
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local RoactModule = require(CorePackages.Packages.Roact)
local Settings = script:FindFirstAncestor("Settings")
local SettingsPageFactoryModule = require(RobloxGui:WaitForChild("Modules").Settings.SettingsPageFactory)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local ReportAbuseAnalytics = require(RobloxGui.Modules.AbuseReportMenu).ReportAbuseAnalytics
local BlockingAnalyticsModule = require(Settings.Analytics.BlockingAnalytics)
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local ReportConfirmationContainerModule = require(Settings.Components.ReportConfirmation.ReportConfirmationContainer)
local Chrome = RobloxGui.Modules.Chrome
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local ServiceModule = if EnabledResult then require(Chrome.Service) else nil
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local ReportSentPageV2 = nil

local function _()
	-- upvalues: ReportSentPageV2 (ref), RoactModule (copy)
	if ReportSentPageV2 ~= nil then
		RoactModule.unmount(ReportSentPageV2)
		ReportSentPageV2 = nil
	end
end

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local NewReportAbuseAnalytics = ReportAbuseAnalytics.new(EventIngest.new(EventIngestService), NewResult.Diag, ReportAbuseAnalytics.MenuContexts.LegacySentPage)
local NewBlockingAnalytics = BlockingAnalyticsModule.new(LocalPlayer.UserId, { EventStream = RbxAnalyticsService })
local v1 = (function()
	-- upvalues: SettingsPageFactoryModule (copy), CreateFunction (copy)
	local NewPage = SettingsPageFactoryModule:CreateNewPage()
	NewPage.TabHeader = nil
	NewPage.PageListLayout.Parent = nil
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	NewPage.IsPageClipped = false
	NewPage.Page.Name = "ReportSentPageV2"
	NewPage.Page.Size = UDim2.fromScale(1, 0)
	NewPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	NewPage.Root = CreateFunction("Frame")({
		BackgroundTransparency = 1,
		Name = "ReportSentContents",
		Size = UDim2.fromScale(1, 1),
		Parent = NewPage.Page
	})
	
	return NewPage
end)()

function v1.UpdateMenu(p1)
	-- upvalues: ReportSentPageV2 (ref), RoactModule (copy), NewReportAbuseAnalytics (copy), NewBlockingAnalytics (copy), CoreScriptsRootProvider (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReportConfirmationContainerModule (copy), EnabledResult (copy), FFlagEnableConsoleExpControls (copy), ServiceModule (copy)
	local ReportedPlayer = p1.ReportedPlayer
	
	if ReportSentPageV2 ~= nil then
		RoactModule.unmount(ReportSentPageV2)
		ReportSentPageV2 = nil
	end
	if p1.settingsShowChangedSignal then
		p1.settingsShowChangedSignal:disconnect()
		p1.settingsShowChangedSignal = nil
	end
	p1.settingsShowChangedSignal = p1.HubRef.SettingsShowSignal:connect(function(p2)
		-- upvalues: p1 (copy)
		if not p2 then
			p1:HandleDone()
		end
	end)
	local BindableEvent = Instance.new("BindableEvent")
	p1.SizeChangedSignal = p1.Root:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: BindableEvent (copy), p1 (copy)
		BindableEvent:Fire(p1.Root.AbsoluteSize)
	end)
	local Element = RoactModule.createElement(CoreScriptsRootProvider, {}, {
		FocusRoot = RoactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.RouterView
		}, {
			ThankYouScreenRoot = RoactModule.createElement(ReportConfirmationContainerModule, {
				player = {
					UserId = ReportedPlayer.UserId,
					Name = ReportedPlayer.Name,
					DisplayName = ReportedPlayer.DisplayName
				},
				closeMenu = function()
					-- upvalues: p1 (copy)
					p1:HandleDone()
				end,
				isVoiceReport = p1.isVoiceReport,
				ZIndex = p1.HubRef.Shield.ZIndex + 1,
				reportAbuseAnalytics = NewReportAbuseAnalytics,
				blockingAnalytics = NewBlockingAnalytics,
				onSizeChanged = BindableEvent.Event
			})
		})
	})
	
	if EnabledResult and FFlagEnableConsoleExpControls then
		ServiceModule:setHideShortcutBar("ReportSentPageV2", true)
	end
	ReportSentPageV2 = RoactModule.mount(Element, p1.Root, "ReportSentPageV2")
end

function v1.ShowReportedPlayer(p1, ReportedPlayer, IsVoiceReport)
	-- upvalues: v1 (copy)
	p1.ReportedPlayer = ReportedPlayer
	p1.isVoiceReport = IsVoiceReport
	p1:UpdateMenu()
	p1.HubRef:SwitchToPage(v1, true)
end

function v1.HandleDone(p1)
	-- upvalues: EnabledResult (copy), FFlagEnableConsoleExpControls (copy), ServiceModule (copy), ReportSentPageV2 (ref), RoactModule (copy)
	if EnabledResult and FFlagEnableConsoleExpControls then
		ServiceModule:setHideShortcutBar("ReportSentPageV2", false)
	end
	if ReportSentPageV2 ~= nil then
		RoactModule.unmount(ReportSentPageV2)
		ReportSentPageV2 = nil
	end
	if p1.settingsShowChangedSignal then
		p1.settingsShowChangedSignal:disconnect()
		p1.settingsShowChangedSignal = nil
	end
	if p1.SizeChangedSignal then
		p1.SizeChangedSignal:disconnect()
		p1.SizeChangedSignal = nil
	end
	p1.HubRef:SetVisibility(false, true)
end

return v1