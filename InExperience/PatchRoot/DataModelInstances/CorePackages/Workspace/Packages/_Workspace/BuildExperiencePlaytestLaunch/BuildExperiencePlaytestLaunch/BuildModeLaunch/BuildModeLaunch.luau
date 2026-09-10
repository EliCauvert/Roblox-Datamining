local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({ cachedResult = nil, cachedModelLibraryLaunchData = nil }, t)
end

function t:set(p1)
	-- upvalues: memStorageService (ref), httpService (ref)
	self.cachedResult = nil
	self.cachedModelLibraryLaunchData = nil
	memStorageService:SetItem("BuildExperienceLaunchData", httpService:JSONEncode({ hasBuildMode = true, modelLibraryLaunchData = p1 }))
end

function t:hasBuildMode()
	-- upvalues: memStorageService (ref), httpService (ref)
	if self.cachedResult ~= nil then
		return self.cachedResult
	end
	local buildExperienceLaunchDataItem = memStorageService:GetItem("BuildExperienceLaunchData")
	
	if buildExperienceLaunchDataItem == "" then
		self.cachedResult = false
		
		return false
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, buildExperienceLaunchDataItem)
	
	if ok and type(status) == "table" then
		memStorageService:SetItem("BuildExperienceLaunchData", "")
		self.cachedResult = status.hasBuildMode == true
		self.cachedModelLibraryLaunchData = status.modelLibraryLaunchData
		
		return self.cachedResult
	end
	self.cachedResult = false
	
	return false
end

function t:takeModelLibraryLaunchData()
	self:hasBuildMode()
	local cachedModelLibraryLaunchData = self.cachedModelLibraryLaunchData
	self.cachedModelLibraryLaunchData = nil
	
	return cachedModelLibraryLaunchData
end

return t