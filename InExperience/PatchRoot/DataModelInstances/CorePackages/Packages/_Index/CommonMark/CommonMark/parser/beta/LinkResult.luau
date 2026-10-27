local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.node.Node)
local _ = require(CommonMark.parser.beta.Position)
local LinkResultModule = {}
LinkResultModule.__index = LinkResultModule
LinkResultModule.Type = table.freeze({ WRAP = "WRAP", REPLACE = "REPLACE" })

local function _(_type, _node, _position)
	-- upvalues: LinkResultModule (copy)
	return (setmetatable({
		_includeMarker = false,
		_type = _type,
		_node = _node,
		_position = _position
	}, LinkResultModule))
end

function LinkResultModule.none()
	return nil
end

function LinkResultModule.wrapTextIn(_node, _position)
	-- upvalues: LinkResultModule (copy)
	return (setmetatable({
		_includeMarker = false,
		_type = LinkResultModule.Type.WRAP,
		_node = _node,
		_position = _position
	}, LinkResultModule))
end

function LinkResultModule.replaceWith(_node, _position)
	-- upvalues: LinkResultModule (copy)
	return (setmetatable({
		_includeMarker = false,
		_type = LinkResultModule.Type.REPLACE,
		_node = _node,
		_position = _position
	}, LinkResultModule))
end

function LinkResultModule.includeMarker(p1)
	p1._includeMarker = true
	
	return p1
end

function LinkResultModule.getType(p1)
	return p1._type
end

function LinkResultModule.getNode(p1)
	return p1._node
end

function LinkResultModule.getPosition(p1)
	return p1._position
end

function LinkResultModule.isIncludeMarker(p1)
	return p1._includeMarker
end

return LinkResultModule