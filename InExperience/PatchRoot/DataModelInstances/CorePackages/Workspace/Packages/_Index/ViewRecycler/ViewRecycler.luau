local CorePackages = game:GetService("CorePackages")
local ViewRecyclerReact06Module = require(CorePackages.Packages.ViewRecyclerReact06)

return if require(script.Parent.SharedFlags).FFlagViewRecyclerReact06 then ViewRecyclerReact06Module else require(CorePackages.Packages.ViewRecyclerReact)