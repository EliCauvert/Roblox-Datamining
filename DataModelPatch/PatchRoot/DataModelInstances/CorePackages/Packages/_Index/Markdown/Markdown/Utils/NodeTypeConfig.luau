local Parent = script:FindFirstAncestor("Utils").Parent
local Parent1 = Parent.Parent
local NodeTypeModule = require(Parent.Enums.NodeType)
local IsInlineElementFunction = require(Parent1.InlineLayout).Utils.isInlineElement
local DashModule = require(Parent1.Dash)
local ReactIsModule = require(Parent1.ReactIs)

return {
	[NodeTypeModule.Root] = {
		children = {
			[NodeTypeModule.Block] = true,
			[NodeTypeModule.TextBlock] = true
		},
		validateRenderResult = function(p1)
			-- upvalues: ReactIsModule (copy)
			return p1 ~= nil and ReactIsModule.isElement(p1)
		end
	},
	[NodeTypeModule.Block] = {
		children = {
			[NodeTypeModule.Block] = true,
			[NodeTypeModule.TextBlock] = true
		},
		validateRenderResult = function(p1)
			-- upvalues: ReactIsModule (copy), DashModule (copy)
			return p1 == nil or (ReactIsModule.isElement(p1) or DashModule.all(p1, ReactIsModule.isElement))
		end
	},
	[NodeTypeModule.TextBlock] = {
		children = {
			[NodeTypeModule.InlineSpan] = true,
			[NodeTypeModule.InlineLeaf] = true
		},
		validateRenderResult = function(p1)
			-- upvalues: ReactIsModule (copy), DashModule (copy)
			return p1 == nil or (ReactIsModule.isElement(p1) or DashModule.all(p1, ReactIsModule.isElement))
		end
	},
	[NodeTypeModule.InlineSpan] = {
		children = {
			[NodeTypeModule.InlineSpan] = true,
			[NodeTypeModule.InlineLeaf] = true
		},
		validateRenderResult = function(p1)
			-- upvalues: IsInlineElementFunction (copy), DashModule (copy)
			return p1 == nil or (IsInlineElementFunction(p1) or DashModule.all(p1, IsInlineElementFunction))
		end
	},
	[NodeTypeModule.InlineLeaf] = {
		children = {},
		validateRenderResult = function(p1)
			-- upvalues: IsInlineElementFunction (copy)
			return p1 == nil or IsInlineElementFunction(p1)
		end
	}
}