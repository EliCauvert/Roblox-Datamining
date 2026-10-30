local Markdown = script:FindFirstAncestor("Markdown")
local Parent = Markdown.Parent
local DashModule = require(Parent.Dash)
local InlineLayoutModule = require(Parent.InlineLayout)
local GetRowContextModule = require(script.Parent.getRowContext)
local MergeContextsModule = require(Markdown.Utils.mergeContexts)
local _ = require(Markdown.Types)
local HardBreakElement = InlineLayoutModule.Components.InlineLayoutElements.HardBreakElement
local IsInlineElement = InlineLayoutModule.Utils.isInlineElement

local function measureUnwrappedWidth(FilterResult): number
	-- upvalues: HardBreakElement (copy)
	local Value = 0
	local NewWidth = 0
	
	for _, value in FilterResult do
		if value == HardBreakElement then
			NewWidth = 0
		else
			NewWidth += value:getWidth()
			Value = math.max(Value, NewWidth)
		end
	end
	return (math.ceil(Value))
end

local function getStyleKey(p1)
	-- upvalues: DashModule (copy)
	return DashModule.pretty({
		textStyles = p1.textStyles,
		codeStyles = p1.codeStyles,
		linkStyles = p1.linkStyles,
		imageStyles = p1.imageStyles
	}, { depth = 4 })
end

local function getContentKey(p1): string
	-- upvalues: DashModule (copy), getContentKey (copy)
	local Text = p1.text or ""
	local Text1: string = `{p1.name}:{#Text}:{Text}`
	
	if p1.attributes then
		Text1 ..= DashModule.pretty(p1.attributes)
	end
	for _, child in p1.children do
		Text1 ..= `({getContentKey(child)})`
	end
	return Text1
end

return {
	MIN_COLUMN_CONTENT_WIDTH = 80,
	createWidthCache = function()
		return { styleKey = "", cellWidths = {} }
	end,
	measureColumnContentWidths = function(p2, p3, WidthCache)
		-- upvalues: getStyleKey (copy), MergeContextsModule (copy), GetRowContextModule (copy), getContentKey (copy), DashModule (copy), IsInlineElement (copy), measureUnwrappedWidth (copy)
		local StyleKey = getStyleKey(p3)
		local CellWidths = if WidthCache.styleKey == StyleKey then WidthCache.cellWidths else {}
		local CellWidths1 = {}
		local Largests = {}
		
		for _, child in p2.children do
			local MergeContextsModuleResult = MergeContextsModule(GetRowContextModule(child, p3), { isInline = true })
			
			for i, child1 in child.children do
				local Text = child.name .. getContentKey(child1)
				local CellWidth = (if CellWidths1[Text] then CellWidths1[Text] else CellWidths[Text]) or measureUnwrappedWidth((DashModule.filter(MergeContextsModuleResult.processChildren(child1, MergeContextsModuleResult), IsInlineElement)))
				CellWidths1[Text] = CellWidth
				Largests[i] = math.max(Largests[i] or 0, CellWidth)
			end
		end
		WidthCache.styleKey = StyleKey
		WidthCache.cellWidths = CellWidths1
		
		return Largests
	end,
	computeColumnWidths = function(List, p4: number, p5: number)
		-- upvalues: DashModule (copy)
		local t = {}
		local NewSmallests = {}
		local Total = 0
		local Total1 = 0
		
		for i, value in List do
			t[i] = value + p5
			NewSmallests[i] = math.min(value, 80) + p5
			Total += t[i]
			Total1 += NewSmallests[i]
		end
		if Total <= p4 then
			return t
		elseif p4 <= Total1 then
			return NewSmallests
		else
			local TotalRatio = (p4 - Total1) / (Total - Total1)
			
			return DashModule.map(NewSmallests, function(p6, p7): number
				-- upvalues: t (copy), TotalRatio (copy)
				return (math.floor(p6 + (t[p7] - p6) * TotalRatio))
			end)
		end
	end,
	fillUnmeasuredColumns = function(Tbl, p6)
		if p6 <= #Tbl then
			return Tbl
		end
		local Copy = table.clone(Tbl)
		
		for i = #Tbl + 1, p6 do
			Copy[i] = 80
		end
		return Copy
	end
}