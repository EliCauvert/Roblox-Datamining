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
local var6 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var7 = if var6 then require(robloxGui.Modules.Chrome.Service) else nil
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagInExperienceReportClosingBugfix = sharedFlagsModule.FFlagInExperienceReportClosingBugfix
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagHideShortcutsOnReportDropdownModule = require(robloxGui.Modules.AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local fFlagAbuseReportMenuV2 = sharedFlagsModule.FFlagAbuseReportMenuV2
local fFlagIEMSettingsPageDisplaying = sharedFlagsModule.FFlagIEMSettingsPageDisplaying
local fFlagReportFocusNavIEMButtonsModule = require(robloxGui.Modules.AbuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)
local fFlagStandardizeSafetyIcon = sharedFlagsModule.FFlagStandardizeSafetyIcon
local fFlagAbuseReportMenuV2_1 = game:DefineFastFlag("SwitchOverToAbuseReportMenuV2", false) and fFlagAbuseReportMenuV2
local _ = nil
local var12 = (function()
	-- upvalues: robloxGui (ref), utilityModule (ref), uiblox (ref), fFlagStandardizeSafetyIcon (ref), iconName (ref), iconVariant (ref), builderIconsModule (ref), fFlagEnableSideSheet (ref), fFlagAbuseReportMenuV2 (ref), fFlagAbuseReportMenuV2_1 (ref), roactModule (ref), abuseReportMenuV2 (ref), abuseReportMenu (ref), fFlagInExperienceReportClosingBugfix (ref), var6 (ref), var7 (ref), fFlagHideShortcutsOnReportDropdownModule (ref), fFlagReportFocusNavIEMButtonsModule (ref)
	local reportAbuseMenuNewContainerPage = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function reportAbuseMenuNewContainerPage._onHiddenCallback() end
	
	function reportAbuseMenuNewContainerPage._onDisplayedCallback() end
	
	function reportAbuseMenuNewContainerPage._onDisplayingCallback() end
	
	function reportAbuseMenuNewContainerPage._onSettingsHiddenCallback() end
	
	function reportAbuseMenuNewContainerPage._setNextPlayerToReportCallback() end
	
	function reportAbuseMenuNewContainerPage._onMenuWidthChange() end
	
	function reportAbuseMenuNewContainerPage.SetHub(_, p0)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage.HubRef = p0
		reportAbuseMenuNewContainerPage.HubRef.SettingsShowSignal:connect(function(p1)
			-- upvalues: reportAbuseMenuNewContainerPage (copy)
			if not p1 then
				reportAbuseMenuNewContainerPage:onSettingsHidden()
			end
		end)
		
		return reportAbuseMenuNewContainerPage
	end
	
	function reportAbuseMenuNewContainerPage.showAlert(_, p2, p3, p4)
		-- upvalues: utilityModule (copy), reportAbuseMenuNewContainerPage (ref)
		utilityModule:ShowAlert(p2, p3, reportAbuseMenuNewContainerPage.HubRef, p4)
	end
	
	function reportAbuseMenuNewContainerPage.showReportSentPage(_, p5)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage.HubRef.ReportSentPageV2:ShowReportedPlayer(p5, true)
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
	
	function reportAbuseMenuNewContainerPage.setNextPlayerToReport(_, p6)
		-- upvalues: reportAbuseMenuNewContainerPage (ref)
		reportAbuseMenuNewContainerPage._setNextPlayerToReportCallback(p6)
	end
	
	reportAbuseMenuNewContainerPage.TabHeader.Name = "ReportAbuseTab"
	local var14 = if fFlagStandardizeSafetyIcon then { name = iconName.Flag, variant = iconVariant.Regular } else uiblox["icons/actions/feedback"]
	reportAbuseMenuNewContainerPage.TabHeader.TabLabel.Icon.Text = var14.name
	reportAbuseMenuNewContainerPage.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[var14.variant]
	reportAbuseMenuNewContainerPage.TabHeader.TabLabel.Title.Text = "Report"
	reportAbuseMenuNewContainerPage.Page.Name = "ReportAbuseMenuNewContainerPage"
	reportAbuseMenuNewContainerPage.ShouldShowBottomBar = not fFlagEnableSideSheet
	reportAbuseMenuNewContainerPage.ShouldShowHubBar = true
	reportAbuseMenuNewContainerPage.ShouldDisableDefaultScroll = fFlagAbuseReportMenuV2 and fFlagAbuseReportMenuV2_1
	roactModule.mount(roactModule.createElement(if fFlagAbuseReportMenuV2_1 then abuseReportMenuV2 else abuseReportMenu, {
		hideReportTab = function()
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage:HideMenu()
		end,
		showReportTab = function()
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage:ShowMenu()
		end,
		registerOnReportTabHidden = function(p7)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onHiddenCallback = p7
		end,
		registerOnReportTabDisplayed = function(p8)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onDisplayedCallback = p8
		end,
		registerOnReportTabDisplaying = function(p9)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onDisplayingCallback = p9
		end,
		registerOnMenuWidthChange = function(p10)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onMenuWidthChange = p10
		end,
		registerSetNextPlayerToReport = function(value)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._setNextPlayerToReportCallback = value
		end,
		registerOnSettingsHidden = function(value)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage._onSettingsHiddenCallback = value
		end,
		showReportSentPage = function(p11)
			-- upvalues: reportAbuseMenuNewContainerPage (ref)
			reportAbuseMenuNewContainerPage:showReportSentPage(p11)
		end,
		onReportComplete = function(p12)
			-- upvalues: fFlagInExperienceReportClosingBugfix (copy), var6 (copy), var7 (copy), reportAbuseMenuNewContainerPage (ref)
			if fFlagInExperienceReportClosingBugfix and var6 then
				var7:setShortcutBar(nil)
			end
			reportAbuseMenuNewContainerPage:showAlert(p12, "Ok", function()
				-- upvalues: reportAbuseMenuNewContainerPage (copy)
				reportAbuseMenuNewContainerPage:HideMenu()
			end)
		end,
		onDropdownMenuOpenChange = if fFlagHideShortcutsOnReportDropdownModule and var6 then function(p13)
			-- upvalues: var7 (copy)
			var7:setHideShortcutBar("InExperienceReportDropdown", p13)
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
var12.Displayed.Event:connect(function()
	-- upvalues: var12 (write)
	var12:onDisplayed()
end)

if fFlagIEMSettingsPageDisplaying then
	var12.Displaying.Event:connect(function()
		-- upvalues: var12 (write)
		var12:onDisplaying()
	end)
end
var12.Hidden.Event:connect(function()
	-- upvalues: var12 (write)
	var12:onHidden()
end)

function var12.ReportPlayer(_, p14, p15)
	-- upvalues: reportAbuseAnalytics (ref), var12 (write)
	if p14 then
		reportAbuseAnalytics:startAbuseReportSession(p15)
		var12:setNextPlayerToReport(p14)
		
		if not var12.HubRef:GetVisibility() then
			var12.HubRef:SetVisibility(true, false, var12)
			
			return
		end
		var12.HubRef:SwitchToPage(var12, false, nil, nil, nil, {
			entrypoint = reportAbuseAnalytics:getAbuseReportSessionEntryPoint()
		})
	end
end

return var12