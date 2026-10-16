local Signal, Signal2 = require(script:FindFirstAncestor("MomentsCommon").Parent.Signals).createSignal(false)

return { getCovering = Signal, setCovering = Signal2 }