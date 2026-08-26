local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.ColorMode)
local _ = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Enums.ThemeName)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(script.Parent.createStyleSheetRules)
local getOverrideAttributesModule = require(script.Parent.getOverrideAttributes)
local scaleValueModule = require(foundation.Utility.scaleValue)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: getOverrideAttributesModule (ref), flagsModule (ref), scaleValueModule (ref)
	for i, v in getOverrideAttributesModule(if flagsModule.FoundationThemeName then p2 else nil, p3, p4, p6) do
		local var1 = if flagsModule.FoundationDisableTokenScaling then v else scaleValueModule(v, p5)
		p1:SetAttribute(i, var1)
		
		if p7 then
			p7[i] = var1
		end
	end
end