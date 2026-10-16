local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local DevConsoleMasterModule = require(game:GetService("CoreGui").RobloxGui.Modules.DevConsoleMaster)
local Parent = script.Parent.Parent
local OpenSystemMenuModule = require(Parent.Thunks.OpenSystemMenu)
local CloseMenuModule = require(Parent.Thunks.CloseMenu)
local SetRespawningModule = require(Parent.Actions.SetRespawning)
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)
local NavigateBackModule = require(Parent.Actions.NavigateBack)
local SetCurrentZoneModule = require(Parent.Actions.SetCurrentZone)
local PagesModule = require(Parent.Components.Pages)
local ConstantsModule = require(Parent.Resources.Constants)

return function(p1) --[[ Line: 31 | Named "bindMenuActions" ]]
	-- upvalues: PagesModule (copy), SetCurrentPageModule (copy), ConstantsModule (copy), OpenSystemMenuModule (copy), CloseMenuModule (copy), ContextActionService (copy), DevConsoleMasterModule (copy), UserInputService (copy), UserGameSettings (copy), SetRespawningModule (copy), NavigateBackModule (copy), SetCurrentZoneModule (copy)
	ContextActionService:BindCoreAction("ToggleInGameMenu", function(_, UserInputState, _) --[[ Line: 32 | Named "toggleMenuFunc" ]]
		-- upvalues: p1 (copy), PagesModule (upval), SetCurrentPageModule (upval), ConstantsModule (upval), OpenSystemMenuModule (upval), CloseMenuModule (upval)
		if UserInputState ~= Enum.UserInputState.Begin then return end
		local State = p1:getState()
		local IsMenuOpen = State.isMenuOpen
		local PagesByKeyEntry = PagesModule.pagesByKey[State.menuPage]
		
		if PagesByKeyEntry and PagesByKeyEntry.isModal then
			p1:dispatch(SetCurrentPageModule(ConstantsModule.defaultPageKey))
			
			return
		end
		if not IsMenuOpen then
			p1:dispatch(OpenSystemMenuModule(ConstantsModule.AnalyticsMenuOpenTypes.Keyboard))
			
			return
		end
		if State.menuPage == ConstantsModule.InitalPageKey then
			p1:dispatch(OpenSystemMenuModule(ConstantsModule.AnalyticsMenuOpenTypes.Keyboard))
			
			return
		else
			p1:dispatch(CloseMenuModule)
		end
	end, false, Enum.KeyCode.Escape)
	ContextActionService:BindCoreAction("ToggleDeveloperConsole", function(p2, UserInputState) --[[ Line: 59 ]]
		-- upvalues: DevConsoleMasterModule (upval)
		if p2 ~= "ToggleDeveloperConsole" then return end
		if UserInputState == Enum.UserInputState.Begin then
			DevConsoleMasterModule:ToggleVisibility()
			
			return
		end
	end, false, Enum.KeyCode.F9)
	ContextActionService:BindCoreAction("TogglePerformanceStats", function(p2, UserInputState) --[[ Line: 71 ]]
		-- upvalues: UserInputService (upval), UserGameSettings (upval)
		if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and not UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
			return Enum.ContextActionResult.Pass
		elseif p2 ~= "TogglePerformanceStats" then return end
		if UserInputState == Enum.UserInputState.Begin then
			UserGameSettings.PerformanceStatsVisible = not UserGameSettings.PerformanceStatsVisible
			
			return
		end
	end, false, Enum.KeyCode.F7)
	ContextActionService:BindCoreAction("LeaveGame", function(_, UserInputState, _) --[[ Line: 90 | Named "leaveGameFunc" ]]
		-- upvalues: p1 (copy), PagesModule (upval), SetCurrentPageModule (upval), ConstantsModule (upval)
		local State = p1:getState()
		
		if UserInputState ~= Enum.UserInputState.Begin or not State.isMenuOpen then
			return Enum.ContextActionResult.Pass
		elseif PagesModule.pagesByKey[State.menuPage].isModal then
			return Enum.ContextActionResult.Pass
		else
			p1:dispatch(SetCurrentPageModule(ConstantsModule.LeaveGamePromptPageKey))
			
			return Enum.ContextActionResult.Sink
		end
	end, false, Enum.KeyCode.L, Enum.KeyCode.ButtonX)
	ContextActionService:BindCoreAction("ResetCharacter", function(_, UserInputState, _) --[[ Line: 107 | Named "resetCharacterFunc" ]]
		-- upvalues: p1 (copy), PagesModule (upval), ConstantsModule (upval), SetRespawningModule (upval)
		local State = p1:getState()
		
		if UserInputState ~= Enum.UserInputState.Begin or not State.isMenuOpen then
			return Enum.ContextActionResult.Pass
		elseif not State.respawn.enabled then
			return Enum.ContextActionResult.Pass
		elseif PagesModule.pagesByKey[State.menuPage].isModal then
			return Enum.ContextActionResult.Pass
		elseif State.menuPage == ConstantsModule.InitalPageKey then
			return Enum.ContextActionResult.Pass
		else
			p1:dispatch(SetRespawningModule(true))
			
			return Enum.ContextActionResult.Sink
		end
	end, false, Enum.KeyCode.R, Enum.KeyCode.ButtonY)
	ContextActionService:BindCoreAction("NavigateBack", function(_, UserInputState, _) --[[ Line: 132 | Named "navigateBackFunc" ]]
		-- upvalues: p1 (copy), PagesModule (upval), DevConsoleMasterModule (upval), CloseMenuModule (upval), NavigateBackModule (upval)
		local State = p1:getState()
		local ParentPage = PagesModule.pagesByKey[State.menuPage].parentPage
		local Visibility = DevConsoleMasterModule:GetVisibility()
		
		if UserInputState ~= Enum.UserInputState.End or not State.isMenuOpen and not Visibility then
			return Enum.ContextActionResult.Pass
		end
		if Visibility then
			DevConsoleMasterModule:SetVisibility(false)
		elseif ParentPage == nil and not State.respawn.dialogOpen then
			p1:dispatch(CloseMenuModule)
		else
			p1:dispatch(NavigateBackModule())
		end
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.ButtonB)
	
	local function _(): boolean --[[ Line: 159 | Named "canBumperSwitch" ]]
		-- upvalues: p1 (copy)
		local State = p1:getState()
		
		return State.menuPage ~= "Controls" and (State.isMenuOpen and (not State.respawn.dialogOpen and (not State.report.dialogOpen and not State.report.reportSentOpen)))
	end
	
	ContextActionService:BindCoreAction("LeftBumperSwitchToZone0", function(_, UserInputState, _) --[[ Line: 169 ]]
		-- upvalues: p1 (copy), SetCurrentZoneModule (upval)
		if UserInputState == Enum.UserInputState.Begin then
			local State = p1:getState()
			
			if State.menuPage ~= "Controls" and (State.isMenuOpen and (not State.respawn.dialogOpen and (not State.report.dialogOpen and not State.report.reportSentOpen))) then
				p1:dispatch(SetCurrentZoneModule(0))
				
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonL1)
	ContextActionService:BindCoreAction("RightBumperSwitchToZone1", function(_, UserInputState, _) --[[ Line: 179 ]]
		-- upvalues: p1 (copy), SetCurrentZoneModule (upval)
		if UserInputState == Enum.UserInputState.Begin then
			local State = p1:getState()
			
			if State.menuPage ~= "Controls" and (State.isMenuOpen and (not State.respawn.dialogOpen and (not State.report.dialogOpen and not State.report.reportSentOpen))) then
				p1:dispatch(SetCurrentZoneModule(1))
				
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonR1)
end