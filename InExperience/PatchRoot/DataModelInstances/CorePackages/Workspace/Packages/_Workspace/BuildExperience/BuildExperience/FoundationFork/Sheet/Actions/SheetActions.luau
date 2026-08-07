local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local sheet = script:FindFirstAncestor("Sheet")
local sheetContextModule = require(sheet.SheetContext)
local sheetTypeModule = require(sheet.SheetType)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local viewModule = require(foundation.Components.View)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 19 | named "SheetActions" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref)
	local var8 = useTokensModule()
	local var9 = reactModule.useContext(sheetContextModule)
	local sheetHeightAvailable = var9.sheetHeightAvailable
	local actionsHeight = var9.actionsHeight
	local setActionsHeight = var9.setActionsHeight
	local hasActionsDivider = var9.hasActionsDivider
	local safeAreaPadding = var9.safeAreaPadding
	local bottomPadding = var9.bottomPadding
	local sheetType = var9.sheetType
	local testId = var9.testId
	assert(sheetHeightAvailable and (actionsHeight and (setActionsHeight and (hasActionsDivider and (safeAreaPadding and (bottomPadding and testId))))), "SheetActions must be used within a Sheet")
	local innerSurface = var9.innerSurface
	local var10 = sheetType == sheetTypeModule.Bottom
	local var11 = reactModule.createElement(viewModule, {
		ZIndex = 1,
		LayoutOrder = 3,
		tag = {
			["row gap-small size-full-0 auto-y"] = true,
			["bg-surface-100"] = var10
		},
		padding = {
			top = UDim.new(0, var8.Margin.Small),
			left = UDim.new(0, var8.Margin.Small),
			right = UDim.new(0, var8.Margin.Small),
			bottom = UDim.new(0, bottomPadding + var8.Margin.Small)
		},
		stroke = {
			Color = var8.Color.Stroke.Default.Color3,
			Transparency = var8.Color.Stroke.Default.Transparency,
			Thickness = hasActionsDivider:map(function(p2) --[[ line: 60 ]]
				-- upvalues: var8 (ref)
				return if p2 then var8.Stroke.Standard else 0
			end)
		},
		onAbsoluteSizeChanged = if var10 then function(p3) --[[ line: 69 ]]
			-- upvalues: setActionsHeight (ref), bottomPadding (ref)
			setActionsHeight(p3.AbsoluteSize.Y - bottomPadding)
		end else nil,
		testId = `{testId}--actions`,
		Position = if var10 then reactModule.joinBindings({
			sheetHeightAvailable = sheetHeightAvailable,
			actionsHeight = actionsHeight
		}):map(function(p4) --[[ line: 79 ]]
			return UDim2.new(0, 0, 1, -math.min(p4.sheetHeightAvailable, p4.actionsHeight))
		end) else nil,
		ref = p1,
		onActivated = function() --[[ line: 89 ]] end,
		selection = { Selectable = false },
		stateLayer = { affordance = stateLayerAffordanceModule.None }
	}, p0.children)
	
	return if var10 then innerSurface and reactRobloxModule.createPortal(var11, innerSurface) else var11
end))