local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.ColorMode)
local _ = require(Foundation.Enums.Device)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Enums.ThemeName)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(script.Parent.createStyleSheetRules)
local GetOverrideAttributesModule = require(script.Parent.getOverrideAttributes)
local ScaleValueModule = require(Foundation.Utility.scaleValue)

return function(Object, p1, p2, p3, p4, p5, p6) --[[ Line: 17 | Named "updateTokenOverrides" ]]
	-- upvalues: GetOverrideAttributesModule (copy), FlagsModule (copy), ScaleValueModule (copy)
	for AttributeName, value in GetOverrideAttributesModule(p1, p2, p3, p5) do
		local ScaleValueModuleResult = if FlagsModule.FoundationDisableTokenScaling then value else ScaleValueModule(value, p4)
		Object:SetAttribute(AttributeName, ScaleValueModuleResult)
		
		if p6 then
			p6[AttributeName] = ScaleValueModuleResult
		end
	end
end