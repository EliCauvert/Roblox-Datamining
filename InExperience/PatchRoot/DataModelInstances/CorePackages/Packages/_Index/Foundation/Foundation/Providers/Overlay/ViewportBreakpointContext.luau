local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.Breakpoint)
local _ = require(Foundation.Providers.Responsive.ResponsiveContext)

return require(Foundation.Parent.React).createContext(nil)