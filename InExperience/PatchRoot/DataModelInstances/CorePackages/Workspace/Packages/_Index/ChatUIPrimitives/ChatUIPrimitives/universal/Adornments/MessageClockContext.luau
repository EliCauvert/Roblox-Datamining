local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local _ = require(Parent.Signals)

return (require(Parent.React).createContext(nil))