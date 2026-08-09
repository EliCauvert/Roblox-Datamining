local t = { list = true, devList = true, inExpChatSelection = true }

local function deepCopy(p0) --[[ line: 19 ]]
	-- upvalues: deepCopy (ref)
	if type(p0) ~= "table" then
		return p0
	end
	local t = {}
	
	for i, v in p0 do
		t[i] = deepCopy(v)
	end
	return t
end

local function buildStoreAsMap(p1) --[[ line: 30 ]]
	local t = {}
	
	for i, v in p1 do
		local storeAs = v.storeAs
		
		if type(storeAs) == "string" and storeAs ~= "" then
			t[storeAs] = v.type or ""
		end
	end
	return t
end

local function rewriteNodes(p2) --[[ line: 41 ]]
	-- upvalues: t (ref)
	for i, v in p2 do
		local storeAs = v.storeAs
		
		if type(storeAs) == "string" and storeAs ~= "" then
			local type = v.type
			v.storeAs = nil
			
			if t[type] then
				v.storeSelectionAsContext = storeAs
				v.formKey = "auto-gen-legacy-" .. storeAs
			else
				v.formKey = storeAs
			end
		end
	end
end

local function rewriteStoreRefs(p3, p4) --[[ line: 59 ]]
	-- upvalues: t (ref), rewriteStoreRefs (ref)
	if type(p3) ~= "table" then return end
	if p3["$store"] == nil then
		for i, v in p3 do
			rewriteStoreRefs(v, p4)
		end
		return
	else
		local var7 = p3["$store"]
		
		if type(var7) == "string" then
			local matchIndex = string.find(var7, ".", 1, true)
			local var9 = p4[if matchIndex then string.sub(var7, 1, matchIndex - 1) else var7]
			p3["$store"] = nil
			
			if t[var9] then
				p3["$context"] = var7
				
				return
			end
			p3["$formData"] = var7
		end
	end
end

return function(p5) --[[ line: 85 | named "downgradeV2ToV1" ]]
	-- upvalues: deepCopy (ref), buildStoreAsMap (ref), rewriteNodes (ref), rewriteStoreRefs (ref)
	local var10 = deepCopy(p5)
	local var11 = buildStoreAsMap(var10.nodes or {})
	rewriteNodes(var10.nodes or {})
	
	if var10.resources then
		for i, v in var10.resources do
			rewriteStoreRefs(v.value, var11)
		end
	end
	rewriteStoreRefs(var10.display, var11)
	
	if var10.nodes then
		for i, v in var10.nodes do
			rewriteStoreRefs(v, var11)
		end
	end
	rewriteStoreRefs(var10.submission, var11)
	var10.version = 1
	
	return var10
end