local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(Tbl)
	return (table.freeze(Tbl))
end