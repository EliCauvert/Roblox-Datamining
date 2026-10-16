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

return function(p1)
	-- upvalues: object (ref), t_1 (ref), useStyleModule (ref), foundationModule (ref), UIBloxConfigModule (ref), reactModule (ref), useInputTypeModule (ref), reactOtterModule (ref), useDelayedActionHandler (ref), t (ref), utilitiesModule (ref), useEventConnection (ref), userInputService (ref), shortcutModule (ref)
	local var1 = object.assign({}, t_1, p1)
	local var2 = useStyleModule()
	local var3 = foundationModule.Hooks.useTokens()
	local spacingTop = nil
	local spacingTrailing = nil
	local spacingBottom = nil
	local spacingLeading = nil
	local itemsGap = nil
	local itemIconLabelGap = nil
	local var4 = nil
	
	if UIBloxConfigModule.useTokenizedShortcutBar then
		spacingTop = p1.spacingTop or var3.Padding.Small
		spacingTrailing = p1.spacingTrailing or var3.Padding.XLarge
		spacingBottom = p1.spacingBottom or var3.Padding.Small
		spacingLeading = p1.spacingLeading or var3.Padding.Medium
		itemsGap = p1.itemsGap or var3.Gap.Large
		itemIconLabelGap = p1.itemIconLabelGap or var3.Gap.XSmall
		var4 = p1.actionTextSpacingLeading or var3.Padding.Small
	end
	local t_2 = {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, spacingTop or var1.spacingTop),
			PaddingRight = UDim.new(0, spacingTrailing or var1.spacingTrailing),
			PaddingBottom = UDim.new(0, spacingBottom or var1.spacingBottom),
			PaddingLeft = UDim.new(0, spacingLeading or var1.spacingLeading)
		}),
		ListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, itemsGap or var1.itemsGap)
		})
	}
	local var5 = useInputTypeModule()
	local var6, var7 = reactOtterModule.useAnimatedBinding(0)
	local var8 = useDelayedActionHandler(if var1.transitionDelaySeconds then var1.transitionDelaySeconds else 0, 0.1, function()
		-- upvalues: var7 (ref), reactOtterModule (copy), t (copy)
		var7(reactOtterModule.spring(0, t))
	end)
	
	local function onInputChanged()
		-- upvalues: var1 (ref), var7 (ref), reactOtterModule (copy), t (copy), var8 (ref)
		if var1.transitionDelaySeconds then
			var7(reactOtterModule.spring(1, t))
			var8()
		end
	end
	
	local var9, var10 = reactModule.useState(utilitiesModule.filterItems(var1.items, var5))
	useEventConnection(userInputService.InputChanged, onInputChanged)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), utilitiesModule (copy), var1 (ref), var5 (ref)
		var10(utilitiesModule.filterItems(var1.items, var5))
	end, { var5, var1.items })
	
	for i, v in ipairs(var9) do
		t_2["Item" .. tostring(i)] = reactModule.createElement(shortcutModule, {
			index = i,
			iconLabelGap = itemIconLabelGap or var1.itemIconLabelGap,
			actionTextSpacingLeading = var4 or var1.actionTextSpacingLeading,
			publicProps = v
		})
	end
	if #var9 > 0 then
		local var11 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var2.Tokens.Color.OverMedia.OverMedia_0 else var2.Tokens.Semantic.Color.BackgroundUi.Contrast
		
		return reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			Position = var1.position,
			AnchorPoint = var1.anchorPoint,
			GroupTransparency = if var1.transitionDelaySeconds then var6 else 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			ShortcutBarComponent = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(0, 0),
				BackgroundColor3 = var11.Color3,
				BackgroundTransparency = var11.Transparency,
				AutomaticSize = Enum.AutomaticSize.XY
			}, t_2)
		})
	end
	return nil
end