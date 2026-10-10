local _ = require(script.Parent.Types)

return {
	incoming = function(a)
		return {
			direction = "incoming",
			stableId = a.id,
			payload = { kind = "message", message = a }
		}
	end,
	sending = function(p1, p2, p3, p4)
		return {
			direction = "outgoing",
			stableId = p1,
			payload = { kind = "draft", draft = p2, author = p3 },
			delivery = { state = "sending", attemptedAtUnixMilliseconds = p4 }
		}
	end,
	acknowledged = function(p1, p2, p3)
		return {
			direction = "outgoing",
			stableId = p1.stableId,
			payload = { kind = "message", message = p2 },
			delivery = {
				state = "acknowledged",
				attemptedAtUnixMilliseconds = p1.delivery.attemptedAtUnixMilliseconds,
				resolvedAtUnixMilliseconds = p3
			}
		}
	end,
	failed = function(p1, p2)
		return {
			direction = "outgoing",
			stableId = p1.stableId,
			payload = p1.payload,
			delivery = {
				state = "failed",
				attemptedAtUnixMilliseconds = p1.delivery.attemptedAtUnixMilliseconds,
				resolvedAtUnixMilliseconds = p2
			}
		}
	end
}