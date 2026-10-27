local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.internal.Delimiter)
local _ = require(CommonMark.parser.beta.Position)
local _ = require(CommonMark.node.Text)
local BracketModule = {}
BracketModule.__index = BracketModule

local function _(MarkerNode, MarkerPosition, BracketNode, BracketPosition, ContentPosition, Previous, PreviousDelimiter)
	-- upvalues: BracketModule (copy)
	return (setmetatable({
		allowed = true,
		bracketAfter = false,
		contentNestingDepth = 0,
		markerNode = MarkerNode,
		markerPosition = MarkerPosition,
		bracketNode = BracketNode,
		bracketPosition = BracketPosition,
		contentPosition = ContentPosition,
		previous = Previous,
		previousDelimiter = PreviousDelimiter
	}, BracketModule))
end

function BracketModule.link(BracketNode, BracketPosition, ContentPosition, Previous, PreviousDelimiter)
	-- upvalues: BracketModule (copy)
	return (setmetatable({
		markerNode = nil,
		markerPosition = nil,
		allowed = true,
		bracketAfter = false,
		contentNestingDepth = 0,
		bracketNode = BracketNode,
		bracketPosition = BracketPosition,
		contentPosition = ContentPosition,
		previous = Previous,
		previousDelimiter = PreviousDelimiter
	}, BracketModule))
end

function BracketModule.withMarker(MarkerNode, MarkerPosition, BracketNode, BracketPosition, ContentPosition, Previous, PreviousDelimiter)
	-- upvalues: BracketModule (copy)
	return (setmetatable({
		allowed = true,
		bracketAfter = false,
		contentNestingDepth = 0,
		markerNode = MarkerNode,
		markerPosition = MarkerPosition,
		bracketNode = BracketNode,
		bracketPosition = BracketPosition,
		contentPosition = ContentPosition,
		previous = Previous,
		previousDelimiter = PreviousDelimiter
	}, BracketModule))
end

return BracketModule