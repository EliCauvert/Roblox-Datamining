local t = {}
t.mt = { __index = t }

function t:new(List)
	-- upvalues: t (copy)
	local t1 = {}
	local IsMetaMatch = getmetatable(List) == t.mt or nil
	
	if type(List) == "table" then
		if IsMetaMatch or #List <= 0 then
			for i in pairs(List) do
				t1[i] = true
			end
		else
			for _, value in ipairs(List) do
				t1[value] = true
			end
		end
	elseif List ~= nil then
		t1 = { [List] = true }
	end
	return (setmetatable(t1, t.mt))
end

function t.add(p1, Key)
	if Key ~= nil then
		p1[Key] = true
	end
	return p1
end

function t.remove(p1, Key)
	if Key ~= nil then
		p1[Key] = nil
	end
	return p1
end

function t.tolist(List)
	local List1 = {}
	
	for i in pairs(List) do
		table.insert(List1, i)
	end
	return List1
end

t.to_list = t.tolist

function t.mt.__add(p1, p2)
	-- upvalues: t (copy)
	local NewResult = t:new()
	local NewResult1 = t:new(p2)
	
	for i in pairs((t:new(p1))) do
		NewResult[i] = true
	end
	for i1 in pairs(NewResult1) do
		NewResult[i1] = true
	end
	return NewResult
end

function t.mt.__sub(p3, p4)
	-- upvalues: t (copy)
	local NewResult = t:new()
	local NewResult1 = t:new(p4)
	
	for i in pairs((t:new(p3))) do
		NewResult[i] = true
	end
	for i1 in pairs(NewResult1) do
		NewResult[i1] = nil
	end
	return NewResult
end

function t.mt.__mul(p5, p6)
	-- upvalues: t (copy)
	local NewResult = t:new()
	local NewResult1 = t:new(p6)
	
	for i in pairs((t:new(p5))) do
		NewResult[i] = NewResult1[i]
	end
	return NewResult
end

function t.mt.__tostring(List): string
	local Text = "{"
	local v1 = ""
	
	for i in pairs(List) do
		Text ..= v1 .. tostring(i)
		v1 = ", "
	end
	return Text .. "}"
end

local ElementNodeModule = {}
ElementNodeModule.mt = { __index = ElementNodeModule }

function ElementNodeModule:new(Index, Text: string, Parent, p7, _closestart, _closeend)
	-- upvalues: t (copy), ElementNodeModule (copy)
	local config = {
		level = 0,
		parent = nil,
		root = nil,
		id = nil,
		index = Index,
		name = Text,
		nodes = {},
		_openstart = _closestart,
		_openend = _closeend,
		_closestart = _closestart,
		_closeend = _closeend,
		attributes = {},
		classes = {},
		deepernodes = t:new(),
		deeperelements = {},
		deeperattributes = {},
		deeperids = {},
		deeperclasses = {}
	}
	config.attrs = config.attributes
	config.children = config.nodes
	config.descendants = config.deepernodes
	config.descendant_elements = config.deeperelements
	config.descendant_attrs = config.deeperattributes
	config.descendent_ids = config.deeperids
	config.descendant_classes = config.deeperclasses
	
	if Parent then
		if p7 then
			config.root = Parent.root
			config.parent = Parent
			config.level = Parent.level + 1
			table.insert(Parent.nodes, config)
		else
			config.root = Parent.root
			config.parent = Parent.parent or Parent
			config.level = Parent.level
			table.insert(Parent.parent and Parent.parent.nodes or Parent.nodes, config)
		end
	else
		config.name = "root"
		config.root = config
		config._text = Text
		local Length = string.len(Text)
		config._openstart = 1
		config._openend = Length
		config._closestart = 1
		config._closeend = Length
	end
	return (setmetatable(config, ElementNodeModule.mt))
end

function ElementNodeModule.text(p7): string
	return (string.sub(p7.root._text, p7._openstart, p7._closeend))
end

ElementNodeModule.gettext = ElementNodeModule.text

function ElementNodeModule.settext(p7, _text)
	p7.root._text = _text
end

function ElementNodeModule.textonly(p7)
	return (p7:text():gsub("<[^>]*>", ""))
end

function ElementNodeModule.content(p7): string
	return (string.sub(p7.root._text, p7._openend + 1, p7._closestart - 1))
end

ElementNodeModule.getcontent = ElementNodeModule.content

function ElementNodeModule.addattribute(p7, Text: string, Text1: string)
	p7.attributes[Text] = Text1
	
	if string.lower(Text) == "id" then
		p7.id = Text1
		
		return
	end
	if string.lower(Text) == "class" then
		for i in string.gmatch(Text1, "%S+") do
			table.insert(p7.classes, i)
		end
	end
end

function ElementNodeModule.links(p8)
	local Hrefs = {}
	
	for _, value in ipairs(p8:select("a[href]")) do
		if #value.attributes.href > 0 then
			table.insert(Hrefs, value.attributes.href)
		end
	end
	return Hrefs
end

function ElementNodeModule.absolutelinks(p9, p10)
	local Text = (p10 or (p9.page_url or "")):split("?")[1]:split("#")[1]
	local Parts = Text:split("://")
	local Part = Parts[#Parts]:split("/")[1]
	local Part1 = Text:find("://") and Text:split("://")[1] or "http"
	while Text:sub(-1, -1) == "/" do
		Text = Text:sub(1, -2)
	end
	local Hrefs = {}
	
	for _, value in ipairs(p9:select("a[href]")) do
		if #value.attributes.href > 0 then
			local Href = value.attributes.href
			
			if not Href:find("://") then
				if Href:sub(1, 2) == "//" then
					Href = Part1 .. ":" .. Href
				elseif Href:sub(1, 1) == "/" then
					Href = Part1 .. "://" .. Part .. Href
				else
					Href = Text .. "/" .. Href
				end
			end
			table.insert(Hrefs, Href)
		end
	end
	return Hrefs
end

ElementNodeModule.absolute_links = ElementNodeModule.absolutelinks

local function _(p11, Key, p12)
	-- upvalues: t (copy)
	p11[Key] = p11[Key] or t:new()
	p11[Key]:add(p12)
end

function ElementNodeModule.close(Parent, _closestart, _closeend)
	-- upvalues: t (copy)
	if _closestart and _closeend then
		Parent._closestart = _closestart
		Parent._closeend = _closeend
	end
	local Parent1 = Parent
	while true do
		Parent1 = Parent1.parent
		if not Parent1 then break end
		Parent1.deepernodes:add(Parent)
		local Deeperelements = Parent1.deeperelements
		local Name = Parent.name
		Deeperelements[Name] = Deeperelements[Name] or t:new()
		Deeperelements[Name]:add(Parent)
		
		for attribute in pairs(Parent.attributes) do
			local Deeperattributes = Parent1.deeperattributes
			Deeperattributes[attribute] = Deeperattributes[attribute] or t:new()
			Deeperattributes[attribute]:add(Parent)
		end
		if Parent.id then
			local Deeperids = Parent1.deeperids
			local Id = Parent.id
			Deeperids[Id] = Deeperids[Id] or t:new()
			Deeperids[Id]:add(Parent)
		end
		for _, class in ipairs(Parent.classes) do
			local Deeperclasses = Parent1.deeperclasses
			Deeperclasses[class] = Deeperclasses[class] or t:new()
			Deeperclasses[class]:add(Parent)
		end
	end
end

local function escape(Text: string): string
	return string.gsub(Text, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
end

local function _select(p11, Text: string)
	-- upvalues: t (copy), escape (copy)
	if not Text or type(Text) ~= "string" or Text == "" then
		return t:new()
	end
	local config = {
		[""] = p11.deeperelements,
		["["] = p11.deeperattributes,
		["#"] = p11.deeperids,
		["."] = p11.deeperclasses
	}
	
	local function match(p12, Text: string)
		-- upvalues: t (upval), config (copy), p11 (copy), escape (upval)
		local v2 = nil
		local v3 = nil
		local Text1: string? = nil
		
		if p12 == "[" then
			Text, v2, v3, Text1 = string.match(Text, "([^=|%*~%$!%^]+)([|%*~%$!%^]?)(=?)(.*)")
		end
		local NewResult = t:new(config[p12][Text])
		
		if v3 == "=" then
			if #Text1 < 2 then
				Text1 = "'" .. Text1 .. "'"
			end
			local Segment = string.sub(Text1, 2, #Text1 - 1)
			
			if v2 == "!" then
				NewResult = t:new(p11.deepernodes)
			end
			for i in pairs(NewResult) do
				local Attribute: string = i.attributes[Text]
				
				if v2 == "" and Attribute ~= Segment then
					NewResult:remove(i)
				elseif v2 == "!" and Attribute == Segment then
					NewResult:remove(i)
				elseif v2 == "|" and string.match(Attribute, "^[^-]*") ~= Segment then
					NewResult:remove(i)
				elseif v2 == "*" and string.match(Attribute, escape(Segment)) ~= Segment then
					NewResult:remove(i)
				elseif v2 == "~" then
					NewResult:remove(i)
					
					for i1 in string.gmatch(Attribute, "%S+") do
						if i1 == Segment then
							NewResult:add(i)
							break
						end
					end
				elseif v2 == "^" and string.match(Attribute, "^" .. string.gsub(Segment, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")) ~= Segment then
					NewResult:remove(i)
				elseif v2 == "$" and string.match(Attribute, string.gsub(Segment, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1") .. "$") ~= Segment then
					NewResult:remove(i)
				end
			end
		end
		return NewResult
	end
	
	local NewResult, NewResult2, NewResult3 = t:new({ p11 })
	
	for Text1 in string.gmatch(Text, "%S+") do
		if Text1 == ">" then
			NewResult3 = true
			continue
		end
		NewResult2 = t:new()
		
		for i in pairs(NewResult) do
			NewResult2 += if NewResult3 then t:new(i.nodes) else i.deepernodes
		end
		NewResult3 = false
		
		if Text1 ~= "*" then
			local NewResult1, NewResult2_1 = t:new()
			local Init = 0
			while true do
				local _, FoundAt3_1, FoundAt4, Text2, FoundAt6, FoundAt7
				_, Init, FoundAt3_1, FoundAt4, Text2, FoundAt6, FoundAt7 = string.find(Text1, "(%(?%)?)([:%[#.]?)([%w-_\\]+)([|%*~%$!%^]?=?)(['\"]?)", Init + 1)
				if not Text2 then break end
				if FoundAt4 == ":" then
					NewResult2_1 = Text2
					continue
				else
					if FoundAt3_1 == ")" then
						NewResult2_1 = nil
					end
					if FoundAt4 == "[" and FoundAt7 ~= "" then
						local _, FoundAt3
						_, Init, FoundAt3 = string.find(Text1, "(%b" .. FoundAt7 .. FoundAt7 .. ")]", Init)
						Text2 ..= FoundAt6 .. FoundAt3
					end
					local MatchResult = match(FoundAt4, Text2)
					
					if NewResult2_1 == "not" then
						NewResult1 += MatchResult
					else
						NewResult2 *= MatchResult
					end
				end
			end
			NewResult2 -= NewResult1
			NewResult = t:new(NewResult2)
		end
	end
	local List = NewResult2:tolist()
	table.sort(List, function(A, B): boolean
		return A.index < B.index
	end)
	
	return List
end

function ElementNodeModule.select(p13, p14)
	-- upvalues: _select (copy)
	return _select(p13, p14)
end

ElementNodeModule.mt.__call = _select

return ElementNodeModule