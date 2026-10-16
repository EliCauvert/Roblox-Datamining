local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.InputPlacement)
local _ = require(Foundation.Enums.InputSize)

return (require(Foundation.Parent.React).createContext({ size = nil, placement = nil }))