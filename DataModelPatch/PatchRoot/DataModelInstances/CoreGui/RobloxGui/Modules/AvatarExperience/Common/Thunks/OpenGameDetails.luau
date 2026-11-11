local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local SetGameDetailsPeekViewStateModule = require(Modules.LuaApp.Actions.Games.SetGameDetailsPeekViewState)
local OpenGameDetailsModule = require(Modules.LuaApp.Thunks.OpenGameDetails)
local UseGameDetailsPeekViewModule = require(Modules.LuaApp.Flags.UseGameDetailsPeekView)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local SetItemDetailsExpandedModule = require(Modules.AvatarExperience.Common.Actions.SetItemDetailsExpanded)

local function openBriefGameDetailsPeekView(p1, p2, p3)
	-- upvalues: SetGameDetailsPeekViewStateModule (copy), PeekViewState (copy), SetItemDetailsExpandedModule (copy), NavigationUtilsModule (copy)
	p1:dispatch(SetGameDetailsPeekViewStateModule(PeekViewState.Closed))
	p1:dispatch(SetItemDetailsExpandedModule(true))
	NavigationUtilsModule.closeFiltersAndItemDetails(p2)
	NavigationUtilsModule.closeAllDialogs(p2)
	p2.navigate(p3.name, p3)
end

return function(p1, p2, ExtraProps)
	-- upvalues: AppPageModule (copy), FormFactor (copy), UseGameDetailsPeekViewModule (copy), PeekViewState (copy), OpenGameDetailsModule (copy), openBriefGameDetailsPeekView (copy)
	return function(p3)
		-- upvalues: AppPageModule (upval), p1 (copy), ExtraProps (copy), FormFactor (upval), UseGameDetailsPeekViewModule (upval), PeekViewState (upval), OpenGameDetailsModule (upval), openBriefGameDetailsPeekView (upval), p2 (copy)
		local config = {
			name = AppPageModule.GameDetail,
			detail = tostring(p1),
			extraProps = ExtraProps
		}
		local State = p3:getState()
		local ViewState = State.GameDetailsPeekView.viewState
		
		if State.FormFactor ~= FormFactor.COMPACT or not UseGameDetailsPeekViewModule() then
			p3:dispatch(OpenGameDetailsModule(p1, ExtraProps))
			
			return
		end
		if ViewState == PeekViewState.Full or ViewState == PeekViewState.Extended or ExtraProps and ExtraProps.mountAsFullView then
			p3:dispatch(OpenGameDetailsModule(p1, ExtraProps))
			
			return
		else
			openBriefGameDetailsPeekView(p3, p2, config)
		end
	end
end