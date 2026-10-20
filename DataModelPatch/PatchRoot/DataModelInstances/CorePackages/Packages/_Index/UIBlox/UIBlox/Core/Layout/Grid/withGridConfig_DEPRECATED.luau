local Parent = script.Parent
local Responsive = Parent.Parent.Responsive
local RoactModule = require(Parent.Parent.Parent.Parent.Parent.Roact)
local ResponsiveLayoutContextModule = require(Responsive.ResponsiveLayoutContext)
local ResponsiveLayoutConfigReaderModule = require(Responsive.ResponsiveLayoutConfigReader)

return function(p1, p2)
	-- upvalues: RoactModule (copy), ResponsiveLayoutContextModule (copy), ResponsiveLayoutConfigReaderModule (copy)
	return function(Callback)
		-- upvalues: RoactModule (upval), ResponsiveLayoutContextModule (upval), p1 (copy), ResponsiveLayoutConfigReaderModule (upval), p2 (copy)
		return RoactModule.createElement(ResponsiveLayoutContextModule.Consumer, {
			render = function(p3)
				-- upvalues: p1 (upval), ResponsiveLayoutConfigReaderModule (upval), p2 (upval), Callback (copy)
				local t = {}
				
				for i, value in pairs(p1) do
					t[i] = ResponsiveLayoutConfigReaderModule.getValue({
						config = p3.config,
						breakpoint = p3.breakpoint,
						kind = p2 or p3.kind
					}, i)
					
					if t[i] == nil then
						t[i] = value
					end
				end
				return Callback(t)
			end
		})
	end
end