local Signal, Signal2 = require(script:FindFirstAncestor("MomentsCommon").Parent.Signals).createSignal(false)

return { getSuspended = Signal, setSuspended = Signal2 }