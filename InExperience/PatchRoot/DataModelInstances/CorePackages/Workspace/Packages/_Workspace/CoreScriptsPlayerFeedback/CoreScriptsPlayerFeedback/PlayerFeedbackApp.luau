local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.InExperienceLocales).Localization
local playerFeedbackPromptsModule = require(coreScriptsPlayerFeedback.Components.PlayerFeedbackPrompts)
local getFFlagEnablePlayerSupportPromptModule = require(coreScriptsPlayerFeedback.Flags.GetFFlagEnablePlayerSupportPrompt)
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:FindFirstChild("RobloxGui") or coreGuiService:WaitForChild("RobloxGui")
local var7 = getFFlagEnablePlayerSupportPromptModule()
local _ = nil
local ok, status = pcall(function()
	-- upvalues: robloxGui (ref)
	return if robloxGui then require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider) else nil
end)
local var8 = if ok and status then status else function(p0)
	return p0.App
end

return function(p1)
	-- upvalues: var8 (write), var7 (ref), reactRobloxModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), playerFeedbackPromptsModule (ref)
	p1 = p1 or var8
	local screenGui = Instance.new("ScreenGui")
	screenGui.IgnoreGuiInset = if var7 then false else true
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.AutoLocalize = false
	screenGui.DisplayOrder = -1
	local var11 = reactRobloxModule.createRoot(screenGui)
	var11:render(p1({
		App = reactModule.createElement(localizationProvider, {
			localization = localization.new(game:GetService("LocalizationService").RobloxLocaleId)
		}, {
			PlayerFeedbackPrompts = reactModule.createElement(playerFeedbackPromptsModule, { enableInputDelayed = true })
		})
	}))
	
	return {
		instance = screenGui,
		unmount = function()
			-- upvalues: var11 (ref)
			var11:unmount()
		end
	}
end