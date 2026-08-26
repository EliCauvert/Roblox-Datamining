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

local function _(p1, p2)
	-- upvalues: enumGameDetailErrorTypes (ref)
	return if p1 == enumGameDetailErrorTypes.ExperienceUnavailable then p2.experienceUnavailable else p2.noInternet
end

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), enumGameDetailErrorTypes (ref), reactModule (ref), view (ref), icon (ref), enums (ref), text (ref)
	local var1 = useLocalization({
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
			Text = if p1.errorType == enumGameDetailErrorTypes.ExperienceUnavailable then var1.experienceUnavailable else var1.noInternet
		})
	})
end