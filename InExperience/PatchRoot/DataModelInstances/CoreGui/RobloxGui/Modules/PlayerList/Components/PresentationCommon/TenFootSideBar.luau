local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local fFlagAppShellMigrateLocales = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAppShellMigrateLocales
local parent = script.Parent.Parent.Parent
local closePlayerDropDownModule = require(parent.Actions.ClosePlayerDropDown)
local setPlayerListVisibilityModule = require(parent.Actions.SetPlayerListVisibility)
local isNewInGameMenuEnabledModule = require(coreGuiService.RobloxGui.Modules.isNewInGameMenuEnabled)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local tenFootSideBar = roactModule.PureComponent:extend("TenFootSideBar")

function tenFootSideBar.init(p0) --[[ line: 23 ]]
	p0.sideBar = nil
end

function tenFootSideBar.render(_) --[[ line: 27 ]]
	return nil
end

function tenFootSideBar.openSidebar(p1, p2) --[[ line: 31 ]]
	-- upvalues: runService (ref), playersService (ref), guiService (ref), robloxGui (ref), fFlagAppShellMigrateLocales (ref), isNewInGameMenuEnabledModule (ref)
	local var12 = not runService:IsStudio() and p2 ~= playersService.LocalPlayer
	
	if not var12 then
		p1.props.closeSideBar()
		
		return
	end
	local selectedCoreObject = guiService.SelectedCoreObject
	local unknownModule = require(robloxGui.Modules:FindFirstChild("ScreenManager") or robloxGui.Modules.Shell.ScreenManager)
	local unknownModule_1 = require(robloxGui.Modules:FindFirstChild("LocalizedStrings") or robloxGui.Modules.Shell.LocalizedStrings)
	
	if not p1.sideBar then
		p1.sideBar = require(robloxGui.Modules:FindFirstChild("SideBar") or robloxGui.Modules.Shell.SideBar)()
	end
	p1.sideBar:RemoveAllItems()
	
	if var12 then
		p1.sideBar:AddItem(if fFlagAppShellMigrateLocales then unknownModule_1:LocStringUA("Xbox.Old.ReportPlayer") else unknownModule_1:LocalizedString("ReportPlayer"), function() --[[ line: 61 ]]
			-- upvalues: p1 (ref), guiService (copy), isNewInGameMenuEnabledModule (copy), robloxGui (copy), p2 (ref)
			p1.props.closePlayerList()
			guiService.SelectedCoreObject = nil
			
			if isNewInGameMenuEnabledModule() then
				require(robloxGui.Modules.InGameMenuInit).openReportDialog(p2, p1.__componentName)
				
				return
			end
			require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(p2, p1.__componentName)
		end)
	end
	local closedConnection = nil
	closedConnection = p1.sideBar.Closed:connect(function() --[[ line: 78 ]]
		-- upvalues: closedConnection (write), p1 (ref), selectedCoreObject (ref), guiService (copy)
		closedConnection:disconnect()
		p1.props.closeSideBar()
		
		if p1.props.playerListVisible then
			if selectedCoreObject and selectedCoreObject.Parent then
				guiService.SelectedCoreObject = selectedCoreObject
				
				return
			end
			p1.props.closePlayerList()
			p1.props.openPlayerList()
		end
	end)
	unknownModule:OpenScreen(p1.sideBar, false)
end

function tenFootSideBar.didMount(p3) --[[ line: 95 ]]
	if p3.props.sideBarVisible then
		p3:openSidebar(p3.props.selectedPlayer)
	end
end

function tenFootSideBar.didUpdate(p4, p5) --[[ line: 101 ]]
	if p4.props.sideBarVisible and p4.props.sideBarVisible ~= p5.sideBarVisible then
		p4:openSidebar(p4.props.selectedPlayer)
	end
end

return roactRoduxModule.connect(function(p6) --[[ line: 107 | named "mapStateToProps" ]]
	return {
		selectedPlayer = p6.playerDropDown.selectedPlayer,
		sideBarVisible = p6.displayOptions.isTenFootInterface and p6.playerDropDown.isVisible,
		playerListVisible = p6.displayOptions.isVisible
	}
end, function(p7) --[[ line: 115 | named "mapDispatchToProps" ]]
	-- upvalues: closePlayerDropDownModule (ref), setPlayerListVisibilityModule (ref)
	return {
		closeSideBar = function() --[[ line: 117 ]]
			-- upvalues: p7 (ref), closePlayerDropDownModule (copy)
			return p7(closePlayerDropDownModule())
		end,
		closePlayerList = function() --[[ line: 121 ]]
			-- upvalues: p7 (ref), setPlayerListVisibilityModule (copy)
			return p7(setPlayerListVisibilityModule(false))
		end,
		openPlayerList = function() --[[ line: 125 ]]
			-- upvalues: p7 (ref), setPlayerListVisibilityModule (copy)
			return p7(setPlayerListVisibilityModule(true))
		end
	}
end)(tenFootSideBar)