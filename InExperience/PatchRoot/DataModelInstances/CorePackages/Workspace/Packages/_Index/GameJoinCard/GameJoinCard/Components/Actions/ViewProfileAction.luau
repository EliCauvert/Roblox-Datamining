local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local Text = FoundationModule.Text
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local AnalyticsConstantsModule = require(GameJoinCard.Analytics.AnalyticsConstants)
local GameJoinCardButtonAction = AnalyticsConstantsModule.GameJoinCardButtonAction
local ViewProfileSourceValues = AnalyticsConstantsModule.viewProfileSourceValues
local UseGameJoinCardAnalyticsModule = require(GameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local GetTelemetryFieldsModule = require(script.Parent.getTelemetryFields)

local function ViewProfileLink(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ControlState (copy), View (copy), StateLayerAffordance (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(View, {
		Name = "ViewProfileButton",
		tag = "row align-x-center align-y-center",
		Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_600),
		onActivated = Frame.onActivated,
		onStateChanged = ReactModule.useCallback(function(Hover)
			-- upvalues: UseStateResult2 (copy), ControlState (upval)
			UseStateResult2(Hover == ControlState.Hover)
		end, {}),
		stateLayer = { affordance = StateLayerAffordance.None },
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			RichText = true,
			tag = "auto-xy text-title-medium text-align-x-center content-emphasis",
			Text = if UseStateResult then `<u>{Frame.text}</u>` else Frame.text
		})
	})
end

return {
	[UserCtaAction.ViewProfile] = function(p1)
		-- upvalues: UserCtaAction (copy), InputSize (copy), ReactModule (copy), ViewProfileLink (copy), ViewProfileSourceValues (copy), GetTelemetryFieldsModule (copy), UseGameJoinCardAnalyticsModule (copy), GameJoinCardButtonAction (copy), FFlagEnableSplitPane (copy), AppPage (copy)
		return {
			id = UserCtaAction.ViewProfile,
			inputSize = InputSize.Medium,
			width = UDim.new(1, 0),
			text = p1.localized[UserCtaAction.ViewProfile],
			render = function(p2, LayoutOrder)
				-- upvalues: ReactModule (upval), ViewProfileLink (upval), ViewProfileSourceValues (upval)
				return ReactModule.createElement(ViewProfileLink, {
					text = p2.text,
					onActivated = function()
						-- upvalues: p2 (copy), ViewProfileSourceValues (upval)
						p2.onActivated(ViewProfileSourceValues.ViewProfileButton)
					end,
					LayoutOrder = LayoutOrder
				})
			end,
			onActivated = function(p2)
				-- upvalues: ViewProfileSourceValues (upval), p1 (copy), GetTelemetryFieldsModule (upval), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), FFlagEnableSplitPane (upval), AppPage (upval)
				local P5 = p2 or ViewProfileSourceValues.ViewProfileButton
				
				if p1.userId ~= "" then
					local TelemetryFieldsModule = GetTelemetryFieldsModule(p1)
					
					if P5 == ViewProfileSourceValues.UserTile then
						UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromUserTile, TelemetryFieldsModule)
					elseif P5 == ViewProfileSourceValues.ViewProfileButton then
						UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromViewProfile, TelemetryFieldsModule)
					end
				end;
				(if FFlagEnableSplitPane then p1.navigation.push else p1.navigation.navigate)(AppPage.ProfilePlatform, { detail = p1.userId })
			end
		}
	end
}