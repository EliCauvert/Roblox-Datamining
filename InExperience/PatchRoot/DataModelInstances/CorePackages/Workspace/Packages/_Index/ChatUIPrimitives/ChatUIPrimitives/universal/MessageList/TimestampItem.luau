local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.groupMessages)
local FormatTimestampModule = require(script.Parent.formatTimestamp)

return function(p1) --[[ Line: 15 | Named "TimestampItem" ]]
	-- upvalues: SignalsReactModule (copy), FormatTimestampModule (copy), ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "size-full-0 auto-y text-align-x-center",
		Text = SignalsReactModule.useSignalBinding(function(p2) --[[ Line: 16 ]]
			-- upvalues: p1 (copy), FormatTimestampModule (upval)
			local ItemSignalResult = p1.itemSignal(p2)
			
			return FormatTimestampModule(ItemSignalResult.displayUnixMilliseconds, ItemSignalResult.referenceUnixMilliseconds)
		end)
	})
end