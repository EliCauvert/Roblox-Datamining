local FaceAnimatorService = game:GetService("FaceAnimatorService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NewResult = require(Modules.SelfView.Analytics).new()
local PublicApiModule = require(Modules.SelfView.publicApi)
local ToggleSelfViewSignalModule = require(Modules.SelfView.toggleSelfViewSignal)

return function() --[[ Line: 9 ]]
	-- upvalues: FaceAnimatorService (copy), NewResult (copy), PublicApiModule (copy), ToggleSelfViewSignalModule (copy)
	if FaceAnimatorService and FaceAnimatorService:IsStarted() then
		FaceAnimatorService.VideoAnimationEnabled = not FaceAnimatorService.VideoAnimationEnabled
		NewResult:setLastCtx("bubbleChatToggle")
		local SelfViewIsOpenAndVisible = PublicApiModule.getSelfViewIsOpenAndVisible()
		
		if FaceAnimatorService.VideoAnimationEnabled and not SelfViewIsOpenAndVisible then
			ToggleSelfViewSignalModule:fire()
		end
	end
end