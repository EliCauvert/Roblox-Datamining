local _ = require(script.Parent.Types)

return function(p0) --[[ line: 13 | named "iterator" ]]
	return if typeof(p0) == "function" then p0 elseif typeof(p0) == "table" then if #p0 > 0 then ipairs(p0) else pairs(p0) else nil
end