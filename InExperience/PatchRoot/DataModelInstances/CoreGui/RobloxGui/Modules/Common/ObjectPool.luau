local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.GetInstance(p0, p1) --[[ line: 14 ]]
	if p0.InstancePoolsByClass[p1] == nil then
		p0.InstancePoolsByClass[p1] = {}
	end
	local count = #p0.InstancePoolsByClass[p1]
	
	if count > 0 then
		local var3 = p0.InstancePoolsByClass[p1][count]
		table.remove(p0.InstancePoolsByClass[p1])
		
		return var3
	end
	return Instance.new(p1)
end

function t_1.ReturnInstance(p2, p3) --[[ line: 27 ]]
	if p2.InstancePoolsByClass[p3.ClassName] == nil then
		p2.InstancePoolsByClass[p3.ClassName] = {}
	end
	if #p2.InstancePoolsByClass[p3.ClassName] < p2.PoolSizePerType then
		table.insert(p2.InstancePoolsByClass[p3.ClassName], p3)
		
		return
	end
	p3:Destroy()
end

function t.new(p4) --[[ line: 41 ]]
	-- upvalues: t_1 (ref)
	local objectPool = setmetatable({}, t_1)
	objectPool.InstancePoolsByClass = {}
	objectPool.Name = "ObjectPool"
	objectPool.PoolSizePerType = p4
	
	return objectPool
end

return t