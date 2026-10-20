local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local NotificationService = game:GetService("NotificationService")
local FFlagBuildExperienceLibrary = require(script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent.SharedFlags).FFlagBuildExperienceLibrary

local function _(Text: string): string?
	if type(Text) == "string" then
		local Lowered = string.lower(Text)
		
		if Lowered == "light" or Lowered == "dark" then
			return Lowered
		end
	end
	return nil
end

local BuildModeLaunchModule = {}
BuildModeLaunchModule.__index = BuildModeLaunchModule

function BuildModeLaunchModule.new()
	-- upvalues: BuildModeLaunchModule (copy)
	return (setmetatable({
		cachedResult = nil,
		cachedSelectedTheme = nil,
		cachedChatSessionId = nil,
		cachedChatPlaceId = nil,
		cachedTeamTestPlaceId = nil
	}, BuildModeLaunchModule))
end

function BuildModeLaunchModule:set(ChatSessionId, ChatPlaceId, p1)
	-- upvalues: FFlagBuildExperienceLibrary (copy), NotificationService (copy), MemStorageService (copy), HttpService (copy)
	local config = { hasBuildMode = true }
	
	if p1 then
		config.teamTestPlaceId = ChatPlaceId
	end
	repeat
		if not FFlagBuildExperienceLibrary then break end
		local SelectedTheme: string = NotificationService.SelectedTheme
		local CachedSelectedTheme = nil
		repeat
			if type(SelectedTheme) == "string" then
				local Lowered = string.lower(SelectedTheme)
				
				if Lowered == "light" or Lowered == "dark" then
					CachedSelectedTheme = Lowered
					break
				end
			end
			CachedSelectedTheme = nil
		until true
		if not CachedSelectedTheme then
			CachedSelectedTheme = self.cachedSelectedTheme
		end
		self.cachedSelectedTheme = CachedSelectedTheme
		config.selectedTheme = self.cachedSelectedTheme
		config.chatSessionId = ChatSessionId
		config.chatPlaceId = ChatPlaceId
	until true
	self.cachedResult = nil
	MemStorageService:SetItem("BuildExperienceLaunchData", HttpService:JSONEncode(config))
end

function BuildModeLaunchModule:hasBuildMode()
	-- upvalues: FFlagBuildExperienceLibrary (copy), MemStorageService (copy), HttpService (copy)
	if self.cachedResult ~= nil then
		return self.cachedResult
	end
	if FFlagBuildExperienceLibrary then
		self.cachedSelectedTheme = nil
		self.cachedChatSessionId = nil
		self.cachedChatPlaceId = nil
	end
	self.cachedTeamTestPlaceId = nil
	local BuildExperienceLaunchDataItem = MemStorageService:GetItem("BuildExperienceLaunchData")
	
	if BuildExperienceLaunchDataItem == "" then
		self.cachedResult = false
		
		return false
	end
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, BuildExperienceLaunchDataItem)
	
	if not Success or type(Result) ~= "table" then
		self.cachedResult = false
		
		return false
	end
	MemStorageService:SetItem("BuildExperienceLaunchData", "")
	self.cachedResult = Result.hasBuildMode == true
	
	if self.cachedResult and type(Result.teamTestPlaceId) == "number" then
		self.cachedTeamTestPlaceId = Result.teamTestPlaceId
	end
	repeat
		if not FFlagBuildExperienceLibrary or not self.cachedResult then break end
		local SelectedTheme: string = Result.selectedTheme
		local CachedSelectedTheme = nil
		repeat
			if type(SelectedTheme) == "string" then
				local Lowered = string.lower(SelectedTheme)
				
				if Lowered == "light" or Lowered == "dark" then
					CachedSelectedTheme = Lowered
					break
				end
			end
			CachedSelectedTheme = nil
		until true
		self.cachedSelectedTheme = CachedSelectedTheme
		
		if type(Result.chatSessionId) ~= "string" or Result.chatSessionId == "" or type(Result.chatPlaceId) ~= "number" then break end
		self.cachedChatSessionId = Result.chatSessionId
		self.cachedChatPlaceId = Result.chatPlaceId
	until true
	return self.cachedResult
end

function BuildModeLaunchModule:applyViewerTheme()
	-- upvalues: NotificationService (copy)
	self:hasBuildMode()
	
	if self.cachedSelectedTheme ~= nil then
		NotificationService.SelectedTheme = self.cachedSelectedTheme
	end
end

function BuildModeLaunchModule:getChatSessionId(CachedChatPlaceId)
	self:hasBuildMode()
	
	return if self.cachedChatPlaceId == CachedChatPlaceId then self.cachedChatSessionId else nil
end

function BuildModeLaunchModule:getTeamTestPlaceId()
	self:hasBuildMode()
	
	return self.cachedTeamTestPlaceId
end

return BuildModeLaunchModule