local parent = script.Parent
local responsive = parent.Parent.Responsive
local roactModule = require(parent.Parent.Parent.Parent.Parent.Roact)
local responsiveLayoutContextModule = require(responsive.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(responsive.ResponsiveLayoutConfigReader)

return function(p1, p2)
	-- upvalues: roactModule (ref), responsiveLayoutContextModule (ref), responsiveLayoutConfigReaderModule (ref)
	return function(p3)
		-- upvalues: roactModule (copy), responsiveLayoutContextModule (copy), p1 (ref), responsiveLayoutConfigReaderModule (copy), p2 (ref)
		return roactModule.createElement(responsiveLayoutContextModule.Consumer, {
			render = function(p4)
				-- upvalues: p1 (copy), responsiveLayoutConfigReaderModule (copy), p2 (copy), p3 (ref)
				local t = {}
				
				for i, v in pairs(p1) do
					t[i] = responsiveLayoutConfigReaderModule.getValue({
						config = p4.config,
						breakpoint = p4.breakpoint,
						kind = p2 or p4.kind
					}, i)
					
					if t[i] == nil then
						t[i] = v
					end
				end
				return p3(t)
			end
		})
	end
end