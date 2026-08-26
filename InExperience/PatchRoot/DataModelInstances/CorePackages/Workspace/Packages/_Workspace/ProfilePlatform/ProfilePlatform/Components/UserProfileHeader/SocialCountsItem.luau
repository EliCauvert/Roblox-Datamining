local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local interactable = require(parent.UIBlox).Core.Control.Interactable
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

local function NOOP() end

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), interactable (ref), NOOP (ref), text (ref)
	local var1 = useTokens()
	local var2 = not p1.isDisabled and p1.count ~= "0"
	local var3 = if var2 then var1.Color.Content.Emphasis else var1.Color.Content.Muted
	
	return reactModule.createElement(interactable, {
		Size = UDim2.fromScale(0.25, 0),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		[reactModule.Event.Activated] = if var2 then p1.onActivated else NOOP,
		onStateChanged = NOOP,
		LayoutOrder = p1.layoutOrder,
		Active = var2
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Count = reactModule.createElement(text, {
			tag = "text-align-y-bottom auto-xy",
			LayoutOrder = 1,
			Text = p1.count,
			fontStyle = var1.Typography.HeadingSmall,
			textStyle = var3
		}),
		Text = reactModule.createElement(text, {
			tag = "text-align-y-top auto-xy",
			LayoutOrder = 2,
			Text = p1.text,
			fontStyle = var1.Typography.CaptionMedium,
			textStyle = var3
		})
	})
end