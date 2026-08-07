local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local adaptiveScrollingContextModule = require(script.Parent.AdaptiveScrollingContext)
local _ = require(parent.AppCommonLib)

return function(p0) --[[ line: 26 | named "withAdaptiveScrolling" ]]
	-- upvalues: reactModule (ref), adaptiveScrollingContextModule (ref), dashModule (ref)
	return function(p1) --[[ line: 27 ]]
		-- upvalues: reactModule (copy), adaptiveScrollingContextModule (copy), p0 (ref), dashModule (copy)
		return reactModule.createElement(adaptiveScrollingContextModule.Consumer, {
			render = function(p2) --[[ line: 29 ]]
				-- upvalues: reactModule (copy), p0 (copy), dashModule (copy), p1 (ref)
				return reactModule.createElement(p0, dashModule.join(p1, { adaptiveScrolling = p2 }))
			end
		})
	end
end