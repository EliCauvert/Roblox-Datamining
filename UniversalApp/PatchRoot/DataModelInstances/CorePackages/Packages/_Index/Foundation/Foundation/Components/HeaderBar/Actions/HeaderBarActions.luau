local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local headerBarSlotModule = require(foundation.Enums.HeaderBarSlot)
local iconButtonModule = require(foundation.Components.IconButton)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local constantsModule = require(foundation.Components.HeaderBar.constants)
local useHeaderBarContextModule = require(foundation.Components.HeaderBar.useHeaderBarContext)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return reactModule.memo(function(p1)
	-- upvalues: useHeaderBarContextModule (ref), useTokensModule (ref), reactModule (ref), headerBarSlotModule (ref), constantsModule (ref), iconButtonModule (ref), viewModule (ref)
	local var1 = useHeaderBarContextModule()
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), headerBarSlotModule (copy), constantsModule (copy), var2 (ref)
		if var1.slot == headerBarSlotModule.Leading then
			return constantsModule.LEADING_ACTIONS_LAYOUT_ORDER, { left = UDim.new(0, -var2.Size.Size_200) }
		elseif var1.slot == headerBarSlotModule.Trailing then
			return constantsModule.TRAILING_ACTIONS_LAYOUT_ORDER, { right = UDim.new(0, -var2.Size.Size_200) }
		end
		return nil, nil
	end, { var1.slot, var2.Size.Size_200 })
	local t = {}
	
	for i, v in p1.actions do
		t[tostring(v.id)] = reactModule.createElement(iconButtonModule, {
			icon = v.icon,
			onActivated = v.onActivated,
			LayoutOrder = i,
			testId = `{var1.testId}--actions--{v.id}`
		})
	end
	return reactModule.createElement(viewModule, {
		tag = "row align-y-center shrink gap-small auto-xy",
		padding = var4,
		LayoutOrder = var3,
		testId = `{var1.testId}--actions`
	}, t)
end)