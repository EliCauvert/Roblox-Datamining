local parent = script:FindFirstAncestor("Utils").Parent
local parent_1 = parent.Parent
local nodeTypeModule = require(parent.Enums.NodeType)
local isInlineElement = require(parent_1.InlineLayout).Utils.isInlineElement
local dashModule = require(parent_1.Dash)
local reactIsModule = require(parent_1.ReactIs)

return {
	[nodeTypeModule.Root] = {
		children = {
			[nodeTypeModule.Block] = true,
			[nodeTypeModule.TextBlock] = true
		},
		validateRenderResult = function(p0)
			-- upvalues: reactIsModule (ref)
			return p0 ~= nil and reactIsModule.isElement(p0)
		end
	},
	[nodeTypeModule.Block] = {
		children = {
			[nodeTypeModule.Block] = true,
			[nodeTypeModule.TextBlock] = true
		},
		validateRenderResult = function(p1)
			-- upvalues: reactIsModule (ref), dashModule (ref)
			return if p1 ~= nil then reactIsModule.isElement(p1) or dashModule.all(p1, reactIsModule.isElement) else true
		end
	},
	[nodeTypeModule.TextBlock] = {
		children = {
			[nodeTypeModule.InlineSpan] = true,
			[nodeTypeModule.InlineLeaf] = true
		},
		validateRenderResult = function(p2)
			-- upvalues: reactIsModule (ref), dashModule (ref)
			return if p2 ~= nil then reactIsModule.isElement(p2) or dashModule.all(p2, reactIsModule.isElement) else true
		end
	},
	[nodeTypeModule.InlineSpan] = {
		children = {
			[nodeTypeModule.InlineSpan] = true,
			[nodeTypeModule.InlineLeaf] = true
		},
		validateRenderResult = function(p3)
			-- upvalues: isInlineElement (ref), dashModule (ref)
			return if p3 ~= nil then isInlineElement(p3) or dashModule.all(p3, isInlineElement) else true
		end
	},
	[nodeTypeModule.InlineLeaf] = {
		children = {},
		validateRenderResult = function(p4)
			-- upvalues: isInlineElement (ref)
			return if p4 ~= nil then isInlineElement(p4) else true
		end
	}
}