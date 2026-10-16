local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local Interactable = require(Parent.UIBlox).Core.Control.Interactable
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function NOOP() --[[ Line: 19 ]] end

return function(p1) --[[ Line: 21 | Named "SocialCountsItem" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Interactable (copy), NOOP (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local IsNot_0: boolean = not p1.isDisabled and p1.count ~= "0"
	local Emphasis = IsNot_0 and UseTokensResult.Color.Content.Emphasis or UseTokensResult.Color.Content.Muted
	
	return ReactModule.createElement(Interactable, {
		Size = UDim2.fromScale(0.25, 0),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		[ReactModule.Event.Activated] = if IsNot_0 then p1.onActivated else NOOP,
		onStateChanged = NOOP,
		LayoutOrder = p1.layoutOrder,
		Active = IsNot_0
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Count = ReactModule.createElement(Text, {
			tag = "text-align-y-bottom auto-xy",
			LayoutOrder = 1,
			Text = p1.count,
			fontStyle = UseTokensResult.Typography.HeadingSmall,
			textStyle = Emphasis
		}),
		Text = ReactModule.createElement(Text, {
			tag = "text-align-y-top auto-xy",
			LayoutOrder = 2,
			Text = p1.text,
			fontStyle = UseTokensResult.Typography.CaptionMedium,
			textStyle = Emphasis
		})
	})
end