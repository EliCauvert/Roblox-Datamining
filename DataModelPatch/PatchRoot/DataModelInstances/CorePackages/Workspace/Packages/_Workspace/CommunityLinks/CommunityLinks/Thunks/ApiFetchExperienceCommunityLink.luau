local Parent = script:FindFirstAncestor("CommunityLinks").Parent
local PromiseModule = require(Parent.Promise)
local StatusCodes = require(Parent.Http).StatusCodes
local SetExperienceCommunityLinkModule = require(script.Parent.Parent.Actions.SetExperienceCommunityLink)
local GetCommunityLinkModule = require(script.Parent.Parent.Requests.GetCommunityLink)
local CommunityInfoModule = require(script.Parent.Parent.Models.CommunityInfo)
local CommunityVisibilityModule = require(script.Parent.Parent.Enums.CommunityVisibility)

return function(p1, p2)
	-- upvalues: GetCommunityLinkModule (copy), CommunityInfoModule (copy), CommunityVisibilityModule (copy), SetExperienceCommunityLinkModule (copy), StatusCodes (copy), PromiseModule (copy)
	return function(p3)
		-- upvalues: GetCommunityLinkModule (upval), p1 (copy), p2 (copy), CommunityInfoModule (upval), CommunityVisibilityModule (upval), SetExperienceCommunityLinkModule (upval), StatusCodes (upval), PromiseModule (upval)
		return GetCommunityLinkModule(p1, p2):andThen(function(Result)
			-- upvalues: CommunityInfoModule (upval), CommunityVisibilityModule (upval), p3 (copy), SetExperienceCommunityLinkModule (upval), p2 (upval)
			if Result.responseBody ~= nil and Result.responseBody.communityId ~= nil then
				local FromJsonDataResult = CommunityInfoModule.fromJsonData(Result.responseBody)
				
				if FromJsonDataResult.visibility == CommunityVisibilityModule.Public then
					p3:dispatch(SetExperienceCommunityLinkModule(p2, FromJsonDataResult))
					
					return
				end
			end
			p3:dispatch(SetExperienceCommunityLinkModule(p2, false))
		end, function(p4)
			-- upvalues: StatusCodes (upval), p3 (copy), SetExperienceCommunityLinkModule (upval), p2 (upval), PromiseModule (upval)
			if p4.StatusCode == StatusCodes.NOT_FOUND then
				p3:dispatch(SetExperienceCommunityLinkModule(p2, false))
			end
			return PromiseModule.resolve()
		end)
	end
end