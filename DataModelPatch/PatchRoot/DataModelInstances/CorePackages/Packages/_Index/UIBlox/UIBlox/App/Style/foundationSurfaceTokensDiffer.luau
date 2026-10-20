local _ = require(script.Parent.StyleTypes)

return function(p1, p2): boolean
	return p1 ~= nil and p2 ~= nil and (p1.Color.Surface.Surface_0.Color3 ~= p2.Color.Surface.Surface_0.Color3 or (p1.Color.Surface.Surface_100.Color3 ~= p2.Color.Surface.Surface_100.Color3 or p1.Color.Surface.Surface_200.Color3 ~= p2.Color.Surface.Surface_200.Color3) or p1.Color.Surface.Surface_300.Color3 ~= p2.Color.Surface.Surface_300.Color3)
end