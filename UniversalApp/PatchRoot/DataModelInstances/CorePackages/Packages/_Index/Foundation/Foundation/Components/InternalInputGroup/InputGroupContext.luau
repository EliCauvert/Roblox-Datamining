local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.InputPlacement)
local _ = require(foundation.Enums.InputSize)

return reactModule.createContext({ size = nil, placement = nil })