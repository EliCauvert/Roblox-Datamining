local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local foundationModule = require(parent.Foundation)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sharedFlagsModule = require(parent.SharedFlags)
local userCtaAction = require(parent.UserCtaCommon).Enums.UserCtaAction
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local appPage = robloxAppEnumsModule.AppPage
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local analyticsConstantsModule = require(gameJoinCard.Analytics.AnalyticsConstants)
local gameJoinCardButtonAction = analyticsConstantsModule.GameJoinCardButtonAction
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local useGameJoinCardAnalyticsModule = require(gameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local getTelemetryFieldsModule = require(script.Parent.getTelemetryFields)

return {
	[userCtaAction.ViewProfile] = function(p1)
		-- upvalues: userCtaAction (ref), buttonVariant (ref), inputSize (ref), getTelemetryFieldsModule (ref), viewProfileSourceValues (ref), useGameJoinCardAnalyticsModule (ref), gameJoinCardButtonAction (ref), fFlagEnableSplitPane (ref), appPage (ref)
		return {
			id = userCtaAction.ViewProfile,
			variant = buttonVariant.Utility,
			inputSize = inputSize.Medium,
			width = UDim.new(1, 0),
			text = p1.localized[userCtaAction.ViewProfile],
			onActivated = function(p2)
				-- upvalues: p1 (ref), getTelemetryFieldsModule (copy), viewProfileSourceValues (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), fFlagEnableSplitPane (copy), appPage (copy)
				if p1.userId ~= "" then
					local var1 = getTelemetryFieldsModule(p1)
					
					if p2 == viewProfileSourceValues.UserTile then
						useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromUserTile, var1)
					elseif p2 == viewProfileSourceValues.ViewProfileButton then
						useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.OpenProfileFromViewProfile, var1)
					end
				end;
				(if fFlagEnableSplitPane then p1.navigation.push else p1.navigation.navigate)(appPage.ProfilePlatform, { detail = p1.userId })
			end
		}
	end
}