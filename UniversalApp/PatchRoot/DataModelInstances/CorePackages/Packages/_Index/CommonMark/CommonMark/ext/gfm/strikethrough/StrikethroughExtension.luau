local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.Extension)
local StrikethroughDelimiterProcessorModule = require(CommonMark.ext.gfm.strikethrough.internal.StrikethroughDelimiterProcessor)
local StrikethroughExtensionModule = {}
local Module = {}
Module.__index = Module

local function new(p1)
	-- upvalues: StrikethroughDelimiterProcessorModule (copy), CommonMark (copy)
	local RequireTwoTildes = p1._requireTwoTildes
	
	return {
		extendParser = function(p2)
			-- upvalues: StrikethroughDelimiterProcessorModule (upval), RequireTwoTildes (copy)
			p2:customDelimiterProcessor(StrikethroughDelimiterProcessorModule.new(RequireTwoTildes))
		end,
		extendHtmlRenderer = function(p2)
			-- upvalues: CommonMark (upval)
			local StrikethroughHtmlNodeRendererModule = require(CommonMark.ext.gfm.strikethrough.internal.StrikethroughHtmlNodeRenderer)
			p2:nodeRendererFactory({
				create = function(_, p3)
					-- upvalues: StrikethroughHtmlNodeRendererModule (copy)
					return StrikethroughHtmlNodeRendererModule.new(p3)
				end
			})
		end
	}
end

function StrikethroughExtensionModule.create()
	-- upvalues: StrikethroughExtensionModule (copy)
	return StrikethroughExtensionModule.builder():build()
end

function StrikethroughExtensionModule.builder()
	-- upvalues: Module (copy)
	return Module.new()
end

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({ _requireTwoTildes = false }, Module))
end

function Module:requireTwoTildes(_requireTwoTildes)
	self._requireTwoTildes = _requireTwoTildes
	
	return self
end

function Module.build(p1)
	-- upvalues: new (copy)
	return (new(p1))
end

StrikethroughExtensionModule.Builder = Module

return StrikethroughExtensionModule