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
local var1 = getFFlagEnablePlayerSupportPromptModule()
local _ = nil
local ok, status = pcall(function()
	-- upvalues: robloxGui (ref)
	return if robloxGui then require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider) else nil
end)
local var2 = if ok and status then status else function(p1)
	return p1.App
end

return function(p1)
	-- upvalues: var2 (write), var1 (ref), reactRobloxModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), playerFeedbackPromptsModule (ref)
	p1 = p1 or var2
	local screenGui = Instance.new("ScreenGui")
	screenGui.IgnoreGuiInset = if var1 then false else true
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.AutoLocalize = false
	screenGui.DisplayOrder = -1
	local var3 = reactRobloxModule.createRoot(screenGui)
	var3:render(p1({
		App = reactModule.createElement(localizationProvider, {
			localization = localization.new(game:GetService("LocalizationService").RobloxLocaleId)
		}, {
			PlayerFeedbackPrompts = reactModule.createElement(playerFeedbackPromptsModule, { enableInputDelayed = true })
		})
	}))
	
	return {
		instance = screenGui,
		unmount = function()
			-- upvalues: var3 (ref)
			var3:unmount()
		end
	}
end