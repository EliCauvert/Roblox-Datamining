local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local TextService = game:GetService("TextService")
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput

return function(String1, X, p1)
	-- upvalues: UseTokensFunction (copy), UseIsSpatialFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ReactModule (copy), TextService (copy)
	local UseTokensResult = UseTokensFunction()
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	local UseIsSpatialResult = UseIsSpatialFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseIsSpatialResult1 = UseIsSpatialResult or IsUsePreferredInputResultMatch
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: String1 (copy), TextService (upval), BodyMedium (copy), UseIsSpatialResult1 (copy), X (copy), UseTokensResult (copy)
		local Y = TextService:GetTextSize(string.gsub(String1 or "", "[\r\n]+", " "), BodyMedium.FontSize, BodyMedium.Font, Vector2.new(1e999, 1e999)).Y
		local NewY = Y * ((if UseIsSpatialResult1 then 1.3 else 1) * BodyMedium.LineHeight) + Y
		
		if String1 and String1 ~= "" then
			local TextSize = TextService:GetTextSize(String1, BodyMedium.FontSize, BodyMedium.Font, Vector2.new(X, 1e999))
			local IsNewYBelow = NewY < TextSize.Y
			
			return if IsNewYBelow then NewY + Y + UseTokensResult.Gap.XSmall else TextSize.Y, NewY
		else
			return 0, NewY
		end
	end, {
		String1, BodyMedium.FontSize, BodyMedium.Font, X, p1, UseIsSpatialResult1,
		UseTokensResult.Gap.XSmall
	})
	
	return UseMemoResult, UseMemoResult2
end