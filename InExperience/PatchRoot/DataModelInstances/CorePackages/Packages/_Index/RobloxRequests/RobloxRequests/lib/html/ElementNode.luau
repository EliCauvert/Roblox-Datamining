local t = {}
t.mt = { __index = t }

function t.new(_, p1)
	-- upvalues: t (ref)
	local t_1 = {}
	local var1 = getmetatable(p1) == t.mt or nil
	
	if type(p1) == "table" then
		if var1 or #p1 <= 0 then
			for i in pairs(p1) do
				t_1[i] = true
			end
		else
			for i, v in ipairs(p1) do
				t_1[v] = true
			end
		end
	elseif p1 ~= nil then
		t_1 = { [p1] = true }
	end
	return setmetatable(t_1, t.mt)
end

function t.add(p2, p3)
	if p3 ~= nil then
		p2[p3] = true
	end
	return p2
end

function t.remove(p2, p3)
	if p3 ~= nil then
		p2[p3] = nil
	end
	return p2
end

function t.tolist(p2)
	local t = {}
	
	for i in pairs(p2) do
		table.insert(t, i)
	end
	return t
end

t.to_list = t.tolist

function t.mt:__add(p3)
	-- upvalues: t (ref)
	local var2 = t:new()
	local var3 = t:new(p3)
	
	for i in pairs(t:new(self)) do
		var2[i] = true
	end
	for i_1 in pairs(var3) do
		var2[i_1] = true
	end
	return var2
end

function t.mt:__sub(p4)
	-- upvalues: t (ref)
	local var4 = t:new()
	local var5 = t:new(p4)
	
	for i in pairs(t:new(self)) do
		var4[i] = true
	end
	for i_1 in pairs(var5) do
		var4[i_1] = nil
	end
	return var4
end

function t.mt:__mul(p5)
	-- upvalues: t (ref)
	local var6 = t:new()
	local var7 = t:new(p5)
	
	for i in pairs(t:new(self)) do
		var6[i] = var7[i]
	end
	return var6
end

function t.mt:__tostring()
	local var8 = "{"
	local var9 = ""
	
	for i in pairs(self) do
		var8 ..= var9 .. tostring(i)
		var9 = ", "
	end
	return var8 .. "}"
end

local t_1 = {}
t_1.mt = { __index = t_1 }

function t_1.new(_, p6, p7, p8, p9, p10, p11)
	-- upvalues: t (ref), t_1 (ref)
	local root = {
		level = 0,
		parent = nil,
		root = nil,
		id = nil,
		index = p6,
		name = p7,
		nodes = {},
		_openstart = p10,
		_openend = p11,
		_closestart = p10,
		_closeend = p11,
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
	
	if not p8 then
		root.name = "root"
		root.root = root
		root._text = p7
		local var10 = string.len(p7)
		root._openstart = 1
		root._openend = var10
		root._closestart = 1
		root._closeend = var10
	elseif p9 then
		root.root = p8.root
		root.parent = p8
		root.level = p8.level + 1
		table.insert(p8.nodes, root)
	else
		root.root = p8.root
		root.parent = p8.parent or p8
		root.level = p8.level
		table.insert(if p8.parent then p8.parent.nodes else p8.nodes, root)
	end
	return setmetatable(root, t_1.mt)
end

function t_1.text(p6)
	return string.sub(p6.root._text, p6._openstart, p6._closeend)
end

t_1.gettext = t_1.text

function t_1.settext(value, p6)
	value.root._text = p6
end

function t_1.textonly(p6)
	return p6:text():gsub("<[^>]*>", "")
end

function t_1.content(p6)
	return string.sub(p6.root._text, p6._openend + 1, p6._closestart - 1)
end

t_1.getcontent = t_1.content

function t_1.addattribute(p6, p7, p8)
	p6.attributes[p7] = p8
	
	if string.lower(p7) == "id" then
		p6.id = p8
		
		return
	elseif string.lower(p7) == "class" then
		for i in string.gmatch(p8, "%S+") do
			table.insert(p6.classes, i)
		end
	end
end

function t_1.links(p9)
	local t = {}
	
	for i, v in ipairs(p9:select("a[href]")) do
		if #v.attributes.href > 0 then
			table.insert(t, v.attributes.href)
		end
	end
	return t
end

function t_1.absolutelinks(value, p10)
	p10 = (p10 or (value.page_url or "")):split("?")[1]:split("#")[1]
	local var10 = p10:split("://")
	var10 = var10[#var10]:split("/")[1]
	local var11 = if p10:find("://") then p10:split("://")[1] else "http"
	while p10:sub(-1, -1) == "/" do
		p10 = p10:sub(1, -2)
	end
	local t = {}
	
	for i, v in ipairs(value:select("a[href]")) do
		if #v.attributes.href > 0 then
			local href = v.attributes.href
			
			if not href:find("://") then
				href = if href:sub(1, 2) == "//" then var11 .. ":" .. href elseif href:sub(1, 1) == "/" then var11 .. "://" .. var18 .. href else p10 .. "/" .. href
			end
			table.insert(t, href)
		end
	end
	return t
end

t_1.absolute_links = t_1.absolutelinks

local function _(p11, p12, p13)
	-- upvalues: t (ref)
	p11[p12] = p11[p12] or t:new()
	p11[p12]:add(p13)
end

function t_1.close(p11, p12, p13)
	-- upvalues: t (ref)
	if p12 and p13 then
		p11._closestart = p12
		p11._closeend = p13
	end
	local var12 = p11
	while true do
		var12 = var12.parent
		if not var12 then break end
		var12.deepernodes:add(p11)
		local deeperelements = var12.deeperelements
		local name = p11.name
		deeperelements[name] = deeperelements[name] or t:new()
		deeperelements[name]:add(p11)
		
		for i in pairs(p11.attributes) do
			local deeperattributes = var12.deeperattributes
			deeperattributes[i] = deeperattributes[i] or t:new()
			deeperattributes[i]:add(p11)
		end
		if p11.id then
			local deeperids = var12.deeperids
			local id = p11.id
			deeperids[id] = deeperids[id] or t:new()
			deeperids[id]:add(p11)
		end
		for i, v in ipairs(p11.classes) do
			local deeperclasses = var12.deeperclasses
			deeperclasses[v] = deeperclasses[v] or t:new()
			deeperclasses[v]:add(p11)
		end
	end
end

local function escape(p14)
	return string.gsub(p14, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
end

local function select(p14, p15)
	-- upvalues: t (ref), escape (ref)
	if not p15 or type(p15) ~= "string" or p15 == "" then
		return t:new()
	end
	local var13, var14
	local t_1 = {
		[""] = p14.deeperelements,
		["["] = p14.deeperattributes,
		["#"] = p14.deeperids,
		["."] = p14.deeperclasses
	}
	
	local function match(p16, p17)
		-- upvalues: t (copy), t_1 (ref), p14 (ref), escape (copy)
		local var15 = nil
		local var16 = nil
		local substring = nil
		
		if p16 == "[" then
			local match, match_1, match_2, match_3 = string.match(p17, "([^=|%*~%$!%^]+)([|%*~%$!%^]?)(=?)(.*)")
			p17 = match
			var15 = match_1
			var16 = match_2
			substring = match_3
		end
		local var17 = t:new(t_1[p16][p17])
		
		if var16 == "=" then
			if #substring < 2 then
				substring = "'" .. substring .. "'"
			end
			substring = string.sub(substring, 2, #substring - 1)
			
			if var15 == "!" then
				var17 = t:new(p14.deepernodes)
			end
			for i in pairs(var17) do
				local var18 = i.attributes[p17]
				
				if var15 == "" and var18 ~= substring then
					var17:remove(i)
				elseif var15 == "!" and var18 == substring then
					var17:remove(i)
				elseif var15 == "|" and string.match(var18, "^[^-]*") ~= substring then
					var17:remove(i)
				elseif var15 == "*" and string.match(var18, escape(substring)) ~= substring then
					var17:remove(i)
				elseif var15 == "~" then
					var17:remove(i)
					
					for i_1 in string.gmatch(var18, "%S+") do
						if i_1 == substring then
							var17:add(i)
							continue
						end
					end
				elseif var15 == "^" and string.match(var18, "^" .. string.gsub(substring, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")) ~= substring then
					var17:remove(i)
				elseif var15 == "$" and string.match(var18, string.gsub(substring, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1") .. "$") ~= substring then
					var17:remove(i)
				end
			end
		end
		return var17
	end
	
	local var19, var20, var21 = t:new({ p14 })
	
	for i in string.gmatch(p15, "%S+") do
		if i == ">" then
			var21 = true
			continue
		end
		local i_1
		var20 = t:new()
		
		for i_1 in pairs(var19) do
			var20 += if var21 then t:new(i_1.nodes) else i_1.deepernodes
		end
		var21 = false
		
		if i ~= "*" then
			var28, var29 = t:new()
			local var22 = 0
			i_1 = 0
			while true do
				local _ = nil
				local var23 = nil
				var14 = nil
				local _ = nil
				local _ = nil
				local matchIndex, matchIndex_1, matchIndex_2, matchIndex_3, matchIndex_4, matchIndex_5, matchIndex_6 = string.find(i, "(%(?%)?)([:%[#.]?)([%w-_\\]+)([|%*~%$!%^]?=?)(['\"]?)", i_1 + 1)
				var22 = matchIndex
				i_1 = matchIndex_1
				local var24 = matchIndex_2
				var23 = matchIndex_3
				var14 = matchIndex_4
				local var25 = matchIndex_5
				local var26 = matchIndex_6
				if not var14 then break end
				if var23 == ":" then
					var13 = var14
					continue
				end
				if var24 == ")" then
					var13 = nil
				end
				if var23 == "[" and var26 ~= "" then
					local _ = nil
					local matchIndex_7, matchIndex_8, matchIndex_9 = string.find(i, "(%b" .. var42 .. var42 .. ")]", i_1)
					var22 = matchIndex_7
					i_1 = matchIndex_8
					var14 ..= var25 .. matchIndex_9
				end
				local var27 = match(var23, var14)
				
				if var13 == "not" then
					var28 += var27
				else
					var20 *= var27
				end
			end
			var20 -= var28
			var19 = t:new(var20)
		end
	end
	local var28 = var20:tolist()
	table.sort(var28, function(p18, p19)
		return p18.index < p19.index
	end)
	
	return var28
end

function t_1.select(p18, p19)
	-- upvalues: select (ref)
	return select(p18, p19)
end

t_1.mt.__call = select

return t_1