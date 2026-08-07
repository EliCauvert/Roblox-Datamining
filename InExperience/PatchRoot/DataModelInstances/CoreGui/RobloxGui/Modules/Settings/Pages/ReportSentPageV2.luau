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
local reportConfirmationScreenModule = require(settings.Components.ReportConfirmation.ReportConfirmationScreen)
local reportConfirmationContainerModule = require(settings.Components.ReportConfirmation.ReportConfirmationContainer)
local reportAbuseThankYouPageGamepadEnable = game:DefineFastFlag("ReportAbuseThankYouPageGamepadEnable", false)
local var15 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var16 = if var15 then require(robloxGui.Modules.Chrome.Service) else nil
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local var17 = nil

local _ = function() --[[ line: 36 ]]
	-- upvalues: var17 (write), roactModule (ref)
	if var17 ~= nil then
		roactModule.unmount(var17)
		var17 = nil
	end
end

local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local var18 = reportAbuseAnalytics.new(eventIngest.new(eventIngestService), var6.Diag, reportAbuseAnalytics.MenuContexts.LegacySentPage)
local var19 = blockingAnalyticsModule.new(localPlayer.UserId, { EventStream = rbxAnalyticsService })
local var20 = (function() --[[ line: 57 | named "Initialize" ]]
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

function var20.UpdateMenu(p0) --[[ line: 81 ]]
	-- upvalues: var17 (write), roactModule (ref), var18 (ref), var19 (ref), reportConfirmationScreenModule (ref), reportAbuseThankYouPageGamepadEnable (ref), coreScriptsRootProvider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), reportConfirmationContainerModule (ref), var15 (ref), fFlagEnableConsoleExpControls (ref), var16 (ref)
	local reportedPlayer = p0.ReportedPlayer
	
	if var17 ~= nil then
		roactModule.unmount(var17)
		var17 = nil
	end
	if p0.settingsShowChangedSignal then
		p0.settingsShowChangedSignal:disconnect()
		p0.settingsShowChangedSignal = nil
	end
	p0.settingsShowChangedSignal = p0.HubRef.SettingsShowSignal:connect(function(p1) --[[ line: 90 ]]
		-- upvalues: p0 (ref)
		if not p1 then
			p0:HandleDone()
		end
	end)
	local bindableEvent = Instance.new("BindableEvent")
	p0.SizeChangedSignal = p0.Root:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 98 ]]
		-- upvalues: bindableEvent (ref), p0 (ref)
		bindableEvent:Fire(p0.Root.AbsoluteSize)
	end)
	local t = {
		player = {
			UserId = reportedPlayer.UserId,
			Name = reportedPlayer.Name,
			DisplayName = reportedPlayer.DisplayName
		},
		closeMenu = function() --[[ line: 108 ]]
			-- upvalues: p0 (ref)
			p0:HandleDone()
		end,
		isVoiceReport = p0.isVoiceReport,
		ZIndex = p0.HubRef.Shield.ZIndex + 1,
		reportAbuseAnalytics = var18,
		blockingAnalytics = var19,
		onSizeChanged = bindableEvent.Event
	}
	local var24 = roactModule.createElement(reportConfirmationScreenModule, t)
	
	if reportAbuseThankYouPageGamepadEnable then
		var24 = roactModule.createElement(coreScriptsRootProvider, {}, {
			FocusRoot = roactModule.createElement(focusRoot, {
				isIsolated = true,
				isAutoFocusRoot = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.RouterView
			}, {
				ThankYouScreenRoot = roactModule.createElement(reportConfirmationContainerModule, t)
			})
		})
		
		if var15 and fFlagEnableConsoleExpControls then
			var16:setHideShortcutBar("ReportSentPageV2", true)
		end
	end
	var17 = roactModule.mount(var24, p0.Root, "ReportSentPageV2")
end

function var20.ShowReportedPlayer(p2, p3, p4) --[[ line: 142 ]]
	-- upvalues: var20 (ref)
	p2.ReportedPlayer = p3
	p2.isVoiceReport = p4
	p2:UpdateMenu()
	p2.HubRef:SwitchToPage(var20, true)
end

function var20.HandleDone(p5) --[[ line: 150 ]]
	-- upvalues: reportAbuseThankYouPageGamepadEnable (ref), var15 (ref), fFlagEnableConsoleExpControls (ref), var16 (ref), var17 (write), roactModule (ref)
	if reportAbuseThankYouPageGamepadEnable and var15 and fFlagEnableConsoleExpControls then
		var16:setHideShortcutBar("ReportSentPageV2", false)
	end
	if var17 ~= nil then
		roactModule.unmount(var17)
		var17 = nil
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

return var20