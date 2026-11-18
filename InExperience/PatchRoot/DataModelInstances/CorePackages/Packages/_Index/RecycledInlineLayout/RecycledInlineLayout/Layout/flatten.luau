local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local _ = require(RecycledInlineLayout.Types)
local IsElementModule = require(RecycledInlineLayout.Definitions.isElement)
local WarnOnceModule = require(RecycledInlineLayout.Utils.warnOnce)

local function inheritProps(p1, Spans)
	local Copy = table.clone(p1.props)
	
	for i = #Spans, 1, -1 do
		local Span = Spans[i]
		
		for _, value in Span.definition.inherit do
			if Copy[value] == nil and p1.definition.props[value] ~= nil then
				Copy[value] = Span.props[value]
			end
		end
	end
	return Copy
end

local function resolveLayoutProps(Definition, Props, Callback)
	for i, prop in Definition.props do
		if prop.layout ~= "none" and Props[i] ~= nil then
			Props[i] = Callback(Props[i])
		end
	end
end

return function(p2, p3)
	-- upvalues: IsElementModule (copy), WarnOnceModule (copy), inheritProps (copy), resolveLayoutProps (copy)
	local List = {}
	
	local function visit(Children, Key, Tbl)
		-- upvalues: IsElementModule (upval), WarnOnceModule (upval), List (copy), visit (copy), inheritProps (upval), resolveLayoutProps (upval), p3 (copy)
		for i, child in Children do
			if not IsElementModule(child) then
				WarnOnceModule(`RecycledInlineLayout: element {if Key then `{Key}.{i}` else tostring(i)} isn't a RecycledInlineLayout Element, so it's skipped. Build Elements with its Leaf and Span constructors, such as Text and Link: the old InlineLayout's elements can't be mixed in.`)
				continue
			end
			if child.type == "HardBreak" then
				table.insert(List, child)
			else
				local Key1 = child.key or tostring(i)
				local Text = if Key then `{Key}.{Key1}` else Key1
				
				if child.type == "Span" then
					local Copy = table.clone(Tbl)
					table.insert(Copy, table.freeze({
						key = Text,
						definition = child.definition,
						props = child.props
					}))
					visit(child.children, Text, Copy)
				else
					local InheritPropsResult = inheritProps(child, Tbl)
					resolveLayoutProps(child.definition, InheritPropsResult, p3)
					table.insert(List, {
						type = "Leaf",
						key = Text,
						definition = child.definition,
						props = InheritPropsResult,
						spans = Tbl
					})
				end
			end
		end
	end
	
	visit(p2, nil, {})
	
	return List
end