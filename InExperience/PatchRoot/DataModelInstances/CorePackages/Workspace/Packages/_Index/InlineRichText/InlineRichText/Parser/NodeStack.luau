local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local _ = require(inlineRichText.Types)
local nodeTypeModule = require(inlineRichText.Enums.NodeType)
local name = require(inlineRichText.Logger):new(script.Name)
local cryoModule = require(parent.Cryo)
local nodeConfigModule = require(inlineRichText.NodeConfig)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.__stack = {}
	tbl.__index = 1
	
	return tbl
end

function t:push(p0)
	-- upvalues: nodeConfigModule (ref), name (ref), nodeTypeModule (ref), cryoModule (ref)
	if not nodeConfigModule.getByNode(p0) then
		return {}, false
	end
	local var9
	local var7 = self:peek()
	local t = {}
	while var7 and not nodeConfigModule.isDescendant(var7, p0) do
		if self:__canCloseTop() then
			var9 = self:__closeTopAndReduce()
			
			if var9 then
				var7 = self:peek()
				table.insert(t, var9)
				continue
			end
			name:error("push: Failed to closeAndReduce top node")
			
			return t, false
		end
		name:error("push: Cannot closeAndReduce top node. Last item in stack is not the root node")
		
		return t, false
	end
	if not var7 and p0.type == nodeTypeModule.Root then
		self:__push(p0)
		
		return t, true
	end
	var9 = var7 and nodeConfigModule.getByNode(var7)
	
	if var9 and var9.children[p0.type] then
		self:__push(p0)
		
		return t, true
	end
	local byNode = nodeConfigModule.getByNode(p0)
	local defaultParent = byNode and byNode.defaultParent
	
	if not defaultParent then
		name:error(`push: No default parent found for node type {p0.type}`)
		
		return t, false
	end
	local var12, var13 = self:pushDefault(defaultParent)
	local var14 = cryoModule.List.join(t, var12)
	
	if var13 then
		self:__push(p0)
		
		return var14, true
	end
	return var14, false
end

function t:pushDefault(p1)
	-- upvalues: nodeConfigModule (ref), name (ref)
	local byType = nodeConfigModule.getByType(p1)
	
	if byType and byType.getDefault then
		return self:push(byType.getDefault())
	end
	name:error(`pushDefault: No config or getDefault function found for node type {p1}`)
	
	return {}, false
end

function t:findAndClose(p2)
	-- upvalues: name (ref)
	if not self:__has(p2) then
		return {}, false
	end
	local t = {}
	local var17 = false
	while self:__canCloseTop() do
		local var18 = self:__closeTopAndReduce()
		
		if var18 then
			table.insert(t, var18)
			
			if var18.name ~= p2 then continue end
			var17 = true
			
			return t, var17
		end
		name:error("findAndClose: Failed to closeAndReduce top node")
		
		return t, false
	end
	return t, var17
end

function t:buildRoot()
	-- upvalues: name (ref), nodeTypeModule (ref)
	while self:__canCloseTop() do
		if self:__closeTopAndReduce() then continue end
		name:error("buildRoot: Failed to closeAndReduce top node")
		break
	end
	if #self.__stack == 0 then
		self:pushDefault(nodeTypeModule.Root)
	end
	local var19 = self.__stack[1]
	
	if var19 and var19.type ~= nodeTypeModule.Root then
		name:error("buildRoot: Last node on stack is not the root node")
	end
	return {
		name = "ROOT",
		text = "",
		type = nodeTypeModule.Root,
		children = var19.children,
		attributes = var19.attributes,
		index = var19.index
	}
end

function t:peek()
	return self.__stack[#self.__stack]
end

function t:__push(p3)
	-- upvalues: cryoModule (ref)
	table.insert(self.__stack, cryoModule.Dictionary.join(p3, { index = self.__index }))
	self.__index += 1
	
	return nil
end

function t:__closeTopAndReduce()
	-- upvalues: name (ref), cryoModule (ref)
	local var20 = self.__stack[#self.__stack]
	local var21 = self.__stack[#self.__stack - 1]
	
	if var20 and var21 then
		local var22 = cryoModule.Dictionary.join(var21, {
			children = cryoModule.List.join(var21.children, { var20 })
		})
		table.remove(self.__stack, #self.__stack)
		self.__stack[#self.__stack] = var22
		
		return {
			text = "",
			name = var20.name,
			type = var20.type,
			children = {},
			attributes = var20.attributes,
			index = var20.index
		}
	end
	name:error("closeTop: No top or next node found")
	
	return nil
end

function t:__canCloseTop()
	return #self.__stack > 1
end

function t:__has(p4)
	-- upvalues: cryoModule (ref)
	return cryoModule.List.findWhere(self.__stack, function(p5)
		-- upvalues: p4 (ref)
		return p5.name == p4
	end) ~= nil
end

return t