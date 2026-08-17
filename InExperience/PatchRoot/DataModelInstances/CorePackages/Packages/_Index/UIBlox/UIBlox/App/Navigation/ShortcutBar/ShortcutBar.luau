local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local reactModule = require(parent_2.React)
local reactOtterModule = require(parent_2.ReactOtter)
local foundationModule = require(parent_2.Foundation)
local reactUtilsModule = require(parent_2.ReactUtils)
local useDelayedActionHandler = reactUtilsModule.useDelayedActionHandler
local useEventConnection = reactUtilsModule.useEventConnection
local object = require(parent_2.LuauPolyfill).Object
local useStyleModule = require(parent_1.Core.Style.useStyle)
local _ = require(script.Parent.Types)
local shortcutModule = require(script.Parent.Shortcut)
local useInputTypeModule = require(parent_1.Utility.useInputType)
local utilitiesModule = require(parent.Utilities)
local _ = require(parent_1.Enums.InputType)
local t = { dampingRatio = 2, frequency = 3 }
local t_1 = {
	spacingTop = 12,
	spacingTrailing = 30,
	spacingBottom = 12,
	spacingLeading = 18,
	itemsGap = 24,
	itemIconLabelGap = 6,
	actionTextSpacingLeading = 12,
	items = {}
}

return function(p0) --[[ line: 71 | named "ShortcutBar" ]]
	-- upvalues: object (ref), t_1 (ref), useStyleModule (ref), foundationModule (ref), UIBloxConfigModule (ref), reactModule (ref), useInputTypeModule (ref), reactOtterModule (ref), useDelayedActionHandler (ref), t (ref), utilitiesModule (ref), useEventConnection (ref), userInputService (ref), shortcutModule (ref)
	local var12 = object.assign({}, t_1, p0)
	local var13 = useStyleModule()
	local var14 = foundationModule.Hooks.useTokens()
	local spacingTop = nil
	local spacingTrailing = nil
	local spacingBottom = nil
	local spacingLeading = nil
	local itemsGap = nil
	local itemIconLabelGap = nil
	local var21 = nil
	
	if UIBloxConfigModule.useTokenizedShortcutBar then
		spacingTop = p0.spacingTop or var14.Padding.Small
		spacingTrailing = p0.spacingTrailing or var14.Padding.XLarge
		spacingBottom = p0.spacingBottom or var14.Padding.Small
		spacingLeading = p0.spacingLeading or var14.Padding.Medium
		itemsGap = p0.itemsGap or var14.Gap.Large
		itemIconLabelGap = p0.itemIconLabelGap or var14.Gap.XSmall
		var21 = p0.actionTextSpacingLeading or var14.Padding.Small
	end
	local t_2 = {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, spacingTop or var12.spacingTop),
			PaddingRight = UDim.new(0, spacingTrailing or var12.spacingTrailing),
			PaddingBottom = UDim.new(0, spacingBottom or var12.spacingBottom),
			PaddingLeft = UDim.new(0, spacingLeading or var12.spacingLeading)
		}),
		ListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, itemsGap or var12.itemsGap)
		})
	}
	local var23 = useInputTypeModule()
	local var24, var25 = reactOtterModule.useAnimatedBinding(0)
	local var26 = useDelayedActionHandler(if var12.transitionDelaySeconds then var12.transitionDelaySeconds else 0, 0.1, function() --[[ line: 114 ]]
		-- upvalues: var25 (ref), reactOtterModule (copy), t (copy)
		var25(reactOtterModule.spring(0, t))
	end)
	
	local function onInputChanged() --[[ line: 119 ]]
		-- upvalues: var12 (ref), var25 (ref), reactOtterModule (copy), t (copy), var26 (ref)
		if var12.transitionDelaySeconds then
			var25(reactOtterModule.spring(1, t))
			var26()
		end
	end
	
	local var28, var29 = reactModule.useState(utilitiesModule.filterItems(var12.items, var23))
	useEventConnection(userInputService.InputChanged, onInputChanged)
	reactModule.useEffect(function() --[[ line: 129 ]]
		-- upvalues: var29 (ref), utilitiesModule (copy), var12 (ref), var23 (ref)
		var29(utilitiesModule.filterItems(var12.items, var23))
	end, { var23, var12.items })
	
	for i, v in ipairs(var28) do
		t_2["Item" .. tostring(i)] = reactModule.createElement(shortcutModule, {
			index = i,
			iconLabelGap = itemIconLabelGap or var12.itemIconLabelGap,
			actionTextSpacingLeading = var21 or var12.actionTextSpacingLeading,
			publicProps = v
		})
	end
	if #var28 > 0 then
		local var30 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var13.Tokens.Color.OverMedia.OverMedia_0 else var13.Tokens.Semantic.Color.BackgroundUi.Contrast
		
		return reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			Position = var12.position,
			AnchorPoint = var12.anchorPoint,
			GroupTransparency = if var12.transitionDelaySeconds then var24 else 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			ShortcutBarComponent = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(0, 0),
				BackgroundColor3 = var30.Color3,
				BackgroundTransparency = var30.Transparency,
				AutomaticSize = Enum.AutomaticSize.XY
			}, t_2)
		})
	end
	return nil
end