local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local HeaderBarSlotModule = require(Foundation.Enums.HeaderBarSlot)
local IconButtonModule = require(Foundation.Components.IconButton)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local ConstantsModule = require(Foundation.Components.HeaderBar.constants)
local UseHeaderBarContextModule = require(Foundation.Components.HeaderBar.useHeaderBarContext)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return ReactModule.memo(function(p1) --[[ Line: 28 | Named "HeaderBarActions" ]]
	-- upvalues: UseHeaderBarContextModule (copy), UseTokensModule (copy), ReactModule (copy), HeaderBarSlotModule (copy), ConstantsModule (copy), IconButtonModule (copy), ViewModule (copy)
	local UseHeaderBarContextModuleResult = UseHeaderBarContextModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 32 ]]
		-- upvalues: UseHeaderBarContextModuleResult (copy), HeaderBarSlotModule (upval), ConstantsModule (upval), UseTokensModuleResult (copy)
		if UseHeaderBarContextModuleResult.slot == HeaderBarSlotModule.Leading then
			return ConstantsModule.LEADING_ACTIONS_LAYOUT_ORDER, { left = UDim.new(0, -UseTokensModuleResult.Size.Size_200) }
		elseif UseHeaderBarContextModuleResult.slot == HeaderBarSlotModule.Trailing then
			return ConstantsModule.TRAILING_ACTIONS_LAYOUT_ORDER, {
				right = UDim.new(0, -UseTokensModuleResult.Size.Size_200)
			}
		else
			return nil, nil
		end
	end, {
		UseHeaderBarContextModuleResult.slot,
		UseTokensModuleResult.Size.Size_200
	})
	local Elements = {}
	
	for LayoutOrder, action in p1.actions do
		Elements[tostring(action.id)] = ReactModule.createElement(IconButtonModule, {
			icon = action.icon,
			onActivated = action.onActivated,
			LayoutOrder = LayoutOrder,
			testId = `{UseHeaderBarContextModuleResult.testId}--actions--{action.id}`
		})
	end
	return ReactModule.createElement(ViewModule, {
		tag = "row align-y-center shrink gap-small auto-xy",
		padding = UseMemoResult2,
		LayoutOrder = UseMemoResult,
		testId = `{UseHeaderBarContextModuleResult.testId}--actions`
	}, Elements)
end)