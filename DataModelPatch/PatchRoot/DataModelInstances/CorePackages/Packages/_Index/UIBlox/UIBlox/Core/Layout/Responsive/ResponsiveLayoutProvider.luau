local Parent = script.Parent
local ReactModule = require(Parent.Parent.Parent.Parent.Parent.React)
local ResponsiveLayoutContextModule = require(Parent.ResponsiveLayoutContext)
local ResponsiveLayoutConfigReaderModule = require(Parent.ResponsiveLayoutConfigReader)

return function(p1)
	-- upvalues: ReactModule (copy), ResponsiveLayoutConfigReaderModule (copy), ResponsiveLayoutContextModule (copy)
	local Width = p1.width or 1
	local Config = p1.config or {}
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: ResponsiveLayoutConfigReaderModule (upval), Config (copy), Width (copy)
		return ResponsiveLayoutConfigReaderModule.findBreakpoint(Config, Width)
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult2 (copy), ResponsiveLayoutConfigReaderModule (upval), Config (copy), Width (copy)
		UseStateResult2(ResponsiveLayoutConfigReaderModule.findBreakpoint(Config, Width))
	end, { Config })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult (copy), Width (copy), UseStateResult2 (copy), ResponsiveLayoutConfigReaderModule (upval), Config (copy)
		if Width < UseStateResult.min or UseStateResult.max < Width then
			UseStateResult2(ResponsiveLayoutConfigReaderModule.findBreakpoint(Config, Width))
		end
	end, { Width, UseStateResult.min, UseStateResult.max })
	
	return ReactModule.createElement(ResponsiveLayoutContextModule.Provider, {
		value = { config = Config, breakpoint = UseStateResult.name }
	}, p1.children)
end