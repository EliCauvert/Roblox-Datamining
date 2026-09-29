local textService = game:GetService("TextService")
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local getTextSize = require(parent.Style).GetTextSize
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local responsiveModule = require(parent.Responsive)
local useTokens = foundationModule.Hooks.useTokens
local useIsSpatial = responsiveModule.useIsSpatial
local usePreferredInput = responsiveModule.usePreferredInput
local fFlagProfilePlatformFixBioTruncationModule = require(profilePlatform.Flags.FFlagProfilePlatformFixBioTruncation)

return function(p1, p2, p3)
	-- upvalues: useTokens (ref), useIsSpatial (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), foundationFontFaceMigration (ref), getTextSize (ref), textService (ref), fFlagProfilePlatformFixBioTruncationModule (ref)
	local var1 = useTokens()
	local bodyMedium = var1.Typography.BodyMedium
	local var2 = useIsSpatial() or usePreferredInput() == responsiveModule.Input.Directional
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), foundationFontFaceMigration (copy), getTextSize (copy), bodyMedium (ref), textService (copy), var2 (ref), fFlagProfilePlatformFixBioTruncationModule (copy), p2 (ref), var1 (ref)
		local replaced = string.gsub(p1 or "", "[\r\n]+", " ")
		local var5 = if foundationFontFaceMigration then getTextSize(replaced, bodyMedium.FontSize, bodyMedium.Font, Vector2.new(1e999, 1e999), { addTemporaryPadding = false }).Y else textService:GetTextSize(replaced, bodyMedium.FontSize, bodyMedium.Font, Vector2.new(1e999, 1e999)).Y
		local var6 = (if var2 then 1.3 else 1) * bodyMedium.LineHeight
		local var7 = if fFlagProfilePlatformFixBioTruncationModule then bodyMedium.FontSize * var6 * 2 else var5 * var6 + var5
		
		if p1 and p1 ~= "" then
			local var8 = if foundationFontFaceMigration then getTextSize(p1, bodyMedium.FontSize, bodyMedium.Font, Vector2.new(p2, 1e999), { addTemporaryPadding = false }) else textService:GetTextSize(p1, bodyMedium.FontSize, bodyMedium.Font, Vector2.new(p2, 1e999))
			
			return if var7 < var8.Y then var7 + var5 + var1.Gap.XSmall else var8.Y, var7
		end
		return 0, var7
	end, {
		p1, bodyMedium.FontSize, bodyMedium.Font,
		if fFlagProfilePlatformFixBioTruncationModule then bodyMedium.LineHeight else nil,
		p2, p3, var2, var1.Gap.XSmall
	})
	
	return var3, var4
end