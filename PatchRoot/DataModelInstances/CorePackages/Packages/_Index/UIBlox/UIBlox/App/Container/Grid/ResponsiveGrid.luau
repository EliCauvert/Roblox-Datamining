-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:52 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactUtilsModule = require(parent_1.ReactUtils)
local useProperties = reactUtilsModule.useProperties
local usePropertiesDeferred = reactUtilsModule.usePropertiesDeferred
local UIBloxConfigModule = require(parent.UIBloxConfig)
local responsiveRowModule = require(parent.Core.Layout.Responsive.ResponsiveRow)
local useResponsiveLayoutModule = require(parent.Core.Layout.Responsive.useResponsiveLayout)

local function useCellAbsoluteHeight(value, p0) --[[ line: 60 ]]
	-- upvalues: useResponsiveLayoutModule (ref), reactModule (ref)
	local columns = useResponsiveLayoutModule("columns", p0) or 1
	local gutter = useResponsiveLayoutModule("gutter", p0) or 0
	local verticalGutter = useResponsiveLayoutModule("verticalGutter", p0) or gutter
	local margin = useResponsiveLayoutModule("margin", p0) or 0
	local value_1 = value or useResponsiveLayoutModule("relativeHeight", p0)
	
	return reactModule.useCallback(function(p1) --[[ line: 69 ]]
		-- upvalues: value_1 (ref), margin (ref), gutter (ref), columns (ref), verticalGutter (ref)
		return if value_1 then math.max(((p1 - 2 * margin + gutter) / columns - gutter) * value_1.Scale + value_1.Offset, 0) + verticalGutter else nil
	end, {
		columns,
		gutter,
		verticalGutter,
		margin,
		value_1
	})
end

local var6 = if UIBloxConfigModule.responsiveGridDisplayLinesNonNil then NumberRange.new(0, 0) else nil

return reactModule.forwardRef(function(p2, p3) --[[ line: 83 | named "ResponsiveGrid" ]]
	-- upvalues: reactModule (ref), var6 (ref), useCellAbsoluteHeight (ref), usePropertiesDeferred (ref), useProperties (ref), responsiveRowModule (ref)
	local var12, var13 = reactModule.useState(var6)
	local var14 = useCellAbsoluteHeight(p2.relativeHeight, p2.kind)
	
	return reactModule.createElement(responsiveRowModule, {
		scrollable = false,
		multiLine = true,
		kind = p2.kind,
		layoutOrder = p2.layoutOrder,
		displayLines = if p2.absoluteWindowTop and p2.absoluteWindowHeight then var12 else nil,
		relativeHeight = p2.relativeHeight,
		data = p2.data,
		getItem = p2.getItem,
		getItemCount = p2.getItemCount,
		renderItem = p2.renderItem,
		keyExtractor = p2.keyExtractor,
		getCellColspan = p2.getCellColspan,
		getCellRowspan = p2.getCellRowspan,
		getCellOrder = p2.getCellOrder,
		ref = (if p2.enableDeferredRefPropEvents then usePropertiesDeferred else useProperties)(p3, reactModule.useCallback(function(p4, p5) --[[ line: 87 ]]
			-- upvalues: p2 (ref), var14 (ref), var13 (ref), var6 (copy)
			if p2.absoluteWindowTop and p2.absoluteWindowHeight then
				local var15 = var14(p5.X)
				
				if var15 and var15 > 0 then
					local var16 = math.floor(math.max(p2.absoluteWindowTop - p4.Y, 0) / var15) + 1
					
					return var13(NumberRange.new(var16, var16 + (math.ceil(math.max(p2.absoluteWindowHeight, 0) / var15) + 1) - 1))
				end
			end
			return var13(var6)
		end, {
			var14,
			p2.absoluteWindowTop,
			p2.absoluteWindowHeight,
			var13
		}), { "AbsolutePosition", "AbsoluteSize" })
	})
end)