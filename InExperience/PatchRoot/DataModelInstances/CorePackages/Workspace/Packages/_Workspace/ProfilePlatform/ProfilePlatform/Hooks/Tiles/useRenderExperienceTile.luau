local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local experienceTileModule = require(profilePlatform.BaseComponents.Tiles.ExperienceTile)
local _ = require(profilePlatform.Common.Types)

return function(p0, p1, p2, p3)
	-- upvalues: useDispatch (ref), useNavigation (ref), reactModule (ref), openGameDetails (ref), experienceTileModule (ref)
	local var3 = useDispatch()
	local var4 = useNavigation()
	p1 = p1 or "ProfileExperienceTile_"
	local var5 = reactModule.useCallback(function(p4, p5, p6)
		-- upvalues: p2 (ref), var3 (ref), openGameDetails (copy), var4 (ref)
		return function()
			-- upvalues: p2 (copy), p4 (ref), p5 (ref), p6 (ref), var3 (copy), openGameDetails (copy), var4 (copy)
			if p2 then
				p2(p4, p5, p6)
			end
			var3(openGameDetails(p4.experienceId, var4, { mountAsFullView = false, showBackButton = true }))
		end
	end, { p2, var3, var4 })
	
	return reactModule.useCallback(function(p7, p8, _, p9)
		-- upvalues: reactModule (copy), experienceTileModule (copy), var5 (ref), p0 (ref), p3 (ref), p1 (write)
		return reactModule.createElement(experienceTileModule, {
			item = p7,
			index = p8,
			onActivated = var5(p7, p8, p9),
			impressionsTag = p0,
			showFooter = p3
		}), `{p1}{p7.experienceId}_`
	end, { p0, var5, p1 })
end