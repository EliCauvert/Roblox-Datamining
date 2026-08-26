local _ = require(script.Parent.StyleTypes)

return function(p1, p2)
	return if p1 == nil or p2 == nil then false elseif p1.Color.Surface.Surface_0.Color3 == p2.Color.Surface.Surface_0.Color3 then if p1.Color.Surface.Surface_100.Color3 == p2.Color.Surface.Surface_100.Color3 then if p1.Color.Surface.Surface_200.Color3 == p2.Color.Surface.Surface_200.Color3 then p1.Color.Surface.Surface_300.Color3 ~= p2.Color.Surface.Surface_300.Color3 else true else true else true
end