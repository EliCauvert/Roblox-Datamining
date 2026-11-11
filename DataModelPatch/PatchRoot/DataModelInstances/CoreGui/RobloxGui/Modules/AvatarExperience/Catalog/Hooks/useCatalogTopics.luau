local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local FetchTopicsModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchTopics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local _ = require(CorePackages.Workspace.Packages.Http)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AXGetTopicsExpirationSeconds = game:DefineFastInt("AXGetTopicsExpirationSeconds", 600)
local list = {
	"____",
	"______",
	"_____",
	"___",
	"_________"
}

local function useCachedTopics(p1, p2, p3)
	-- upvalues: CatalogUtilsModule (copy), ReactModule (copy), AXGetTopicsExpirationSeconds (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy)
	local TopicRequestKey = CatalogUtilsModule.getTopicRequestKey(p1, p2, p3)
	
	return UseSelectorFunction(ReactModule.useCallback(function(p4)
		-- upvalues: TopicRequestKey (copy), AXGetTopicsExpirationSeconds (upval)
		return if (p4.AvatarExperience.Catalog.TopicsFetchTimes[TopicRequestKey] or 0) + AXGetTopicsExpirationSeconds <= tick() then nil else p4.AvatarExperience.Catalog.Topics[TopicRequestKey]
	end, { TopicRequestKey }), GetUseSelectorDeepEqualsFunction())
end

return function(p1, p2, p3)
	-- upvalues: UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseDispatchFunction (copy), ReactModule (copy), list (copy), useCachedTopics (copy), FetchTopicsModule (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(list)
	local UseCachedTopicsResult = useCachedTopics(p1, p2, p3)
	local NoUseCachedTopicsResult = UseCachedTopicsResult == nil
	
	if UseCachedTopicsResult ~= nil and UseCachedTopicsResult ~= UseStateResult then
		UseStateResult2(UseCachedTopicsResult)
	end
	ReactModule.useEffect(function()
		-- upvalues: UseCachedTopicsResult (copy), UseDispatchResult (copy), FetchTopicsModule (upval), UseRoactServiceModuleResult (copy), p1 (copy), p2 (copy), p3 (copy)
		if UseCachedTopicsResult == nil then
			UseDispatchResult(FetchTopicsModule(UseRoactServiceModuleResult, p1, p2, p3))
		end
	end, { UseCachedTopicsResult, p1, p2, p3 })
	
	return UseCachedTopicsResult or UseStateResult, NoUseCachedTopicsResult
end