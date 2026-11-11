local function parsePath(Text: string)
	local Parts = string.split(Text, "/")
	
	for i = #Parts, 1, -1 do
		if Parts[i] == "" then
			table.remove(Parts, i)
		end
	end
	return Parts
end

local function _(List, Count): boolean
	local Count1 = 0
	
	for _ in pairs(List) do
		Count1 += 1
	end
	assert(Count1 <= Count, Count1)
	
	return Count1 == Count
end

local function unbindNodeDescend(p1, RootInstToManifestIsNil)
	-- upvalues: unbindNodeDescend (copy)
	if p1.instance == nil then return end
	p1.instance = nil
	local Connections = p1.connections
	
	if Connections then
		for _, connection in ipairs(Connections) do
			connection:Disconnect()
		end
		table.clear(Connections)
	end
	if RootInstToManifestIsNil and p1.alias then
		RootInstToManifestIsNil[p1.alias] = nil
	end
	local Children = p1.children
	
	if Children then
		for _, child in pairs(Children) do
			unbindNodeDescend(child, RootInstToManifestIsNil)
		end
	end
end

local AtomicBindingModule = {}
AtomicBindingModule.__index = AtomicBindingModule

function AtomicBindingModule.new(List, _boundFn)
	-- upvalues: parsePath (copy), AtomicBindingModule (copy)
	local _dtorMap = {}
	local _connections = {}
	local _rootInstToRootNode = {}
	local _rootInstToManifest = {}
	local _parsedManifest = {}
	local _manifestSizeTarget = 1
	
	for i, value in pairs(List) do
		_parsedManifest[i] = parsePath(value)
		_manifestSizeTarget += 1
	end
	return (setmetatable({
		_boundFn = _boundFn,
		_parsedManifest = _parsedManifest,
		_manifestSizeTarget = _manifestSizeTarget,
		_dtorMap = _dtorMap,
		_connections = _connections,
		_rootInstToRootNode = _rootInstToRootNode,
		_rootInstToManifest = _rootInstToManifest
	}, AtomicBindingModule))
end

function AtomicBindingModule:_startBoundFn(Key, InstanceDoesNotExists)
	local BoundFnFunction = self._boundFn
	local DtorMap = self._dtorMap
	local Callback: () -> () = DtorMap[Key]
	
	if Callback then
		Callback()
		DtorMap[Key] = nil
	end
	local BoundFnResult = BoundFnFunction(InstanceDoesNotExists)
	
	if BoundFnResult then
		DtorMap[Key] = BoundFnResult
	end
end

function AtomicBindingModule:_stopBoundFn(Key)
	local DtorMap = self._dtorMap
	local Callback: () -> () = DtorMap[Key]
	
	if Callback then
		Callback()
		DtorMap[Key] = nil
	end
end

function AtomicBindingModule:bindRoot(Key)
	-- upvalues: unbindNodeDescend (copy)
	debug.profilebegin("AtomicBinding:BindRoot")
	local ParsedManifest = self._parsedManifest
	local RootInstToRootNode = self._rootInstToRootNode
	local RootInstToManifest = self._rootInstToManifest
	local ManifestSizeTarget = self._manifestSizeTarget
	
	if RootInstToManifest[Key] ~= nil then return end
	local InstanceDoesNotExists = {}
	RootInstToManifest[Key] = InstanceDoesNotExists
	debug.profilebegin("BuildTree")
	local config = { alias = "root", instance = Key }
	
	if next(ParsedManifest) then
		config.children = {}
		config.connections = {}
	end
	RootInstToRootNode[Key] = config
	
	for Alias, value in pairs(ParsedManifest) do
		local config1 = config
		
		for i, value1 in ipairs(value) do
			local Child = config1.children[value1] or {}
			
			if i == #value then
				if Child.alias ~= nil then
					error("Multiple aliases assigned to one instance")
				end
				Child.alias = Alias
			else
				Child.children = Child.children or {}
				Child.connections = Child.connections or {}
			end
			config1.children[value1] = Child
			config1 = Child
		end
	end
	debug.profileend()
	
	local function processNode(p2)
		-- upvalues: InstanceDoesNotExists (copy), processNode (copy), self (copy), Key (copy), unbindNodeDescend (upval), ManifestSizeTarget (copy)
		local InstanceDoesNotExist = assert(p2.instance, "instance does not exist")
		local Children = p2.children
		local Alias = p2.alias
		local NoChildren = not Children
		
		if Alias then
			InstanceDoesNotExists[Alias] = InstanceDoesNotExist
		end
		if not NoChildren then
			local function processAddChild(Child)
				-- upvalues: Children (copy), processNode (upval)
				local Child1 = Children[Child.Name]
				
				if Child1 and Child1.instance == nil then
					Child1.instance = Child
					processNode(Child1)
					
					return
				end
			end
			
			local function processDeleteChild(Child)
				-- upvalues: Children (copy), self (upval), Key (upval), unbindNodeDescend (upval), InstanceDoesNotExists (upval), InstanceDoesNotExist (copy), processNode (upval)
				local Name = Child.Name
				local Child1 = Children[Name]
				
				if not Child1 then return end
				if Child1.instance ~= Child then return end
				self:_stopBoundFn(Key)
				unbindNodeDescend(Child1, InstanceDoesNotExists)
				assert(Child1.instance == nil, "unbindNodeDescend failed")
				local Name1 = InstanceDoesNotExist:FindFirstChild(Name)
				
				if Name1 then
					local Child2 = Children[Name1.Name]
					
					if Child2 then
						if Child2.instance ~= nil then return end
						Child2.instance = Name1
						processNode(Child2)
					end
				end
			end
			
			for _, child in ipairs(InstanceDoesNotExist:GetChildren()) do
				local Child = Children[child.Name]
				
				if Child and Child.instance == nil then
					Child.instance = child
					processNode(Child)
				end
			end
			table.insert(p2.connections, InstanceDoesNotExist.ChildAdded:Connect(processAddChild))
			table.insert(p2.connections, InstanceDoesNotExist.ChildRemoved:Connect(processDeleteChild))
		end
		if NoChildren then
			local Count = 0
			
			for _ in pairs(InstanceDoesNotExists) do
				Count += 1
			end
			assert(Count <= ManifestSizeTarget, Count)
			
			if Count == ManifestSizeTarget then
				self:_startBoundFn(Key, InstanceDoesNotExists)
			end
		end
	end
	
	debug.profilebegin("ResolveTree")
	processNode(config)
	debug.profileend()
	debug.profileend()
end

function AtomicBindingModule:unbindRoot(Key)
	-- upvalues: unbindNodeDescend (copy)
	local RootInstToRootNode = self._rootInstToRootNode
	local RootInstToManifest = self._rootInstToManifest
	self:_stopBoundFn(Key)
	local RootInstToRootNodeEntry = RootInstToRootNode[Key]
	
	if RootInstToRootNodeEntry then
		unbindNodeDescend(RootInstToRootNodeEntry, (assert(RootInstToManifest[Key], "rootInstToManifest is nil")))
		RootInstToRootNode[Key] = nil
	end
	RootInstToManifest[Key] = nil
end

function AtomicBindingModule:destroy()
	-- upvalues: unbindNodeDescend (copy)
	debug.profilebegin("AtomicBinding:destroy")
	
	for _, value in pairs(self._dtorMap) do
		value:destroy()
	end
	table.clear(self._dtorMap)
	
	for _, connection in ipairs(self._connections) do
		connection:Disconnect()
	end
	table.clear(self._connections)
	local RootInstToManifest = self._rootInstToManifest
	
	for i, value1 in pairs(self._rootInstToRootNode) do
		unbindNodeDescend(value1, (assert(RootInstToManifest[i], "rootInstToManifest is nil")))
	end
	table.clear(self._rootInstToManifest)
	table.clear(self._rootInstToRootNode)
	debug.profileend()
end

return AtomicBindingModule