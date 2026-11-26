local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.ChatUIPrimitives.MessageList)
local CreateProjectorFunction = require(script.Parent.toMessageEnvelopes).createProjector
local TextChannelWindowPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.TextChannelWindowPerfTracker
local Signal = SignalsModule.createSignal({})

return function(p1)
	-- upvalues: Signal (copy), ReactModule (copy), CreateProjectorFunction (copy), SignalsModule (copy), TextChannelWindowPerfTracker (copy)
	local MessagesSignal = p1.messagesSignal or Signal
	
	return {
		displayMode = "inline",
		groupingEnabled = false,
		getMessageEnvelopes = ReactModule.useMemo(function()
			-- upvalues: CreateProjectorFunction (upval), SignalsModule (upval), MessagesSignal (copy)
			local Projector = CreateProjectorFunction()
			
			return SignalsModule.createComputed(function(p2)
				-- upvalues: Projector (copy), MessagesSignal (upval)
				return Projector(MessagesSignal(p2))
			end)
		end, { MessagesSignal }),
		onUserScrollInput = p1.onScroll,
		onMessageRendered = TextChannelWindowPerfTracker.finishMessageIntervals
	}
end