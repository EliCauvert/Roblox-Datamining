local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local interactable = require(parent.UIBlox).Core.Control.Interactable
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

local function NOOP() --[[ line: 19 ]] end

return function(p0) --[[ line: 21 | named "SocialCountsItem" ]]
	-- upvalues: useTokens (ref), reactModule (ref), interactable (ref), NOOP (ref), text (ref)
	local var3 = useTokens()
	local var4 = not p0.isDisabled and p0.count ~= "0"
	local var5 = if var4 then var3.Color.Content.Emphasis else var3.Color.Content.Muted
	
	return reactModule.createElement(interactable, {
		Size = UDim2.fromScale(0.25, 0),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		[reactModule.Event.Activated] = if var4 then p0.onActivated else NOOP,
		onStateChanged = NOOP,
		LayoutOrder = p0.layoutOrder,
		Active = var4
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Count = reactModule.createElement(text, {
			tag = "text-align-y-bottom auto-xy",
			LayoutOrder = 1,
			Text = p0.count,
			fontStyle = var3.Typography.HeadingSmall,
			textStyle = var5
		}),
		Text = reactModule.createElement(text, {
			tag = "text-align-y-top auto-xy",
			LayoutOrder = 2,
			Text = p0.text,
			fontStyle = var3.Typography.CaptionMedium,
			textStyle = var5
		})
	})
end