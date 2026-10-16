local Module = {}
Module.__index = Module

function Module.GetInstance(p1, p2) --[[ Line: 14 ]]
	if p1.InstancePoolsByClass[p2] == nil then
		p1.InstancePoolsByClass[p2] = {}
	end
	local Count = #p1.InstancePoolsByClass[p2]
	
	if Count > 0 then
		local InstancePoolsByClassEntry = p1.InstancePoolsByClass[p2][Count]
		table.remove(p1.InstancePoolsByClass[p2])
		
		return InstancePoolsByClassEntry
	else
		return Instance.new(p2)
	end
end

function Module.ReturnInstance(p1, Object) --[[ Line: 27 ]]
	if p1.InstancePoolsByClass[Object.ClassName] == nil then
		p1.InstancePoolsByClass[Object.ClassName] = {}
	end
	if #p1.InstancePoolsByClass[Object.ClassName] < p1.PoolSizePerType then
		table.insert(p1.InstancePoolsByClass[Object.ClassName], Object)
		
		return
	else
		Object:Destroy()
	end
end

return {
	new = function(PoolSizePerType) --[[ Line: 41 ]]
		-- upvalues: Module (copy)
		local ObjectPool = setmetatable({}, Module)
		ObjectPool.InstancePoolsByClass = {}
		ObjectPool.Name = "ObjectPool"
		ObjectPool.PoolSizePerType = PoolSizePerType
		
		return ObjectPool
	end
}