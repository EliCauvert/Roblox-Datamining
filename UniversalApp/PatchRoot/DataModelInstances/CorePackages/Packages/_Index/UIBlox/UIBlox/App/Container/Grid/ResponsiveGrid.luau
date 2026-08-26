local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactUtilsModule = require(parent_1.ReactUtils)
local useProperties = reactUtilsModule.useProperties
local usePropertiesDeferred = reactUtilsModule.usePropertiesDeferred
local UIBloxConfigModule = require(parent.UIBloxConfig)
local responsiveRowModule = require(parent.Core.Layout.Responsive.ResponsiveRow)
local useResponsiveLayoutModule = require(parent.Core.Layout.Responsive.useResponsiveLayout)

local function useCellAbsoluteHeight(value, p1)
	-- upvalues: useResponsiveLayoutModule (ref), reactModule (ref)
	local columns = useResponsiveLayoutModule("columns", p1) or 1
	local gutter = useResponsiveLayoutModule("gutter", p1) or 0
	local verticalGutter = useResponsiveLayoutModule("verticalGutter", p1) or gutter
	local margin = useResponsiveLayoutModule("margin", p1) or 0
	local value_1 = value or useResponsiveLayoutModule("relativeHeight", p1)
	
	return reactModule.useCallback(function(p2)
		-- upvalues: value_1 (ref), margin (ref), gutter (ref), columns (ref), verticalGutter (ref)
		return if value_1 then math.max(((p2 - 2 * margin + gutter) / columns - gutter) * value_1.Scale + value_1.Offset, 0) + verticalGutter else nil
	end, {
		columns,
		gutter,
		verticalGutter,
		margin,
		value_1
	})
end

local var1 = if UIBloxConfigModule.responsiveGridDisplayLinesNonNil then NumberRange.new(0, 0) else nil

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), var1 (ref), useCellAbsoluteHeight (ref), usePropertiesDeferred (ref), useProperties (ref), responsiveRowModule (ref)
	local var2, var3 = reactModule.useState(var1)
	local var4 = useCellAbsoluteHeight(p1.relativeHeight, p1.kind)
	
	return reactModule.createElement(responsiveRowModule, {
		scrollable = false,
		multiLine = true,
		kind = p1.kind,
		layoutOrder = p1.layoutOrder,
		displayLines = if p1.absoluteWindowTop and p1.absoluteWindowHeight then var2 else nil,
		relativeHeight = p1.relativeHeight,
		data = p1.data,
		getItem = p1.getItem,
		getItemCount = p1.getItemCount,
		renderItem = p1.renderItem,
		keyExtractor = p1.keyExtractor,
		getCellColspan = p1.getCellColspan,
		getCellRowspan = p1.getCellRowspan,
		getCellOrder = p1.getCellOrder,
		ref = (if p1.enableDeferredRefPropEvents then usePropertiesDeferred else useProperties)(p2, reactModule.useCallback(function(p3, p4)
			-- upvalues: p1 (ref), var4 (ref), var3 (ref), var1 (copy)
			if p1.absoluteWindowTop and p1.absoluteWindowHeight then
				local var5 = var4(p4.X)
				
				if var5 and var5 > 0 then
					local var6 = math.floor(math.max(p1.absoluteWindowTop - p3.Y, 0) / var5) + 1
					
					return var3(NumberRange.new(var6, var6 + (math.ceil(math.max(p1.absoluteWindowHeight, 0) / var5) + 1) - 1))
				end
			end
			return var3(var1)
		end, {
			var4,
			p1.absoluteWindowTop,
			p1.absoluteWindowHeight,
			var3
		}), { "AbsolutePosition", "AbsoluteSize" })
	})
end)