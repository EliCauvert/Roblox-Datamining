local _ = require(script.Parent.Types)

return {
	incoming = function(Message)
		return {
			direction = "incoming",
			stableId = Message.id,
			payload = { kind = "message", message = Message }
		}
	end,
	sending = function(StableId, Draft, Author, AttemptedAtUnixMilliseconds)
		return {
			direction = "outgoing",
			stableId = StableId,
			payload = { kind = "draft", draft = Draft, author = Author },
			delivery = {
				state = "sending",
				attemptedAtUnixMilliseconds = AttemptedAtUnixMilliseconds
			}
		}
	end,
	acknowledged = function(p1, Message, ResolvedAtUnixMilliseconds)
		return {
			direction = "outgoing",
			stableId = p1.stableId,
			payload = { kind = "message", message = Message },
			delivery = {
				state = "acknowledged",
				attemptedAtUnixMilliseconds = p1.delivery.attemptedAtUnixMilliseconds,
				resolvedAtUnixMilliseconds = ResolvedAtUnixMilliseconds
			}
		}
	end,
	failed = function(p1, ResolvedAtUnixMilliseconds)
		return {
			direction = "outgoing",
			stableId = p1.stableId,
			payload = p1.payload,
			delivery = {
				state = "failed",
				attemptedAtUnixMilliseconds = p1.delivery.attemptedAtUnixMilliseconds,
				resolvedAtUnixMilliseconds = ResolvedAtUnixMilliseconds
			}
		}
	end
}