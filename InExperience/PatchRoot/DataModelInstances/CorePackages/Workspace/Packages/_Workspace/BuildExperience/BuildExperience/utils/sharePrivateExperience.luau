local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local universalShareSheet = require(parent.ShareSheet).UniversalShareSheet
local sharedFlagsModule = require(parent.SharedFlags)
local createPrivateShareLinkModule = require(buildExperience.utils.createPrivateShareLink)
local fFlagEnableShareSheet = sharedFlagsModule.FFlagEnableShareSheet
local isSubjectToDesktopPolicies = sharedFlagsModule.isSubjectToDesktopPolicies

return function(p0) --[[ line: 33 | named "sharePrivateExperience" ]]
	-- upvalues: createPrivateShareLinkModule (ref), fFlagEnableShareSheet (ref), universalShareSheet (ref), isSubjectToDesktopPolicies (ref), default (ref)
	return createPrivateShareLinkModule(p0):andThen(function(p1) --[[ line: 34 ]]
		-- upvalues: fFlagEnableShareSheet (copy), universalShareSheet (copy), isSubjectToDesktopPolicies (copy), default (copy)
		if p1 == nil then
			error("sharePrivateExperience: no share link returned")
		end
		if fFlagEnableShareSheet then
			universalShareSheet.show({
				context = "BuildExperiencePrivateInvitesShareLink",
				url = p1
			})
			
			return nil
		elseif isSubjectToDesktopPolicies() then
			default:setClipboardText({
				context = "BuildExperiencePrivateInvitesShareLink",
				text = p1
			})
			
			return { copiedToClipboard = true, url = p1 }
		end
		default:shareUrl({
			context = "BuildExperiencePrivateInvitesShareLink",
			url = p1
		})
		
		return { copiedToClipboard = false, url = p1 }
	end)
end