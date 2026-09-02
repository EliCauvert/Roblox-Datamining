local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local uiblox = builderIconsModule.Migration.uiblox
local foundationModule = require(corePackagesService.Packages.Foundation)
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local abuseReportMenu = require(robloxGui.Modules.AbuseReportMenu).AbuseReportMenu
local abuseReportMenuV2 = require(robloxGui.Modules.AbuseReportMenu).AbuseReportMenuV2
local reportAbuseAnalytics = require(robloxGui.Modules.AbuseReportMenu).ReportAbuseAnalytics
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var2 = if var1 then require(robloxGui.Modules.Chrome.Service) else nil
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagInExperienceReportClosingBugfix = sharedFlagsModule.FFlagInExperienceReportClosingBugfix
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagHideShortcutsOnReportDropdownModule = require(robloxGui.Modules.AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local fFlagReportFocusNavIEMButtonsModule = require(robloxGui.Modules.AbuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)
local fFlagStandardizeSafetyIcon = sharedFlagsModule.FFlagStandardizeSafetyIcon
local switchOverToAbuseReportMenuV2 = game:DefineFastFlag("SwitchOverToAbuseReportMenuV2", false)
local _ = nil
local var3 = (function()
	-- upvalues: robloxGui (ref), utilityModule (ref), uiblox (ref), fFlagStandardizeSafetyIcon (ref), iconName (ref), iconVariant (ref), builderIconsModule (ref), fFlagEnableSideSheet (ref), switchOverToAbuseReportMenuV2 (ref), roactModule (ref), abuseReportMenuV2 (ref), abuseReportMenu (ref), fFlagInExperienceReportClosingBugfix (ref), var1 (ref), var2 (ref), fFlagHideShortcutsOnReportDropdownModule (ref), fFlagReportFocusNavIEMButtonsModule (ref)
	local reportAbuseMenuNewContainerPage = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function reportAbuseMenuNewContainerPage._onHiddenCallback() end
	
	function reportAbuseMenuNewContainerPage._onDisplayedCallback() end
	
	function reportAbuseMenuNewContainerPage._onDisplayingCallback() end
	
	function reportAbuseMenuNewContainerPage._onSettingsHiddenCallback() end
	
	function reportAbuseMenuNewContainerPage._setNextPlayerToReportCallback() end
	
	function reportAbuseMenuNewContainerPage._onMenuWidthChange() end
	
	function reportAbuseMenuNewContainerPage.SetHub(_, p1)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage.HubRef = p1
		reportAbuseMenuNewContainerPage.HubRef.SettingsShowSignal:connect(function(p2)
			-- upvalues: reportAbuseMenuNewContainerPage (copy)
			if not p2 then
				reportAbuseMenuNewContainerPage:onSettingsHidden()
			end
		end)
		
		return reportAbuseMenuNewContainerPage
	end
	
	function reportAbuseMenuNewContainerPage.showAlert(_, p1, p2, p3)
		-- upvalues: utilityModule (copy), reportAbuseMenuNewContainerPage (ref)
		utilityModule:ShowAlert(p1, p2, reportAbuseMenuNewContainerPage.HubRef, p3)
	end
	
	function reportAbuseMenuNewContainerPage.showReportSentPage(_, p1)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage.HubRef.ReportSentPageV2:ShowReportedPlayer(p1, true)
	end
	
	function reportAbuseMenuNewContainerPage.HideMenu(_)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage.HubRef:SetVisibility(false, true)
	end
	
	function reportAbuseMenuNewContainerPage.ShowMenu(_)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage.HubRef:SetVisibility(true, true, reportAbuseMenuNewContainerPage, nil, "ScreenshotUnhide")
	end
	
	function reportAbuseMenuNewContainerPage.onHidden(_)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage._onHiddenCallback()
	end
	
	function reportAbuseMenuNewContainerPage.onSettingsHidden(_)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage._onSettingsHiddenCallback()
	end
	
	function reportAbuseMenuNewContainerPage.onDisplayed(_)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage._onDisplayedCallback()
	end
	
	function reportAbuseMenuNewContainerPage.onDisplaying(_)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage._onDisplayingCallback()
	end
	
	function reportAbuseMenuNewContainerPage.setNextPlayerToReport(_, p1)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage._setNextPlayerToReportCallback(p1)
	end
	
	reportAbuseMenuNewContainerPage.TabHeader.Name = "ReportAbuseTab"
	local var4 = if fFlagStandardizeSafetyIcon then { name = iconName.Flag, variant = iconVariant.Regular } else uiblox["icons/actions/feedback"]
	reportAbuseMenuNewContainerPage.TabHeader.TabLabel.Icon.Text = var4.name
	reportAbuseMenuNewContainerPage.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[var4.variant]
	reportAbuseMenuNewContainerPage.TabHeader.TabLabel.Title.Text = "Report"
	reportAbuseMenuNewContainerPage.Page.Name = "ReportAbuseMenuNewContainerPage"
	reportAbuseMenuNewContainerPage.ShouldShowBottomBar = not fFlagEnableSideSheet
	reportAbuseMenuNewContainerPage.ShouldShowHubBar = true
	reportAbuseMenuNewContainerPage.ShouldDisableDefaultScroll = switchOverToAbuseReportMenuV2
	roactModule.mount(roactModule.createElement(if switchOverToAbuseReportMenuV2 then abuseReportMenuV2 else abuseReportMenu, {
		hideReportTab = function()
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage:HideMenu()
		end,
		showReportTab = function()
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage:ShowMenu()
		end,
		registerOnReportTabHidden = function(p1)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onHiddenCallback = p1
		end,
		registerOnReportTabDisplayed = function(p1)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onDisplayedCallback = p1
		end,
		registerOnReportTabDisplaying = function(p1)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onDisplayingCallback = p1
		end,
		registerOnMenuWidthChange = function(p1)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onMenuWidthChange = p1
		end,
		registerSetNextPlayerToReport = function(value)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._setNextPlayerToReportCallback = value
		end,
		registerOnSettingsHidden = function(value)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onSettingsHiddenCallback = value
		end,
		showReportSentPage = function(p1)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage:showReportSentPage(p1)
		end,
		onReportComplete = function(p1)
			-- upvalues: fFlagInExperienceReportClosingBugfix (copy), var1 (copy), var2 (copy), reportAbuseMenuNewContainerPage (ref)
			if fFlagInExperienceReportClosingBugfix and var1 then
				var2:setShortcutBar(nil)
			end
			reportAbuseMenuNewContainerPage:showAlert(p1, "Ok", function()
				-- upvalues: reportAbuseMenuNewContainerPage (copy)
				reportAbuseMenuNewContainerPage:HideMenu()
			end)
		end,
		onDropdownMenuOpenChange = if fFlagHideShortcutsOnReportDropdownModule and var1 then function(p1)
			-- upvalues: var2 (copy)
			var2:setHideShortcutBar("InExperienceReportDropdown", p1)
		end else nil,
		getSettingsHubRef = if fFlagReportFocusNavIEMButtonsModule then function()
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			return reportAbuseMenuNewContainerPage.HubRef
		end else nil
	}), reportAbuseMenuNewContainerPage.Page, "AbuseReportMenu")
	reportAbuseMenuNewContainerPage.Page.Size = UDim2.new(1, 0, 0, 0)
	reportAbuseMenuNewContainerPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	reportAbuseMenuNewContainerPage.Page:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage._onMenuWidthChange(reportAbuseMenuNewContainerPage.Page.AbsoluteSize.X)
	end)
	
	return reportAbuseMenuNewContainerPage
end)()
var3.Displayed.Event:connect(function()
	-- upvalues: var3 (write)
	var3:onDisplayed()
end)
var3.Displaying.Event:connect(function()
	-- upvalues: var3 (write)
	var3:onDisplaying()
end)
var3.Hidden.Event:connect(function()
	-- upvalues: var3 (write)
	var3:onHidden()
end)

function var12.ReportPlayer(_, p1, p2)
	-- upvalues: reportAbuseAnalytics (ref), var3 (write)
	if p1 then
		reportAbuseAnalytics:startAbuseReportSession(p2)
		var3:setNextPlayerToReport(p1)
		
		if not var3.HubRef:GetVisibility() then
			var3.HubRef:SetVisibility(true, false, var3)
			
			return
		end
		var3.HubRef:SwitchToPage(var3, false, nil, nil, nil, {
			entrypoint = reportAbuseAnalytics:getAbuseReportSessionEntryPoint()
		})
	end
end

return var3