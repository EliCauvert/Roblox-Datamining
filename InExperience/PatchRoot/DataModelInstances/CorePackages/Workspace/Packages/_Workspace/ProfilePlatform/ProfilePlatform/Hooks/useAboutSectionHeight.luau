local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local textService = game:GetService("TextService")
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useIsSpatial = responsiveModule.useIsSpatial
local usePreferredInput = responsiveModule.usePreferredInput

return function(p0, p1, p2) --[[ line: 11 ]]
	-- upvalues: useTokens (ref), useIsSpatial (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), textService (ref)
	local var3 = useTokens()
	local bodyMedium = var3.Typography.BodyMedium
	local var4 = useIsSpatial() or usePreferredInput() == responsiveModule.Input.Directional
	local var5, var6 = reactModule.useMemo(function() --[[ line: 19 ]]
		-- upvalues: p0 (ref), textService (copy), bodyMedium (ref), var4 (ref), p1 (ref), var3 (ref)
		local y = textService:GetTextSize(string.gsub(p0 or "", "[\r\n]+", " "), bodyMedium.FontSize, bodyMedium.Font, Vector2.new(1e999, 1e999)).Y
		local var7 = y * ((if var4 then 1.3 else 1) * bodyMedium.LineHeight) + y
		
		if p0 and p0 ~= "" then
			local var8 = textService:GetTextSize(p0, bodyMedium.FontSize, bodyMedium.Font, Vector2.new(p1, 1e999))
			
			return if var7 < var8.Y then var7 + y + var3.Gap.XSmall else var8.Y, var7
		end
		return 0, var7
	end, {
		p0, bodyMedium.FontSize, bodyMedium.Font, p1, p2, var4, var3.Gap.XSmall
	})
	
	return var5, var6
end