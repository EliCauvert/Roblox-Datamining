local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseSmartSuggestionsModule = require(script.Parent.useSmartSuggestions)
local Chip = FoundationModule.Chip
local ChipSize = FoundationModule.Enums.ChipSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	[require(script.Parent.SmartSuggestionActionHandler).SuggestionType.GameCard] = FoundationModule.Enums.IconName.Controller
}

local function attachGrowFlexItem(Parent)
	if Parent ~= nil and Parent:FindFirstChildOfClass("UIFlexItem") == nil then
		local FlexItem = Instance.new("UIFlexItem")
		FlexItem.FlexMode = Enum.UIFlexMode.Grow
		FlexItem.Parent = Parent
	end
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UseSmartSuggestionsModule (copy), ReactModule (copy), Chip (copy), config (copy), ChipSize (copy), attachGrowFlexItem (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSmartSuggestionsModuleResult = UseSmartSuggestionsModule(Frame.conversationId, Frame.sendMessage, Frame.sendGameLinkChatMessage)
	local HiddenSuggestions = UseSmartSuggestionsModuleResult.hiddenSuggestions
	local OnActivatedFunction = UseSmartSuggestionsModuleResult.onActivated
	local Elements = {}
	local v1 = false
	
	for LayoutOrder, value in Frame.suggestions or UseSmartSuggestionsModuleResult.suggestions do
		local IsHiddenSuggestion = HiddenSuggestions[value] == true
		v1 = v1 or not IsHiddenSuggestion
		Elements[`chip_{LayoutOrder}`] = ReactModule.createElement(Chip, {
			text = value.display_text,
			leading = config[value.type],
			size = ChipSize.Large,
			LayoutOrder = LayoutOrder,
			Visible = not IsHiddenSuggestion,
			ref = attachGrowFlexItem,
			onActivated = function()
				-- upvalues: OnActivatedFunction (copy), value (copy)
				OnActivatedFunction(value)
			end
		})
	end
	return if v1 then ReactModule.createElement(FoundationModule.ScrollView, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.Small),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		scroll = {
			ScrollingDirection = Enum.ScrollingDirection.X,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			AutomaticSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(),
			scrollBarVisibility = FoundationModule.Enums.Visibility.None
		}
	}, Elements) else nil
end)