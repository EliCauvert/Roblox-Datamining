local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.GetInstance(p1, p2)
	if p1.InstancePoolsByClass[p2] == nil then
		p1.InstancePoolsByClass[p2] = {}
	end
	local count = #p1.InstancePoolsByClass[p2]
	
	if count > 0 then
		local var1 = p1.InstancePoolsByClass[p2][count]
		table.remove(p1.InstancePoolsByClass[p2])
		
		return var1
	end
	return Instance.new(p2)
end

function t_1.ReturnInstance(p1, p2)
	if p1.InstancePoolsByClass[p2.ClassName] == nil then
		p1.InstancePoolsByClass[p2.ClassName] = {}
	end
	if #p1.InstancePoolsByClass[p2.ClassName] < p1.PoolSizePerType then
		table.insert(p1.InstancePoolsByClass[p2.ClassName], p2)
		
		return
	end
	p2:Destroy()
end

function t.new(p1)
	-- upvalues: t_1 (ref)
	local objectPool = setmetatable({}, t_1)
	objectPool.InstancePoolsByClass = {}
	objectPool.Name = "ObjectPool"
	objectPool.PoolSizePerType = p1
	
	return objectPool
end

return t