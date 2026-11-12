local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local _ = require(Foundation.Components.Types)
local FlagsModule = require(Foundation.Utility.Flags)
local GetTextBoundsAsyncModule = require(Foundation.Utility.getTextBoundsAsync)
local NormalizeFontFaceModule = require(Foundation.Utility.normalizeFontFace)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local TextService = require(Foundation.Utility.Wrappers.Services).TextService

return function(String, p1, p2)
	-- upvalues: FlagsModule (copy), UsePreferencesModule (copy), NormalizeFontFaceModule (copy), ReactUtilsModule (copy), GetTextBoundsAsyncModule (copy), ReactModule (copy), TextService (copy)
	if FlagsModule.FoundationFontFaceMigration then
		local PreferredTextSize = UsePreferencesModule().preferredTextSize
		local NormalizeFontFaceModuleResult = NormalizeFontFaceModule(p1.Font)
		local FontSize = p1.FontSize
		local UseAsyncResult = ReactUtilsModule.useAsync(function()
			-- upvalues: String (copy), FontSize (copy), NormalizeFontFaceModuleResult (copy), GetTextBoundsAsyncModule (upval), p2 (copy)
			return if String == nil or FontSize == nil or typeof(NormalizeFontFaceModuleResult) ~= "Font" then nil else GetTextBoundsAsyncModule(String, NormalizeFontFaceModuleResult, FontSize, if p2 then p2.X else nil)
		end, {
			String,
			p1.Font,
			FontSize,
			p2,
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
	else
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
end