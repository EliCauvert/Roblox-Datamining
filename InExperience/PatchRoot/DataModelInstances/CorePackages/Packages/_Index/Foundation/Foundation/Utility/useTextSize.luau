local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local _ = require(foundation.Components.Types)
local flagsModule = require(foundation.Utility.Flags)
local getTextBoundsAsyncModule = require(foundation.Utility.getTextBoundsAsync)
local normalizeFontFaceModule = require(foundation.Utility.normalizeFontFace)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local textService = require(foundation.Utility.Wrappers.Services).TextService

return function(value, p1, p2)
	-- upvalues: flagsModule (ref), usePreferencesModule (ref), normalizeFontFaceModule (ref), reactUtilsModule (ref), getTextBoundsAsyncModule (ref), reactModule (ref), textService (ref)
	if not flagsModule.FoundationFontFaceMigration then
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
	local preferredTextSize = usePreferencesModule().preferredTextSize
	local var3 = normalizeFontFaceModule(p1.Font)
	local fontSize = p1.FontSize
	local var4 = reactUtilsModule.useAsync(function()
		-- upvalues: value (ref), fontSize (ref), var3 (ref), getTextBoundsAsyncModule (copy), p2 (ref)
		return if value == nil or fontSize == nil or typeof(var3) ~= "Font" then nil else getTextBoundsAsyncModule(value, var3, fontSize, if p2 then p2.X else nil)
	end, {
		value,
		p1.Font,
		fontSize,
		p2,
		preferredTextSize
	})
	local var5 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref)
		if var4.status == "ok" then
			var5.current = var4.value
		end
	end, { var4 })
	
	return if var4.status == "ok" then var4.value else var5.current
end