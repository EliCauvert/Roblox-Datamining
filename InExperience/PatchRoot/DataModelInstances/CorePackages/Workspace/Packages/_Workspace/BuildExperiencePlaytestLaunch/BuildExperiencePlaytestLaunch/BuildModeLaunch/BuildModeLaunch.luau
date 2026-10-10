local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local notificationService = game:GetService("NotificationService")
local fFlagBuildExperienceLibrary = require(script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent.SharedFlags).FFlagBuildExperienceLibrary

local function _(p1)
	if type(p1) == "string" then
		local lowerText = string.lower(p1)
		
		return if lowerText == "light" or lowerText == "dark" then lowerText else nil
	end
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({
		cachedResult = nil,
		cachedSelectedTheme = nil,
		cachedChatSessionId = nil,
		cachedChatPlaceId = nil,
		cachedTeamTestPlaceId = nil
	}, t)
end

function t:set(p1, p2, p3)
	-- upvalues: fFlagBuildExperienceLibrary (ref), notificationService (ref), memStorageService (ref), httpService (ref)
	local t = { hasBuildMode = true }
	
	if p3 then
		t.teamTestPlaceId = p2
	end
	if fFlagBuildExperienceLibrary then
		local var1
		local selectedTheme = notificationService.SelectedTheme
		
		if type(selectedTheme) == "string" then
			local lowerText = string.lower(selectedTheme)
			var1 = if lowerText == "light" or lowerText == "dark" then lowerText else nil
		end
		self.cachedSelectedTheme = var1 or self.cachedSelectedTheme
		t.selectedTheme = self.cachedSelectedTheme
		t.chatSessionId = p1
		t.chatPlaceId = p2
	end
	self.cachedResult = nil
	memStorageService:SetItem("BuildExperienceLaunchData", httpService:JSONEncode(t))
end

function t:hasBuildMode()
	-- upvalues: fFlagBuildExperienceLibrary (ref), memStorageService (ref), httpService (ref)
	if self.cachedResult ~= nil then
		return self.cachedResult
	elseif fFlagBuildExperienceLibrary then
		self.cachedSelectedTheme = nil
		self.cachedChatSessionId = nil
		self.cachedChatPlaceId = nil
	end
	self.cachedTeamTestPlaceId = nil
	local buildExperienceLaunchDataItem = memStorageService:GetItem("BuildExperienceLaunchData")
	
	if buildExperienceLaunchDataItem == "" then
		self.cachedResult = false
		
		return false
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, buildExperienceLaunchDataItem)
	
	if not ok or type(status) ~= "table" then
		self.cachedResult = false
		
		return false
	end
	memStorageService:SetItem("BuildExperienceLaunchData", "")
	self.cachedResult = status.hasBuildMode == true
	
	if self.cachedResult and type(status.teamTestPlaceId) == "number" then
		self.cachedTeamTestPlaceId = status.teamTestPlaceId
	end
	if fFlagBuildExperienceLibrary and self.cachedResult then
		local var1
		local selectedTheme = status.selectedTheme
		
		if type(selectedTheme) == "string" then
			local lowerText = string.lower(selectedTheme)
			var1 = if lowerText == "light" or lowerText == "dark" then lowerText else nil
		end
		self.cachedSelectedTheme = var1
		
		if type(status.chatSessionId) == "string" and status.chatSessionId ~= "" and type(status.chatPlaceId) == "number" then
			self.cachedChatSessionId = status.chatSessionId
			self.cachedChatPlaceId = status.chatPlaceId
		end
	end
	return self.cachedResult
end

function t:applyViewerTheme()
	-- upvalues: notificationService (ref)
	self:hasBuildMode()
	
	if self.cachedSelectedTheme ~= nil then
		notificationService.SelectedTheme = self.cachedSelectedTheme
	end
end

function t:getChatSessionId(p1)
	self:hasBuildMode()
	
	return if self.cachedChatPlaceId == p1 then self.cachedChatSessionId else nil
end

function t:getTeamTestPlaceId()
	self:hasBuildMode()
	
	return self.cachedTeamTestPlaceId
end

return t