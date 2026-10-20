local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local BuildModeLaunchModule = {}
BuildModeLaunchModule.__index = BuildModeLaunchModule

function BuildModeLaunchModule.new()
	-- upvalues: BuildModeLaunchModule (copy)
	return (setmetatable({ cachedResult = nil }, BuildModeLaunchModule))
end

function BuildModeLaunchModule:set()
	-- upvalues: MemStorageService (copy), HttpService (copy)
	self.cachedResult = nil
	MemStorageService:SetItem("BuildExperienceLaunchData", HttpService:JSONEncode({ hasBuildMode = true }))
end

function BuildModeLaunchModule:hasBuildMode()
	-- upvalues: MemStorageService (copy), HttpService (copy)
	if self.cachedResult ~= nil then
		return self.cachedResult
	end
	local BuildExperienceLaunchDataItem = MemStorageService:GetItem("BuildExperienceLaunchData")
	
	if BuildExperienceLaunchDataItem == "" then
		self.cachedResult = false
		
		return false
	end
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, BuildExperienceLaunchDataItem)
	
	if Success and type(Result) == "table" then
		MemStorageService:SetItem("BuildExperienceLaunchData", "")
		self.cachedResult = Result.hasBuildMode == true
		
		return self.cachedResult
	else
		self.cachedResult = false
		
		return false
	end
end

return BuildModeLaunchModule