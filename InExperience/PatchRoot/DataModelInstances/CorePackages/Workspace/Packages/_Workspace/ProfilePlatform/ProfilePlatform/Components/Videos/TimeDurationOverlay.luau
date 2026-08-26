local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text

local function formatTime(p1)
	return string.format("%02d:%02d", math.floor(p1 / 60), math.floor(p1 % 60))
end

return function(p1)
	-- upvalues: reactModule (ref), formatTime (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "position-bottom-right anchor-bottom-right padding-bottom-medium padding-right-medium auto-xy",
		ZIndex = 20
	}, {
		reactModule.createElement(view, {
			tag = "bg-over-media-100 radius-small size-1000-500",
			ZIndex = 21
		}, {
			DurationText = reactModule.createElement(text, {
				tag = "text-label-small anchor-center-center position-center-center color-content-emphasis",
				Text = reactModule.useMemo(function()
					-- upvalues: formatTime (copy), p1 (ref)
					return formatTime(p1.timeLength)
				end, { p1.timeLength })
			})
		})
	})
end