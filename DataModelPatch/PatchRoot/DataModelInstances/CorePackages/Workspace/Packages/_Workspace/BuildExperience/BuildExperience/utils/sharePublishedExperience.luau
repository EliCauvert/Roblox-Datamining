local Parent = script:FindFirstAncestor("BuildExperience").Parent
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local IsSubjectToDesktopPoliciesFunction = require(Parent.SharedFlags).isSubjectToDesktopPolicies

return {
	getGameShareUrl = function(p1): string
		return `https://www.roblox.com/games/{p1}`
	end,
	sharePublishedExperience = function(p1)
		-- upvalues: IsSubjectToDesktopPoliciesFunction (copy), Default (copy)
		local Url: string = `https://www.roblox.com/games/{p1}`
		
		if IsSubjectToDesktopPoliciesFunction() then
			Default:setClipboardText({ context = "BuildExperienceGameShare", text = Url })
			
			return { copiedToClipboard = true, url = Url }
		else
			Default:shareUrl({ context = "BuildExperienceGameShare", url = Url })
			
			return { copiedToClipboard = false, url = Url }
		end
	end
}