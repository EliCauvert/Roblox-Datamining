local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useSelectedTheme = require(parent.RoactUtils).Hooks.useSelectedTheme
local userGameSettingsService = UserSettings():GetService("UserGameSettings")

local function useReducedMotion()
	-- upvalues: reactModule (ref), userGameSettingsService (ref)
	local var1, var2 = reactModule.useState(userGameSettingsService.ReducedMotion)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), userGameSettingsService (copy)
		var2(userGameSettingsService.ReducedMotion)
		local var3 = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
			-- upvalues: var2 (copy), userGameSettingsService (copy)
			var2(userGameSettingsService.ReducedMotion)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return var1
end

return function(p1)
	-- upvalues: useSelectedTheme (ref), useReducedMotion (ref), reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.FoundationProvider, {
		colorMode = if useSelectedTheme() == "light" then foundationModule.Enums.ColorMode.Light else foundationModule.Enums.ColorMode.Dark,
		overlayGui = { DisplayOrder = p1.displayOrder },
		preferences = { reducedMotion = useReducedMotion() }
	}, p1.children)
end