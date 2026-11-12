local Signal, Signal2 = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal(false)

return { getCovering = Signal, setCovering = Signal2 }