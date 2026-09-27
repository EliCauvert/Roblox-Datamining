local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

local function isNonEmpty(p1)
	return if typeof(p1) == "string" then p1 ~= "" else p1:map(function(p2)
		return p2 ~= ""
	end)
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), isNonEmpty (ref), foundationModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: isNonEmpty (copy), p1 (ref)
		return isNonEmpty(p1.subtitleText)
	end, { p1.subtitleText })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-right-medium clip",
		LayoutOrder = p1.LayoutOrder
	}, {
		subtitle = reactModule.createElement(foundationModule.Text, {
			tag = "shrink auto-xy text-body-small text-align-x-left text-truncate-split content-default",
			LayoutOrder = 1,
			Text = p1.subtitleText,
			Visible = var1
		}),
		inlineTimestamp = reactModule.createElement(foundationModule.View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2,
			testId = "conversation-row-inline-timestamp",
			Visible = reactModule.useMemo(function()
				-- upvalues: isNonEmpty (copy), p1 (ref)
				return isNonEmpty(p1.timestampText)
			end, { p1.timestampText })
		}, {
			separator = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-body-small content-default",
				Text = "\194\183",
				LayoutOrder = 1,
				Visible = var1
			}),
			timestamp = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-body-small content-default",
				LayoutOrder = 2,
				testId = "conversation-row-timestamp",
				Text = p1.timestampText
			})
		})
	})
end)