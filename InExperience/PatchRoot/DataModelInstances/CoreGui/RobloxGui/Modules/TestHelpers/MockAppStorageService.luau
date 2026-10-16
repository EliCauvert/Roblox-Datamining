local MockAppStorageService = {}
MockAppStorageService.__index = MockAppStorageService

function MockAppStorageService.new(p1) --[[ Line: 4 ]]
	-- upvalues: MockAppStorageService (copy)
	local P0 = p1 or {}
	setmetatable(P0, { __index = MockAppStorageService })
	
	return P0
end

function MockAppStorageService:GetItem(p1) --[[ Line: 13 ]]
	return self[p1]
end

function MockAppStorageService:SetItem(Key, p1) --[[ Line: 18 ]]
	self[Key] = tostring(p1)
end

function MockAppStorageService:flush() --[[ Line: 22 ]] end

return MockAppStorageService