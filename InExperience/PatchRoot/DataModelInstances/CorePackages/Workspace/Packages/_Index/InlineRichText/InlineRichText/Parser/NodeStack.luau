local InlineRichText = script:FindFirstAncestor("InlineRichText")
local _ = require(InlineRichText.Types)
local NodeTypeModule = require(InlineRichText.Enums.NodeType)
local NewResult = require(InlineRichText.Logger):new(script.Name)
local CryoModule = require(InlineRichText.Parent.Cryo)
local NodeConfigModule = require(InlineRichText.NodeConfig)
local NodeStackModule = {}
NodeStackModule.__index = NodeStackModule

function NodeStackModule.new() --[[ Line: 42 ]]
	-- upvalues: NodeStackModule (copy)
	local self = setmetatable({}, NodeStackModule)
	self.__stack = {}
	self.__index = 1
	
	return self
end

function NodeStackModule:push(Default) --[[ Line: 51 ]]
	-- upvalues: NodeConfigModule (copy), NewResult (copy), NodeTypeModule (copy), CryoModule (copy)
	if not NodeConfigModule.getByNode(Default) then
		return {}, false
	end
	local PeekResult = self:peek()
	local CloseTopAndReduceResults = {}
	while PeekResult and not NodeConfigModule.isDescendant(PeekResult, Default) do
		if not self:__canCloseTop() then
			NewResult:error("push: Cannot closeAndReduce top node. Last item in stack is not the root node")
			
			return CloseTopAndReduceResults, false
		end
		local CloseTopAndReduceResult = self:__closeTopAndReduce()
		
		if not CloseTopAndReduceResult then
			NewResult:error("push: Failed to closeAndReduce top node")
			
			return CloseTopAndReduceResults, false
		end
		PeekResult = self:peek()
		table.insert(CloseTopAndReduceResults, CloseTopAndReduceResult)
	end
	if not PeekResult and Default.type == NodeTypeModule.Root then
		self:__push(Default)
		
		return CloseTopAndReduceResults, true
	end
	local ByNode = PeekResult and NodeConfigModule.getByNode(PeekResult)
	
	if ByNode and ByNode.children[Default.type] then
		self:__push(Default)
		
		return CloseTopAndReduceResults, true
	end
	local ByNode1 = NodeConfigModule.getByNode(Default)
	local DefaultParent = ByNode1 and ByNode1.defaultParent
	
	if not DefaultParent then
		NewResult:error(`push: No default parent found for node type {Default.type}`)
		
		return CloseTopAndReduceResults, false
	end
	local PushDefaultResult, PushDefaultResult2 = self:pushDefault(DefaultParent)
	local JoinResult = CryoModule.List.join(CloseTopAndReduceResults, PushDefaultResult)
	
	if PushDefaultResult2 then
		self:__push(Default)
		
		return JoinResult, true
	else
		return JoinResult, false
	end
end

function NodeStackModule:pushDefault(DefaultParent) --[[ Line: 102 ]]
	-- upvalues: NodeConfigModule (copy), NewResult (copy)
	local ByType = NodeConfigModule.getByType(DefaultParent)
	
	if ByType and ByType.getDefault then
		return self:push((ByType.getDefault()))
	else
		NewResult:error(`pushDefault: No config or getDefault function found for node type {DefaultParent}`)
		
		return {}, false
	end
end

function NodeStackModule:findAndClose(Name) --[[ Line: 112 ]]
	-- upvalues: NewResult (copy)
	if not self:__has(Name) then
		return {}, false
	end
	local CloseTopAndReduceResults = {}
	local Flag = false
	while self:__canCloseTop() do
		local CloseTopAndReduceResult = self:__closeTopAndReduce()
		
		if not CloseTopAndReduceResult then
			NewResult:error("findAndClose: Failed to closeAndReduce top node")
			
			return CloseTopAndReduceResults, false
		end
		table.insert(CloseTopAndReduceResults, CloseTopAndReduceResult)
		
		if CloseTopAndReduceResult.name ~= Name then continue end
		Flag = true
		
		return CloseTopAndReduceResults, Flag
	end
	return CloseTopAndReduceResults, Flag
end

function NodeStackModule:buildRoot() --[[ Line: 135 ]]
	-- upvalues: NewResult (copy), NodeTypeModule (copy)
	while self:__canCloseTop() do
		if self:__closeTopAndReduce() then continue end
		NewResult:error("buildRoot: Failed to closeAndReduce top node")
		break
	end
	if #self.__stack == 0 then
		self:pushDefault(NodeTypeModule.Root)
	end
	local StackEntry = self.__stack[1]
	
	if StackEntry and StackEntry.type ~= NodeTypeModule.Root then
		NewResult:error("buildRoot: Last node on stack is not the root node")
	end
	return {
		name = "ROOT",
		text = "",
		type = NodeTypeModule.Root,
		children = StackEntry.children,
		attributes = StackEntry.attributes,
		index = StackEntry.index
	}
end

function NodeStackModule:peek() --[[ Line: 162 ]]
	return self.__stack[#self.__stack]
end

function NodeStackModule:__push(p1) --[[ Line: 169 ]]
	-- upvalues: CryoModule (copy)
	table.insert(self.__stack, (CryoModule.Dictionary.join(p1, { index = self.__index })))
	self.__index += 1
	
	return nil
end

function NodeStackModule:__closeTopAndReduce() --[[ Line: 179 ]]
	-- upvalues: NewResult (copy), CryoModule (copy)
	local StackEntry = self.__stack[#self.__stack]
	local StackEntry1 = self.__stack[#self.__stack - 1]
	
	if StackEntry and StackEntry1 then
		local JoinResult = CryoModule.Dictionary.join(StackEntry1, {
			children = CryoModule.List.join(StackEntry1.children, { StackEntry })
		})
		table.remove(self.__stack, #self.__stack)
		self.__stack[#self.__stack] = JoinResult
		
		return {
			text = "",
			name = StackEntry.name,
			type = StackEntry.type,
			children = {},
			attributes = StackEntry.attributes,
			index = StackEntry.index
		}
	else
		NewResult:error("closeTop: No top or next node found")
		
		return nil
	end
end

function NodeStackModule:__canCloseTop(): boolean --[[ Line: 202 ]]
	return #self.__stack > 1
end

function NodeStackModule:__has(Name): boolean --[[ Line: 206 ]]
	-- upvalues: CryoModule (copy)
	return CryoModule.List.findWhere(self.__stack, function(p1): boolean --[[ Line: 207 ]]
		-- upvalues: Name (copy)
		return p1.name == Name
	end) ~= nil
end

return NodeStackModule