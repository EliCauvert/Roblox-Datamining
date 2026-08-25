local faceAnimatorService = game:GetService("FaceAnimatorService")
local modules = game:GetService("CoreGui").RobloxGui.Modules
local var1 = require(modules.SelfView.Analytics).new()
local publicApiModule = require(modules.SelfView.publicApi)
local toggleSelfViewSignalModule = require(modules.SelfView.toggleSelfViewSignal)

return function()
	-- upvalues: faceAnimatorService (ref), var1 (ref), publicApiModule (ref), toggleSelfViewSignalModule (ref)
	if faceAnimatorService and faceAnimatorService:IsStarted() then
		faceAnimatorService.VideoAnimationEnabled = not faceAnimatorService.VideoAnimationEnabled
		var1:setLastCtx("bubbleChatToggle")
		
		if faceAnimatorService.VideoAnimationEnabled and not publicApiModule.getSelfViewIsOpenAndVisible() then
			toggleSelfViewSignalModule:fire()
		end
	end
end