-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:03 2026 Pacific Standard Time.

local parent = script.Parent
local reactModule = require(parent.Parent.Parent.Parent.Parent.React)
local responsiveLayoutContextModule = require(parent.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(parent.ResponsiveLayoutConfigReader)

return function(p0, p1) --[[ line: 19 ]]
	-- upvalues: reactModule (ref), responsiveLayoutContextModule (ref), responsiveLayoutConfigReaderModule (ref)
	local var3 = reactModule.useContext(responsiveLayoutContextModule)
	
	return responsiveLayoutConfigReaderModule.getValue({
		config = var3.config,
		breakpoint = var3.breakpoint,
		kind = p1 or var3.kind
	}, p0)
end