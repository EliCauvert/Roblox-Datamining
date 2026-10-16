local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent.Parent
local ClosePlayerDropDownModule = require(Parent.Actions.ClosePlayerDropDown)
local SetPlayerListVisibilityModule = require(Parent.Actions.SetPlayerListVisibility)
local IsNewInGameMenuEnabledModule = require(CoreGui.RobloxGui.Modules.isNewInGameMenuEnabled)
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local TenFootSideBar = require(CorePackages.Packages.Roact).PureComponent:extend("TenFootSideBar")

function TenFootSideBar.init(p1) --[[ Line: 22 ]]
	p1.sideBar = nil
end

function TenFootSideBar:render() --[[ Line: 26 ]]
	return nil
end

function TenFootSideBar.openSidebar(p1, SelectedPlayer) --[[ Line: 30 ]]
	-- upvalues: RunService (copy), Players (copy), GuiService (copy), RobloxGui (copy), IsNewInGameMenuEnabledModule (copy)
	local IsNotSelectedPlayerMatch: boolean = not RunService:IsStudio() and SelectedPlayer ~= Players.LocalPlayer
	
	if not IsNotSelectedPlayerMatch then
		p1.props.closeSideBar()
		
		return
	end
	local SelectedCoreObject = GuiService.SelectedCoreObject
	local Module = require(RobloxGui.Modules:FindFirstChild("ScreenManager") or RobloxGui.Modules.Shell.ScreenManager)
	local Module1 = require(RobloxGui.Modules:FindFirstChild("LocalizedStrings") or RobloxGui.Modules.Shell.LocalizedStrings)
	
	if not p1.sideBar then
		p1.sideBar = require(RobloxGui.Modules:FindFirstChild("SideBar") or RobloxGui.Modules.Shell.SideBar)()
	end
	p1.sideBar:RemoveAllItems()
	
	if IsNotSelectedPlayerMatch then
		p1.sideBar:AddItem(Module1:LocStringUA("Xbox.Old.ReportPlayer"), function() --[[ Line: 58 ]]
			-- upvalues: p1 (copy), GuiService (upval), IsNewInGameMenuEnabledModule (upval), RobloxGui (upval), SelectedPlayer (copy)
			p1.props.closePlayerList()
			GuiService.SelectedCoreObject = nil
			
			if IsNewInGameMenuEnabledModule() then
				require(RobloxGui.Modules.InGameMenuInit).openReportDialog(SelectedPlayer, p1.__componentName)
				
				return
			else
				require(RobloxGui.Modules.Settings.Pages.ReportAbuseMenuContainerPage):ReportPlayer(SelectedPlayer, p1.__componentName)
			end
		end)
	end
	local ClosedConnection = nil
	ClosedConnection = p1.sideBar.Closed:connect(function() --[[ Line: 75 ]]
		-- upvalues: ClosedConnection (ref), p1 (copy), SelectedCoreObject (copy), GuiService (upval)
		ClosedConnection:disconnect()
		p1.props.closeSideBar()
		
		if p1.props.playerListVisible then
			if SelectedCoreObject and SelectedCoreObject.Parent then
				GuiService.SelectedCoreObject = SelectedCoreObject
				
				return
			end
			p1.props.closePlayerList()
			p1.props.openPlayerList()
		end
	end)
	Module:OpenScreen(p1.sideBar, false)
end

function TenFootSideBar.didMount(p1) --[[ Line: 92 ]]
	if p1.props.sideBarVisible then
		p1:openSidebar(p1.props.selectedPlayer)
	end
end

function TenFootSideBar.didUpdate(p1, p2) --[[ Line: 98 ]]
	if p1.props.sideBarVisible and p1.props.sideBarVisible ~= p2.sideBarVisible then
		p1:openSidebar(p1.props.selectedPlayer)
	end
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 104 | Named "mapStateToProps" ]]
	return {
		selectedPlayer = p1.playerDropDown.selectedPlayer,
		sideBarVisible = p1.displayOptions.isTenFootInterface and p1.playerDropDown.isVisible,
		playerListVisible = p1.displayOptions.isVisible
	}
end, function(Callback) --[[ Line: 112 | Named "mapDispatchToProps" ]]
	-- upvalues: ClosePlayerDropDownModule (copy), SetPlayerListVisibilityModule (copy)
	return {
		closeSideBar = function() --[[ Line: 114 ]]
			-- upvalues: Callback (copy), ClosePlayerDropDownModule (upval)
			return Callback(ClosePlayerDropDownModule())
		end,
		closePlayerList = function() --[[ Line: 118 ]]
			-- upvalues: Callback (copy), SetPlayerListVisibilityModule (upval)
			return Callback(SetPlayerListVisibilityModule(false))
		end,
		openPlayerList = function() --[[ Line: 122 ]]
			-- upvalues: Callback (copy), SetPlayerListVisibilityModule (upval)
			return Callback(SetPlayerListVisibilityModule(true))
		end
	}
end)(TenFootSideBar)