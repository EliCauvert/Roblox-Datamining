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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref)
	local var9 = useTokensModule()
	local var10 = reactModule.useContext(sheetContextModule)
	local sheetHeightAvailable = var10.sheetHeightAvailable
	local actionsHeight = var10.actionsHeight
	local setActionsHeight = var10.setActionsHeight
	local hasActionsDivider = var10.hasActionsDivider
	local safeAreaPadding = var10.safeAreaPadding
	local bottomPadding = var10.bottomPadding
	local sheetType = var10.sheetType
	local testId = var10.testId
	assert(sheetHeightAvailable and (actionsHeight and (setActionsHeight and (hasActionsDivider and (safeAreaPadding and (bottomPadding and testId))))), "SheetActions must be used within a Sheet")
	local innerSurface = var10.innerSurface
	local var11 = sheetType == sheetTypeModule.Bottom
	local var12 = reactModule.createElement(viewModule, {
		ZIndex = 1,
		LayoutOrder = 3,
		tag = {
			["row gap-small size-full-0 auto-y"] = true,
			["bg-surface-100"] = var11
		},
		padding = {
			top = UDim.new(0, var9.Margin.Small),
			left = UDim.new(0, var9.Margin.Small),
			right = UDim.new(0, var9.Margin.Small),
			bottom = UDim.new(0, bottomPadding + var9.Margin.Small)
		},
		stroke = {
			Color = var9.Color.Stroke.Default.Color3,
			Transparency = var9.Color.Stroke.Default.Transparency,
			Thickness = hasActionsDivider:map(function(p2)
				-- upvalues: var9 (ref)
				return if p2 then var9.Stroke.Standard else 0
			end)
		},
		onAbsoluteSizeChanged = if var11 then function(p3)
			-- upvalues: setActionsHeight (ref), bottomPadding (ref)
			setActionsHeight(p3.AbsoluteSize.Y - bottomPadding)
		end else nil,
		testId = `{testId}--actions`,
		Position = if var11 then reactModule.joinBindings({
			sheetHeightAvailable = sheetHeightAvailable,
			actionsHeight = actionsHeight
		}):map(function(p4)
			return UDim2.new(0, 0, 1, -math.min(p4.sheetHeightAvailable, p4.actionsHeight))
		end) else nil,
		ref = p1,
		onActivated = function() end,
		selection = { Selectable = false },
		stateLayer = { affordance = stateLayerAffordanceModule.None }
	}, p0.children)
	
	return if var11 then innerSurface and reactRobloxModule.createPortal(var12, innerSurface) else var12
end))