local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local _ = require(RecycledInlineLayout.Types)
local _ = require(RecycledInlineLayout.Layout.flatten)

local function sameSpans(Spans, Spans1): boolean
	if #Spans ~= #Spans1 then
		return false
	end
	for i, span in Spans do
		local Span = Spans1[i]
		
		if span.key ~= Span.key or span.definition ~= Span.definition then
			return false
		end
	end
	return true
end

local function leafNeedsRelayout(p1, p2): boolean
	-- upvalues: sameSpans (copy)
	if p1.key ~= p2.key or p1.definition ~= p2.definition or not sameSpans(p1.spans, p2.spans) then
		return true
	end
	for i, prop in p2.definition.props do
		if prop.layout ~= "none" and not prop.equals(p1.props[i], p2.props[i]) then
			return true
		end
	end
	return false
end

local function needsRelayout(p3, List): boolean
	-- upvalues: leafNeedsRelayout (copy)
	if #p3 ~= #List then
		return true
	end
	for i, value in List do
		local v1 = p3[i]
		
		if value.type ~= v1.type then
			return true
		elseif value.type == "Leaf" and leafNeedsRelayout(v1, value) then
			return true
		end
	end
	return false
end

local function propsMatch(Props, Props1, Props2): boolean
	for i, prop in Props do
		if prop.delivery == "callback" then
			if Props1[i] == nil ~= (Props2[i] == nil) then
				return false
			end
		elseif not prop.equals(Props1[i], Props2[i]) then
			return false
		end
	end
	return true
end

return {
	needsRelayout = needsRelayout,
	sameContent = function(p4, List): boolean
		-- upvalues: needsRelayout (copy), propsMatch (copy)
		if needsRelayout(p4, List) then
			return false
		end
		for i, value in List do
			if value.type == "Leaf" then
				local v2 = p4[i]
				
				if not propsMatch(value.definition.props, v2.props, value.props) then
					return false
				end
				for i1, span in value.spans do
					local Span = v2.spans[i1]
					
					if Span.props ~= span.props and not propsMatch(span.definition.props, Span.props, span.props) then
						return false
					end
				end
			end
		end
		return true
	end,
	rebind = function(p5, List)
		local t = {}
		local t1 = {}
		
		for _, value in List do
			if value.type == "Leaf" then
				t[value.key] = value
				
				for _, span in value.spans do
					t1[span.key] = span
				end
			end
		end
		local Buffer = table.create(#p5.fragments)
		
		for i, fragment in p5.fragments do
			local Entry = t[fragment.leafKey]
			assert(Entry ~= nil, `Reconcile.rebind: no Leaf for Fragment {fragment.key}; a merged layout can't be rebound`)
			local Copy = table.clone(Entry.props)
			
			for i1, prop in Entry.definition.props do
				if prop.layout == "split" then
					Copy[i1] = fragment.props[i1]
				end
			end
			local Copy1 = table.clone(fragment)
			Copy1.props = Copy
			Copy1.spans = Entry.spans
			Buffer[i] = Copy1
		end
		local Buffer1 = table.create(#p5.decorations)
		
		for i2, decoration in p5.decorations do
			local Copy = table.clone(decoration)
			Copy.span = t1[decoration.span.key]
			Buffer1[i2] = Copy
		end
		return {
			fragments = Buffer,
			decorations = Buffer1,
			height = p5.height,
			contentWidth = p5.contentWidth,
			wrapped = p5.wrapped,
			naturalWidth = p5.naturalWidth
		}
	end
}