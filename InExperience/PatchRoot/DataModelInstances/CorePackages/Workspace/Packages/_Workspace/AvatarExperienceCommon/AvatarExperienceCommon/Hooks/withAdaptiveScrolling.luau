local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local AdaptiveScrollingContextModule = require(script.Parent.AdaptiveScrollingContext)
local _ = require(Parent.AppCommonLib)

return function(p1) --[[ Line: 26 | Named "withAdaptiveScrolling" ]]
	-- upvalues: ReactModule (copy), AdaptiveScrollingContextModule (copy), DashModule (copy)
	return function(p2) --[[ Line: 27 ]]
		-- upvalues: ReactModule (upval), AdaptiveScrollingContextModule (upval), p1 (copy), DashModule (upval)
		return ReactModule.createElement(AdaptiveScrollingContextModule.Consumer, {
			render = function(AdaptiveScrolling) --[[ Line: 29 ]]
				-- upvalues: ReactModule (upval), p1 (upval), DashModule (upval), p2 (copy)
				return ReactModule.createElement(p1, DashModule.join(p2, { adaptiveScrolling = AdaptiveScrolling }))
			end
		})
	end
end