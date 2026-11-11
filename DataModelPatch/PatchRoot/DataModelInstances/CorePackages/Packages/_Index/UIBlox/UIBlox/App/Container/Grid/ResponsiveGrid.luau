local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactUtilsModule = require(Parent1.ReactUtils)
local UseProperties = ReactUtilsModule.useProperties
local UsePropertiesDeferred = ReactUtilsModule.usePropertiesDeferred
local ResponsiveRowModule = require(Parent.Core.Layout.Responsive.ResponsiveRow)
local UseResponsiveLayoutModule = require(Parent.Core.Layout.Responsive.useResponsiveLayout)

local function useCellAbsoluteHeight(RelativeHeight, Kind)
	-- upvalues: UseResponsiveLayoutModule (copy), ReactModule (copy)
	local Columns = UseResponsiveLayoutModule("columns", Kind) or 1
	local Gutter = UseResponsiveLayoutModule("gutter", Kind) or 0
	local VerticalGutter = UseResponsiveLayoutModule("verticalGutter", Kind) or Gutter
	local Margin = UseResponsiveLayoutModule("margin", Kind) or 0
	local RelativeHeight1 = UseResponsiveLayoutModule("relativeHeight", Kind)
	local RelativeHeight2 = RelativeHeight or RelativeHeight1
	
	return ReactModule.useCallback(function(p1)
		-- upvalues: RelativeHeight2 (copy), Margin (copy), Gutter (copy), Columns (copy), VerticalGutter (copy)
		return if RelativeHeight2 then math.max(((p1 - 2 * Margin + Gutter) / Columns - Gutter) * RelativeHeight2.Scale + RelativeHeight2.Offset, 0) + VerticalGutter else nil
	end, {
		Columns,
		Gutter,
		VerticalGutter,
		Margin,
		RelativeHeight2
	})
end

local _NumberRange = NumberRange.new(0, 0)
local _NumberRange1 = if require(Parent.UIBloxConfig).responsiveGridDisplayLinesNonNil then _NumberRange else nil

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: ReactModule (copy), _NumberRange1 (copy), useCellAbsoluteHeight (copy), UsePropertiesDeferred (copy), UseProperties (copy), ResponsiveRowModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(_NumberRange1)
	local UseCellAbsoluteHeightResult = useCellAbsoluteHeight(p1.relativeHeight, p1.kind)
	
	return ReactModule.createElement(ResponsiveRowModule, {
		scrollable = false,
		multiLine = true,
		kind = p1.kind,
		layoutOrder = p1.layoutOrder,
		displayLines = if p1.absoluteWindowTop and p1.absoluteWindowHeight then UseStateResult else nil,
		relativeHeight = p1.relativeHeight,
		data = p1.data,
		getItem = p1.getItem,
		getItemCount = p1.getItemCount,
		renderItem = p1.renderItem,
		keyExtractor = p1.keyExtractor,
		getCellColspan = p1.getCellColspan,
		getCellRowspan = p1.getCellRowspan,
		getCellOrder = p1.getCellOrder,
		ref = (if p1.enableDeferredRefPropEvents then UsePropertiesDeferred else UseProperties)(p2, ReactModule.useCallback(function(p3, p4)
			-- upvalues: p1 (copy), UseCellAbsoluteHeightResult (copy), UseStateResult2 (copy), _NumberRange1 (upval)
			if p1.absoluteWindowTop and p1.absoluteWindowHeight then
				local UseCellAbsoluteHeightResultResult: number = UseCellAbsoluteHeightResult(p4.X)
				
				if UseCellAbsoluteHeightResultResult and UseCellAbsoluteHeightResultResult > 0 then
					local NewFloored = math.floor(math.max(p1.absoluteWindowTop - p3.Y, 0) / UseCellAbsoluteHeightResultResult) + 1
					
					return UseStateResult2(NumberRange.new(NewFloored, NewFloored + (math.ceil(math.max(p1.absoluteWindowHeight, 0) / UseCellAbsoluteHeightResultResult) + 1) - 1))
				end
			end
			return UseStateResult2(_NumberRange1)
		end, {
			UseCellAbsoluteHeightResult,
			p1.absoluteWindowTop,
			p1.absoluteWindowHeight,
			UseStateResult2
		}), { "AbsolutePosition", "AbsoluteSize" })
	})
end)