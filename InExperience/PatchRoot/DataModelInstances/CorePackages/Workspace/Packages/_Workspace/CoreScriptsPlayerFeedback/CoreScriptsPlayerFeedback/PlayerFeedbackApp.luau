local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.InExperienceLocales).Localization
local PlayerFeedbackPromptsModule = require(CoreScriptsPlayerFeedback.Components.PlayerFeedbackPrompts)
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:FindFirstChild("RobloxGui") or CoreGui:WaitForChild("RobloxGui")
local v1 = require(CoreScriptsPlayerFeedback.Flags.GetFFlagEnablePlayerSupportPrompt)()
local Result1 = nil
local Success, Result = pcall(function() --[[ Line: 21 ]]
	-- upvalues: RobloxGui (copy)
	return if RobloxGui then require(RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider) else nil
end)
Result1 = if Success and Result then Result else function(p1) --[[ Line: 31 ]]
	return p1.App
end

return function(p1) --[[ Line: 37 | Named "createApp" ]]
	-- upvalues: Result1 (ref), v1 (copy), ReactRobloxModule (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), PlayerFeedbackPromptsModule (copy)
	local Callback = p1 or Result1
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.IgnoreGuiInset = not v1
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.AutoLocalize = false
	ScreenGui.DisplayOrder = -1
	local Root = ReactRobloxModule.createRoot(ScreenGui)
	Root:render((Callback({
		App = ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
		}, {
			PlayerFeedbackPrompts = ReactModule.createElement(PlayerFeedbackPromptsModule, { enableInputDelayed = true })
		})
	})))
	
	return {
		instance = ScreenGui,
		unmount = function() --[[ Line: 67 ]]
			-- upvalues: Root (copy)
			Root:unmount()
		end
	}
end