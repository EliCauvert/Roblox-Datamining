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

return function(p1)
	-- upvalues: pagesModule (ref), setCurrentPageModule (ref), constantsModule (ref), openSystemMenuModule (ref), closeMenuModule (ref), contextActionService (ref), devConsoleMasterModule (ref), userInputService (ref), userGameSettingsService (ref), setRespawningModule (ref), navigateBackModule (ref), setCurrentZoneModule (ref)
	contextActionService:BindCoreAction("ToggleInGameMenu", function(_, p2, _)
		-- upvalues: p1 (ref), pagesModule (copy), setCurrentPageModule (copy), constantsModule (copy), openSystemMenuModule (copy), closeMenuModule (copy)
		if p2 ~= Enum.UserInputState.Begin then return end
		local state = p1:getState()
		local isMenuOpen = state.isMenuOpen
		local menuPage = pagesModule.pagesByKey[state.menuPage]
		
		if menuPage and menuPage.isModal then
			p1:dispatch(setCurrentPageModule(constantsModule.defaultPageKey))
			
			return
		elseif not isMenuOpen then
			p1:dispatch(openSystemMenuModule(constantsModule.AnalyticsMenuOpenTypes.Keyboard))
			
			return
		elseif state.menuPage == constantsModule.InitalPageKey then
			p1:dispatch(openSystemMenuModule(constantsModule.AnalyticsMenuOpenTypes.Keyboard))
			
			return
		end
		p1:dispatch(closeMenuModule)
	end, false, Enum.KeyCode.Escape)
	contextActionService:BindCoreAction("ToggleDeveloperConsole", function(p2, p3)
		-- upvalues: devConsoleMasterModule (copy)
		if p2 ~= "ToggleDeveloperConsole" then return end
		if p3 == Enum.UserInputState.Begin then
			devConsoleMasterModule:ToggleVisibility()
			
			return
		end
	end, false, Enum.KeyCode.F9)
	contextActionService:BindCoreAction("TogglePerformanceStats", function(p2, p3)
		-- upvalues: userInputService (copy), userGameSettingsService (copy)
		if not userInputService:IsKeyDown(Enum.KeyCode.LeftControl) and not userInputService:IsKeyDown(Enum.KeyCode.RightControl) then
			return Enum.ContextActionResult.Pass
		elseif p2 ~= "TogglePerformanceStats" then return end
		if p3 == Enum.UserInputState.Begin then
			userGameSettingsService.PerformanceStatsVisible = not userGameSettingsService.PerformanceStatsVisible
			
			return
		end
	end, false, Enum.KeyCode.F7)
	contextActionService:BindCoreAction("LeaveGame", function(_, p2, _)
		-- upvalues: p1 (ref), pagesModule (copy), setCurrentPageModule (copy), constantsModule (copy)
		local state = p1:getState()
		
		if p2 ~= Enum.UserInputState.Begin or not state.isMenuOpen then
			return Enum.ContextActionResult.Pass
		elseif pagesModule.pagesByKey[state.menuPage].isModal then
			return Enum.ContextActionResult.Pass
		end
		p1:dispatch(setCurrentPageModule(constantsModule.LeaveGamePromptPageKey))
		
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.L, Enum.KeyCode.ButtonX)
	contextActionService:BindCoreAction("ResetCharacter", function(_, p2, _)
		-- upvalues: p1 (ref), pagesModule (copy), constantsModule (copy), setRespawningModule (copy)
		local state = p1:getState()
		
		if p2 ~= Enum.UserInputState.Begin or not state.isMenuOpen then
			return Enum.ContextActionResult.Pass
		elseif not state.respawn.enabled then
			return Enum.ContextActionResult.Pass
		elseif pagesModule.pagesByKey[state.menuPage].isModal then
			return Enum.ContextActionResult.Pass
		elseif state.menuPage == constantsModule.InitalPageKey then
			return Enum.ContextActionResult.Pass
		end
		p1:dispatch(setRespawningModule(true))
		
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.R, Enum.KeyCode.ButtonY)
	contextActionService:BindCoreAction("NavigateBack", function(_, p2, _)
		-- upvalues: p1 (ref), pagesModule (copy), devConsoleMasterModule (copy), closeMenuModule (copy), navigateBackModule (copy)
		local state = p1:getState()
		local parentPage = pagesModule.pagesByKey[state.menuPage].parentPage
		local visibility = devConsoleMasterModule:GetVisibility()
		
		if p2 ~= Enum.UserInputState.End or not state.isMenuOpen and not visibility then
			return Enum.ContextActionResult.Pass
		elseif visibility then
			devConsoleMasterModule:SetVisibility(false)
		elseif parentPage == nil and not state.respawn.dialogOpen then
			p1:dispatch(closeMenuModule)
		else
			p1:dispatch(navigateBackModule())
		end
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.ButtonB)
	
	local function _()
		-- upvalues: p1 (ref)
		local state = p1:getState()
		
		return state.menuPage ~= "Controls" and (state.isMenuOpen and (not state.respawn.dialogOpen and (not state.report.dialogOpen and not state.report.reportSentOpen)))
	end
	
	contextActionService:BindCoreAction("LeftBumperSwitchToZone0", function(_, p2, _)
		-- upvalues: p1 (ref), setCurrentZoneModule (copy)
		if p2 == Enum.UserInputState.Begin then
			local state = p1:getState()
			
			if state.menuPage ~= "Controls" and (state.isMenuOpen and (not state.respawn.dialogOpen and (not state.report.dialogOpen and not state.report.reportSentOpen))) then
				p1:dispatch(setCurrentZoneModule(0))
				
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonL1)
	contextActionService:BindCoreAction("RightBumperSwitchToZone1", function(_, p2, _)
		-- upvalues: p1 (ref), setCurrentZoneModule (copy)
		if p2 == Enum.UserInputState.Begin then
			local state = p1:getState()
			
			if state.menuPage ~= "Controls" and (state.isMenuOpen and (not state.respawn.dialogOpen and (not state.report.dialogOpen and not state.report.reportSentOpen))) then
				p1:dispatch(setCurrentZoneModule(1))
				
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonR1)
end