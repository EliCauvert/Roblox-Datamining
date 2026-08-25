local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local sheet = script:FindFirstAncestor("Sheet")
local sheetContextModule = require(sheet.SheetContext)
local sheetTypeModule = require(sheet.SheetType)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local viewModule = require(foundation.Components.View)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), sheetTypeModule (ref), viewModule (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref)
	local var1 = useTokensModule()
	local var2 = reactModule.useContext(sheetContextModule)
	local innerScrollY = var2.innerScrollY
	local setHasHeader = var2.setHasHeader
	local hasFullBleed = var2.hasFullBleed
	local sheetType = var2.sheetType
	local closeSheet = var2.closeSheet
	local testId = var2.testId
	local closeAffordanceRef = var2.closeAffordanceRef
	local contentStartRef = var2.contentStartRef
	assert(innerScrollY and (setHasHeader and (closeSheet and testId)), "SheetHeader must be used within a Sheet")
	local var3 = sheetType == sheetTypeModule.Bottom
	reactModule.useEffect(function()
		-- upvalues: setHasHeader (ref)
		setHasHeader(true)
		
		return function()
			-- upvalues: setHasHeader (copy)
			setHasHeader(false)
		end
	end, {})
	
	return reactModule.createElement(viewModule, {
		ZIndex = 2,
		tag = "col size-full-0 auto-y",
		testId = `{testId}--header`,
		ref = p2
	}, {
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "row align-y-center items-center gap-small size-full-1400 auto-y margin-left-small padding-y-small padding-right-medium"
		}, {
			SubContent = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = "row items-center shrink gap-small size-full-0 auto-y"
			}, p1.children),
			CloseAffordance = if if p1.hasCloseAffordance == nil then not var3 else p1.hasCloseAffordance then reactModule.createElement(closeAffordanceModule, {
				LayoutOrder = 2,
				onActivated = closeSheet,
				ref = closeAffordanceRef,
				NextSelectionDown = contentStartRef,
				variant = if hasFullBleed then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
				testId = `{testId}--header--close-affordance`
			}) else nil
		}),
		BottomBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			backgroundStyle = innerScrollY:map(function(p1)
				-- upvalues: var1 (ref)
				return {
					Color3 = var1.Color.Stroke.Default.Color3,
					Transparency = math.lerp(1, var1.Color.Stroke.Default.Transparency, math.clamp(p1 / var1.Size.Size_1200, 0, 1))
				}
			end),
			testId = `{testId}--header--bottom-border`,
			Size = UDim2.new(1, 0, 0, var1.Stroke.Standard)
		})
	})
end))