local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local FetchHydratedWidgetContentModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchHydratedWidgetContent)
local GetContentToHyderateModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getContentToHyderate)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), ReactModule (copy), RetrievalStatusModule (copy), GetContentToHyderateModule (copy), WidgetConstants (copy), FetchHydratedWidgetContentModule (copy)
	local WidgetInfo = p1.widgetInfo
	local HydratedWidgetData = p1.hydratedWidgetData
	local HydrationCount = p1.hydrationCount
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(RetrievalStatusModule.NotStarted)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetContentToHyderateModule (upval), WidgetInfo (copy), HydratedWidgetData (copy), HydrationCount (copy)
		return GetContentToHyderateModule(WidgetInfo, HydratedWidgetData, HydrationCount)
	end, { HydratedWidgetData, WidgetInfo, HydrationCount })
	ReactModule.useEffect(function()
		-- upvalues: WidgetInfo (copy), WidgetConstants (upval), UseMemoResult (copy), UseStateResult (copy), RetrievalStatusModule (upval), UseStateResult2 (copy), UseDispatchResult (copy), FetchHydratedWidgetContentModule (upval), UseRoactServiceModuleResult (copy)
		if WidgetInfo.type ~= WidgetConstants.Types.MySharedAvatarsWidget and UseMemoResult and #UseMemoResult > 0 and UseStateResult == RetrievalStatusModule.NotStarted then
			UseStateResult2(RetrievalStatusModule.Fetching)
			UseDispatchResult(FetchHydratedWidgetContentModule(UseRoactServiceModuleResult, UseMemoResult, WidgetInfo.id))
		end
	end, {
		UseMemoResult,
		WidgetInfo,
		UseStateResult,
		UseDispatchResult,
		UseRoactServiceModuleResult
	})
end