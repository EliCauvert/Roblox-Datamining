local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local universalShareSheet = require(parent.ShareSheet).UniversalShareSheet
local sharedFlagsModule = require(parent.SharedFlags)
local createPrivateShareLinkModule = require(buildExperience.utils.createPrivateShareLink)
local fFlagEnableShareSheet = sharedFlagsModule.FFlagEnableShareSheet
local isSubjectToDesktopPolicies = sharedFlagsModule.isSubjectToDesktopPolicies

return function(p1)
	-- upvalues: createPrivateShareLinkModule (ref), fFlagEnableShareSheet (ref), universalShareSheet (ref), isSubjectToDesktopPolicies (ref), default (ref)
	return createPrivateShareLinkModule(p1):andThen(function(p2)
		-- upvalues: fFlagEnableShareSheet (copy), universalShareSheet (copy), isSubjectToDesktopPolicies (copy), default (copy)
		if p2 == nil then
			error("sharePrivateExperience: no share link returned")
		end
		if fFlagEnableShareSheet then
			universalShareSheet.show({
				context = "BuildExperiencePrivateInvitesShareLink",
				url = p2
			})
			
			return nil
		elseif isSubjectToDesktopPolicies() then
			default:setClipboardText({
				context = "BuildExperiencePrivateInvitesShareLink",
				text = p2
			})
			
			return { copiedToClipboard = true, url = p2 }
		end
		default:shareUrl({
			context = "BuildExperiencePrivateInvitesShareLink",
			url = p2
		})
		
		return { copiedToClipboard = false, url = p2 }
	end)
end