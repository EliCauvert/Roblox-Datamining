local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local ReactiveModule = require(RecycledInlineLayout.Utils.Reactive)
local _ = require(RecycledInlineLayout.Types)
local self = setmetatable({}, { __mode = "k" })

local function styleNames(Definition)
	-- upvalues: self (copy)
	local SelfEntry = self[Definition]
	
	if SelfEntry == nil then
		SelfEntry = {}
		
		for i, prop in Definition.props do
			if prop.layout == "none" and prop.delivery == "binding" then
				table.insert(SelfEntry, i)
			end
		end
		table.sort(SelfEntry)
		self[Definition] = SelfEntry
	end
	return SelfEntry
end

local function runKind(p1)
	-- upvalues: styleNames (copy), ReactiveModule (copy)
	local v1 = nil
	
	for _, value in styleNames(p1.leaf.definition) do
		local KindOfResult = ReactiveModule.kindOf(p1.props[value])
		
		if KindOfResult ~= nil then
			if v1 ~= nil and v1 ~= KindOfResult then
				return false
			end
			v1 = KindOfResult
		end
	end
	return v1
end

local function canJoin(p2, p3, Merge, LabelKeyResult, p4)
	-- upvalues: runKind (copy)
	if p3.leaf.definition ~= p2.leaf.definition or p3.props.testId ~= nil or not Merge.canMerge(p3.props) then
		return false, p4
	elseif Merge.labelKey(p3.props) ~= LabelKeyResult then
		return false, p4
	else
		local RunKindResult = runKind(p3)
		
		if RunKindResult == false then
			return false, p4
		elseif p4 ~= nil and RunKindResult ~= nil and RunKindResult ~= p4 then
			return false, p4
		else
			local v2 = true
			
			if p4 == nil then
				return v2, RunKindResult
			else
				return v2, p4
			end
		end
	end
end

local function allShare(Entry, SharedOnly): boolean
	-- upvalues: ReactiveModule (copy)
	local Props = Entry[1].leaf.definition.props
	
	for _, value in SharedOnly do
		local Prop = Entry[1].props[value]
		
		for i = 2, #Entry do
			local Prop1 = Entry[i].props[value]
			
			if ReactiveModule.kindOf(Prop) == nil and ReactiveModule.kindOf(Prop1) == nil then
				if not Props[value].equals(Prop, Prop1) then
					return false
				end
			elseif not rawequal(Prop, Prop1) then
				return false
			end
		end
	end
	return true
end

local function _(Tbl, List)
	-- upvalues: ReactiveModule (copy)
	local Copy = table.clone(Tbl)
	
	for _, value in List do
		Copy[value] = ReactiveModule.peek(Copy[value])
	end
	return Copy
end

local function combine(Entry, Merge, p2, p3)
	-- upvalues: styleNames (copy), ReactiveModule (copy), allShare (copy)
	local Entry1 = Entry[1]
	local StyleNamesResult = styleNames(Entry1.leaf.definition)
	local Buffer = table.create(#Entry)
	local NewX = 0
	local Y = 0
	
	for i, value in Entry do
		local Copy = table.clone(value.props)
		
		for _, value1 in StyleNamesResult do
			Copy[value1] = ReactiveModule.peek(Copy[value1])
		end
		Buffer[i] = Copy
		NewX += value.size.X
		Y = math.max(Y, value.size.Y)
	end
	local BaseResult = Merge.base(Buffer)
	local SharedOnly = Merge.sharedOnly
	local t = {}
	
	if SharedOnly ~= nil then
		local AllShareResult = allShare(Entry, SharedOnly)
		
		for _, value2 in SharedOnly do
			if AllShareResult then
				t[value2] = true
			else
				BaseResult[value2] = nil
			end
		end
	end
	local Copy = table.clone(BaseResult)
	local t1 = {}
	local Props = {}
	local Flag = nil
	
	for _, value3 in StyleNamesResult do
		local Prop = Entry1.props[value3]
		Flag = true
		
		for i1 = 2, #Entry do
			if rawequal(Entry[i1].props[value3], Prop) then
				continue
			end
			Flag = false
			break
		end
		if t[value3] then
			Flag = true
		elseif SharedOnly ~= nil and table.find(SharedOnly, value3) ~= nil then
			Flag = false
		end
		if not Flag or ReactiveModule.kindOf(Prop) ~= nil and Merge.label.props[value3] == nil then
			for i2, value4 in Entry do
				local Prop1 = value4.props[value3]
				
				if ReactiveModule.kindOf(Prop1) ~= nil then
					t1[i2] = t1[i2] or {}
					t1[i2][value3] = true
					Props[`{i2}.{value3}`] = Prop1
				end
			end
		elseif ReactiveModule.kindOf(Prop) ~= nil then
			Copy[value3] = Prop
		end
	end
	local function build(p4): string
		-- upvalues: Entry (copy), Buffer (copy), t1 (copy), Merge (copy), BaseResult (copy)
		local Buffer1 = table.create(#Entry)
		
		for i, value in Buffer do
			local v2 = value
			
			if p4 ~= nil and t1[i] ~= nil then
				v2 = table.clone(value)
				
				for i1 in t1[i] do
					v2[i1] = p4[`{i}.{i1}`]
				end
			end
			Buffer1[i] = Merge.markup(v2, BaseResult)
		end
		return table.concat(Buffer1)
	end
	
	local Copy1 = table.clone(BaseResult)
	local Buffer1 = table.create(#Entry)
	
	for i3, value5 in Buffer do
		Buffer1[i3] = Merge.markup(value5, BaseResult)
	end
	Copy1.Markup = table.concat(Buffer1)
	local MeasureResult = Merge.label.measure(Copy1, p2)
	Copy.Markup = if next(Props) == nil then Copy1.Markup else ReactiveModule.combine(p3, Props, build)
	
	return {
		leaf = {
			type = "Leaf",
			key = `{Entry1.leaf.key}~merged`,
			definition = Merge.label,
			props = Copy,
			spans = {}
		},
		props = Copy,
		size = Vector2.new(math.max(NewX, MeasureResult.X), Y),
		index = Entry1.index,
		members = Entry,
		membersWidth = NewX
	}
end

return function(p5, p6)
	-- upvalues: runKind (copy), canJoin (copy), combine (copy)
	local List = {}
	local v3 = 1
	while v3 <= #p5 do
		local v4 = p5[v3]
		local Merge = v4.leaf.definition.merge
		local Count: number = v3
		local v5 = nil
		local RunKindResult = Merge ~= nil and runKind(v4)
		
		if Merge ~= nil and RunKindResult ~= false and v4.props.testId == nil and Merge.canMerge(v4.props) then
			v5 = RunKindResult
			local LabelKeyResult = Merge.labelKey(v4.props)
			while Count < #p5 do
				local CanJoin, CanJoin2 = canJoin(v4, p5[Count + 1], Merge, LabelKeyResult, v5)
				
				if not CanJoin then break end
				v5 = CanJoin2
				Count += 1
			end
		end
		if v3 < Count then
			table.insert(List, (combine(table.move(p5, v3, Count, 1, {}), Merge, p6, v5)))
		else
			table.insert(List, v4)
		end
		v3 = Count + 1
	end
	return List
end