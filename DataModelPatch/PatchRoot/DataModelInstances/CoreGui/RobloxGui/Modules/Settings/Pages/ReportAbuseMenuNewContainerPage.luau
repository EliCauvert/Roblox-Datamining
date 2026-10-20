local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local AbuseReportMenu = require(RobloxGui.Modules.AbuseReportMenu).AbuseReportMenu
local AbuseReportMenuV2 = require(RobloxGui.Modules.AbuseReportMenu).AbuseReportMenuV2
local ReportAbuseAnalytics = require(RobloxGui.Modules.AbuseReportMenu).ReportAbuseAnalytics
local Chrome = RobloxGui.Modules.Chrome
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local ServiceModule = if EnabledResult then require(Chrome.Service) else nil
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagInExperienceReportClosingBugfix = SharedFlagsModule.FFlagInExperienceReportClosingBugfix
local FFlagEnableSideSheet = SharedFlagsModule.FFlagEnableSideSheet
local FFlagHideShortcutsOnReportDropdownModule = require(RobloxGui.Modules.AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local FFlagAbuseReportMenuV2 = SharedFlagsModule.FFlagAbuseReportMenuV2
local FFlagIEMSettingsPageDisplaying = SharedFlagsModule.FFlagIEMSettingsPageDisplaying
local FFlagReportFocusNavIEMButtonsModule = require(RobloxGui.Modules.AbuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)
local FFlagStandardizeSafetyIcon = SharedFlagsModule.FFlagStandardizeSafetyIcon
local FFlagAbuseReportMenuV2_1 = game:DefineFastFlag("SwitchOverToAbuseReportMenuV2", false) and FFlagAbuseReportMenuV2
local v1 = nil
v1 = (function()
	-- upvalues: RobloxGui (copy), UtilityModule (copy), Uiblox (copy), FFlagStandardizeSafetyIcon (copy), IconName (copy), IconVariant (copy), BuilderIconsModule (copy), FFlagEnableSideSheet (copy), FFlagAbuseReportMenuV2 (copy), FFlagAbuseReportMenuV2_1 (copy), RoactModule (copy), AbuseReportMenuV2 (copy), AbuseReportMenu (copy), FFlagInExperienceReportClosingBugfix (copy), EnabledResult (copy), ServiceModule (copy), FFlagHideShortcutsOnReportDropdownModule (copy), FFlagReportFocusNavIEMButtonsModule (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function NewPage._onHiddenCallback() end
	
	function NewPage._onDisplayedCallback() end
	
	function NewPage._onDisplayingCallback() end
	
	function NewPage._onSettingsHiddenCallback() end
	
	function NewPage._setNextPlayerToReportCallback() end
	
	function NewPage._onMenuWidthChange() end
	
	function NewPage:SetHub(HubRef)
		-- upvalues: NewPage (copy)
		NewPage.HubRef = HubRef
		NewPage.HubRef.SettingsShowSignal:connect(function(p1)
			-- upvalues: NewPage (upval)
			if not p1 then
				NewPage:onSettingsHidden()
			end
		end)
		
		return NewPage
	end
	
	function NewPage:showAlert(p1, p2, p3)
		-- upvalues: UtilityModule (upval), NewPage (copy)
		UtilityModule:ShowAlert(p1, p2, NewPage.HubRef, p3)
	end
	
	function NewPage:showReportSentPage(p1)
		-- upvalues: NewPage (copy)
		NewPage.HubRef.ReportSentPageV2:ShowReportedPlayer(p1, true)
	end
	
	function NewPage:HideMenu()
		-- upvalues: NewPage (copy)
		NewPage.HubRef:SetVisibility(false, true)
	end
	
	function NewPage:ShowMenu()
		-- upvalues: NewPage (copy)
		NewPage.HubRef:SetVisibility(true, true, NewPage, nil, "ScreenshotUnhide")
	end
	
	function NewPage:onHidden()
		-- upvalues: NewPage (copy)
		NewPage._onHiddenCallback()
	end
	
	function NewPage:onSettingsHidden()
		-- upvalues: NewPage (copy)
		NewPage._onSettingsHiddenCallback()
	end
	
	function NewPage:onDisplayed()
		-- upvalues: NewPage (copy)
		NewPage._onDisplayedCallback()
	end
	
	function NewPage:onDisplaying()
		-- upvalues: NewPage (copy)
		NewPage._onDisplayingCallback()
	end
	
	function NewPage:setNextPlayerToReport(p1)
		-- upvalues: NewPage (copy)
		NewPage._setNextPlayerToReportCallback(p1)
	end
	
	NewPage.TabHeader.Name = "ReportAbuseTab"
	local Config = if FFlagStandardizeSafetyIcon then { name = IconName.Flag, variant = IconVariant.Regular } else Uiblox["icons/actions/feedback"]
	NewPage.TabHeader.TabLabel.Icon.Text = Config.name
	NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[Config.variant]
	NewPage.TabHeader.TabLabel.Title.Text = "Report"
	NewPage.Page.Name = "ReportAbuseMenuNewContainerPage"
	NewPage.ShouldShowBottomBar = not FFlagEnableSideSheet
	NewPage.ShouldShowHubBar = true
	NewPage.ShouldDisableDefaultScroll = FFlagAbuseReportMenuV2 and FFlagAbuseReportMenuV2_1
	RoactModule.mount(RoactModule.createElement(if FFlagAbuseReportMenuV2_1 then AbuseReportMenuV2 else AbuseReportMenu, {
		hideReportTab = function()
			-- upvalues: NewPage (copy)
			NewPage:HideMenu()
		end,
		showReportTab = function()
			-- upvalues: NewPage (copy)
			NewPage:ShowMenu()
		end,
		registerOnReportTabHidden = function(_onHiddenCallback)
			-- upvalues: NewPage (copy)
			NewPage._onHiddenCallback = _onHiddenCallback
		end,
		registerOnReportTabDisplayed = function(_onDisplayedCallback)
			-- upvalues: NewPage (copy)
			NewPage._onDisplayedCallback = _onDisplayedCallback
		end,
		registerOnReportTabDisplaying = function(_onDisplayingCallback)
			-- upvalues: NewPage (copy)
			NewPage._onDisplayingCallback = _onDisplayingCallback
		end,
		registerOnMenuWidthChange = function(_onMenuWidthChange)
			-- upvalues: NewPage (copy)
			NewPage._onMenuWidthChange = _onMenuWidthChange
		end,
		registerSetNextPlayerToReport = function(_setNextPlayerToReportCallback)
			-- upvalues: NewPage (copy)
			NewPage._setNextPlayerToReportCallback = _setNextPlayerToReportCallback
		end,
		registerOnSettingsHidden = function(_onSettingsHiddenCallback)
			-- upvalues: NewPage (copy)
			NewPage._onSettingsHiddenCallback = _onSettingsHiddenCallback
		end,
		showReportSentPage = function(p1)
			-- upvalues: NewPage (copy)
			NewPage:showReportSentPage(p1)
		end,
		onReportComplete = function(p1)
			-- upvalues: FFlagInExperienceReportClosingBugfix (upval), EnabledResult (upval), ServiceModule (upval), NewPage (copy)
			if FFlagInExperienceReportClosingBugfix and EnabledResult then
				ServiceModule:setShortcutBar(nil)
			end
			NewPage:showAlert(p1, "Ok", function()
				-- upvalues: NewPage (upval)
				NewPage:HideMenu()
			end)
		end,
		onDropdownMenuOpenChange = if FFlagHideShortcutsOnReportDropdownModule and EnabledResult then function(p1)
			-- upvalues: ServiceModule (upval)
			ServiceModule:setHideShortcutBar("InExperienceReportDropdown", p1)
		end else nil,
		getSettingsHubRef = if FFlagReportFocusNavIEMButtonsModule then function()
			-- upvalues: NewPage (copy)
			return NewPage.HubRef
		end else nil
	}), NewPage.Page, "AbuseReportMenu")
	NewPage.Page.Size = UDim2.new(1, 0, 0, 0)
	NewPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	NewPage.Page:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
		-- upvalues: NewPage (copy)
		NewPage._onMenuWidthChange(NewPage.Page.AbsoluteSize.X)
	end)
	
	return NewPage
end)()
v1.Displayed.Event:connect(function()
	-- upvalues: v1 (ref)
	v1:onDisplayed()
end)

if FFlagIEMSettingsPageDisplaying then
	v1.Displaying.Event:connect(function()
		-- upvalues: v1 (ref)
		v1:onDisplaying()
	end)
end
v1.Hidden.Event:connect(function()
	-- upvalues: v1 (ref)
	v1:onHidden()
end)

function v1:ReportPlayer(p1, p2)
	-- upvalues: ReportAbuseAnalytics (copy), v1 (ref)
	if p1 then
		ReportAbuseAnalytics:startAbuseReportSession(p2)
		v1:setNextPlayerToReport(p1)
		
		if not v1.HubRef:GetVisibility() then
			v1.HubRef:SetVisibility(true, false, v1)
			
			return
		end
		v1.HubRef:SwitchToPage(v1, false, nil, nil, nil, {
			entrypoint = ReportAbuseAnalytics:getAbuseReportSessionEntryPoint()
		})
	end
end

return v1