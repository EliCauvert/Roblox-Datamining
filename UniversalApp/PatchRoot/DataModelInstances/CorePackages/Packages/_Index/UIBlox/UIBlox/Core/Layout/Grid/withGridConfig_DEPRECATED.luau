local parent = script.Parent
local responsive = parent.Parent.Responsive
local roactModule = require(parent.Parent.Parent.Parent.Parent.Roact)
local responsiveLayoutContextModule = require(responsive.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(responsive.ResponsiveLayoutConfigReader)

return function(p0, p1) --[[ line: 27 ]]
	-- upvalues: roactModule (ref), responsiveLayoutContextModule (ref), responsiveLayoutConfigReaderModule (ref)
	return function(p2) --[[ line: 28 ]]
		-- upvalues: roactModule (copy), responsiveLayoutContextModule (copy), p0 (ref), responsiveLayoutConfigReaderModule (copy), p1 (ref)
		return roactModule.createElement(responsiveLayoutContextModule.Consumer, {
			render = function(p3) --[[ line: 30 ]]
				-- upvalues: p0 (copy), responsiveLayoutConfigReaderModule (copy), p1 (copy), p2 (ref)
				local t = {}
				
				for i, v in pairs(p0) do
					t[i] = responsiveLayoutConfigReaderModule.getValue({
						config = p3.config,
						breakpoint = p3.breakpoint,
						kind = p1 or p3.kind
					}, i)
					
					if t[i] == nil then
						t[i] = v
					end
				end
				return p2(t)
			end
		})
	end
end