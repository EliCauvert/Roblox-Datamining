local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Empty = FoundationModule.Empty
local IconSize = FoundationModule.Enums.IconSize
local ConstantsModule = require(Parent.Common.Constants)

local function v8() end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), ConstantsModule (copy), Empty (copy), IconSize (copy), v8 (copy)
	return ReactModule.createElement(View, {
		tag = ConstantsModule.STATE_PANEL_TAG,
		LayoutOrder = p1.layoutOrder
	}, {
		Content = ReactModule.createElement(Empty, {
			text = "Leaderboard unavailable. Please try again later.",
			icon = { name = "triangle-exclamation", size = IconSize.Large },
			button = { text = "Retry", onActivated = p1.onRetry or v8 }
		})
	})
end)