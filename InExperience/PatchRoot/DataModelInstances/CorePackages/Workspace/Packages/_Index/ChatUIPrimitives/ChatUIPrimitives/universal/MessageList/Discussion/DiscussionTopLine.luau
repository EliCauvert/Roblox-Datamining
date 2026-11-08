local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local MessageTimestampModule = require(script.Parent.Parent.Parent.Adornments.MessageTimestamp)

local function toDisplayName(p1)
	return if p1 then p1.displayName else ""
end

return ReactModule.memo(function(Frame)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), toDisplayName (copy), FoundationModule (copy), MessageTimestampModule (copy)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(Frame.getIdentity)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = Frame.tag,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		Name = ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 1,
			testId = "discussion-name",
			tag = Frame.nameTag,
			Text = ReactModule.useMemo(function()
				-- upvalues: UseSignalBindingResult (copy), toDisplayName (upval)
				return UseSignalBindingResult:map(toDisplayName)
			end, { UseSignalBindingResult })
		}),
		Timestamp = ReactModule.createElement(MessageTimestampModule, {
			LayoutOrder = 2,
			testId = "discussion-timestamp",
			getSentAtUnixMilliseconds = Frame.getSentAtUnixMilliseconds,
			tag = Frame.timestampTag
		})
	})
end)