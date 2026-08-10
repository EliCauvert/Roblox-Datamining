local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local sheet = script:FindFirstAncestor("Sheet")
local sheetContextModule = require(sheet.SheetContext)
local sheetTypeModule = require(sheet.SheetType)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local viewModule = require(foundation.Components.View)
local flagsModule = require(foundation.Utility.Flags)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 21 | named "SheetHeader" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), flagsModule (ref), sheetTypeModule (ref), viewModule (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref)
	local var19
	local var10 = useTokensModule()
	local var11 = reactModule.useContext(sheetContextModule)
	local innerScrollY = var11.innerScrollY
	local setHasHeader = var11.setHasHeader
	local var12 = if flagsModule.FoundationSheetFullBleed then var11.hasFullBleed else nil
	local sheetType = var11.sheetType
	local closeSheet = var11.closeSheet
	local testId = var11.testId
	local closeAffordanceRef = var11.closeAffordanceRef
	local contentStartRef = var11.contentStartRef
	assert(innerScrollY and (setHasHeader and (closeSheet and testId)), "SheetHeader must be used within a Sheet")
	local var13 = sheetType == sheetTypeModule.Bottom
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: setHasHeader (ref)
		setHasHeader(true)
		
		return function() --[[ line: 39 ]]
			-- upvalues: setHasHeader (copy)
			setHasHeader(false)
		end
	end, {})
	local var14 = if p0.hasCloseAffordance == nil then not var13 else p0.hasCloseAffordance
	local createElement = reactModule.createElement
	local t = {
		ZIndex = 2,
		tag = "col size-full-0 auto-y",
		testId = `{testId}--header`,
		ref = p1
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		LayoutOrder = 1,
		tag = "row align-y-center items-center gap-small size-full-1400 auto-y margin-left-small padding-y-small padding-right-medium"
	}
	local t_3 = {
		SubContent = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "row items-center shrink gap-small size-full-0 auto-y"
		}, p0.children)
	}
	
	if var14 then
		var19 = reactModule.createElement
		var19 = var19(closeAffordanceModule, {
			LayoutOrder = 2,
			onActivated = closeSheet,
			ref = closeAffordanceRef,
			NextSelectionDown = contentStartRef,
			variant = if flagsModule.FoundationSheetFullBleed and var12 then closeAffordanceVariantModule.OverMedia else closeAffordanceVariantModule.Utility,
			testId = `{testId}--header--close-affordance`
		})
	else
		var19 = nil
	end
	t_3.CloseAffordance = var19
	t_1.Content = createElement_1(viewModule, t_2, t_3)
	t_1.BottomBorder = reactModule.createElement(viewModule, {
		LayoutOrder = 2,
		backgroundStyle = innerScrollY:map(function(p2) --[[ line: 75 ]]
			-- upvalues: var10 (ref)
			return {
				Color3 = var10.Color.Stroke.Default.Color3,
				Transparency = math.lerp(1, var10.Color.Stroke.Default.Transparency, math.clamp(p2 / var10.Size.Size_1200, 0, 1))
			}
		end),
		testId = `{testId}--header--bottom-border`,
		Size = UDim2.new(1, 0, 0, var10.Stroke.Standard)
	})
	
	return createElement(viewModule, t, t_1)
end))