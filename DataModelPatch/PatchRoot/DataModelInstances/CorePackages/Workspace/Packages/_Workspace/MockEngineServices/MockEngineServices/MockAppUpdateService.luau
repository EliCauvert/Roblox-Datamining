local MockAppUpdateService = {}
MockAppUpdateService.__index = MockAppUpdateService

function MockAppUpdateService.new(p1, p2)
	-- upvalues: MockAppUpdateService (copy)
	local config = { status = p1 or "", updateError = p2 or false }
	setmetatable(config, { __index = MockAppUpdateService })
	
	return config
end

function MockAppUpdateService:CheckForUpdate(Callback: (any) -> ())
	if self.updateError then
		error("Error: CheckForUpdate")
	end
	Callback(self.status)
end

function MockAppUpdateService:PerformManagedUpdate() end

function MockAppUpdateService:CanPerformBinaryUpdate(): boolean
	return false
end

return MockAppUpdateService