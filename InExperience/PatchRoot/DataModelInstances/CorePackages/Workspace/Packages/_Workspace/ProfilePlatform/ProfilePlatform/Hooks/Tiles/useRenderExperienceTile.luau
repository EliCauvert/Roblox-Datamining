local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local experienceTileModule = require(profilePlatform.BaseComponents.Tiles.ExperienceTile)
local _ = require(profilePlatform.Common.Types)

return function(p1, p2, p3, p4)
	-- upvalues: useDispatch (ref), useNavigation (ref), reactModule (ref), openGameDetails (ref), experienceTileModule (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	p2 = p2 or "ProfileExperienceTile_"
	local var3 = reactModule.useCallback(function(p5, p6, p7)
		-- upvalues: p3 (ref), var1 (ref), openGameDetails (copy), var2 (ref)
		return function()
			-- upvalues: p3 (copy), p5 (ref), p6 (ref), p7 (ref), var1 (copy), openGameDetails (copy), var2 (copy)
			if p3 then
				p3(p5, p6, p7)
			end
			var1(openGameDetails(p5.experienceId, var2, { mountAsFullView = false, showBackButton = true }))
		end
	end, { p3, var1, var2 })
	
	return reactModule.useCallback(function(p5, p6, _, p7)
		-- upvalues: reactModule (copy), experienceTileModule (copy), var3 (ref), p1 (ref), p4 (ref), p2 (write)
		return reactModule.createElement(experienceTileModule, {
			item = p5,
			index = p6,
			onActivated = var3(p5, p6, p7),
			impressionsTag = p1,
			showFooter = p4
		}), `{p2}{p5.experienceId}_`
	end, { p1, var3, p2 })
end