local function parsePath(p0)
	local parts = string.split(p0, "/")
	
	for i = #parts, 1, -1 do
		if parts[i] == "" then
			table.remove(parts, i)
		end
	end
	return parts
end

local function _(p1, p2)
	local var4 = 0
	
	for i in pairs(p1) do
		var4 += 1
	end
	assert(var4 <= p2, var4)
	
	return var4 == p2
end

local function unbindNodeDescend(p3, p4)
	-- upvalues: unbindNodeDescend (ref)
	if p3.instance == nil then return end
	p3.instance = nil
	local connections = p3.connections
	
	if connections then
		for i, v in ipairs(connections) do
			v:Disconnect()
		end
		table.clear(connections)
	end
	if p4 and p3.alias then
		p4[p3.alias] = nil
	end
	local children = p3.children
	
	if children then
		for i, v in pairs(children) do
			unbindNodeDescend(v, p4)
		end
	end
end

local t = {}
t.__index = t

function t.new(p5, p6)
	-- upvalues: parsePath (ref), t (ref)
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local var10 = 1
	
	for i, v in pairs(p5) do
		t_5[i] = parsePath(v)
		var10 += 1
	end
	return setmetatable({
		_boundFn = p6,
		_parsedManifest = t_5,
		_manifestSizeTarget = var10,
		_dtorMap = t_1,
		_connections = t_2,
		_rootInstToRootNode = t_3,
		_rootInstToManifest = t_4
	}, t)
end

function t:_startBoundFn(p7, p8)
	local boundFn = self._boundFn
	local dtorMap = self._dtorMap
	local var11 = dtorMap[p7]
	
	if var11 then
		var11()
		dtorMap[p7] = nil
	end
	local var12 = boundFn(p8)
	
	if var12 then
		dtorMap[p7] = var12
	end
end

function t:_stopBoundFn(p9)
	local dtorMap = self._dtorMap
	local var13 = dtorMap[p9]
	
	if var13 then
		var13()
		dtorMap[p9] = nil
	end
end

function t:bindRoot(p10)
	-- upvalues: unbindNodeDescend (ref)
	debug.profilebegin("AtomicBinding:BindRoot")
	local parsedManifest = self._parsedManifest
	local rootInstToRootNode = self._rootInstToRootNode
	local rootInstToManifest = self._rootInstToManifest
	local manifestSizeTarget = self._manifestSizeTarget
	
	if rootInstToManifest[p10] ~= nil then return end
	local t = {}
	rootInstToManifest[p10] = t
	debug.profilebegin("BuildTree")
	local t_1 = { alias = "root", instance = p10 }
	
	if next(parsedManifest) then
		t_1.children = {}
		t_1.connections = {}
	end
	rootInstToRootNode[p10] = t_1
	
	for i, v in pairs(parsedManifest) do
		local var17 = t_1
		
		for i_1, v_1 in ipairs(v) do
			local var18 = var17.children[v_1] or {}
			
			if i_1 == #v then
				if var18.alias ~= nil then
					error("Multiple aliases assigned to one instance")
				end
				var18.alias = i
			else
				var18.children = var18.children or {}
				var18.connections = var18.connections or {}
			end
			var17.children[v_1] = var18
			var17 = var18
		end
	end
	debug.profileend()
	
	local function processNode(p11)
		-- upvalues: t (ref), processNode (ref), self (ref), p10 (ref), unbindNodeDescend (copy), manifestSizeTarget (ref)
		local var19 = assert(p11.instance, "instance does not exist")
		local children = p11.children
		local alias = p11.alias
		local var20 = not children
		
		if alias then
			t[alias] = var19
		end
		if not var20 then
			local function processAddChild(p12)
				-- upvalues: children (ref), processNode (copy)
				local name = children[p12.Name]
				
				if name and name.instance == nil then
					name.instance = p12
					processNode(name)
					
					return
				end
			end
			
			local function processDeleteChild(p13)
				-- upvalues: children (ref), self (copy), p10 (copy), unbindNodeDescend (copy), t (copy), var19 (ref), processNode (copy)
				local name = p13.Name
				local var26 = children[name]
				
				if not var26 then return end
				if var26.instance ~= p13 then return end
				self:_stopBoundFn(p10)
				unbindNodeDescend(var26, t)
				assert(var26.instance == nil, "unbindNodeDescend failed")
				local var27 = var19:FindFirstChild(name)
				
				if var27 then
					local name_1 = children[var27.Name]
					
					if name_1 then
						if name_1.instance ~= nil then return end
						name_1.instance = var27
						processNode(name_1)
					end
				end
			end
			
			for i, v in ipairs(var19:GetChildren()) do
				local name = children[v.Name]
				
				if name and name.instance == nil then
					name.instance = v
					processNode(name)
				end
			end
			table.insert(p11.connections, var19.ChildAdded:Connect(processAddChild))
			table.insert(p11.connections, var19.ChildRemoved:Connect(processDeleteChild))
		end
		if var20 then
			local var23 = t
			local var24 = manifestSizeTarget
			local var25 = 0
			
			for i in pairs(var23) do
				var25 += 1
			end
			assert(var25 <= var24, var25)
			
			if var25 == var24 then
				self:_startBoundFn(p10, t)
			end
		end
	end
	
	debug.profilebegin("ResolveTree")
	processNode(t_1)
	debug.profileend()
	debug.profileend()
end

function t:unbindRoot(p14)
	-- upvalues: unbindNodeDescend (ref)
	local rootInstToRootNode = self._rootInstToRootNode
	local rootInstToManifest = self._rootInstToManifest
	self:_stopBoundFn(p14)
	local var28 = rootInstToRootNode[p14]
	
	if var28 then
		unbindNodeDescend(var28, assert(rootInstToManifest[p14], "rootInstToManifest is nil"))
		rootInstToRootNode[p14] = nil
	end
	rootInstToManifest[p14] = nil
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