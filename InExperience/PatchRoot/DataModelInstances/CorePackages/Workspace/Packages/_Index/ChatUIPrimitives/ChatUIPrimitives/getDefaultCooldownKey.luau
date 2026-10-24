local _ = require(script.Parent.UniversalMessage.Types)

return function(p1)
	return if p1.kind == "preset" then "preset" else nil
end