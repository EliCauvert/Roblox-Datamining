local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local UIBloxConfigModule = require(Parent1.UIBloxConfig)
local ReactModule = require(Parent2.React)
local ReactOtterModule = require(Parent2.ReactOtter)
local FoundationModule = require(Parent2.Foundation)
local ReactUtilsModule = require(Parent2.ReactUtils)
local UseDelayedActionHandlerFunction = ReactUtilsModule.useDelayedActionHandler
local UseEventConnectionFunction = ReactUtilsModule.useEventConnection
local Object = require(Parent2.LuauPolyfill).Object
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local _ = require(script.Parent.Types)
local ShortcutModule = require(script.Parent.Shortcut)
local UseInputTypeModule = require(Parent1.Utility.useInputType)
local UtilitiesModule = require(Parent.Utilities)
local _ = require(Parent1.Enums.InputType)
local config = { dampingRatio = 2, frequency = 3 }
local config1 = {
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
	-- upvalues: Object (copy), config1 (copy), UseStyleModule (copy), FoundationModule (copy), UIBloxConfigModule (copy), ReactModule (copy), UseInputTypeModule (copy), ReactOtterModule (copy), UseDelayedActionHandlerFunction (copy), config (copy), UtilitiesModule (copy), UseEventConnectionFunction (copy), UserInputService (copy), ShortcutModule (copy)
	local AssignResult = Object.assign({}, config1, p1)
	local UseStyleModuleResult = UseStyleModule()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local SpacingTop = nil
	local SpacingTrailing = nil
	local SpacingBottom = nil
	local SpacingLeading = nil
	local ItemsGap = nil
	local ItemIconLabelGap = nil
	local ActionTextSpacingLeading = nil
	
	if UIBloxConfigModule.useTokenizedShortcutBar then
		SpacingTop = p1.spacingTop or UseTokensResult.Padding.Small
		SpacingTrailing = p1.spacingTrailing or UseTokensResult.Padding.XLarge
		SpacingBottom = p1.spacingBottom or UseTokensResult.Padding.Small
		SpacingLeading = p1.spacingLeading or UseTokensResult.Padding.Medium
		ItemsGap = p1.itemsGap or UseTokensResult.Gap.Large
		ItemIconLabelGap = p1.itemIconLabelGap or UseTokensResult.Gap.XSmall
		ActionTextSpacingLeading = p1.actionTextSpacingLeading or UseTokensResult.Padding.Small
	end
	local config2 = {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, SpacingTop or AssignResult.spacingTop),
			PaddingRight = UDim.new(0, SpacingTrailing or AssignResult.spacingTrailing),
			PaddingBottom = UDim.new(0, SpacingBottom or AssignResult.spacingBottom),
			PaddingLeft = UDim.new(0, SpacingLeading or AssignResult.spacingLeading)
		}),
		ListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, ItemsGap or AssignResult.itemsGap)
		})
	}
	local UseInputTypeModuleResult = UseInputTypeModule()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseDelayedActionHandlerResult = UseDelayedActionHandlerFunction(if AssignResult.transitionDelaySeconds then AssignResult.transitionDelaySeconds else 0, 0.1, function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(0, config))
	end)
	
	local function onInputChanged()
		-- upvalues: AssignResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval), UseDelayedActionHandlerResult (copy)
		if AssignResult.transitionDelaySeconds then
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, config))
			UseDelayedActionHandlerResult()
		end
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(UtilitiesModule.filterItems(AssignResult.items, UseInputTypeModuleResult))
	UseEventConnectionFunction(UserInputService.InputChanged, onInputChanged)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UtilitiesModule (upval), AssignResult (copy), UseInputTypeModuleResult (copy)
		UseStateResult2(UtilitiesModule.filterItems(AssignResult.items, UseInputTypeModuleResult))
	end, { UseInputTypeModuleResult, AssignResult.items })
	
	for Index, PublicProps in ipairs(UseStateResult) do
		config2["Item" .. tostring(Index)] = ReactModule.createElement(ShortcutModule, {
			index = Index,
			iconLabelGap = ItemIconLabelGap or AssignResult.itemIconLabelGap,
			actionTextSpacingLeading = ActionTextSpacingLeading or AssignResult.actionTextSpacingLeading,
			publicProps = PublicProps
		})
	end
	if #UseStateResult > 0 then
		local OverMedia0 = UseStyleModuleResult.Tokens.Color.OverMedia.OverMedia_0
		
		return ReactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			Position = AssignResult.position,
			AnchorPoint = AssignResult.anchorPoint,
			GroupTransparency = if AssignResult.transitionDelaySeconds then UseAnimatedBindingResult else 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			ShortcutBarComponent = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(0, 0),
				BackgroundColor3 = OverMedia0.Color3,
				BackgroundTransparency = OverMedia0.Transparency,
				AutomaticSize = Enum.AutomaticSize.XY
			}, config2)
		})
	else
		return nil
	end
end