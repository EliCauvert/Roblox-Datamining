local InlineRichText = script:FindFirstAncestor("InlineRichText")
local Parent = InlineRichText.Parent
local _ = require(InlineRichText.Types)
local NodeTypeModule = require(InlineRichText.Enums.NodeType)
local NewResult = require(InlineRichText.Logger):new(script.Name)
local IsDescendantModule = require(InlineRichText.Utils.isDescendant)
local ReactIsModule = require(Parent.ReactIs)
local IsInlineElementFunction = require(Parent.InlineLayout).Utils.isInlineElement
local IsStudio = game:GetService("RunService"):IsStudio()
local config = {
	[NodeTypeModule.InlineCustom] = {
		defaultParent = NodeTypeModule.Root,
		getDefault = function()
			-- upvalues: NodeTypeModule (copy)
			return {
				name = "TEXT_SPAN",
				text = "",
				type = NodeTypeModule.InlineCustom,
				children = {},
				attributes = {}
			}
		end,
		children = {
			[NodeTypeModule.EngineTag] = true,
			[NodeTypeModule.Plaintext] = true
		},
		validateRenderResult = function(p1)
			-- upvalues: IsInlineElementFunction (copy)
			return IsInlineElementFunction(p1)
		end
	},
	[NodeTypeModule.EngineTag] = {
		defaultParent = NodeTypeModule.InlineCustom,
		children = {
			[NodeTypeModule.EngineTag] = true,
			[NodeTypeModule.Plaintext] = true
		},
		validateRenderResult = function(_): boolean
			return true
		end
	},
	[NodeTypeModule.Plaintext] = {
		defaultParent = NodeTypeModule.InlineCustom,
		getDefault = function()
			-- upvalues: NodeTypeModule (copy)
			return {
				name = "TEXT",
				text = "",
				type = NodeTypeModule.Plaintext,
				children = {},
				attributes = {}
			}
		end,
		children = {},
		validateRenderResult = function(_): boolean
			return true
		end
	}
}
local UnionResult = require(Parent.Cryo).Dictionary.union(config, {
	[NodeTypeModule.Root] = {
		getDefault = function()
			-- upvalues: NodeTypeModule (copy)
			return {
				name = "ROOT",
				text = "",
				type = NodeTypeModule.Root,
				children = {},
				attributes = {}
			}
		end,
		children = { [NodeTypeModule.InlineCustom] = true },
		validateRenderResult = function(p1)
			-- upvalues: ReactIsModule (copy)
			return ReactIsModule.isElement(p1)
		end
	}
})

local function getByType(p1)
	-- upvalues: UnionResult (copy), NewResult (copy)
	local UnionResultEntry = UnionResult[p1]
	
	if UnionResultEntry then
		return UnionResultEntry
	else
		NewResult:error(`getByType: No config found for node type {p1}`)
		
		return nil
	end
end

local function getByNode(p2)
	-- upvalues: NewResult (copy), UnionResult (copy)
	if not p2 then
		NewResult:error("getByNode: No node provided")
		
		return nil
	end
	local Type = p2.type
	local UnionResultEntry = UnionResult[Type]
	
	if UnionResultEntry then
		return UnionResultEntry
	else
		NewResult:error(`getByType: No config found for node type {Type}`)
		
		return nil
	end
end

local function IsDescendant(p3, p4)
	-- upvalues: IsDescendantModule (copy), UnionResult (copy)
	return IsDescendantModule(UnionResult, "InlineRichTextNodeConfigGraph", p3.type, p4.type)
end

if _G.__DEV__ or IsStudio then
	for i, value in config do
		if not IsDescendantModule(UnionResult, "InlineRichTextNodeConfigGraph", NodeTypeModule.Root, i) then
			error(`NodeConfigNonRoot: Node type {i} does not descend from the root node`)
		end
		if IsDescendantModule(UnionResult, "InlineRichTextNodeConfigGraph", i, NodeTypeModule.Root) then
			error(`NodeConfigNonRoot: Node type {i} descends from the root node`)
		end
		if value.getDefault and value.getDefault().type ~= i then
			error(`NodeConfigNonRoot: Node type {i} getDefault function returns a node with type {value.getDefault().type} instead of {i}`)
		end
		if not value.defaultParent then
			error(`NodeConfigNonRoot: Node type {i} has no defaultParent`)
		end
		if not UnionResult[value.defaultParent].getDefault then
			error(`NodeConfigNonRoot: Node type {value.defaultParent} has no getDefault function, but {i} has it as its defaultParent`)
		end
	end
end
return {
	getByType = getByType,
	getByNode = getByNode,
	isDescendant = IsDescendant
}