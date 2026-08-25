local parent = script.Parent
local reactModule = require(parent.Parent.Parent.Parent.Parent.React)
local responsiveLayoutContextModule = require(parent.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(parent.ResponsiveLayoutConfigReader)

return function(p0, p1)
	-- upvalues: reactModule (ref), responsiveLayoutContextModule (ref), responsiveLayoutConfigReaderModule (ref)
	local var3 = reactModule.useContext(responsiveLayoutContextModule)
	
	return responsiveLayoutConfigReaderModule.getValue({
		config = var3.config,
		breakpoint = var3.breakpoint,
		kind = p1 or var3.kind
	}, p0)
end