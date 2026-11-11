local ExperienceSongsRodux = script:FindFirstAncestor("ExperienceSongsRodux")
local Parent = ExperienceSongsRodux.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local ApiFetchExperienceSongsModule = require(ExperienceSongsRodux.Thunks.ApiFetchExperienceSongs)
local ExperienceSongsReducerModule = require(ExperienceSongsRodux.Reducers.ExperienceSongsReducer)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), ExperienceSongsReducerModule (copy), ReactModule (copy), ApiFetchExperienceSongsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ExperienceSongsReducerModule (upval), p1 (copy)
		return p2.Personalization[ExperienceSongsReducerModule.key] and p2.Personalization[ExperienceSongsReducerModule.key][p1] or {}
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), ApiFetchExperienceSongsModule (upval), UseRoactServiceResult (copy), p1 (copy)
		UseDispatchResult(ApiFetchExperienceSongsModule.Fetch(UseRoactServiceResult, p1))
	end, { UseDispatchResult, UseRoactServiceResult, p1 })
	
	return { songIds = UseSelectorResult }
end