local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local textService = game:GetService("TextService")
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useIsSpatial = responsiveModule.useIsSpatial
local usePreferredInput = responsiveModule.usePreferredInput
local fFlagProfilePlatformFixBioTruncationModule = require(profilePlatform.Flags.FFlagProfilePlatformFixBioTruncation)

return function(p1, p2, p3)
	-- upvalues: useTokens (ref), useIsSpatial (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), textService (ref), fFlagProfilePlatformFixBioTruncationModule (ref)
	local var1 = useTokens()
	local bodyMedium = var1.Typography.BodyMedium
	local var2 = useIsSpatial() or usePreferredInput() == responsiveModule.Input.Directional
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), textService (copy), bodyMedium (ref), var2 (ref), fFlagProfilePlatformFixBioTruncationModule (copy), p2 (ref), var1 (ref)
		local y = textService:GetTextSize(string.gsub(p1 or "", "[\r\n]+", " "), bodyMedium.FontSize, bodyMedium.Font, Vector2.new(1e999, 1e999)).Y
		local var5 = (if var2 then 1.3 else 1) * bodyMedium.LineHeight
		local var6 = if fFlagProfilePlatformFixBioTruncationModule then bodyMedium.FontSize * var5 * 2 else y * var5 + y
		
		if p1 and p1 ~= "" then
			local var7 = textService:GetTextSize(p1, bodyMedium.FontSize, bodyMedium.Font, Vector2.new(p2, 1e999))
			
			return if var6 < var7.Y then var6 + y + var1.Gap.XSmall else var7.Y, var6
		end
		return 0, var6
	end, {
		p1, bodyMedium.FontSize, bodyMedium.Font,
		if fFlagProfilePlatformFixBioTruncationModule then bodyMedium.LineHeight else nil,
		p2, p3, var2, var1.Gap.XSmall
	})
	
	return var3, var4
end