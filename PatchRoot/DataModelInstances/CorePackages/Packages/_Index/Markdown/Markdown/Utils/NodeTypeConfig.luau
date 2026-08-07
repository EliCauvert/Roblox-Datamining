-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

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
		validateRenderResult = function(p0) --[[ line: 20 ]]
			-- upvalues: reactIsModule (ref)
			return p0 ~= nil and reactIsModule.isElement(p0)
		end
	},
	[nodeTypeModule.Block] = {
		children = {
			[nodeTypeModule.Block] = true,
			[nodeTypeModule.TextBlock] = true
		},
		validateRenderResult = function(p1) --[[ line: 29 ]]
			-- upvalues: reactIsModule (ref), dashModule (ref)
			return if p1 ~= nil then reactIsModule.isElement(p1) or dashModule.all(p1, reactIsModule.isElement) else true
		end
	},
	[nodeTypeModule.TextBlock] = {
		children = {
			[nodeTypeModule.InlineSpan] = true,
			[nodeTypeModule.InlineLeaf] = true
		},
		validateRenderResult = function(p2) --[[ line: 38 ]]
			-- upvalues: reactIsModule (ref), dashModule (ref)
			return if p2 ~= nil then reactIsModule.isElement(p2) or dashModule.all(p2, reactIsModule.isElement) else true
		end
	},
	[nodeTypeModule.InlineSpan] = {
		children = {
			[nodeTypeModule.InlineSpan] = true,
			[nodeTypeModule.InlineLeaf] = true
		},
		validateRenderResult = function(p3) --[[ line: 47 ]]
			-- upvalues: isInlineElement (ref), dashModule (ref)
			return if p3 ~= nil then isInlineElement(p3) or dashModule.all(p3, isInlineElement) else true
		end
	},
	[nodeTypeModule.InlineLeaf] = {
		children = {},
		validateRenderResult = function(p4) --[[ line: 53 ]]
			-- upvalues: isInlineElement (ref)
			return if p4 ~= nil then isInlineElement(p4) else true
		end
	}
}