local unpackContentModule = require(script.Parent.Parent.ContentKinds.unpackContent)
local _ = require(script.Parent.projectMessageEnvelope)

local function _(p1, p2)
	local author = p1.author
	local author_1 = p2.author
	
	return if author == nil or author_1 == nil then false else author.userId == author_1.userId
end

local _ = function(p1, p2, p3, p4, p5)
	if p5 ~= nil and p5 <= p2.sentAtUnixMilliseconds - p1.sentAtUnixMilliseconds then
		return "time"
	end
	local author = p1.author
	local author_1 = p2.author
	
	return if if author == nil or author_1 == nil then false else author.userId == author_1.userId then if p4 == nil or p4 > p3 then nil else "count" else "sender"
end

local _ = function(p1)
	-- upvalues: unpackContentModule (ref)
	local contents = p1.contents
	
	if type(contents) ~= "table" then
		return false
	end
	for i, v in contents do
		if unpackContentModule(v) ~= nil then
			return true
		end
	end
	return false
end

local function orderedMessages(p2)
	-- upvalues: unpackContentModule (ref)
	local t = {}
	
	for i, v in p2 do
		if type(v) == "table" then
			local var1
			local contents = v.contents
			
			if type(contents) == "table" then
				for i_1, v_1 in contents do
					if unpackContentModule(v_1) ~= nil then
						var1 = true
					end
				end
				var1 = false
			else
				var1 = false
			end
			if var1 then
				table.insert(t, v)
			end
		end
	end
	table.sort(t, function(p3, p4)
		return if p3.sentAtUnixMilliseconds == p4.sentAtUnixMilliseconds then p3.id < p4.id else p3.sentAtUnixMilliseconds < p4.sentAtUnixMilliseconds
	end)
	
	return t
end

local _ = function(p3)
	local t = {}
	
	if p3 == nil then
		return t
	end
	for i, v in p3 do
		t[v.id] = v
	end
	return t
end

local function messageRow(p4, p5, p6, p7)
	local id = p4[p5.id]
	
	return if id == nil or id.kind ~= "message" or (id.message ~= p5 or id.groupPosition.isFirst ~= p6) or id.groupPosition.isLast ~= p7 then {
		kind = "message",
		id = p5.id,
		message = p5,
		groupPosition = { isFirst = p6, isLast = p7 }
	} else id
end

local function timestampRow(p4, p5, p6)
	local id = `timestamp:{p5.id}`
	local var2 = if p6 ~= nil then nil else p6.sentAtUnixMilliseconds
	local var3 = p4[id]
	
	return if var3 == nil or var3.kind ~= "timestamp" or (var3.displayUnixMilliseconds ~= p5.sentAtUnixMilliseconds or var3.referenceUnixMilliseconds ~= var2) then {
		kind = "timestamp",
		id = id,
		displayUnixMilliseconds = p5.sentAtUnixMilliseconds,
		referenceUnixMilliseconds = var2
	} else var3
end

local _ = function(p4, p5)
	if p4 == nil or #p4 ~= #p5 then
		return p5
	end
	for i, v in p5 do
		if p4[i] ~= v then
			return p5
		end
	end
	return p4
end

return {
	groupMessages = function(p6, p7, p8, p9)
		-- upvalues: orderedMessages (ref), messageRow (ref), timestampRow (ref)
		local var2
		local var3 = orderedMessages(p6)
		local t = {}
		
		if p9 == nil then
			var2 = t
		else
			for i, v in p9 do
				t[v.id] = v
			end
			var2 = t
		end
		local var4
		local t_1 = {}
		local var5 = 1
		
		local function appendGroup(p10)
			-- upvalues: var5 (write), var3 (ref), t_1 (ref), messageRow (copy), var2 (ref)
			local var6 = p10 - var5 + 1
			
			for i = 0, var6 - 1 do
				table.insert(t_1, messageRow(var2, var3[var5 + i], i == 0, i == var6 - 1))
			end
		end
		
		local function _(p11, p12)
			-- upvalues: t_1 (ref), timestampRow (copy), var2 (ref)
			table.insert(t_1, timestampRow(var2, p11, p12))
		end
		
		for i = 2, #var3 do
			local var7
			local var8 = i - var5
			var4 = var3[i - 1]
			local var9 = var3[i]
			
			if p8 ~= nil and p8 <= var9.sentAtUnixMilliseconds - var4.sentAtUnixMilliseconds then
				var7 = "time"
				if var7 ~= nil then
					appendGroup(i - 1)
					
					if var7 == "time" then
						table.insert(t_1, timestampRow(var2, var3[i], var3[i - 1]))
					end
					var5 = i
				end
			end
			local author = var4.author
			local author_1 = var9.author
			var7 = if not (if author == nil or author_1 == nil then false else author.userId == author_1.userId) then if p7 == nil or p7 > var8 then nil else "count" else "sender"
		end
		local var10
		if #var3 > 0 then
			appendGroup(#var3)
		end
		if p9 == nil or #p9 ~= #t_1 then
			var10 = t_1
		else
			for i_1, var4 in t_1 do
				if p9[i_1] ~= var4 then
					var10 = t_1
				end
			end
			var10 = p9
		end
		return var10
	end,
	ungroupedRows = function(p11, p12)
		-- upvalues: orderedMessages (ref), messageRow (ref)
		local var11
		local var12 = orderedMessages(p11)
		local t = {}
		
		if p12 == nil then
			var11 = t
		else
			for i, v in p12 do
				t[v.id] = v
			end
			var11 = t
		end
		local list = table.create(#var12)
		
		for i, v in var12 do
			list[i] = messageRow(var11, v, true, true)
		end
		if p12 == nil or #p12 ~= #list then
			return list
		end
		for i_1, v_1 in list do
			if p12[i_1] ~= v_1 then
				return list
			end
		end
		return p12
	end
}