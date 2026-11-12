local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local _ = require(Foundation.Components.Types)
local GetTextBoundsAsyncModule = require(Foundation.Utility.getTextBoundsAsync)
local NormalizeFontFaceModule = require(Foundation.Utility.normalizeFontFace)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)

return function(p1, p2, p3)
	-- upvalues: UsePreferencesModule (copy), NormalizeFontFaceModule (copy), ReactUtilsModule (copy), GetTextBoundsAsyncModule (copy), ReactModule (copy)
	local PreferredTextSize = UsePreferencesModule().preferredTextSize
	local NormalizeFontFaceModuleResult = NormalizeFontFaceModule(p2.Font)
	local FontSize = p2.FontSize
	local UseAsyncResult = ReactUtilsModule.useAsync(function()
		-- upvalues: p1 (copy), FontSize (copy), NormalizeFontFaceModuleResult (copy), GetTextBoundsAsyncModule (upval), p3 (copy)
		return if p1 == nil or FontSize == nil or typeof(NormalizeFontFaceModuleResult) ~= "Font" then nil else GetTextBoundsAsyncModule(p1, NormalizeFontFaceModuleResult, FontSize, if p3 then p3.X else nil)
	end, {
		p1,
		p2.Font,
		FontSize,
		p3,
		PreferredTextSize
	})
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseAsyncResult (copy), UseRefResult (copy)
		if UseAsyncResult.status == "ok" then
			UseRefResult.current = UseAsyncResult.value
		end
	end, { UseAsyncResult })
	
	return if UseAsyncResult.status == "ok" then UseAsyncResult.value else UseRefResult.current
end