local function parsePath(p1)
	local parts = string.split(p1, "/")
	
	for i = #parts, 1, -1 do
		if parts[i] == "" then
			table.remove(parts, i)
		end
	end
	return parts
end

local function _(p2, p3)
	local var1 = 0
	
	for i in pairs(p2) do
		var1 += 1
	end
	assert(var1 <= p3, var1)
	
	return var1 == p3
end

local function unbindNodeDescend(p4, p5)
	-- upvalues: unbindNodeDescend (ref)
	if p4.instance == nil then return end
	p4.instance = nil
	local connections = p4.connections
	
	if connections then
		for i, v in ipairs(connections) do
			v:Disconnect()
		end
		table.clear(connections)
	end
	if p5 and p4.alias then
		p5[p4.alias] = nil
	end
	local children = p4.children
	
	if children then
		for i, v in pairs(children) do
			unbindNodeDescend(v, p5)
		end
	end
end

local t = {}
t.__index = t

function t.new(p6, p7)
	-- upvalues: parsePath (ref), t (ref)
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local var2 = 1
	
	for i, v in pairs(p6) do
		t_5[i] = parsePath(v)
		var2 += 1
	end
	return setmetatable({
		_boundFn = p7,
		_parsedManifest = t_5,
		_manifestSizeTarget = var2,
		_dtorMap = t_1,
		_connections = t_2,
		_rootInstToRootNode = t_3,
		_rootInstToManifest = t_4
	}, t)
end

function t:_startBoundFn(p8, p9)
	local boundFn = self._boundFn
	local dtorMap = self._dtorMap
	local var3 = dtorMap[p8]
	
	if var3 then
		var3()
		dtorMap[p8] = nil
	end
	local var4 = boundFn(p9)
	
	if var4 then
		dtorMap[p8] = var4
	end
end

function t:_stopBoundFn(p8)
	local dtorMap = self._dtorMap
	local var3 = dtorMap[p8]
	
	if var3 then
		var3()
		dtorMap[p8] = nil
	end
end

function t:bindRoot(p8)
	-- upvalues: unbindNodeDescend (ref)
	debug.profilebegin("AtomicBinding:BindRoot")
	local parsedManifest = self._parsedManifest
	local rootInstToRootNode = self._rootInstToRootNode
	local rootInstToManifest = self._rootInstToManifest
	local manifestSizeTarget = self._manifestSizeTarget
	
	if rootInstToManifest[p8] ~= nil then return end
	local t = {}
	rootInstToManifest[p8] = t
	debug.profilebegin("BuildTree")
	local t_1 = { alias = "root", instance = p8 }
	
	if next(parsedManifest) then
		t_1.children = {}
		t_1.connections = {}
	end
	rootInstToRootNode[p8] = t_1
	
	for i, v in pairs(parsedManifest) do
		local var3 = t_1
		
		for i_1, v_1 in ipairs(v) do
			local var4 = var3.children[v_1] or {}
			
			if i_1 == #v then
				if var4.alias ~= nil then
					error("Multiple aliases assigned to one instance")
				end
				var4.alias = i
			else
				var4.children = var4.children or {}
				var4.connections = var4.connections or {}
			end
			var3.children[v_1] = var4
			var3 = var4
		end
	end
	debug.profileend()
	
	local function processNode(p9)
		-- upvalues: t (ref), processNode (ref), self (ref), p8 (ref), unbindNodeDescend (copy), manifestSizeTarget (ref)
		local var5 = assert(p9.instance, "instance does not exist")
		local children = p9.children
		local alias = p9.alias
		local var6 = not children
		
		if alias then
			t[alias] = var5
		end
		if not var6 then
			local function processAddChild(p10)
				-- upvalues: children (ref), processNode (copy)
				local name = children[p10.Name]
				
				if name and name.instance == nil then
					name.instance = p10
					processNode(name)
					
					return
				end
			end
			
			local function processDeleteChild(p10)
				-- upvalues: children (ref), self (copy), p8 (copy), unbindNodeDescend (copy), t (copy), var5 (ref), processNode (copy)
				local name = p10.Name
				local var7 = children[name]
				
				if not var7 then return end
				if var7.instance ~= p10 then return end
				self:_stopBoundFn(p8)
				unbindNodeDescend(var7, t)
				assert(var7.instance == nil, "unbindNodeDescend failed")
				local var8 = var5:FindFirstChild(name)
				
				if var8 then
					local name_1 = children[var8.Name]
					
					if name_1 then
						if name_1.instance ~= nil then return end
						name_1.instance = var8
						processNode(name_1)
					end
				end
			end
			
			for i, v in ipairs(var5:GetChildren()) do
				local name = children[v.Name]
				
				if name and name.instance == nil then
					name.instance = v
					processNode(name)
				end
			end
			table.insert(p9.connections, var5.ChildAdded:Connect(processAddChild))
			table.insert(p9.connections, var5.ChildRemoved:Connect(processDeleteChild))
		end
		if var6 then
			local var7 = t
			local var8 = manifestSizeTarget
			local var9 = 0
			
			for i in pairs(var7) do
				var9 += 1
			end
			assert(var9 <= var8, var9)
			
			if var9 == var8 then
				self:_startBoundFn(p8, t)
			end
		end
	end
	
	debug.profilebegin("ResolveTree")
	processNode(t_1)
	debug.profileend()
	debug.profileend()
end

function t:unbindRoot(p10)
	-- upvalues: unbindNodeDescend (ref)
	local rootInstToRootNode = self._rootInstToRootNode
	local rootInstToManifest = self._rootInstToManifest
	self:_stopBoundFn(p10)
	local var10 = rootInstToRootNode[p10]
	
	if var10 then
		unbindNodeDescend(var10, assert(rootInstToManifest[p10], "rootInstToManifest is nil"))
		rootInstToRootNode[p10] = nil
	end
	rootInstToManifest[p10] = nil
end

function t:destroy()
	-- upvalues: unbindNodeDescend (ref)
	debug.profilebegin("AtomicBinding:destroy")
	
	for i, v in pairs(self._dtorMap) do
		v:destroy()
	end
	table.clear(self._dtorMap)
	
	for i, v_1 in ipairs(self._connections) do
		v_1:Disconnect()
	end
	table.clear(self._connections)
	local rootInstToManifest = self._rootInstToManifest
	
	for i_2, v_2 in pairs(self._rootInstToRootNode) do
		unbindNodeDescend(v_2, assert(rootInstToManifest[i_2], "rootInstToManifest is nil"))
	end
	table.clear(self._rootInstToManifest)
	table.clear(self._rootInstToRootNode)
	debug.profileend()
end

return t