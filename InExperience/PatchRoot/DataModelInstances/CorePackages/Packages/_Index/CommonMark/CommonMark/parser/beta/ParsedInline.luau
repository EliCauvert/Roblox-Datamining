local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.node.Node)
local _ = require(CommonMark.parser.beta.Position)
local ParsedInlineModule = {}
ParsedInlineModule.__index = ParsedInlineModule

function ParsedInlineModule.none()
	return nil
end

function ParsedInlineModule.of(_node, _position)
	-- upvalues: ParsedInlineModule (copy)
	return (setmetatable({ _node = _node, _position = _position }, ParsedInlineModule))
end

function ParsedInlineModule.getNode(p1)
	return p1._node
end

function ParsedInlineModule.getPosition(p1)
	return p1._position
end

return ParsedInlineModule