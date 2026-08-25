local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local sheet = script:FindFirstAncestor("Sheet")
local sheetContextModule = require(sheet.SheetContext)
local sheetTypeModule = require(sheet.SheetType)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local viewModule = require(foundation.Components.View)

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), sheetTypeModule (ref), viewModule (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref)
	local var9 = useTokensModule()
	local var10 = reactModule.useContext(sheetContextModule)
	local innerScrollY = var10.innerScrollY
	local setHasHeader = var10.setHasHeader
	local hasFullBleed = var10.hasFullBleed
	local sheetType = var10.sheetType
	local closeSheet = var10.closeSheet
	local testId = var10.testId
	local closeAffordanceRef = var10.closeAffordanceRef
	local contentStartRef = var10.contentStartRef
	assert(innerScrollY and (setHasHeader and (closeSheet and testId)), "SheetHeader must be used within a Sheet")
	local var11 = sheetType == sheetTypeModule.Bottom
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
		ref = p1
	}, {
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "row align-y-center items-center gap-small size-full-1400 auto-y margin-left-small padding-y-small padding-right-medium"
		}, {
			SubContent = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = "row items-center shrink gap-small size-full-0 auto-y"
			}, p0.children),
			CloseAffordance = if if p0.hasCloseAffordance == nil then not var11 else p0.hasCloseAffordance then reactModule.createElement(closeAffordanceModule, {
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
			backgroundStyle = innerScrollY:map(function(p2)
				-- upvalues: var9 (ref)
				return {
					Color3 = var9.Color.Stroke.Default.Color3,
					Transparency = math.lerp(1, var9.Color.Stroke.Default.Transparency, math.clamp(p2 / var9.Size.Size_1200, 0, 1))
				}
			end),
			testId = `{testId}--header--bottom-border`,
			Size = UDim2.new(1, 0, 0, var9.Stroke.Standard)
		})
	})
end))