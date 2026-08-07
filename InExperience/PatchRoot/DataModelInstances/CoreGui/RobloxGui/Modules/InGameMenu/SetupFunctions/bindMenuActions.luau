local coreGuiService = game:GetService("CoreGui")
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local devConsoleMasterModule = require(coreGuiService.RobloxGui.Modules.DevConsoleMaster)
local parent = script.Parent.Parent
local openSystemMenuModule = require(parent.Thunks.OpenSystemMenu)
local closeMenuModule = require(parent.Thunks.CloseMenu)
local setRespawningModule = require(parent.Actions.SetRespawning)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local navigateBackModule = require(parent.Actions.NavigateBack)
local setCurrentZoneModule = require(parent.Actions.SetCurrentZone)
local pagesModule = require(parent.Components.Pages)
local constantsModule = require(parent.Resources.Constants)

return function(p0) --[[ line: 31 | named "bindMenuActions" ]]
	-- upvalues: pagesModule (ref), setCurrentPageModule (ref), constantsModule (ref), openSystemMenuModule (ref), closeMenuModule (ref), contextActionService (ref), devConsoleMasterModule (ref), userInputService (ref), userGameSettingsService (ref), setRespawningModule (ref), navigateBackModule (ref), setCurrentZoneModule (ref)
	contextActionService:BindCoreAction("ToggleInGameMenu", function(_, p1, _) --[[ line: 32 | named "toggleMenuFunc" ]]
		-- upvalues: p0 (ref), pagesModule (copy), setCurrentPageModule (copy), constantsModule (copy), openSystemMenuModule (copy), closeMenuModule (copy)
		if p1 ~= Enum.UserInputState.Begin then return end
		local state = p0:getState()
		local isMenuOpen = state.isMenuOpen
		local menuPage = pagesModule.pagesByKey[state.menuPage]
		
		if menuPage and menuPage.isModal then
			p0:dispatch(setCurrentPageModule(constantsModule.defaultPageKey))
			
			return
		elseif not isMenuOpen then
			p0:dispatch(openSystemMenuModule(constantsModule.AnalyticsMenuOpenTypes.Keyboard))
			
			return
		elseif state.menuPage == constantsModule.InitalPageKey then
			p0:dispatch(openSystemMenuModule(constantsModule.AnalyticsMenuOpenTypes.Keyboard))
			
			return
		end
		p0:dispatch(closeMenuModule)
	end, false, Enum.KeyCode.Escape)
	contextActionService:BindCoreAction("ToggleDeveloperConsole", function(p2, p3) --[[ line: 59 ]]
		-- upvalues: devConsoleMasterModule (copy)
		if p2 ~= "ToggleDeveloperConsole" then return end
		if p3 == Enum.UserInputState.Begin then
			devConsoleMasterModule:ToggleVisibility()
			
			return
		end
	end, false, Enum.KeyCode.F9)
	contextActionService:BindCoreAction("TogglePerformanceStats", function(p4, p5) --[[ line: 71 ]]
		-- upvalues: userInputService (copy), userGameSettingsService (copy)
		if not userInputService:IsKeyDown(Enum.KeyCode.LeftControl) and not userInputService:IsKeyDown(Enum.KeyCode.RightControl) then
			return Enum.ContextActionResult.Pass
		elseif p4 ~= "TogglePerformanceStats" then return end
		if p5 == Enum.UserInputState.Begin then
			userGameSettingsService.PerformanceStatsVisible = not userGameSettingsService.PerformanceStatsVisible
			
			return
		end
	end, false, Enum.KeyCode.F7)
	contextActionService:BindCoreAction("LeaveGame", function(_, p6, _) --[[ line: 90 | named "leaveGameFunc" ]]
		-- upvalues: p0 (ref), pagesModule (copy), setCurrentPageModule (copy), constantsModule (copy)
		local state = p0:getState()
		
		if p6 ~= Enum.UserInputState.Begin or not state.isMenuOpen then
			return Enum.ContextActionResult.Pass
		elseif pagesModule.pagesByKey[state.menuPage].isModal then
			return Enum.ContextActionResult.Pass
		end
		p0:dispatch(setCurrentPageModule(constantsModule.LeaveGamePromptPageKey))
		
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.L, Enum.KeyCode.ButtonX)
	contextActionService:BindCoreAction("ResetCharacter", function(_, p7, _) --[[ line: 107 | named "resetCharacterFunc" ]]
		-- upvalues: p0 (ref), pagesModule (copy), constantsModule (copy), setRespawningModule (copy)
		local state = p0:getState()
		
		if p7 ~= Enum.UserInputState.Begin or not state.isMenuOpen then
			return Enum.ContextActionResult.Pass
		elseif not state.respawn.enabled then
			return Enum.ContextActionResult.Pass
		elseif pagesModule.pagesByKey[state.menuPage].isModal then
			return Enum.ContextActionResult.Pass
		elseif state.menuPage == constantsModule.InitalPageKey then
			return Enum.ContextActionResult.Pass
		end
		p0:dispatch(setRespawningModule(true))
		
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.R, Enum.KeyCode.ButtonY)
	contextActionService:BindCoreAction("NavigateBack", function(_, p8, _) --[[ line: 132 | named "navigateBackFunc" ]]
		-- upvalues: p0 (ref), pagesModule (copy), devConsoleMasterModule (copy), closeMenuModule (copy), navigateBackModule (copy)
		local state = p0:getState()
		local parentPage = pagesModule.pagesByKey[state.menuPage].parentPage
		local visibility = devConsoleMasterModule:GetVisibility()
		
		if p8 ~= Enum.UserInputState.End or not state.isMenuOpen and not visibility then
			return Enum.ContextActionResult.Pass
		elseif visibility then
			devConsoleMasterModule:SetVisibility(false)
		elseif parentPage == nil and not state.respawn.dialogOpen then
			p0:dispatch(closeMenuModule)
		else
			p0:dispatch(navigateBackModule())
		end
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.ButtonB)
	
	local function _() --[[ line: 159 | named "canBumperSwitch" ]]
		-- upvalues: p0 (ref)
		local state = p0:getState()
		
		return state.menuPage ~= "Controls" and (state.isMenuOpen and (not state.respawn.dialogOpen and (not state.report.dialogOpen and not state.report.reportSentOpen)))
	end
	
	contextActionService:BindCoreAction("LeftBumperSwitchToZone0", function(_, p9, _) --[[ line: 169 ]]
		-- upvalues: p0 (ref), setCurrentZoneModule (copy)
		if p9 == Enum.UserInputState.Begin then
			local state = p0:getState()
			
			if state.menuPage ~= "Controls" and (state.isMenuOpen and (not state.respawn.dialogOpen and (not state.report.dialogOpen and not state.report.reportSentOpen))) then
				p0:dispatch(setCurrentZoneModule(0))
				
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonL1)
	contextActionService:BindCoreAction("RightBumperSwitchToZone1", function(_, p10, _) --[[ line: 179 ]]
		-- upvalues: p0 (ref), setCurrentZoneModule (copy)
		if p10 == Enum.UserInputState.Begin then
			local state = p0:getState()
			
			if state.menuPage ~= "Controls" and (state.isMenuOpen and (not state.respawn.dialogOpen and (not state.report.dialogOpen and not state.report.reportSentOpen))) then
				p0:dispatch(setCurrentZoneModule(1))
				
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonR1)
end