local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local adaptiveScrollingContextModule = require(script.Parent.AdaptiveScrollingContext)
local _ = require(parent.AppCommonLib)

return function(p1)
	-- upvalues: reactModule (ref), adaptiveScrollingContextModule (ref), dashModule (ref)
	return function(p2)
		-- upvalues: reactModule (copy), adaptiveScrollingContextModule (copy), p1 (ref), dashModule (copy)
		return reactModule.createElement(adaptiveScrollingContextModule.Consumer, {
			render = function(p3)
				-- upvalues: reactModule (copy), p1 (copy), dashModule (copy), p2 (ref)
				return reactModule.createElement(p1, dashModule.join(p2, { adaptiveScrolling = p3 }))
			end
		})
	end
end