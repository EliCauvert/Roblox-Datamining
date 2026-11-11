local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetGameSocialLinksModule = require(Modules.LuaApp.Actions.Games.SetGameSocialLinks)
local GamesGetSocialLinksModule = require(Modules.LuaApp.Http.Requests.GamesApi.GamesGetSocialLinks)
local GameSocialLinkModule = require(Modules.LuaApp.Models.GamesApi.GameSocialLink)
local SocialMediaTypeModule = require(Modules.LuaApp.Enum.SocialMediaType)
local EnableCommunityProfilePageIXPModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)
local ProcessGameSocialLinksModule = require(script.Parent.ProcessGameSocialLinks)
local FFlagLuaAppProcessGameSocialLinks = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppProcessGameSocialLinks

local function _(p1): boolean
	-- upvalues: SocialMediaTypeModule (copy)
	for _, value in pairs(SocialMediaTypeModule) do
		if p1 == value then
			return true
		end
	end
	return false
end

return function(p2, p3)
	-- upvalues: GamesGetSocialLinksModule (copy), FFlagLuaAppProcessGameSocialLinks (copy), ProcessGameSocialLinksModule (copy), SetGameSocialLinksModule (copy), GameSocialLinkModule (copy), SocialMediaTypeModule (copy), EnableCommunityProfilePageIXPModule (copy)
	return function(p4)
		-- upvalues: GamesGetSocialLinksModule (upval), p2 (copy), p3 (copy), FFlagLuaAppProcessGameSocialLinks (upval), ProcessGameSocialLinksModule (upval), SetGameSocialLinksModule (upval), GameSocialLinkModule (upval), SocialMediaTypeModule (upval), EnableCommunityProfilePageIXPModule (upval)
		return GamesGetSocialLinksModule(p2, p3):andThen(function(Result)
			-- upvalues: FFlagLuaAppProcessGameSocialLinks (upval), ProcessGameSocialLinksModule (upval), p3 (upval), p4 (copy), SetGameSocialLinksModule (upval), GameSocialLinkModule (upval), SocialMediaTypeModule (upval), EnableCommunityProfilePageIXPModule (upval)
			local Data = Result.responseBody.data
			local ExternalLinks = {}
			local GroupLink = nil
			
			if FFlagLuaAppProcessGameSocialLinks then
				p4:dispatch(SetGameSocialLinksModule(p3, (ProcessGameSocialLinksModule(Data, (tostring(p3))))))
				
				return
			end
			local Flag = nil
			for _, entry in ipairs(Data) do
				local FromJsonDataResult = GameSocialLinkModule.fromJsonData(entry)
				local Type = FromJsonDataResult.type
				Flag = false
				
				for _, value in pairs(SocialMediaTypeModule) do
					if Type == value then
						Flag = true
						break
					end
				end
				if not Flag then
					warn("Can NOT recognize " .. FromJsonDataResult.type .. " as a valid Social Link Type!")
				elseif FromJsonDataResult.type ~= SocialMediaTypeModule.RobloxGroup then
					table.insert(ExternalLinks, FromJsonDataResult)
				elseif GroupLink then
					warn("Detected multiple " .. FromJsonDataResult.type .. " links for universe " .. p3 .. "!")
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
			p4:dispatch(SetGameSocialLinksModule(p3, { externalLinks = ExternalLinks, groupLink = GroupLink }))
		end)
	end
end