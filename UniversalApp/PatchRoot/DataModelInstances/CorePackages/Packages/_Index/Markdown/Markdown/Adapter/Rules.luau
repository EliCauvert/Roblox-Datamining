local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(script.Parent.AdapterTypes)
local ChildrenModule = require(script.Parent.Children)
local _ = require(Markdown.Parent.CommonMark)
local _ = require(script.Parent.Engine)
local ListMarkersModule = require(script.Parent.ListMarkers)
local _ = require(Markdown.Types)

local function _(Url, Title)
	return if Url == nil and Title == nil then nil else { url = Url, title = Title }
end

local function appendListItems(Removed, List, p1)
	-- upvalues: ListMarkersModule (copy), ChildrenModule (copy)
	local List1 = Removed.list
	local Out = Removed.out
	local NoTight = not List1.tight
	
	if NoTight and Removed.splitParent == nil then
		p1:gap("LooseList", List1)
	end
	local SplitParent = if NoTight then Removed.splitParent else nil
	local BulletPrefixResult = ListMarkersModule.bulletPrefix(List1)
	local StartNumberResult = ListMarkersModule.startNumber(List1)
	local v1 = nil
	
	local function appendItem()
		-- upvalues: SplitParent (copy), v1 (ref), Out (ref), p1 (copy), StartNumberResult (ref), BulletPrefixResult (copy), ListMarkersModule (upval)
		if SplitParent ~= nil and v1 ~= nil then
			Out = p1:append(SplitParent, "LIST")
		end
		local BulletPrefixResult1 = if StartNumberResult == nil then BulletPrefixResult else ListMarkersModule.orderedPrefix(StartNumberResult)
		
		if StartNumberResult ~= nil then
			StartNumberResult += 1
		end
		local LISTITEM = p1:append(Out, "LIST_ITEM", { prefix = BulletPrefixResult1 })
		v1 = LISTITEM
		
		return LISTITEM
	end
	local Block1 = nil
	
	for _, value in p1:_units(List1, true) do
		local Block = value.block
		
		if Block == nil or Block.kind ~= "ListItem" then
			p1:_flattenUnits({ value }, v1 or appendItem())
			continue
		end
		local AppendItemResult = appendItem()
		local UnitsResult = p1:_units(Block, false)
		Block1 = nil
		
		for _, value1 in UnitsResult do
			if ChildrenModule.isList(value1) then
				Block1 = value1.block
				break
			end
		end
		p1:_flattenUnits(UnitsResult, AppendItemResult, { gap = "ListItemBlocks", except = Block1 }, Block)
		
		if Block1 ~= nil then
			table.insert(List, { list = Block1, out = p1:append(Out, "LIST") })
		end
	end
end

return {
	list = function(p2)
		-- upvalues: appendListItems (copy)
		local v2: boolean = p2 == nil or p2.splitLooseTopLevel ~= false
		
		return function(List, p3)
			-- upvalues: v2 (copy), appendListItems (upval)
			local List1 = {
				{
					list = List,
					out = p3:block("LIST"),
					splitParent = if v2 and p3.depth == 0 then p3.parent else nil
				}
			}
			while #List1 > 0 do
				appendListItems(table.remove(List1), List1, p3)
			end
		end
	end,
	quote = function(p3)
		local Flatten = if p3 == nil then "flatten" else p3.nested or "flatten"
		
		if Flatten ~= "flatten" and Flatten ~= "drop" then
			error(`Rules.quote's nested must be "flatten" or "drop", not {Flatten}`)
		end
		local Frozen = if Flatten == "drop" then table.freeze({ BlockQuote = true }) else nil
		
		return function(p4, p5)
			-- upvalues: Frozen (copy)
			p5:flatten(p4, p5:block("QUOTE"), { gap = "QuoteBlocks", drop = Frozen })
		end
	end,
	codeBlock = function()
		return function(p3, p4)
			local Info = if p3.kind == "FencedCodeBlock" then p3.info else nil
			local v3 = nil
			
			if Info ~= nil and Info ~= "" then
				local FoundAt: number? = string.find(Info, " ", 1, true)
				v3 = {
					language = if FoundAt then string.sub(Info, 1, FoundAt - 1) else Info
				}
			end
			local CODEBLOCK = p4:block("CODE_BLOCK", v3)
			local Literal = p3.literal or ""
			
			if string.sub(Literal, -1) == "\n" then
				Literal = string.sub(Literal, 1, -2)
			end
			CODEBLOCK.text = Literal
		end
	end,
	divider = function()
		return function(_, p3)
			p3:block("DIVIDER")
		end
	end,
	htmlBlock = function()
		return function(p3, p4)
			local PARAGRAPH = p4:block("PARAGRAPH")
			local Literal = p3.literal
			
			if Literal ~= nil and Literal ~= "" then
				p4:append(PARAGRAPH, "TEXT").text = Literal
			end
		end
	end,
	code = function()
		return function(p3, p4)
			local STYLEDTEXT = p4:append(p4.parent, "STYLED_TEXT", { style = "INLINE_CODE" })
			local Literal = p3.literal
			
			if Literal ~= nil and Literal ~= "" then
				p4:append(STYLEDTEXT, "TEXT").text = Literal
			end
		end
	end,
	hardLineBreak = function()
		return function(_, p3)
			p3:append(p3.parent, "BREAK")
		end
	end,
	link = function()
		return function(p3, p4)
			local Destination = p3.destination
			local Title = p3.title
			p4:adaptInlinesOf(p3, (p4:append(p4.parent, "LINK", if Destination == nil and Title == nil then nil else { url = Destination, title = Title })))
		end
	end,
	image = function()
		return function(p3, p4)
			local Destination = p3.destination
			local Title = p3.title
			p4:append(p4.parent, "IMAGE", if Destination == nil and Title == nil then nil else { url = Destination, title = Title }).text = p4:plainText(p3)
		end
	end
}