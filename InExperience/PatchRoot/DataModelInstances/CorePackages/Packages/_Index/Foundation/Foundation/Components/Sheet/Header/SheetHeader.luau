local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local Sheet = script:FindFirstAncestor("Sheet")
local SheetContextModule = require(Sheet.SheetContext)
local SheetTypeModule = require(Sheet.SheetType)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local ViewModule = require(Foundation.Components.View)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 19 | Named "SheetHeader" ]]
	-- upvalues: UseTokensModule (copy), ReactModule (copy), SheetContextModule (copy), SheetTypeModule (copy), ViewModule (copy), CloseAffordanceModule (copy), CloseAffordanceVariantModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseContextResult = ReactModule.useContext(SheetContextModule)
	local InnerScrollY = UseContextResult.innerScrollY
	local SetHasHeaderFunction = UseContextResult.setHasHeader
	local HasFullBleed = UseContextResult.hasFullBleed
	local SheetType = UseContextResult.sheetType
	local CloseSheet = UseContextResult.closeSheet
	local TestId = UseContextResult.testId
	local CloseAffordanceRef = UseContextResult.closeAffordanceRef
	local ContentStartRef = UseContextResult.contentStartRef
	assert(InnerScrollY and (SetHasHeaderFunction and (CloseSheet and TestId)), "SheetHeader must be used within a Sheet")
	local IsSheetTypeMatch = SheetType == SheetTypeModule.Bottom
	ReactModule.useEffect(function() --[[ Line: 35 ]]
		-- upvalues: SetHasHeaderFunction (copy)
		SetHasHeaderFunction(true)
		
		return function() --[[ Line: 37 ]]
			-- upvalues: SetHasHeaderFunction (upval)
			SetHasHeaderFunction(false)
		end
	end, {})
	
	return ReactModule.createElement(ViewModule, {
		ZIndex = 2,
		tag = "col size-full-0 auto-y",
		testId = `{TestId}--header`,
		ref = Ref
	}, {
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = "row align-y-center items-center gap-small size-full-1400 auto-y margin-left-small padding-y-small padding-right-medium"
		}, {
			SubContent = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = "row items-center shrink gap-small size-full-0 auto-y"
			}, p1.children),
			CloseAffordance = if if p1.hasCloseAffordance == nil then not IsSheetTypeMatch else p1.hasCloseAffordance then ReactModule.createElement(CloseAffordanceModule, {
				LayoutOrder = 2,
				onActivated = CloseSheet,
				ref = CloseAffordanceRef,
				NextSelectionDown = ContentStartRef,
				variant = if HasFullBleed then CloseAffordanceVariantModule.OverMedia else CloseAffordanceVariantModule.Utility,
				testId = `{TestId}--header--close-affordance`
			}) else nil
		}),
		BottomBorder = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			backgroundStyle = InnerScrollY:map(function(p2) --[[ Line: 71 ]]
				-- upvalues: UseTokensModuleResult (copy)
				return {
					Color3 = UseTokensModuleResult.Color.Stroke.Default.Color3,
					Transparency = math.lerp(1, UseTokensModuleResult.Color.Stroke.Default.Transparency, (math.clamp(p2 / UseTokensModuleResult.Size.Size_1200, 0, 1)))
				}
			end),
			testId = `{TestId}--header--bottom-border`,
			Size = UDim2.new(1, 0, 0, UseTokensModuleResult.Stroke.Standard)
		})
	})
end))