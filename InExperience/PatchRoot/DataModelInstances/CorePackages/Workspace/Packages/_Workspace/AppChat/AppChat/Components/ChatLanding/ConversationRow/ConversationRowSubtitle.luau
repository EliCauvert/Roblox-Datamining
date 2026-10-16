local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

local function isNonEmpty(SubtitleText) --[[ Line: 24 ]]
	return if typeof(SubtitleText) == "string" then SubtitleText ~= "" else SubtitleText:map(function(p1): boolean --[[ Line: 28 ]]
		return p1 ~= ""
	end)
end

return ReactModule.memo(function(Frame) --[[ Line: 33 | Named "ConversationRowSubtitle" ]]
	-- upvalues: ReactModule (copy), isNonEmpty (copy), FoundationModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 34 ]]
		-- upvalues: isNonEmpty (upval), Frame (copy)
		return isNonEmpty(Frame.subtitleText)
	end, { Frame.subtitleText })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-right-medium clip",
		LayoutOrder = Frame.LayoutOrder
	}, {
		subtitle = ReactModule.createElement(FoundationModule.Text, {
			tag = "shrink auto-xy text-body-small text-align-x-left text-truncate-split content-default",
			LayoutOrder = 1,
			Text = Frame.subtitleText,
			Visible = UseMemoResult
		}),
		inlineTimestamp = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2,
			testId = "conversation-row-inline-timestamp",
			Visible = ReactModule.useMemo(function() --[[ Line: 37 ]]
				-- upvalues: isNonEmpty (upval), Frame (copy)
				return isNonEmpty(Frame.timestampText)
			end, { Frame.timestampText })
		}, {
			separator = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-body-small content-default",
				Text = "·",
				LayoutOrder = 1,
				Visible = UseMemoResult
			}),
			timestamp = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-body-small content-default",
				LayoutOrder = 2,
				testId = "conversation-row-timestamp",
				Text = Frame.timestampText
			})
		})
	})
end)