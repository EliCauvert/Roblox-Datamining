local t = {}
t.mt = { __index = t }

function t.new(_, p0)
	-- upvalues: t (ref)
	local t_1 = {}
	local var5 = getmetatable(p0) == t.mt or nil
	
	if type(p0) == "table" then
		if var5 or #p0 <= 0 then
			for i in pairs(p0) do
				t_1[i] = true
			end
		else
			for i, v in ipairs(p0) do
				t_1[v] = true
			end
		end
	elseif p0 ~= nil then
		t_1 = { [p0] = true }
	end
	return setmetatable(t_1, t.mt)
end

function t.add(p1, p2)
	if p2 ~= nil then
		p1[p2] = true
	end
	return p1
end

function t.remove(p3, p4)
	if p4 ~= nil then
		p3[p4] = nil
	end
	return p3
end

function t.tolist(p5)
	local t = {}
	
	for i in pairs(p5) do
		table.insert(t, i)
	end
	return t
end

t.to_list = t.tolist

function t.mt:__add(p6)
	-- upvalues: t (ref)
	local var7 = t:new()
	local var8 = t:new(p6)
	
	for i in pairs(t:new(self)) do
		var7[i] = true
	end
	for i_1 in pairs(var8) do
		var7[i_1] = true
	end
	return var7
end

function t.mt:__sub(p7)
	-- upvalues: t (ref)
	local var9 = t:new()
	local var10 = t:new(p7)
	
	for i in pairs(t:new(self)) do
		var9[i] = true
	end
	for i_1 in pairs(var10) do
		var9[i_1] = nil
	end
	return var9
end

function t.mt:__mul(p8)
	-- upvalues: t (ref)
	local var11 = t:new()
	local var12 = t:new(p8)
	
	for i in pairs(t:new(self)) do
		var11[i] = var12[i]
	end
	return var11
end

function t.mt:__tostring()
	local var13 = "{"
	local var14 = ""
	
	for i in pairs(self) do
		var13 ..= var14 .. tostring(i)
		var14 = ", "
	end
	return var13 .. "}"
end

local t_1 = {}
t_1.mt = { __index = t_1 }

function t_1.new(_, p9, p10, p11, p12, p13, p14)
	-- upvalues: t (ref), t_1 (ref)
	local root = {
		level = 0,
		parent = nil,
		root = nil,
		id = nil,
		index = p9,
		name = p10,
		nodes = {},
		_openstart = p13,
		_openend = p14,
		_closestart = p13,
		_closeend = p14,
		attributes = {},
		classes = {},
		deepernodes = t:new(),
		deeperelements = {},
		deeperattributes = {},
		deeperids = {},
		deeperclasses = {}
	}
	root.attrs = root.attributes
	root.children = root.nodes
	root.descendants = root.deepernodes
	root.descendant_elements = root.deeperelements
	root.descendant_attrs = root.deeperattributes
	root.descendent_ids = root.deeperids
	root.descendant_classes = root.deeperclasses
	
	if not p11 then
		root.name = "root"
		root.root = root
		root._text = p10
		local var16 = string.len(p10)
		root._openstart = 1
		root._openend = var16
		root._closestart = 1
		root._closeend = var16
	elseif p12 then
		root.root = p11.root
		root.parent = p11
		root.level = p11.level + 1
		table.insert(p11.nodes, root)
	else
		root.root = p11.root
		root.parent = p11.parent or p11
		root.level = p11.level
		table.insert(if p11.parent then p11.parent.nodes else p11.nodes, root)
	end
	return setmetatable(root, t_1.mt)
end

function t_1.text(p15)
	return string.sub(p15.root._text, p15._openstart, p15._closeend)
end

t_1.gettext = t_1.text

function t_1.settext(value, p16)
	value.root._text = p16
end

function t_1.textonly(p17)
	return p17:text():gsub("<[^>]*>", "")
end

function t_1.content(p18)
	return string.sub(p18.root._text, p18._openend + 1, p18._closestart - 1)
end

t_1.getcontent = t_1.content

function t_1.addattribute(p19, p20, p21)
	p19.attributes[p20] = p21
	
	if string.lower(p20) == "id" then
		p19.id = p21
		
		return
	elseif string.lower(p20) == "class" then
		for i in string.gmatch(p21, "%S+") do
			table.insert(p19.classes, i)
		end
	end
end

function t_1.links(p22)
	local t = {}
	
	for i, v in ipairs(p22:select("a[href]")) do
		if #v.attributes.href > 0 then
			table.insert(t, v.attributes.href)
		end
	end
	return t
end

function t_1.absolutelinks(value, p23)
	p23 = (p23 or (value.page_url or "")):split("?")[1]:split("#")[1]
	local var18 = p23:split("://")
	var18 = var18[#var18]:split("/")[1]
	local var19 = if p23:find("://") then p23:split("://")[1] else "http"
	while p23:sub(-1, -1) == "/" do
		p23 = p23:sub(1, -2)
	end
	local t = {}
	
	for i, v in ipairs(value:select("a[href]")) do
		if #v.attributes.href > 0 then
			local href = v.attributes.href
			
			if not href:find("://") then
				href = if href:sub(1, 2) == "//" then var19 .. ":" .. href elseif href:sub(1, 1) == "/" then var19 .. "://" .. var18 .. href else p23 .. "/" .. href
			end
			table.insert(t, href)
		end
	end
	return t
end

t_1.absolute_links = t_1.absolutelinks

local function _(p24, p25, p26)
	-- upvalues: t (ref)
	p24[p25] = p24[p25] or t:new()
	p24[p25]:add(p26)
end

function t_1.close(p27, p28, p29)
	-- upvalues: t (ref)
	if p28 and p29 then
		p27._closestart = p28
		p27._closeend = p29
	end
	local var21 = p27
	while true do
		var21 = var21.parent
		if not var21 then break end
		var21.deepernodes:add(p27)
		local deeperelements = var21.deeperelements
		local name = p27.name
		deeperelements[name] = deeperelements[name] or t:new()
		deeperelements[name]:add(p27)
		
		for i in pairs(p27.attributes) do
			local deeperattributes = var21.deeperattributes
			deeperattributes[i] = deeperattributes[i] or t:new()
			deeperattributes[i]:add(p27)
		end
		if p27.id then
			local deeperids = var21.deeperids
			local id = p27.id
			deeperids[id] = deeperids[id] or t:new()
			deeperids[id]:add(p27)
		end
		for i, v in ipairs(p27.classes) do
			local deeperclasses = var21.deeperclasses
			deeperclasses[v] = deeperclasses[v] or t:new()
			deeperclasses[v]:add(p27)
		end
	end
end

local function escape(p30)
	return string.gsub(p30, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
end

local function select(p31, p32)
	-- upvalues: t (ref), escape (ref)
	if not p32 or type(p32) ~= "string" or p32 == "" then
		return t:new()
	end
	local var29, var32
	local t_1 = {
		[""] = p31.deeperelements,
		["["] = p31.deeperattributes,
		["#"] = p31.deeperids,
		["."] = p31.deeperclasses
	}
	
	local function match(p33, p34)
		-- upvalues: t (copy), t_1 (ref), p31 (ref), escape (copy)
		local var47 = nil
		local var48 = nil
		local substring = nil
		
		if p33 == "[" then
			local match, match_1, match_2, match_3 = string.match(p34, "([^=|%*~%$!%^]+)([|%*~%$!%^]?)(=?)(.*)")
			p34 = match
			var47 = match_1
			var48 = match_2
			substring = match_3
		end
		local var54 = t:new(t_1[p33][p34])
		
		if var48 == "=" then
			if #substring < 2 then
				substring = "'" .. substring .. "'"
			end
			substring = string.sub(substring, 2, #substring - 1)
			
			if var47 == "!" then
				var54 = t:new(p31.deepernodes)
			end
			for i in pairs(var54) do
				local var55 = i.attributes[p34]
				
				if var47 == "" and var55 ~= substring then
					var54:remove(i)
				elseif var47 == "!" and var55 == substring then
					var54:remove(i)
				elseif var47 == "|" and string.match(var55, "^[^-]*") ~= substring then
					var54:remove(i)
				elseif var47 == "*" and string.match(var55, escape(substring)) ~= substring then
					var54:remove(i)
				elseif var47 == "~" then
					var54:remove(i)
					
					for i_1 in string.gmatch(var55, "%S+") do
						if i_1 == substring then
							var54:add(i)
							continue
						end
					end
				elseif var47 == "^" and string.match(var55, "^" .. string.gsub(substring, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")) ~= substring then
					var54:remove(i)
				elseif var47 == "$" and string.match(var55, string.gsub(substring, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1") .. "$") ~= substring then
					var54:remove(i)
				end
			end
		end
		return var54
	end
	
	local var24, var25, var26 = t:new({ p31 })
	
	for i in string.gmatch(p32, "%S+") do
		if i == ">" then
			var26 = true
			continue
		end
		local i_1
		var25 = t:new()
		
		for i_1 in pairs(var24) do
			var25 += if var26 then t:new(i_1.nodes) else i_1.deepernodes
		end
		var26 = false
		
		if i ~= "*" then
			var28, var29 = t:new()
			local var30 = 0
			i_1 = 0
			while true do
				local _ = nil
				local var31 = nil
				var32 = nil
				local _ = nil
				local _ = nil
				local matchIndex, matchIndex_1, matchIndex_2, matchIndex_3, matchIndex_4, matchIndex_5, matchIndex_6 = string.find(i, "(%(?%)?)([:%[#.]?)([%w-_\\]+)([|%*~%$!%^]?=?)(['\"]?)", i_1 + 1)
				var30 = matchIndex
				i_1 = matchIndex_1
				local var40 = matchIndex_2
				var31 = matchIndex_3
				var32 = matchIndex_4
				local var41 = matchIndex_5
				local var42 = matchIndex_6
				if not var32 then break end
				if var31 == ":" then
					var29 = var32
					continue
				end
				if var40 == ")" then
					var29 = nil
				end
				if var31 == "[" and var42 ~= "" then
					local _ = nil
					local matchIndex_7, matchIndex_8, matchIndex_9 = string.find(i, "(%b" .. var42 .. var42 .. ")]", i_1)
					var30 = matchIndex_7
					i_1 = matchIndex_8
					var32 ..= var41 .. matchIndex_9
				end
				local var46 = match(var31, var32)
				
				if var29 == "not" then
					var28 += var46
				else
					var25 *= var46
				end
			end
			var25 -= var28
			var24 = t:new(var25)
		end
	end
	local var27 = var25:tolist()
	table.sort(var27, function(p35, p36)
		return p35.index < p36.index
	end)
	
	return var27
end

function t_1.select(p37, p38)
	-- upvalues: select (ref)
	return select(p37, p38)
end

t_1.mt.__call = select

return t_1