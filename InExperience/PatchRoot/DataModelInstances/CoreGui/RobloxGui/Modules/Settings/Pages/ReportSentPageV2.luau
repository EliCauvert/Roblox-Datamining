local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local modules = robloxGui:WaitForChild("Modules")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local eventIngestService = game:GetService("EventIngestService")
local var1 = require(corePackagesService.Workspace.Packages.Analytics).Analytics.new(rbxAnalyticsService)
local eventIngest = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local roactModule = require(corePackagesService.Packages.Roact)
local settings = script:FindFirstAncestor("Settings")
local settingsPageFactoryModule = require(modules.Settings.SettingsPageFactory)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local reportAbuseAnalytics = require(robloxGui.Modules.AbuseReportMenu).ReportAbuseAnalytics
local blockingAnalyticsModule = require(settings.Analytics.BlockingAnalytics)
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local reportConfirmationContainerModule = require(settings.Components.ReportConfirmation.ReportConfirmationContainer)
local var2 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var3 = if var2 then require(robloxGui.Modules.Chrome.Service) else nil
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local var4 = nil

local _ = function()
	-- upvalues: var4 (write), roactModule (ref)
	if var4 ~= nil then
		roactModule.unmount(var4)
		var4 = nil
	end
end

local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local var5 = reportAbuseAnalytics.new(eventIngest.new(eventIngestService), var1.Diag, reportAbuseAnalytics.MenuContexts.LegacySentPage)
local var6 = blockingAnalyticsModule.new(localPlayer.UserId, { EventStream = rbxAnalyticsService })
local var7 = (function()
	-- upvalues: settingsPageFactoryModule (ref), create (ref)
	local reportSentPageV2 = settingsPageFactoryModule:CreateNewPage()
	reportSentPageV2.TabHeader = nil
	reportSentPageV2.PageListLayout.Parent = nil
	reportSentPageV2.ShouldShowBottomBar = false
	reportSentPageV2.ShouldShowHubBar = false
	reportSentPageV2.IsPageClipped = false
	reportSentPageV2.Page.Name = "ReportSentPageV2"
	reportSentPageV2.Page.Size = UDim2.fromScale(1, 0)
	reportSentPageV2.Page.AutomaticSize = Enum.AutomaticSize.Y
	reportSentPageV2.Root = create("Frame")({
		BackgroundTransparency = 1,
		Name = "ReportSentContents",
		Size = UDim2.fromScale(1, 1),
		Parent = reportSentPageV2.Page
	})
	
	return reportSentPageV2
end)()

function var18.UpdateMenu(p1)
	-- upvalues: var4 (write), roactModule (ref), var5 (ref), var6 (ref), coreScriptsRootProvider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), reportConfirmationContainerModule (ref), var2 (ref), fFlagEnableConsoleExpControls (ref), var3 (ref)
	local reportedPlayer = p1.ReportedPlayer
	
	if var4 ~= nil then
		roactModule.unmount(var4)
		var4 = nil
	end
	if p1.settingsShowChangedSignal then
		p1.settingsShowChangedSignal:disconnect()
		p1.settingsShowChangedSignal = nil
	end
	p1.settingsShowChangedSignal = p1.HubRef.SettingsShowSignal:connect(function(p2)
		-- upvalues: p1 (ref)
		if not p2 then
			p1:HandleDone()
		end
	end)
	local bindableEvent = Instance.new("BindableEvent")
	p1.SizeChangedSignal = p1.Root:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: bindableEvent (ref), p1 (ref)
		bindableEvent:Fire(p1.Root.AbsoluteSize)
	end)
	local var8 = roactModule.createElement(coreScriptsRootProvider, {}, {
		FocusRoot = roactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.RouterView
		}, {
			ThankYouScreenRoot = roactModule.createElement(reportConfirmationContainerModule, {
				player = {
					UserId = reportedPlayer.UserId,
					Name = reportedPlayer.Name,
					DisplayName = reportedPlayer.DisplayName
				},
				closeMenu = function()
					-- upvalues: p1 (ref)
					p1:HandleDone()
				end,
				isVoiceReport = p1.isVoiceReport,
				ZIndex = p1.HubRef.Shield.ZIndex + 1,
				reportAbuseAnalytics = var5,
				blockingAnalytics = var6,
				onSizeChanged = bindableEvent.Event
			})
		})
	})
	
	if var2 and fFlagEnableConsoleExpControls then
		var3:setHideShortcutBar("ReportSentPageV2", true)
	end
	var4 = roactModule.mount(var8, p1.Root, "ReportSentPageV2")
end

function var18.ShowReportedPlayer(p1, p2, p3)
	-- upvalues: var7 (ref)
	p1.ReportedPlayer = p2
	p1.isVoiceReport = p3
	p1:UpdateMenu()
	p1.HubRef:SwitchToPage(var7, true)
end

function var18.HandleDone(p1)
	-- upvalues: var2 (ref), fFlagEnableConsoleExpControls (ref), var3 (ref), var4 (write), roactModule (ref)
	if var2 and fFlagEnableConsoleExpControls then
		var3:setHideShortcutBar("ReportSentPageV2", false)
	end
	if var4 ~= nil then
		roactModule.unmount(var4)
		var4 = nil
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

return var7