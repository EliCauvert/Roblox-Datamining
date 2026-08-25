local corePackagesService = game:GetService("CorePackages")
local socialService = game:GetService("SocialService")
local default = require(corePackagesService.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local var2 = require(corePackagesService.Workspace.Packages.CachedPolicyService):IsContentSharingAllowed()
local var3 = require(corePackagesService.Packages.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")
local differentiateSharingBaseOnPlatform = game:DefineFastFlag("DifferentiateSharingBaseOnPlatform", false)
local var5 = false

if differentiateSharingBaseOnPlatform then
	local eligibleForCapturesFeature
	local var6 = var3.read()
	
	if var6 and var6.EnableShareCaptureCTA then
		eligibleForCapturesFeature = var6.EligibleForCapturesFeature
		
		if not eligibleForCapturesFeature then
			eligibleForCapturesFeature = false
		end
		var5 = eligibleForCapturesFeature
	end
end
socialService.OpenShareSheetWithLink:Connect(function(p0)
	-- upvalues: default (ref), differentiateSharingBaseOnPlatform (ref), var5 (write), var2 (ref)
	if not default then return end
	assert(default ~= nil, "ExternalContentSharingProtocol is required")
	
	if differentiateSharingBaseOnPlatform then
		if var5 then
			default:shareUrl({ context = "PromptLinkSharing", url = p0 })
			
			return
		else
			default:setClipboardText({ context = "PromptLinkSharing", text = p0 })
			
			return
		end
	elseif var2 then
	else
		default:setClipboardText({ context = "PromptLinkSharing", text = p0 })
	end
end)