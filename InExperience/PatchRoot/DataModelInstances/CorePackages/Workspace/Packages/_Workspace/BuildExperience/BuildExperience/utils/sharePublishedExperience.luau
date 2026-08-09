local parent = script:FindFirstAncestor("BuildExperience").Parent
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local isSubjectToDesktopPolicies = require(parent.SharedFlags).isSubjectToDesktopPolicies

return {
	getGameShareUrl = function(p0) --[[ line: 15 ]]
		return `https://www.roblox.com/games/{p0}`
	end,
	sharePublishedExperience = function(p1) --[[ line: 19 ]]
		-- upvalues: isSubjectToDesktopPolicies (ref), default (ref)
		local var0 = `https://www.roblox.com/games/{p1}`
		
		if isSubjectToDesktopPolicies() then
			default:setClipboardText({ context = "BuildExperienceGameShare", text = var0 })
			
			return { copiedToClipboard = true, url = var0 }
		end
		default:shareUrl({ context = "BuildExperienceGameShare", url = var0 })
		
		return { copiedToClipboard = false, url = var0 }
	end
}