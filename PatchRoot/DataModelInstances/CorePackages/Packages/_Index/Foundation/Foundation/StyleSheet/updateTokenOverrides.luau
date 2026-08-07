-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Enums.Theme)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(script.Parent.createStyleSheetRules)
local getOverrideAttributesModule = require(script.Parent.getOverrideAttributes)
local scaleValueModule = require(foundation.Utility.scaleValue)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 15 | named "updateTokenOverrides" ]]
	-- upvalues: getOverrideAttributesModule (ref), flagsModule (ref), scaleValueModule (ref)
	for i, v in getOverrideAttributesModule(p1, p2, p4) do
		local var4 = if flagsModule.FoundationDisableTokenScaling then v else scaleValueModule(v, p3)
		p0:SetAttribute(i, var4)
		
		if p5 then
			p5[i] = var4
		end
	end
end