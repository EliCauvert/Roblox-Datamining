local parent = script.Parent
local tModule = require(parent.Parent.Parent.Parent.Parent.t)

return tModule.union(tModule.string, require(parent.validateImageSetData))