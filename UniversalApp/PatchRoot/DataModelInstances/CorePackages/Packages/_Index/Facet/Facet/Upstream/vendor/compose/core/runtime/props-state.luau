local _ = require("../reactive/types")
local Mapped = {}
require("../weak").keys(Mapped)

return {
	mapped = Mapped,
	applying = { key = nil },
	unwritten = newproxy(false)
}