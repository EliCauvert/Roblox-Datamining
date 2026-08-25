local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local modules = robloxGui:WaitForChild("Modules")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local eventIngestService = game:GetService("EventIngestService")
local var6 = require(corePackagesService.Workspace.Packages.Analytics).Analytics.new(rbxAnalyticsService)
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
local var13 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var14 = if var13 then require(robloxGui.Modules.Chrome.Service) else nil
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local var15 = nil

local _ = function()
	-- upvalues: var15 (write), roactModule (ref)
	if var15 ~= nil then
		roactModule.unmount(var15)
		var15 = nil
	end
end

local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local var16 = reportAbuseAnalytics.new(eventIngest.new(eventIngestService), var6.Diag, reportAbuseAnalytics.MenuContexts.LegacySentPage)
local var17 = blockingAnalyticsModule.new(localPlayer.UserId, { EventStream = rbxAnalyticsService })
local var18 = (function()
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

function var18.UpdateMenu(p0)
	-- upvalues: var15 (write), roactModule (ref), var16 (ref), var17 (ref), coreScriptsRootProvider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), reportConfirmationContainerModule (ref), var13 (ref), fFlagEnableConsoleExpControls (ref), var14 (ref)
	local reportedPlayer = p0.ReportedPlayer
	
	if var15 ~= nil then
		roactModule.unmount(var15)
		var15 = nil
	end
	if p0.settingsShowChangedSignal then
		p0.settingsShowChangedSignal:disconnect()
		p0.settingsShowChangedSignal = nil
	end
	p0.settingsShowChangedSignal = p0.HubRef.SettingsShowSignal:connect(function(p1)
		-- upvalues: p0 (ref)
		if not p1 then
			p0:HandleDone()
		end
	end)
	local bindableEvent = Instance.new("BindableEvent")
	p0.SizeChangedSignal = p0.Root:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: bindableEvent (ref), p0 (ref)
		bindableEvent:Fire(p0.Root.AbsoluteSize)
	end)
	local var21 = roactModule.createElement(coreScriptsRootProvider, {}, {
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
					-- upvalues: p0 (ref)
					p0:HandleDone()
				end,
				isVoiceReport = p0.isVoiceReport,
				ZIndex = p0.HubRef.Shield.ZIndex + 1,
				reportAbuseAnalytics = var16,
				blockingAnalytics = var17,
				onSizeChanged = bindableEvent.Event
			})
		})
	})
	
	if var13 and fFlagEnableConsoleExpControls then
		var14:setHideShortcutBar("ReportSentPageV2", true)
	end
	var15 = roactModule.mount(var21, p0.Root, "ReportSentPageV2")
end

function var18.ShowReportedPlayer(p2, p3, p4)
	-- upvalues: var18 (ref)
	p2.ReportedPlayer = p3
	p2.isVoiceReport = p4
	p2:UpdateMenu()
	p2.HubRef:SwitchToPage(var18, true)
end

function var18.HandleDone(p5)
	-- upvalues: var13 (ref), fFlagEnableConsoleExpControls (ref), var14 (ref), var15 (write), roactModule (ref)
	if var13 and fFlagEnableConsoleExpControls then
		var14:setHideShortcutBar("ReportSentPageV2", false)
	end
	if var15 ~= nil then
		roactModule.unmount(var15)
		var15 = nil
	end
	if p5.settingsShowChangedSignal then
		p5.settingsShowChangedSignal:disconnect()
		p5.settingsShowChangedSignal = nil
	end
	if p5.SizeChangedSignal then
		p5.SizeChangedSignal:disconnect()
		p5.SizeChangedSignal = nil
	end
	p5.HubRef:SetVisibility(false, true)
end

return var18