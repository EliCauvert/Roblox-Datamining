local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local textService = game:GetService("TextService")
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useIsSpatial = responsiveModule.useIsSpatial
local usePreferredInput = responsiveModule.usePreferredInput

return function(p1, p2, p3)
	-- upvalues: useTokens (ref), useIsSpatial (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), textService (ref)
	local var1 = useTokens()
	local bodyMedium = var1.Typography.BodyMedium
	local var2 = useIsSpatial() or usePreferredInput() == responsiveModule.Input.Directional
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), textService (copy), bodyMedium (ref), var2 (ref), p2 (ref), var1 (ref)
		local y = textService:GetTextSize(string.gsub(p1 or "", "[\r\n]+", " "), bodyMedium.FontSize, bodyMedium.Font, Vector2.new(1e999, 1e999)).Y
		local var5 = y * ((if var2 then 1.3 else 1) * bodyMedium.LineHeight) + y
		
		if p1 and p1 ~= "" then
			local var6 = textService:GetTextSize(p1, bodyMedium.FontSize, bodyMedium.Font, Vector2.new(p2, 1e999))
			
			return if var5 < var6.Y then var5 + y + var1.Gap.XSmall else var6.Y, var5
		end
		return 0, var5
	end, {
		p1, bodyMedium.FontSize, bodyMedium.Font, p2, p3, var2, var1.Gap.XSmall
	})
	
	return var3, var4
end