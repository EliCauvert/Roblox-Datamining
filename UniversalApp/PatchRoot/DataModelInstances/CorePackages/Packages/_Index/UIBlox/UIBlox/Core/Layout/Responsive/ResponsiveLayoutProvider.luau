local parent = script.Parent
local reactModule = require(parent.Parent.Parent.Parent.Parent.React)
local responsiveLayoutContextModule = require(parent.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(parent.ResponsiveLayoutConfigReader)

return function(p0)
	-- upvalues: reactModule (ref), responsiveLayoutConfigReaderModule (ref), responsiveLayoutContextModule (ref)
	local width = p0.width or 1
	local config = p0.config or {}
	local var5, var6 = reactModule.useState(function()
		-- upvalues: responsiveLayoutConfigReaderModule (copy), config (ref), width (ref)
		return responsiveLayoutConfigReaderModule.findBreakpoint(config, width)
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var6 (ref), responsiveLayoutConfigReaderModule (copy), config (ref), width (ref)
		var6(responsiveLayoutConfigReaderModule.findBreakpoint(config, width))
	end, { config })
	reactModule.useLayoutEffect(function()
		-- upvalues: var5 (ref), width (ref), var6 (ref), responsiveLayoutConfigReaderModule (copy), config (ref)
		if width < var5.min or var5.max < width then
			var6(responsiveLayoutConfigReaderModule.findBreakpoint(config, width))
		end
	end, { width, var5.min, var5.max })
	
	return reactModule.createElement(responsiveLayoutContextModule.Provider, { value = { config = config, breakpoint = var5.name } }, p0.children)
end