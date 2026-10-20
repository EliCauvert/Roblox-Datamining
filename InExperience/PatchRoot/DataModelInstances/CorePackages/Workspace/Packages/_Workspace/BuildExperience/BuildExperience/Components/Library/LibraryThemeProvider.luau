local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseSelectedThemeFunction = require(Parent.RoactUtils).Hooks.useSelectedTheme
local UserGameSettings = UserSettings():GetService("UserGameSettings")

local function useReducedMotion()
	-- upvalues: ReactModule (copy), UserGameSettings (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserGameSettings.ReducedMotion)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UserGameSettings (upval)
		UseStateResult2(UserGameSettings.ReducedMotion)
		local Connection = UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserGameSettings (upval)
			UseStateResult2(UserGameSettings.ReducedMotion)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end

return function(p1)
	-- upvalues: UseSelectedThemeFunction (copy), useReducedMotion (copy), ReactModule (copy), FoundationModule (copy)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	
	return ReactModule.createElement(FoundationModule.FoundationProvider, {
		colorMode = if UseSelectedThemeResult == "light" then FoundationModule.Enums.ColorMode.Light else FoundationModule.Enums.ColorMode.Dark,
		overlayGui = { DisplayOrder = p1.displayOrder },
		preferences = { reducedMotion = useReducedMotion() }
	}, p1.children)
end