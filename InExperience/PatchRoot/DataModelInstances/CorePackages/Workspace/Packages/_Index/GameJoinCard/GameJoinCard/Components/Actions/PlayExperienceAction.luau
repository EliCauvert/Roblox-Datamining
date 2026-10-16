local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local FoundationModule = require(Parent.Foundation)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local GameJoinCardButtonAction = require(GameJoinCard.Analytics.AnalyticsConstants).GameJoinCardButtonAction
local UseGameJoinCardAnalyticsModule = require(GameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local GetTelemetryFieldsModule = require(script.Parent.getTelemetryFields)
local LogGamePlayIntentModule = require(script.Parent.logGamePlayIntent)

return {
	[UserCtaAction.PlayExperience] = function(p1) --[[ Line: 20 ]]
		-- upvalues: UserCtaAction (copy), ButtonVariant (copy), InputSize (copy), UseGameJoinCardAnalyticsModule (copy), GameJoinCardButtonAction (copy), GetTelemetryFieldsModule (copy), LogGamePlayIntentModule (copy)
		local Experience = p1.experience
		
		return {
			id = UserCtaAction.PlayExperience,
			variant = ButtonVariant.Emphasis,
			inputSize = InputSize.Medium,
			width = UDim.new(1, 0),
			isLoading = Experience.isLoading,
			text = p1.localized[UserCtaAction.PlayExperience],
			onActivated = function() --[[ Line: 29 ]]
				-- upvalues: p1 (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), GetTelemetryFieldsModule (upval), LogGamePlayIntentModule (upval), Experience (copy)
				if p1.userId ~= "" then
					UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.PlayExperience, GetTelemetryFieldsModule(p1))
				end
				LogGamePlayIntentModule(p1)
				Experience.playExperience()
			end
		}
	end
}