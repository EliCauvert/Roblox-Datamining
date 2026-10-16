local Parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local EnumGameDetailErrorTypes = require(Parent.DiscoveryTypes).EnumGameDetailErrorTypes

local function _(ExperienceUnavailable, p1) --[[ Line: 18 | Named "getErrorDisplayMessage" ]]
	-- upvalues: EnumGameDetailErrorTypes (copy)
	return if ExperienceUnavailable == EnumGameDetailErrorTypes.ExperienceUnavailable then p1.experienceUnavailable else p1.noInternet
end

return function(p1) --[[ Line: 25 | Named "InExperienceDetailsPromptErrorContent" ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), EnumGameDetailErrorTypes (copy), ReactModule (copy), View (copy), Icon (copy), Enums (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		experienceUnavailable = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable",
		noInternet = "Feature.EmptyStatePage.Message.NoInternet"
	})
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y items-center gap-medium padding-bottom-large padding-top-large"
	}, {
		Icon = ReactModule.createElement(Icon, {
			layoutOrder = 1,
			name = Enums.IconName.TriangleExclamation,
			size = UseTokensResult.Size.Size_1700
		}),
		Message = ReactModule.createElement(Text, {
			tag = "text-body-large size-full-0 auto-y text-center text-wrap",
			layoutOrder = 2,
			Text = if p1.errorType == EnumGameDetailErrorTypes.ExperienceUnavailable then UseLocalizationResult.experienceUnavailable else UseLocalizationResult.noInternet
		})
	})
end