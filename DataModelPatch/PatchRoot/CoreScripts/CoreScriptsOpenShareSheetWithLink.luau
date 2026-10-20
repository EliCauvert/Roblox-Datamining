local CorePackages = game:GetService("CorePackages")
local SocialService = game:GetService("SocialService")
local Default = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local IsContentSharingAllowed = require(CorePackages.Workspace.Packages.CachedPolicyService):IsContentSharingAllowed()
local AppPolicy = require(CorePackages.Packages.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")
local DifferentiateSharingBaseOnPlatform = game:DefineFastFlag("DifferentiateSharingBaseOnPlatform", false)
local EligibleForCapturesFeature = false

if DifferentiateSharingBaseOnPlatform then
	local ReadResult = AppPolicy.read()
	EligibleForCapturesFeature = ReadResult and ReadResult.EnableShareCaptureCTA and ReadResult.EligibleForCapturesFeature or false
end
SocialService.OpenShareSheetWithLink:Connect(function(Text)
	-- upvalues: Default (copy), DifferentiateSharingBaseOnPlatform (copy), EligibleForCapturesFeature (ref), IsContentSharingAllowed (copy)
	if not Default then return end
	assert(Default ~= nil, "ExternalContentSharingProtocol is required")
	
	if DifferentiateSharingBaseOnPlatform then
		if not EligibleForCapturesFeature then
			Default:setClipboardText({ context = "PromptLinkSharing", text = Text })
			
			return
		end
	elseif not IsContentSharingAllowed then
		Default:setClipboardText({ context = "PromptLinkSharing", text = Text })
		
		return
	end
	Default:shareUrl({ context = "PromptLinkSharing", url = Text })
end)