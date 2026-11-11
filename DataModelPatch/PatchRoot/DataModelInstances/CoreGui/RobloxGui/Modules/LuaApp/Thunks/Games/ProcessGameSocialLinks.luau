local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GameSocialLinkModule = require(Modules.LuaApp.Models.GamesApi.GameSocialLink)
local SocialMediaTypeModule = require(Modules.LuaApp.Enum.SocialMediaType)
local EnableCommunityProfilePageIXPModule = require(game:GetService("CorePackages").Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)

local function _(p1): boolean
	-- upvalues: SocialMediaTypeModule (copy)
	for _, value in pairs(SocialMediaTypeModule) do
		if p1 == value then
			return true
		end
	end
	return false
end

return function(List, Text)
	-- upvalues: GameSocialLinkModule (copy), SocialMediaTypeModule (copy), EnableCommunityProfilePageIXPModule (copy)
	local ExternalLinks = {}
	local GroupLink = nil
	local Flag = nil
	
	for _, value in ipairs(List) do
		local FromJsonDataResult = GameSocialLinkModule.fromJsonData(value)
		local Type = FromJsonDataResult.type
		Flag = false
		
		for _, value1 in pairs(SocialMediaTypeModule) do
			if Type == value1 then
				Flag = true
				break
			end
		end
		if not Flag then
			warn("Can NOT recognize " .. FromJsonDataResult.type .. " as a valid Social Link Type!")
		elseif FromJsonDataResult.type ~= SocialMediaTypeModule.RobloxGroup then
			table.insert(ExternalLinks, FromJsonDataResult)
		elseif GroupLink then
			warn("Detected multiple " .. FromJsonDataResult.type .. " links for universe " .. Text .. "!")
		else
			GroupLink = FromJsonDataResult
			
			if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and GroupLink.url ~= nil then
				local Parts = string.split(GroupLink.url, "/")
				local Part = Parts[#Parts]
				
				if tonumber(Part) ~= nil then
					GroupLink.communityId = Part
				end
			end
		end
	end
	return { externalLinks = ExternalLinks, groupLink = GroupLink }
end