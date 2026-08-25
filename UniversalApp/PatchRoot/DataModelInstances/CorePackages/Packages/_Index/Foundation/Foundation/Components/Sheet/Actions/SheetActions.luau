local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local sheet = script:FindFirstAncestor("Sheet")
local sheetContextModule = require(sheet.SheetContext)
local sheetTypeModule = require(sheet.SheetType)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local viewModule = require(foundation.Components.View)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref)
	local var1 = useTokensModule()
	local var2 = reactModule.useContext(sheetContextModule)
	local sheetHeightAvailable = var2.sheetHeightAvailable
	local actionsHeight = var2.actionsHeight
	local setActionsHeight = var2.setActionsHeight
	local hasActionsDivider = var2.hasActionsDivider
	local safeAreaPadding = var2.safeAreaPadding
	local bottomPadding = var2.bottomPadding
	local sheetType = var2.sheetType
	local testId = var2.testId
	assert(sheetHeightAvailable and (actionsHeight and (setActionsHeight and (hasActionsDivider and (safeAreaPadding and (bottomPadding and testId))))), "SheetActions must be used within a Sheet")
	local innerSurface = var2.innerSurface
	local var3 = sheetType == sheetTypeModule.Bottom
	local var4 = reactModule.createElement(viewModule, {
		ZIndex = 1,
		LayoutOrder = 3,
		tag = {
			["row gap-small size-full-0 auto-y"] = true,
			["bg-surface-100"] = var3
		},
		padding = {
			top = UDim.new(0, var1.Margin.Small),
			left = UDim.new(0, var1.Margin.Small),
			right = UDim.new(0, var1.Margin.Small),
			bottom = UDim.new(0, bottomPadding + var1.Margin.Small)
		},
		stroke = {
			Color = var1.Color.Stroke.Default.Color3,
			Transparency = var1.Color.Stroke.Default.Transparency,
			Thickness = hasActionsDivider:map(function(p1)
				-- upvalues: var1 (ref)
				return if p1 then var1.Stroke.Standard else 0
			end)
		},
		onAbsoluteSizeChanged = if var3 then function(p1)
			-- upvalues: setActionsHeight (ref), bottomPadding (ref)
			setActionsHeight(p1.AbsoluteSize.Y - bottomPadding)
		end else nil,
		testId = `{testId}--actions`,
		Position = if var3 then reactModule.joinBindings({
			sheetHeightAvailable = sheetHeightAvailable,
			actionsHeight = actionsHeight
		}):map(function(p1)
			return UDim2.new(0, 0, 1, -math.min(p1.sheetHeightAvailable, p1.actionsHeight))
		end) else nil,
		ref = p2,
		onActivated = function() end,
		selection = { Selectable = false },
		stateLayer = { affordance = stateLayerAffordanceModule.None }
	}, p1.children)
	
	return if var3 then innerSurface and reactRobloxModule.createPortal(var4, innerSurface) else var4
end))