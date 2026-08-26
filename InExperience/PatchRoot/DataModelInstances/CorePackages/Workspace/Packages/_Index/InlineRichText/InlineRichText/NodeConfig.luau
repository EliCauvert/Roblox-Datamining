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
local var1 = runService:IsStudio()
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
		validateRenderResult = function(p1)
			-- upvalues: isInlineElement (ref)
			return isInlineElement(p1)
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
local var2 = cryoModule.Dictionary.union(t, {
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

local function getByType(p1)
	-- upvalues: var2 (ref), name (ref)
	local var3 = var2[p1]
	
	if var3 then
		return var3
	end
	name:error(`getByType: No config found for node type {p1}`)
	
	return nil
end

local function getByNode(p2)
	-- upvalues: name (ref), var2 (ref)
	if not p2 then
		name:error("getByNode: No node provided")
		
		return nil
	end
	local type = p2.type
	local var4 = var2[type]
	
	if var4 then
		return var4
	end
	name:error(`getByType: No config found for node type {type}`)
	
	return nil
end

local var5 = function(p3, p4)
	-- upvalues: isDescendantModule (ref), var2 (ref)
	return isDescendantModule(var2, "InlineRichTextNodeConfigGraph", p3.type, p4.type)
end

if _G.__DEV__ or var1 then
	for i, v in t do
		if not isDescendantModule(var2, "InlineRichTextNodeConfigGraph", nodeTypeModule.Root, i) then
			error(`NodeConfigNonRoot: Node type {i} does not descend from the root node`)
		end
		if isDescendantModule(var2, "InlineRichTextNodeConfigGraph", i, nodeTypeModule.Root) then
			error(`NodeConfigNonRoot: Node type {i} descends from the root node`)
		end
		if v.getDefault and v.getDefault().type ~= i then
			error(`NodeConfigNonRoot: Node type {i} getDefault function returns a node with type {v.getDefault().type} instead of {i}`)
		end
		if not v.defaultParent then
			error(`NodeConfigNonRoot: Node type {i} has no defaultParent`)
		end
		if not var2[v.defaultParent].getDefault then
			error(`NodeConfigNonRoot: Node type {v.defaultParent} has no getDefault function, but {i} has it as its defaultParent`)
		end
	end
end
return {
	getByType = getByType,
	getByNode = getByNode,
	isDescendant = var5
}