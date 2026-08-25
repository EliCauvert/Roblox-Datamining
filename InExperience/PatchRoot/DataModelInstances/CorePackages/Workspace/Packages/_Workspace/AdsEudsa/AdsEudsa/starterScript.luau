local coreGuiService = game:GetService("CoreGui")
local roactModule = require(script.Parent.Parent.Roact)
local adsEuDsaPromptHandlerModule = require(script.Parent.AdsEuDsaPromptHandler)

return function()
	-- upvalues: roactModule (ref), adsEuDsaPromptHandlerModule (ref), coreGuiService (ref)
	roactModule.mount(roactModule.createElement(adsEuDsaPromptHandlerModule), coreGuiService, "AdsEuDsaPromptHandler")
end