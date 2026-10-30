local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

local function _(p1, p2)
	if p1 ~= nil and p2 ~= nil and p2 < p1 then
		error("fence lengths required to be: closingFenceLength >= openingFenceLength")
	end
end

local function getOpeningFenceLength(p1)
	return p1._openingFenceLength
end

local function setOpeningFenceLength(p1, _openingFenceLength: number)
	if _openingFenceLength ~= nil and _openingFenceLength < 3 then
		error("openingFenceLength needs to be >= 3")
	end
	local ClosingFenceLength = p1._closingFenceLength
	
	if _openingFenceLength ~= nil and ClosingFenceLength ~= nil and ClosingFenceLength < _openingFenceLength then
		error("fence lengths required to be: closingFenceLength >= openingFenceLength")
	end
	p1._openingFenceLength = _openingFenceLength
end

local function getClosingFenceLength(p1)
	return p1._closingFenceLength
end

local function setClosingFenceLength(p1, _closingFenceLength: number)
	if _closingFenceLength ~= nil and _closingFenceLength < 3 then
		error("closingFenceLength needs to be >= 3")
	end
	local OpeningFenceLength = p1._openingFenceLength
	
	if OpeningFenceLength ~= nil and _closingFenceLength ~= nil and _closingFenceLength < OpeningFenceLength then
		error("fence lengths required to be: closingFenceLength >= openingFenceLength")
	end
	p1._closingFenceLength = _closingFenceLength
end

return function()
	-- upvalues: NodeModule (copy), getOpeningFenceLength (copy), setOpeningFenceLength (copy), getClosingFenceLength (copy), setClosingFenceLength (copy)
	local FencedCodeBlock = NodeModule.new("FencedCodeBlock", true)
	FencedCodeBlock.fenceCharacter = nil
	FencedCodeBlock._openingFenceLength = nil
	FencedCodeBlock._closingFenceLength = nil
	FencedCodeBlock.fenceIndent = 0
	FencedCodeBlock.info = nil
	FencedCodeBlock.literal = nil
	FencedCodeBlock.getOpeningFenceLength = getOpeningFenceLength
	FencedCodeBlock.setOpeningFenceLength = setOpeningFenceLength
	FencedCodeBlock.getClosingFenceLength = getClosingFenceLength
	FencedCodeBlock.setClosingFenceLength = setClosingFenceLength
	
	return FencedCodeBlock
end