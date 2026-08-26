local parent = script.Parent
local reactModule = require(parent.Parent.Parent.Parent.Parent.React)
local responsiveLayoutContextModule = require(parent.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(parent.ResponsiveLayoutConfigReader)

return function(p1)
	-- upvalues: reactModule (ref), responsiveLayoutConfigReaderModule (ref), responsiveLayoutContextModule (ref)
	local width = p1.width or 1
	local config = p1.config or {}
	local var1, var2 = reactModule.useState(function()
		-- upvalues: responsiveLayoutConfigReaderModule (copy), config (ref), width (ref)
		return responsiveLayoutConfigReaderModule.findBreakpoint(config, width)
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), responsiveLayoutConfigReaderModule (copy), config (ref), width (ref)
		var2(responsiveLayoutConfigReaderModule.findBreakpoint(config, width))
	end, { config })
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), width (ref), var2 (ref), responsiveLayoutConfigReaderModule (copy), config (ref)
		if width < var1.min or var1.max < width then
			var2(responsiveLayoutConfigReaderModule.findBreakpoint(config, width))
		end
	end, { width, var1.min, var1.max })
	
	return reactModule.createElement(responsiveLayoutContextModule.Provider, { value = { config = config, breakpoint = var1.name } }, p1.children)
end