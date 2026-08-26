local parent = script.Parent
local reactModule = require(parent.Parent.Parent.Parent.Parent.React)
local responsiveLayoutContextModule = require(parent.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(parent.ResponsiveLayoutConfigReader)

return function(p1, p2)
	-- upvalues: reactModule (ref), responsiveLayoutContextModule (ref), responsiveLayoutConfigReaderModule (ref)
	local var1 = reactModule.useContext(responsiveLayoutContextModule)
	
	return responsiveLayoutConfigReaderModule.getValue({
		config = var1.config,
		breakpoint = var1.breakpoint,
		kind = p2 or var1.kind
	}, p1)
end