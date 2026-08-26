local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local textService = require(foundation.Utility.Wrappers.Services).TextService

return function(value, p1, p2)
	-- upvalues: reactModule (ref), usePreferencesModule (ref), textService (ref)
	local var1, var2 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var2 (ref), textService (copy), p1 (ref), p2 (ref)
		if value == nil then
			var2(nil)
			
			return
		end
		var2(textService:GetTextSize(value, p1.FontSize, p1.Font, p2 or Vector2.new(1e999, 1e999)))
	end, { value, p1, p2, usePreferencesModule().preferredTextSize })
	
	return var1
end