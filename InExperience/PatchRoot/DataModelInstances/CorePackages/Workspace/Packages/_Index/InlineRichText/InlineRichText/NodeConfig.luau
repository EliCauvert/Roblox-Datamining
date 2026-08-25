local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local runService = game:GetService("RunService")
local _ = require(inlineRichText.Types)
local nodeTypeModule = require(inlineRichText.Enums.NodeType)
local name = require(inlineRichText.Logger):new(script.Name)
local cryoModule = require(parent.Cryo)
local isDescendantModule = require(inlineRichText.Utils.isDescendant)
local reactIsModule = require(parent.ReactIs)
local isInlineElement = require(parent.InlineLayout).Utils.isInlineElement
local var7 = runService:IsStudio()
local t = {
	[nodeTypeModule.InlineCustom] = {
		defaultParent = nodeTypeModule.Root,
		getDefault = function()
			-- upvalues: nodeTypeModule (ref)
			return {
				name = "TEXT_SPAN",
				text = "",
				type = nodeTypeModule.InlineCustom,
				children = {},
				attributes = {}
			}
		end,
		children = {
			[nodeTypeModule.EngineTag] = true,
			[nodeTypeModule.Plaintext] = true
		},
		validateRenderResult = function(p0)
			-- upvalues: isInlineElement (ref)
			return isInlineElement(p0)
		end
	},
	[nodeTypeModule.EngineTag] = {
		defaultParent = nodeTypeModule.InlineCustom,
		children = {
			[nodeTypeModule.EngineTag] = true,
			[nodeTypeModule.Plaintext] = true
		},
		validateRenderResult = function(_)
			return true
		end
	},
	[nodeTypeModule.Plaintext] = {
		defaultParent = nodeTypeModule.InlineCustom,
		getDefault = function()
			-- upvalues: nodeTypeModule (ref)
			return {
				name = "TEXT",
				text = "",
				type = nodeTypeModule.Plaintext,
				children = {},
				attributes = {}
			}
		end,
		children = {},
		validateRenderResult = function(_)
			return true
		end
	}
}
local var9 = cryoModule.Dictionary.union(t, {
	[nodeTypeModule.Root] = {
		getDefault = function()
			-- upvalues: nodeTypeModule (ref)
			return {
				name = "ROOT",
				text = "",
				type = nodeTypeModule.Root,
				children = {},
				attributes = {}
			}
		end,
		children = { [nodeTypeModule.InlineCustom] = true },
		validateRenderResult = function(p1)
			-- upvalues: reactIsModule (ref)
			return reactIsModule.isElement(p1)
		end
	}
})

local function getByType(p2)
	-- upvalues: var9 (ref), name (ref)
	local var13 = var9[p2]
	
	if var13 then
		return var13
	end
	name:error(`getByType: No config found for node type {p2}`)
	
	return nil
end

local function getByNode(p3)
	-- upvalues: name (ref), var9 (ref)
	if not p3 then
		name:error("getByNode: No node provided")
		
		return nil
	end
	local type = p3.type
	local var14 = var9[type]
	
	if var14 then
		return var14
	end
	name:error(`getByType: No config found for node type {type}`)
	
	return nil
end

local var12 = function(p4, p5)
	-- upvalues: isDescendantModule (ref), var9 (ref)
	return isDescendantModule(var9, "InlineRichTextNodeConfigGraph", p4.type, p5.type)
end

if _G.__DEV__ or var7 then
	for i, v in t do
		if not isDescendantModule(var9, "InlineRichTextNodeConfigGraph", nodeTypeModule.Root, i) then
			error(`NodeConfigNonRoot: Node type {i} does not descend from the root node`)
		end
		if isDescendantModule(var9, "InlineRichTextNodeConfigGraph", i, nodeTypeModule.Root) then
			error(`NodeConfigNonRoot: Node type {i} descends from the root node`)
		end
		if v.getDefault and v.getDefault().type ~= i then
			error(`NodeConfigNonRoot: Node type {i} getDefault function returns a node with type {v.getDefault().type} instead of {i}`)
		end
		if not v.defaultParent then
			error(`NodeConfigNonRoot: Node type {i} has no defaultParent`)
		end
		if not var9[v.defaultParent].getDefault then
			error(`NodeConfigNonRoot: Node type {v.defaultParent} has no getDefault function, but {i} has it as its defaultParent`)
		end
	end
end
return {
	getByType = getByType,
	getByNode = getByNode,
	isDescendant = var12
}