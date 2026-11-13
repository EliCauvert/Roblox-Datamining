local SourceModule = require("@self/source")
local _ = require("@self/types")

return {
	document = require("@self/document"),
	datatype = require("@self/datatype"),
	history = require("@self/history"),
	render = require("@self/render"),
	session = require("@self/session"),
	link = require("@self/link"),
	extend = require("@self/library").extend,
	imports = require("@self/imports").extend,
	emit = SourceModule.emit,
	parse = SourceModule.parse,
	literal = SourceModule.literal,
	parseLiteral = SourceModule.parseLiteral
}