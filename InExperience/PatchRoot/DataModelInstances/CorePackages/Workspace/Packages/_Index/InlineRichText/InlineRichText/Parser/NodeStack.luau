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

function t:push(p1)
	-- upvalues: nodeConfigModule (ref), name (ref), nodeTypeModule (ref), cryoModule (ref)
	if not nodeConfigModule.getByNode(p1) then
		return {}, false
	end
	local var1
	local var2 = self:peek()
	local t = {}
	while var2 and not nodeConfigModule.isDescendant(var2, p1) do
		if self:__canCloseTop() then
			var1 = self:__closeTopAndReduce()
			
			if var1 then
				var2 = self:peek()
				table.insert(t, var1)
				continue
			end
			name:error("push: Failed to closeAndReduce top node")
			
			return t, false
		end
		name:error("push: Cannot closeAndReduce top node. Last item in stack is not the root node")
		
		return t, false
	end
	if not var2 and p1.type == nodeTypeModule.Root then
		self:__push(p1)
		
		return t, true
	end
	var1 = var2 and nodeConfigModule.getByNode(var2)
	
	if var1 and var1.children[p1.type] then
		self:__push(p1)
		
		return t, true
	end
	local byNode = nodeConfigModule.getByNode(p1)
	local defaultParent = byNode and byNode.defaultParent
	
	if not defaultParent then
		name:error(`push: No default parent found for node type {p1.type}`)
		
		return t, false
	end
	local var3, var4 = self:pushDefault(defaultParent)
	local var5 = cryoModule.List.join(t, var3)
	
	if var4 then
		self:__push(p1)
		
		return var5, true
	end
	return var5, false
end

function t:pushDefault(p2)
	-- upvalues: nodeConfigModule (ref), name (ref)
	local byType = nodeConfigModule.getByType(p2)
	
	if byType and byType.getDefault then
		return self:push(byType.getDefault())
	end
	name:error(`pushDefault: No config or getDefault function found for node type {p1}`)
	
	return {}, false
end

function t:findAndClose(p3)
	-- upvalues: name (ref)
	if not self:__has(p3) then
		return {}, false
	end
	local t = {}
	local var6 = false
	while self:__canCloseTop() do
		local var7 = self:__closeTopAndReduce()
		
		if var7 then
			table.insert(t, var7)
			
			if var7.name ~= p3 then continue end
			var6 = true
			
			return t, var6
		end
		name:error("findAndClose: Failed to closeAndReduce top node")
		
		return t, false
	end
	return t, var6
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
	local var8 = self.__stack[1]
	
	if var8 and var8.type ~= nodeTypeModule.Root then
		name:error("buildRoot: Last node on stack is not the root node")
	end
	return {
		name = "ROOT",
		text = "",
		type = nodeTypeModule.Root,
		children = var8.children,
		attributes = var8.attributes,
		index = var8.index
	}
end

function t:peek()
	return self.__stack[#self.__stack]
end

function t:__push(p4)
	-- upvalues: cryoModule (ref)
	table.insert(self.__stack, cryoModule.Dictionary.join(p4, { index = self.__index }))
	self.__index += 1
	
	return nil
end

function t:__closeTopAndReduce()
	-- upvalues: name (ref), cryoModule (ref)
	local var9 = self.__stack[#self.__stack]
	local var10 = self.__stack[#self.__stack - 1]
	
	if var9 and var10 then
		local var11 = cryoModule.Dictionary.join(var10, {
			children = cryoModule.List.join(var10.children, { var9 })
		})
		table.remove(self.__stack, #self.__stack)
		self.__stack[#self.__stack] = var11
		
		return {
			text = "",
			name = var9.name,
			type = var9.type,
			children = {},
			attributes = var9.attributes,
			index = var9.index
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