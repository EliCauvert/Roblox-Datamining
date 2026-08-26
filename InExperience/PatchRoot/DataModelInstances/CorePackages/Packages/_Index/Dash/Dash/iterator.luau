local _ = require(script.Parent.Types)

return function(p1)
	return if typeof(p1) == "function" then p1 elseif typeof(p1) == "table" then if #p1 > 0 then ipairs(p1) else pairs(p1) else nil
end