local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local typesModule = require(script.Parent.Types)
local useSmartSuggestionsModule = require(script.Parent.useSmartSuggestions)
local chip = foundationModule.Chip
local chipSize = foundationModule.Enums.ChipSize
local useTokens = foundationModule.Hooks.useTokens
local suggestionType = typesModule.SuggestionType
local t = {
	[suggestionType.GameCard] = foundationModule.Enums.IconName.Controller,
	[suggestionType.StartParty] = foundationModule.Enums.IconName.ThreePeople
}

local function attachGrowFlexItem(p0) --[[ line: 43 ]]
	if p0 ~= nil and p0:FindFirstChildOfClass("UIFlexItem") == nil then
		local UIFlexItem = Instance.new("UIFlexItem")
		UIFlexItem.FlexMode = Enum.UIFlexMode.Grow
		UIFlexItem.Parent = p0
	end
end

return reactModule.memo(function(p1) --[[ line: 51 | named "SmartSuggestionsChipRow" ]]
	-- upvalues: useTokens (ref), useSmartSuggestionsModule (ref), reactModule (ref), chip (ref), t (ref), chipSize (ref), attachGrowFlexItem (ref), foundationModule (ref)
	local var7 = useTokens()
	local var8 = useSmartSuggestionsModule(p1.conversationId, p1.sendMessage, p1.sendGameLinkChatMessage)
	local suggestions = p1.suggestions or var8.suggestions
	local hiddenSuggestions = var8.hiddenSuggestions
	local onActivated = var8.onActivated
	local t_1 = {}
	local var11 = false
	
	for i, v in suggestions do
		local var12 = hiddenSuggestions[v] == true
		var11 = var11 or not var12
		t_1[`chip_{i}`] = reactModule.createElement(chip, {
			text = v.display_text,
			leading = t[v.type],
			size = chipSize.Large,
			LayoutOrder = i,
			Visible = not var12,
			ref = attachGrowFlexItem,
			onActivated = function() --[[ line: 70 ]]
				-- upvalues: onActivated (ref), v (ref)
				onActivated(v)
			end
		})
	end
	return if var11 then reactModule.createElement(foundationModule.ScrollView, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var7.Gap.Small),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		scroll = {
			ScrollingDirection = Enum.ScrollingDirection.X,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			AutomaticSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(),
			scrollBarVisibility = foundationModule.Enums.Visibility.None
		}
	}, t_1) else nil
end)