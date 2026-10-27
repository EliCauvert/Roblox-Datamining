local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.parser.InlineParserContext)
local _ = require(CommonMark.parser.beta.LinkInfo)
local _ = require(CommonMark.parser.beta.LinkProcessor)
local LinkResultModule = require(CommonMark.parser.beta.LinkResult)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.beta.Scanner)
local CoreLinkProcessorModule = {}
CoreLinkProcessorModule.__index = CoreLinkProcessorModule

function CoreLinkProcessorModule.new(Enabled, Enabled1)
	-- upvalues: CoreLinkProcessorModule (copy)
	return (setmetatable({
		_linkEnabled = Enabled ~= false,
		_imageEnabled = Enabled1 ~= false
	}, CoreLinkProcessorModule))
end

local function process(p1, p2, p3, Destination, Title)
	-- upvalues: LinkResultModule (copy), NodesModule (copy)
	local MarkerResult = p2:marker()
	
	return if MarkerResult == nil or MarkerResult.literal ~= "!" or not p1._imageEnabled then if p1._linkEnabled then LinkResultModule.wrapTextIn(NodesModule.Link(Destination, Title), p3:position()) else LinkResultModule.none() else LinkResultModule.wrapTextIn(NodesModule.Image(Destination, Title), p3:position()):includeMarker()
end

function CoreLinkProcessorModule.process(p1, p2, p3, p4)
	-- upvalues: process (copy), LinkResultModule (copy)
	if p2:destination() == nil then
		local LabelResult = p2:label()
		local LinkReferenceDefinition = p4:getDefinition("LinkReferenceDefinition", if LabelResult == nil or LabelResult == "" then p2:text() else LabelResult)
		
		return if LinkReferenceDefinition == nil then LinkResultModule.none() else process(p1, p2, p3, LinkReferenceDefinition.destination, LinkReferenceDefinition.title)
	else
		return process(p1, p2, p3, p2:destination(), p2:title())
	end
end

return CoreLinkProcessorModule