local Parent = script.Parent
local ReactModule = require(Parent.Parent.Parent.Parent.Parent.React)
local ResponsiveLayoutContextModule = require(Parent.ResponsiveLayoutContext)
local ResponsiveLayoutConfigReaderModule = require(Parent.ResponsiveLayoutConfigReader)

return function(p1, p2)
	-- upvalues: ReactModule (copy), ResponsiveLayoutContextModule (copy), ResponsiveLayoutConfigReaderModule (copy)
	local UseContextResult = ReactModule.useContext(ResponsiveLayoutContextModule)
	
	return ResponsiveLayoutConfigReaderModule.getValue({
		config = UseContextResult.config,
		breakpoint = UseContextResult.breakpoint,
		kind = p2 or UseContextResult.kind
	}, p1)
end