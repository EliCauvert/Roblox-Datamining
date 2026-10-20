local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local _ = require(Parent.GameTile)
local Modules = DiscoveryMonolith.Modules
local GameGridModule = require(Modules.LuaApp.Components.Games.GameGrid)
local GameGridTableModule = require(Modules.LuaApp.Components.Games.GameGridTable)
local FFlagLuaAppEnableGameGridTableModule = require(Modules.LuaApp.Flags.FFlagLuaAppEnableGameGridTable)
local list = { AppUserLayers.GridUILayer }

local function v10(p1)
	-- upvalues: AppUserLayers (copy)
	return (p1[AppUserLayers.GridUILayer] or {}).IsGameGridDesktopRefreshEnabled or false
end

return function(Frame)
	-- upvalues: UseAppPolicyFunction (copy), FFlagLuaAppEnableGameGridTableModule (copy), UseUserExperimentFunction (copy), list (copy), v10 (copy), ReactModule (copy), GameGridTableModule (copy), GameGridModule (copy)
	local CurrentSidePadding = Frame.currentSidePadding or 0
	local UseUserExperimentResult = if FFlagLuaAppEnableGameGridTableModule then true else UseUserExperimentFunction(list, v10)
	
	return if UseAppPolicyFunction(function(p1)
		return p1.useGridPageLayout()
	end) and UseUserExperimentResult then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(-CurrentSidePadding, 0),
		Size = UDim2.new(1, CurrentSidePadding * 2, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Layout = ReactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
		GridTable = ReactModule.createElement(GameGridTableModule, Frame)
	}) else ReactModule.createElement(GameGridModule, Frame)
end