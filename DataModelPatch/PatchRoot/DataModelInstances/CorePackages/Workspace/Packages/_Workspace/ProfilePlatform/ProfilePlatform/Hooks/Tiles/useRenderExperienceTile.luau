local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local ExperienceTileModule = require(ProfilePlatform.BaseComponents.Tiles.ExperienceTile)
local _ = require(ProfilePlatform.Common.Types)

return function(ImpressionsTag, p1, Callback, ShowFooter)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), ReactModule (copy), OpenGameDetailsFunction (copy), ExperienceTileModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local P1 = p1 or "ProfileExperienceTile_"
	local UseResult = ReactModule.useCallback(function(p2, p3, p4)
		-- upvalues: Callback (copy), UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseNavigationResult (copy)
		return function()
			-- upvalues: Callback (upval), p2 (copy), p3 (copy), p4 (copy), UseDispatchResult (upval), OpenGameDetailsFunction (upval), UseNavigationResult (upval)
			if Callback then
				Callback(p2, p3, p4)
			end
			UseDispatchResult(OpenGameDetailsFunction(p2.experienceId, UseNavigationResult, { mountAsFullView = false, showBackButton = true }))
		end
	end, { Callback, UseDispatchResult, UseNavigationResult })
	
	return (ReactModule.useCallback(function(Item, Index, _, p2)
		-- upvalues: ReactModule (upval), ExperienceTileModule (upval), UseResult (copy), ImpressionsTag (copy), ShowFooter (copy), P1 (ref)
		return ReactModule.createElement(ExperienceTileModule, {
			item = Item,
			index = Index,
			onActivated = UseResult(Item, Index, p2),
			impressionsTag = ImpressionsTag,
			showFooter = ShowFooter
		}), `{P1}{Item.experienceId}_`
	end, { ImpressionsTag, UseResult, P1 }))
end