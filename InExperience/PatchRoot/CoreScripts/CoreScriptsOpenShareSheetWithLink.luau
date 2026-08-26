local corePackagesService = game:GetService("CorePackages")
local socialService = game:GetService("SocialService")
local default = require(corePackagesService.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local var1 = require(corePackagesService.Workspace.Packages.CachedPolicyService):IsContentSharingAllowed()
local var2 = require(corePackagesService.Packages.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")
local differentiateSharingBaseOnPlatform = game:DefineFastFlag("DifferentiateSharingBaseOnPlatform", false)
local var3 = false

if differentiateSharingBaseOnPlatform then
	local eligibleForCapturesFeature
	local var4 = var2.read()
	
	if var4 and var4.EnableShareCaptureCTA then
		eligibleForCapturesFeature = var4.EligibleForCapturesFeature
		
		if not eligibleForCapturesFeature then
			eligibleForCapturesFeature = false
		end
		var3 = eligibleForCapturesFeature
	end
end
socialService.OpenShareSheetWithLink:Connect(function(p1)
	-- upvalues: default (ref), differentiateSharingBaseOnPlatform (ref), var3 (write), var1 (ref)
	if not default then return end
	assert(default ~= nil, "ExternalContentSharingProtocol is required")
	
	if differentiateSharingBaseOnPlatform then
		if var3 then
			default:shareUrl({ context = "PromptLinkSharing", url = p1 })
			
			return
		else
			default:setClipboardText({ context = "PromptLinkSharing", text = p1 })
			
			return
		end
	elseif var1 then
	else
		default:setClipboardText({ context = "PromptLinkSharing", text = p1 })
	end
end)