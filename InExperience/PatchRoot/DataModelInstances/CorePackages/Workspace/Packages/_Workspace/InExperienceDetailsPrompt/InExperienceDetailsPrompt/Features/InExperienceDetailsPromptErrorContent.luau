local parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local enumGameDetailErrorTypes = require(parent.DiscoveryTypes).EnumGameDetailErrorTypes

local function _(p0, p1) --[[ line: 18 | named "getErrorDisplayMessage" ]]
	-- upvalues: enumGameDetailErrorTypes (ref)
	return if p0 == enumGameDetailErrorTypes.ExperienceUnavailable then p1.experienceUnavailable else p1.noInternet
end

return function(p2) --[[ line: 25 | named "InExperienceDetailsPromptErrorContent" ]]
	-- upvalues: useTokens (ref), useLocalization (ref), enumGameDetailErrorTypes (ref), reactModule (ref), view (ref), icon (ref), enums (ref), text (ref)
	local var2 = useLocalization({
		experienceUnavailable = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable",
		noInternet = "Feature.EmptyStatePage.Message.NoInternet"
	})
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y items-center gap-medium padding-bottom-large padding-top-large"
	}, {
		Icon = reactModule.createElement(icon, {
			layoutOrder = 1,
			name = enums.IconName.TriangleExclamation,
			size = useTokens().Size.Size_1700
		}),
		Message = reactModule.createElement(text, {
			tag = "text-body-large size-full-0 auto-y text-center text-wrap",
			layoutOrder = 2,
			Text = if p2.errorType == enumGameDetailErrorTypes.ExperienceUnavailable then var2.experienceUnavailable else var2.noInternet
		})
	})
end