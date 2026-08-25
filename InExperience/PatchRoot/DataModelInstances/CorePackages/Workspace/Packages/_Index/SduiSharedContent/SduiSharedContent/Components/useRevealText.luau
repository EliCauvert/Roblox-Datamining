local reactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)

local function _(p0)
	return if p0 == nil or p0 == "" then " " else p0
end

local _ = function(p1)
	return if p1 == nil then 0.05 else math.max(p1, 0)
end

local _ = function(p2)
	return not p2
end

local _ = function(p3, p4)
	return string.match(p3, if p4 then "^<%s*/%s*([%w]+)" else "^<%s*([%w]+)")
end

local _ = function(p5, p6)
	return if p6 ~= "br" then string.match(p5, "/%s*>$") ~= nil else true
end

local function removeLastMatchingTag(p7, p8)
	for i = #p7, 1, -1 do
		if p7[i] ~= p8 then
			continue
		end
		table.remove(p7, i)
		
		return
	end
end

local _ = function(p9, p10)
	local joined = table.concat(p9)
	
	for i = #p10, 1, -1 do
		joined ..= `</{p10[i]}>`
	end
	return joined
end

local _ = function(p11, p12, p13)
	local joined = table.concat(p12)
	
	for i = #p13, 1, -1 do
		joined ..= `</{p13[i]}>`
	end
	if joined ~= p11[#p11] then
		table.insert(p11, joined)
	end
end

local function buildRevealTextFrames(p14, p15, p16, p17)
	-- upvalues: removeLastMatchingTag (ref)
	if p14 == nil or p14 == "" then
		return { p14 or "" }
	end
	local var5 = if p15 == nil or p15 == "" then " " else p15
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var9 = false
	local var10 = 1
	local p14Count = #p14
	local var5Count = #var5
	while var10 <= p14Count do
		local var18
		local var13 = false
		
		if var5Count > 0 and string.sub(p14, var10, var10 + var5Count - 1) == var5 then
			if var9 then
				local joined = table.concat(t_1)
				
				for var18 = #t_2, 1, -1 do
					joined ..= `</{t_2[var18]}>`
				end
				local var20 = joined
				
				if var20 ~= t[#t] then
					table.insert(t, var20)
				end
				var9 = false
			end
			if p17 then
				table.insert(t_1, var5)
			end
			var10 += var5Count
			var13 = true
		elseif p16 and string.sub(p14, var10, var10) == "<" then
			local matchIndex = string.find(p14, ">", var10, true)
			
			if matchIndex then
				local substring = string.sub(p14, var10, matchIndex)
				table.insert(t_1, substring)
				local var16 = string.sub(substring, 1, 2) == "</"
				local match = string.match(substring, if var16 then "^<%s*/%s*([%w]+)" else "^<%s*([%w]+)")
				
				if match then
					if var16 then
						removeLastMatchingTag(t_2, match)
					else
						var18 = if match ~= "br" then string.match(substring, "/%s*>$") ~= nil else true
						
						if not var18 then
							table.insert(t_2, match)
						end
					end
				end
				var10 = matchIndex + 1
				var13 = true
			end
		end
		if var13 then continue end
		table.insert(t_1, string.sub(p14, var10, var10))
		var9 = true
		var10 += 1
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

return function(p18)
	-- upvalues: reactModule (ref), buildRevealTextFrames (ref)
	local text = p18.text
	local delimiter = p18.delimiter
	local removeDelimiter = p18.removeDelimiter
	local richText = p18.richText
	local revealInterval = p18.revealInterval
	local var22 = reactModule.useMemo(function()
		-- upvalues: buildRevealTextFrames (copy), text (ref), delimiter (ref), richText (ref), removeDelimiter (ref)
		return buildRevealTextFrames(text, delimiter, richText, removeDelimiter)
	end, { text, delimiter, richText, removeDelimiter })
	local var23 = if revealInterval == nil then 0.05 else math.max(revealInterval, 0)
	local var24, var25 = reactModule.useState(if var23 == 0 then var22[#var22] else var22[1])
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), var25 (ref), var22 (ref)
		local thread = task.spawn(function()
			-- upvalues: var23 (copy), var25 (copy), var22 (copy)
			if var23 == 0 then
				var25(var22[#var22])
				
				return
			end
			var25(var22[1])
			
			for i = 2, #var22 do
				task.wait(var23)
				var25(var22[i])
			end
		end)
		
		return function()
			-- upvalues: thread (ref)
			task.cancel(thread)
		end
	end, { var22, var23 })
	
	return var24
end