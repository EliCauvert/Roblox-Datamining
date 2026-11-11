local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text

local function formatTime(TimeLength: number): string
	return string.format("%02d:%02d", math.floor(TimeLength / 60), (math.floor(TimeLength % 60)))
end

return function(p1)
	-- upvalues: ReactModule (copy), formatTime (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "position-bottom-right anchor-bottom-right padding-bottom-medium padding-right-medium auto-xy",
		ZIndex = 20
	}, {
		ReactModule.createElement(View, {
			tag = "bg-over-media-100 radius-small size-1000-500",
			ZIndex = 21
		}, {
			DurationText = ReactModule.createElement(Text, {
				tag = "text-label-small anchor-center-center position-center-center color-content-emphasis",
				Text = ReactModule.useMemo(function()
					-- upvalues: formatTime (upval), p1 (copy)
					return formatTime(p1.timeLength)
				end, { p1.timeLength })
			})
		})
	})
end