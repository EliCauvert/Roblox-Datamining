local reactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)

local function _(p1)
	return if p1 == nil or p1 == "" then " " else p1
end

local _ = function(p1)
	return if p1 == nil then 0.05 else math.max(p1, 0)
end

local _ = function(p1)
	return not p1
end

local _ = function(p1, p2)
	return string.match(p1, if p2 then "^<%s*/%s*([%w]+)" else "^<%s*([%w]+)")
end

local _ = function(p1, p2)
	return if p2 ~= "br" then string.match(p1, "/%s*>$") ~= nil else true
end

local function removeLastMatchingTag(p1, p2)
	for i = #p1, 1, -1 do
		if p1[i] ~= p2 then
			continue
		end
		table.remove(p1, i)
		
		return
	end
end

local _ = function(p3, p4)
	local joined = table.concat(p3)
	
	for i = #p4, 1, -1 do
		joined ..= `</{p4[i]}>`
	end
	return joined
end

local _ = function(p5, p6, p7)
	local joined = table.concat(p6)
	
	for i = #p7, 1, -1 do
		joined ..= `</{p7[i]}>`
	end
	if joined ~= p5[#p5] then
		table.insert(p5, joined)
	end
end

local function buildRevealTextFrames(p8, p9, p10, p11)
	-- upvalues: removeLastMatchingTag (ref)
	if p8 == nil or p8 == "" then
		return { p8 or "" }
	end
	local var1 = if p9 == nil or p9 == "" then " " else p9
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var2 = false
	local var3 = 1
	local p14Count = #p8
	local var5Count = #var1
	while var3 <= p14Count do
		local var4
		local var5 = false
		
		if var5Count > 0 and string.sub(p8, var3, var3 + var5Count - 1) == var1 then
			if var2 then
				local joined = table.concat(t_1)
				
				for var4 = #t_2, 1, -1 do
					joined ..= `</{t_2[var4]}>`
				end
				local var6 = joined
				
				if var6 ~= t[#t] then
					table.insert(t, var6)
				end
				var2 = false
			end
			if p11 then
				table.insert(t_1, var1)
			end
			var3 += var5Count
			var5 = true
		elseif p10 and string.sub(p8, var3, var3) == "<" then
			local matchIndex = string.find(p8, ">", var3, true)
			
			if matchIndex then
				local substring = string.sub(p8, var3, matchIndex)
				table.insert(t_1, substring)
				local var7 = string.sub(substring, 1, 2) == "</"
				local match = string.match(substring, if var7 then "^<%s*/%s*([%w]+)" else "^<%s*([%w]+)")
				
				if match then
					if var7 then
						removeLastMatchingTag(t_2, match)
					else
						var4 = if match ~= "br" then string.match(substring, "/%s*>$") ~= nil else true
						
						if not var4 then
							table.insert(t_2, match)
						end
					end
				end
				var3 = matchIndex + 1
				var5 = true
			end
		end
		if var5 then continue end
		table.insert(t_1, string.sub(p8, var3, var3))
		var2 = true
		var3 += 1
	end
	local joined = table.concat(t_1)
	
	for i = #t_2, 1, -1 do
		joined ..= `</{t_2[i]}>`
	end
	if joined ~= t[#t] then
		table.insert(t, joined)
	end
	return t
end

return function(p12)
	-- upvalues: reactModule (ref), buildRevealTextFrames (ref)
	local text = p12.text
	local delimiter = p12.delimiter
	local removeDelimiter = p12.removeDelimiter
	local richText = p12.richText
	local revealInterval = p12.revealInterval
	local var8 = reactModule.useMemo(function()
		-- upvalues: buildRevealTextFrames (copy), text (ref), delimiter (ref), richText (ref), removeDelimiter (ref)
		return buildRevealTextFrames(text, delimiter, richText, removeDelimiter)
	end, { text, delimiter, richText, removeDelimiter })
	local var9 = if revealInterval == nil then 0.05 else math.max(revealInterval, 0)
	local var10, var11 = reactModule.useState(if var9 == 0 then var8[#var8] else var8[1])
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var11 (ref), var8 (ref)
		local thread = task.spawn(function()
			-- upvalues: var9 (copy), var11 (copy), var8 (copy)
			if var9 == 0 then
				var11(var8[#var8])
				
				return
			end
			var11(var8[1])
			
			for i = 2, #var8 do
				task.wait(var9)
				var11(var8[i])
			end
		end)
		
		return function()
			-- upvalues: thread (ref)
			task.cancel(thread)
		end
	end, { var8, var9 })
	
	return var10
end