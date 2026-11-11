local MockAppStorageService = {}
MockAppStorageService.__index = MockAppStorageService

function MockAppStorageService.new(p1)
	-- upvalues: MockAppStorageService (copy)
	local P0 = p1 or {}
	setmetatable(P0, { __index = MockAppStorageService })
	
	return P0
end

function MockAppStorageService:GetItem(p1)
	return self[p1]
end

function MockAppStorageService:SetItem(Key, p1)
	self[Key] = tostring(p1)
end

function MockAppStorageService:flush() end

return MockAppStorageService