local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local TextService = require(Foundation.Utility.Wrappers.Services).TextService

return function(String, p1, p2)
	-- upvalues: ReactModule (copy), UsePreferencesModule (copy), TextService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: String (copy), UseStateResult2 (copy), TextService (upval), p1 (copy), p2 (copy)
		if String == nil then
			UseStateResult2(nil)
			
			return
		else
			UseStateResult2(TextService:GetTextSize(String, p1.FontSize, p1.Font, if p2 then p2 else Vector2.new(1e999, 1e999)))
		end
	end, { String, p1, p2, UsePreferencesModule().preferredTextSize })
	
	return UseStateResult
end