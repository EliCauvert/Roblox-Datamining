local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local Sheet = script:FindFirstAncestor("Sheet")
local SheetContextModule = require(Sheet.SheetContext)
local SheetTypeModule = require(Sheet.SheetType)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local ViewModule = require(Foundation.Components.View)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 19 | Named "SheetActions" ]]
	-- upvalues: UseTokensModule (copy), ReactModule (copy), SheetContextModule (copy), SheetTypeModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), ReactRobloxModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseContextResult = ReactModule.useContext(SheetContextModule)
	local SheetHeightAvailable = UseContextResult.sheetHeightAvailable
	local ActionsHeight = UseContextResult.actionsHeight
	local SetActionsHeightFunction = UseContextResult.setActionsHeight
	local HasActionsDivider = UseContextResult.hasActionsDivider
	local SafeAreaPadding = UseContextResult.safeAreaPadding
	local BottomPadding = UseContextResult.bottomPadding
	local SheetType = UseContextResult.sheetType
	local TestId = UseContextResult.testId
	assert(SheetHeightAvailable and (ActionsHeight and (SetActionsHeightFunction and (HasActionsDivider and (SafeAreaPadding and (BottomPadding and TestId))))), "SheetActions must be used within a Sheet")
	local InnerSurface = UseContextResult.innerSurface
	local IsSheetTypeMatch = SheetType == SheetTypeModule.Bottom
	local Element = ReactModule.createElement(ViewModule, {
		ZIndex = 1,
		LayoutOrder = 3,
		tag = {
			["row gap-small size-full-0 auto-y"] = true,
			["bg-surface-100"] = IsSheetTypeMatch
		},
		padding = {
			top = UDim.new(0, UseTokensModuleResult.Margin.Small),
			left = UDim.new(0, UseTokensModuleResult.Margin.Small),
			right = UDim.new(0, UseTokensModuleResult.Margin.Small),
			bottom = UDim.new(0, BottomPadding + UseTokensModuleResult.Margin.Small)
		},
		stroke = {
			Color = UseTokensModuleResult.Color.Stroke.Default.Color3,
			Transparency = UseTokensModuleResult.Color.Stroke.Default.Transparency,
			Thickness = HasActionsDivider:map(function(p2) --[[ Line: 60 ]]
				-- upvalues: UseTokensModuleResult (copy)
				return if p2 then UseTokensModuleResult.Stroke.Standard else 0
			end)
		},
		onAbsoluteSizeChanged = if IsSheetTypeMatch then function(Frame) --[[ Line: 69 ]]
			-- upvalues: SetActionsHeightFunction (copy), BottomPadding (copy)
			SetActionsHeightFunction(Frame.AbsoluteSize.Y - BottomPadding)
		end else nil,
		testId = `{TestId}--actions`,
		Position = if IsSheetTypeMatch then ReactModule.joinBindings({
			sheetHeightAvailable = SheetHeightAvailable,
			actionsHeight = ActionsHeight
		}):map(function(p2): UDim2 --[[ Line: 79 ]]
			return UDim2.new(0, 0, 1, -math.min(p2.sheetHeightAvailable, p2.actionsHeight))
		end) else nil,
		ref = Ref,
		onActivated = function() --[[ Line: 89 ]] end,
		selection = { Selectable = false },
		stateLayer = { affordance = StateLayerAffordanceModule.None }
	}, p1.children)
	
	return if IsSheetTypeMatch then InnerSurface and ReactRobloxModule.createPortal(Element, InnerSurface) else Element
end))