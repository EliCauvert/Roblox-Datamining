local TextService = game:GetService("TextService")
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ResponsiveModule = require(Parent.Responsive)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local FFlagProfilePlatformFixBioTruncationModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFixBioTruncation)

return function(String1, X, p1) --[[ Line: 15 ]]
	-- upvalues: UseTokensFunction (copy), UseIsSpatialFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ReactModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), FFlagProfilePlatformFixBioTruncationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	local UseIsSpatialResult = UseIsSpatialFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseIsSpatialResult1 = UseIsSpatialResult or IsUsePreferredInputResultMatch
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 23 ]]
		-- upvalues: String1 (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), BodyMedium (copy), TextService (upval), UseIsSpatialResult1 (copy), FFlagProfilePlatformFixBioTruncationModule (upval), X (copy), UseTokensResult (copy)
		local Replaced = string.gsub(String1 or "", "[\r\n]+", " ")
		local Y = if FoundationFontFaceMigration then GetTextSizeFunction(Replaced, BodyMedium.FontSize, BodyMedium.Font, Vector2.new(1e999, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(Replaced, BodyMedium.FontSize, BodyMedium.Font, Vector2.new(1e999, 1e999)).Y
		local ScaledLineHeight = (if UseIsSpatialResult1 then 1.3 else 1) * BodyMedium.LineHeight
		local ScaledFontSize = if FFlagProfilePlatformFixBioTruncationModule then BodyMedium.FontSize * ScaledLineHeight * 2 else Y * ScaledLineHeight + Y
		
		if String1 and String1 ~= "" then
			local TextSize = if FoundationFontFaceMigration then GetTextSizeFunction(String1, BodyMedium.FontSize, BodyMedium.Font, Vector2.new(X, 1e999), { addTemporaryPadding = false }) else TextService:GetTextSize(String1, BodyMedium.FontSize, BodyMedium.Font, Vector2.new(X, 1e999))
			local IsScaledFontSizeBelow = ScaledFontSize < TextSize.Y
			
			return if IsScaledFontSizeBelow then ScaledFontSize + Y + UseTokensResult.Gap.XSmall else TextSize.Y, ScaledFontSize
		else
			return 0, ScaledFontSize
		end
	end, {
		String1, BodyMedium.FontSize, BodyMedium.Font,
		if FFlagProfilePlatformFixBioTruncationModule then BodyMedium.LineHeight else nil,
		X, p1, UseIsSpatialResult1, UseTokensResult.Gap.XSmall
	})
	
	return UseMemoResult, UseMemoResult2
end