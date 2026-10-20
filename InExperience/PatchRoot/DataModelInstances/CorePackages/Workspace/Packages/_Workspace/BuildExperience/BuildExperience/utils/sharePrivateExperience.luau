local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local UniversalShareSheet = require(Parent.ShareSheet).UniversalShareSheet
local SharedFlagsModule = require(Parent.SharedFlags)
local CreateExperienceShareLinkModule = require(BuildExperience.utils.createExperienceShareLink)
local FFlagEnableShareSheet = SharedFlagsModule.FFlagEnableShareSheet
local IsSubjectToDesktopPoliciesFunction = SharedFlagsModule.isSubjectToDesktopPolicies

return function(p1)
	-- upvalues: CreateExperienceShareLinkModule (copy), FFlagEnableShareSheet (copy), UniversalShareSheet (copy), IsSubjectToDesktopPoliciesFunction (copy), Default (copy)
	return CreateExperienceShareLinkModule(p1):andThen(function(Result)
		-- upvalues: FFlagEnableShareSheet (upval), UniversalShareSheet (upval), IsSubjectToDesktopPoliciesFunction (upval), Default (upval)
		if Result == nil then
			error("sharePrivateExperience: no share link returned")
		end
		if FFlagEnableShareSheet then
			UniversalShareSheet.show({
				context = "BuildExperiencePrivateInvitesShareLink",
				url = Result
			})
			
			return nil
		elseif IsSubjectToDesktopPoliciesFunction() then
			Default:setClipboardText({
				context = "BuildExperiencePrivateInvitesShareLink",
				text = Result
			})
			
			return { copiedToClipboard = true, url = Result }
		else
			Default:shareUrl({
				context = "BuildExperiencePrivateInvitesShareLink",
				url = Result
			})
			
			return { copiedToClipboard = false, url = Result }
		end
	end)
end