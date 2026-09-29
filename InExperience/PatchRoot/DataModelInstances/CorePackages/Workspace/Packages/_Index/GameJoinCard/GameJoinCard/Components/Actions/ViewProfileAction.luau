local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sharedFlagsModule = require(parent.SharedFlags)
local userCtaAction = require(parent.UserCtaCommon).Enums.UserCtaAction
local text = foundationModule.Text
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useTokens = foundationModule.Hooks.useTokens
local appPage = robloxAppEnumsModule.AppPage
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local fFlagDesktopGameJoinCardUIImprovements = sharedFlagsModule.FFlagDesktopGameJoinCardUIImprovements
local analyticsConstantsModule = require(gameJoinCard.Analytics.AnalyticsConstants)
local gameJoinCardButtonAction = analyticsConstantsModule.GameJoinCardButtonAction
local viewProfileSourceValues = analyticsConstantsModule.viewProfileSourceValues
local useGameJoinCardAnalyticsModule = require(gameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local getTelemetryFieldsModule = require(script.Parent.getTelemetryFields)

local function ViewProfileLink(p1)
	-- upvalues: useTokens (ref), reactModule (ref), controlState (ref), view (ref), fFlagDesktopGameJoinCardUIImprovements (ref), stateLayerAffordance (ref), text (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		Name = "ViewProfileButton",
		tag = "row align-x-center align-y-center",
		Size = UDim2.new(1, 0, 0, var1.Size.Size_600),
		onActivated = p1.onActivated,
		onStateChanged = if fFlagDesktopGameJoinCardUIImprovements then reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref), controlState (copy)
			var3(p2 == controlState.Hover)
		end, {}) else nil,
		stateLayer = { affordance = stateLayerAffordance.None },
		LayoutOrder = p1.LayoutOrder
	}, {
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-title-medium text-align-x-center content-emphasis",
			Text = if fFlagDesktopGameJoinCardUIImprovements and var2 then `<u>{p1.text}</u>` else p1.text,
			RichText = fFlagDesktopGameJoinCardUIImprovements
		})
	})
end

return {
	[userCtaAction.ViewProfile] = function(p1)
		-- upvalues: userCtaAction (ref), inputSize (ref), reactModule (ref), ViewProfileLink (ref), viewProfileSourceValues (ref), getTelemetryFieldsModule (ref), useGameJoinCardAnalyticsModule (ref), gameJoinCardButtonAction (ref), fFlagEnableSplitPane (ref), appPage (ref)
		return {
			id = userCtaAction.ViewProfile,
			inputSize = inputSize.Medium,
			width = UDim.new(1, 0),
			text = p1.localized[userCtaAction.ViewProfile],
			render = function(p2, p3)
				-- upvalues: reactModule (copy), ViewProfileLink (copy), viewProfileSourceValues (copy)
				return reactModule.createElement(ViewProfileLink, {
					text = p2.text,
					onActivated = function()
						-- upvalues: p2 (ref), viewProfileSourceValues (copy)
						p2.onActivated(viewProfileSourceValues.ViewProfileButton)
					end,
					LayoutOrder = p3
				})
			end,
			onActivated = function(p2)
				-- upvalues: viewProfileSourceValues (copy), p1 (ref), getTelemetryFieldsModule (copy), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), fFlagEnableSplitPane (copy), appPage (copy)
				p2 = p2 or viewProfileSourceValues.ViewProfileButton
				
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