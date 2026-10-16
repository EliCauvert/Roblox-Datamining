local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local LegacyAbuseReportMenu = require(RobloxGui.Modules.AbuseReportMenu).LegacyAbuseReportMenu
local AbuseReportMenuV2 = require(RobloxGui.Modules.AbuseReportMenu).AbuseReportMenuV2
local ReportAbuseAnalytics = require(RobloxGui.Modules.AbuseReportMenu).ReportAbuseAnalytics
local Chrome = RobloxGui.Modules.Chrome
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local ServiceModule = if EnabledResult then require(Chrome.Service) else nil
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagInExperienceReportClosingBugfix = SharedFlagsModule.FFlagInExperienceReportClosingBugfix
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagHideShortcutsOnReportDropdownModule = require(RobloxGui.Modules.AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local FFlagReportFocusNavIEMButtonsModule = require(RobloxGui.Modules.AbuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)
local FFlagReportFocusNavCloseButtonModule = require(RobloxGui.Modules.AbuseReportMenu.Flags.FFlagReportFocusNavCloseButton)
local FFlagStandardizeSafetyIcon = SharedFlagsModule.FFlagStandardizeSafetyIcon
local SwitchOverToAbuseReportMenuV2 = game:DefineFastFlag("SwitchOverToAbuseReportMenuV2", false)
local v1 = nil
v1 = (function() --[[ Line: 38 | Named "Initialize" ]]
	-- upvalues: RobloxGui (copy), UtilityModule (copy), Uiblox (copy), FFlagStandardizeSafetyIcon (copy), IconName (copy), IconVariant (copy), BuilderIconsModule (copy), IsSideSheetEnabledModule (copy), SwitchOverToAbuseReportMenuV2 (copy), RoactModule (copy), AbuseReportMenuV2 (copy), LegacyAbuseReportMenu (copy), FFlagInExperienceReportClosingBugfix (copy), EnabledResult (copy), ServiceModule (copy), FFlagHideShortcutsOnReportDropdownModule (copy), FFlagReportFocusNavIEMButtonsModule (copy), FFlagReportFocusNavCloseButtonModule (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function NewPage._onHiddenCallback() --[[ Line: 42 ]] end
	
	function NewPage._onDisplayedCallback() --[[ Line: 43 ]] end
	
	function NewPage._onDisplayingCallback() --[[ Line: 44 ]] end
	
	function NewPage._onSettingsHiddenCallback() --[[ Line: 45 ]] end
	
	function NewPage._setNextPlayerToReportCallback() --[[ Line: 46 ]] end
	
	function NewPage._onMenuWidthChange() --[[ Line: 47 ]] end
	
	function NewPage:SetHub(HubRef) --[[ Line: 49 ]]
		-- upvalues: NewPage (copy)
		NewPage.HubRef = HubRef
		NewPage.HubRef.SettingsShowSignal:connect(function(p1) --[[ Line: 53 ]]
			-- upvalues: NewPage (upval)
			if not p1 then
				NewPage:onSettingsHidden()
			end
		end)
		
		return NewPage
	end
	
	function NewPage:showAlert(p1, p2, p3) --[[ Line: 62 ]]
		-- upvalues: UtilityModule (upval), NewPage (copy)
		UtilityModule:ShowAlert(p1, p2, NewPage.HubRef, p3)
	end
	
	function NewPage:showReportSentPage(p1) --[[ Line: 66 ]]
		-- upvalues: NewPage (copy)
		NewPage.HubRef.ReportSentPageV2:ShowReportedPlayer(p1, true)
	end
	
	function NewPage:HideMenu() --[[ Line: 70 ]]
		-- upvalues: NewPage (copy)
		NewPage.HubRef:SetVisibility(false, true)
	end
	
	function NewPage:ShowMenu() --[[ Line: 74 ]]
		-- upvalues: NewPage (copy)
		NewPage.HubRef:SetVisibility(true, true, NewPage, nil, "ScreenshotUnhide")
	end
	
	function NewPage:onHidden() --[[ Line: 78 ]]
		-- upvalues: NewPage (copy)
		NewPage._onHiddenCallback()
	end
	
	function NewPage:onSettingsHidden() --[[ Line: 82 ]]
		-- upvalues: NewPage (copy)
		NewPage._onSettingsHiddenCallback()
	end
	
	function NewPage:onDisplayed() --[[ Line: 86 ]]
		-- upvalues: NewPage (copy)
		NewPage._onDisplayedCallback()
	end
	
	function NewPage:onDisplaying() --[[ Line: 90 ]]
		-- upvalues: NewPage (copy)
		NewPage._onDisplayingCallback()
	end
	
	function NewPage:setNextPlayerToReport(p1) --[[ Line: 94 ]]
		-- upvalues: NewPage (copy)
		NewPage._setNextPlayerToReportCallback(p1)
	end
	
	NewPage.TabHeader.Name = "ReportAbuseTab"
	local Config = if FFlagStandardizeSafetyIcon then { name = IconName.Flag, variant = IconVariant.Regular } else Uiblox["icons/actions/feedback"]
	NewPage.TabHeader.TabLabel.Icon.Text = Config.name
	NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[Config.variant]
	NewPage.TabHeader.TabLabel.Title.Text = "Report"
	NewPage.Page.Name = "ReportAbuseMenuNewContainerPage"
	NewPage.ShouldShowBottomBar = not IsSideSheetEnabledModule
	NewPage.ShouldShowHubBar = true
	NewPage.ShouldDisableDefaultScroll = SwitchOverToAbuseReportMenuV2
	RoactModule.mount(RoactModule.createElement(if SwitchOverToAbuseReportMenuV2 then AbuseReportMenuV2 else LegacyAbuseReportMenu, {
		hideReportTab = function() --[[ Line: 120 ]]
			-- upvalues: NewPage (copy)
			NewPage:HideMenu()
		end,
		showReportTab = function() --[[ Line: 123 ]]
			-- upvalues: NewPage (copy)
			NewPage:ShowMenu()
		end,
		registerOnReportTabHidden = function(_onHiddenCallback) --[[ Line: 126 ]]
			-- upvalues: NewPage (copy)
			NewPage._onHiddenCallback = _onHiddenCallback
		end,
		registerOnReportTabDisplayed = function(_onDisplayedCallback) --[[ Line: 129 ]]
			-- upvalues: NewPage (copy)
			NewPage._onDisplayedCallback = _onDisplayedCallback
		end,
		registerOnReportTabDisplaying = function(_onDisplayingCallback) --[[ Line: 132 ]]
			-- upvalues: NewPage (copy)
			NewPage._onDisplayingCallback = _onDisplayingCallback
		end,
		registerOnMenuWidthChange = function(_onMenuWidthChange) --[[ Line: 135 ]]
			-- upvalues: NewPage (copy)
			NewPage._onMenuWidthChange = _onMenuWidthChange
		end,
		registerSetNextPlayerToReport = function(_setNextPlayerToReportCallback) --[[ Line: 138 ]]
			-- upvalues: NewPage (copy)
			NewPage._setNextPlayerToReportCallback = _setNextPlayerToReportCallback
		end,
		registerOnSettingsHidden = function(_onSettingsHiddenCallback) --[[ Line: 141 ]]
			-- upvalues: NewPage (copy)
			NewPage._onSettingsHiddenCallback = _onSettingsHiddenCallback
		end,
		showReportSentPage = function(p1) --[[ Line: 144 ]]
			-- upvalues: NewPage (copy)
			NewPage:showReportSentPage(p1)
		end,
		onReportComplete = function(p1) --[[ Line: 147 ]]
			-- upvalues: FFlagInExperienceReportClosingBugfix (upval), EnabledResult (upval), ServiceModule (upval), NewPage (copy)
			if FFlagInExperienceReportClosingBugfix and EnabledResult then
				ServiceModule:setShortcutBar(nil)
			end
			NewPage:showAlert(p1, "Ok", function() --[[ Line: 151 ]]
				-- upvalues: NewPage (upval)
				NewPage:HideMenu()
			end)
		end,
		onDropdownMenuOpenChange = if FFlagHideShortcutsOnReportDropdownModule and EnabledResult then function(p1) --[[ Line: 157 ]]
			-- upvalues: ServiceModule (upval)
			ServiceModule:setHideShortcutBar("InExperienceReportDropdown", p1)
		end else nil,
		getSettingsHubRef = if FFlagReportFocusNavIEMButtonsModule or FFlagReportFocusNavCloseButtonModule then function() --[[ Line: 162 ]]
			-- upvalues: NewPage (copy)
			return NewPage.HubRef
		end else nil
	}), NewPage.Page, "AbuseReportMenu")
	NewPage.Page.Size = UDim2.new(1, 0, 0, 0)
	NewPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	NewPage.Page:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 176 ]]
		-- upvalues: NewPage (copy)
		NewPage._onMenuWidthChange(NewPage.Page.AbsoluteSize.X)
	end)
	
	return NewPage
end)()
v1.Displayed.Event:connect(function() --[[ Line: 186 ]]
	-- upvalues: v1 (ref)
	v1:onDisplayed()
end)
v1.Displaying.Event:connect(function() --[[ Line: 190 ]]
	-- upvalues: v1 (ref)
	v1:onDisplaying()
end)
v1.Hidden.Event:connect(function() --[[ Line: 194 ]]
	-- upvalues: v1 (ref)
	v1:onHidden()
end)

function v1:ReportPlayer(p1, p2) --[[ Line: 198 ]]
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