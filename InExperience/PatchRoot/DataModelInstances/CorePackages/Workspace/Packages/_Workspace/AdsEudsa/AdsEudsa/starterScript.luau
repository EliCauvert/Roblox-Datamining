local CoreGui = game:GetService("CoreGui")
local RoactModule = require(script.Parent.Parent.Roact)
local AdsEuDsaPromptHandlerModule = require(script.Parent.AdsEuDsaPromptHandler)

return function() --[[ Line: 9 | Named "starterScript" ]]
	-- upvalues: RoactModule (copy), AdsEuDsaPromptHandlerModule (copy), CoreGui (copy)
	RoactModule.mount(RoactModule.createElement(AdsEuDsaPromptHandlerModule), CoreGui, "AdsEuDsaPromptHandler")
end