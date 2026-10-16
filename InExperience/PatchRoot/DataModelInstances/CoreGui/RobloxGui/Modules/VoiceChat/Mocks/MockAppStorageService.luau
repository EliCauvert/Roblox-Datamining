local MockAppStorageService = {}
MockAppStorageService.__index = MockAppStorageService

function MockAppStorageService.new(Tbl) --[[ Line: 4 ]]
	-- upvalues: MockAppStorageService (copy)
	return (setmetatable({ _privateValues = table.clone(Tbl) }, MockAppStorageService))
end

function MockAppStorageService:GetItem(p1) --[[ Line: 12 ]]
	return self._privateValues[p1]
end

function MockAppStorageService:SetItem(p1, p2) --[[ Line: 16 ]]
	self._privateValues[p1] = p2
end

function MockAppStorageService:Flush() --[[ Line: 20 ]] end

function MockAppStorageService:_DeepEquals(List): boolean --[[ Line: 23 ]]
	for i, value in List do
		if self._privateValues[i] ~= value then
			return false
		end
	end
	return true
end

return MockAppStorageService