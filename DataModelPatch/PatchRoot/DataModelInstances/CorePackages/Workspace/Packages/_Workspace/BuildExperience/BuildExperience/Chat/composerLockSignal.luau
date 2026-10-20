local Normal, Normal2 = require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createSignal("normal")

return { getComposerMode = Normal, setComposerMode = Normal2 }