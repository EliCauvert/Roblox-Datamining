local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local ResponsiveModule = require(Parent.Responsive)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local FFlagProfilePlatformFixBioTruncationModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFixBioTruncation)

return function(p1, X, p2)
	-- upvalues: UseTokensFunction (copy), UseIsSpatialFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ReactModule (copy), GetTextSizeFunction (copy), FFlagProfilePlatformFixBioTruncationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	local UseIsSpatialResult = UseIsSpatialFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseIsSpatialResult1 = UseIsSpatialResult or IsUsePreferredInputResultMatch
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GetTextSizeFunction (upval), BodyMedium (copy), UseIsSpatialResult1 (copy), FFlagProfilePlatformFixBioTruncationModule (upval), X (copy), UseTokensResult (copy)
		local Y = GetTextSizeFunction(string.gsub(p1 or "", "[\r\n]+", " "), BodyMedium.FontSize, BodyMedium.Font, Vector2.new(1e999, 1e999), { addTemporaryPadding = false }).Y
		local ScaledLineHeight = (if UseIsSpatialResult1 then 1.3 else 1) * BodyMedium.LineHeight
		local ScaledFontSize = if FFlagProfilePlatformFixBioTruncationModule then BodyMedium.FontSize * ScaledLineHeight * 2 else Y * ScaledLineHeight + Y
		
		if p1 and p1 ~= "" then
			local TextSize = GetTextSizeFunction(p1, BodyMedium.FontSize, BodyMedium.Font, Vector2.new(X, 1e999), { addTemporaryPadding = false })
			local IsScaledFontSizeBelow = ScaledFontSize < TextSize.Y
			
			return if IsScaledFontSizeBelow then ScaledFontSize + Y + UseTokensResult.Gap.XSmall else TextSize.Y, ScaledFontSize
		else
			return 0, ScaledFontSize
		end
	end, {
		p1, BodyMedium.FontSize, BodyMedium.Font,
		if FFlagProfilePlatformFixBioTruncationModule then BodyMedium.LineHeight else nil,
		X, p2, UseIsSpatialResult1, UseTokensResult.Gap.XSmall
	})
	
	return UseMemoResult, UseMemoResult2
end