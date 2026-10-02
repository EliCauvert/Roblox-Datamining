local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.groupMessages)
local formatTimestampModule = require(script.Parent.formatTimestamp)

return function(p1)
	-- upvalues: signalsReactModule (ref), formatTimestampModule (ref), reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		tag = "size-full-0 auto-y text-align-x-center",
		Text = signalsReactModule.useSignalBinding(function(p2)
			-- upvalues: p1 (ref), formatTimestampModule (copy)
			local var1 = p1.itemSignal(p2)
			
			return formatTimestampModule(var1.displayUnixMilliseconds, var1.referenceUnixMilliseconds)
		end)
	})
end