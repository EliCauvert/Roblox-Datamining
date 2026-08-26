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
		validateRenderResult = function(p1)
			-- upvalues: reactIsModule (ref)
			return p1 ~= nil and reactIsModule.isElement(p1)
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
		validateRenderResult = function(p1)
			-- upvalues: reactIsModule (ref), dashModule (ref)
			return if p1 ~= nil then reactIsModule.isElement(p1) or dashModule.all(p1, reactIsModule.isElement) else true
		end
	},
	[nodeTypeModule.InlineSpan] = {
		children = {
			[nodeTypeModule.InlineSpan] = true,
			[nodeTypeModule.InlineLeaf] = true
		},
		validateRenderResult = function(p1)
			-- upvalues: isInlineElement (ref), dashModule (ref)
			return if p1 ~= nil then isInlineElement(p1) or dashModule.all(p1, isInlineElement) else true
		end
	},
	[nodeTypeModule.InlineLeaf] = {
		children = {},
		validateRenderResult = function(p1)
			-- upvalues: isInlineElement (ref)
			return if p1 ~= nil then isInlineElement(p1) else true
		end
	}
}