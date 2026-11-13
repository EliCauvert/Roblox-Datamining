local function _(Text: string, p1)
	local Match, Match2 = string.match(Text, "^(%d*%.?%d*)()", p1)
	
	if Match == nil or Match == "" or Match == "." then
		return nil, p1
	end
	local Number: number? = tonumber(Match)
	
	if Number == nil or Number ~= Number then
		return nil, p1
	else
		return Number, Match2
	end
end

local Segments = { "*", "×", "✕" }
local Segments1 = { "/", "÷" }
local Segments2 = { "-", "−" }
local Segments3 = { "+" }

local _ = function(Text: string, StartIndex: number, List)
	for _, value in List do
		if string.sub(Text, StartIndex, StartIndex + #value - 1) == value then
			return value
		end
	end
	return nil
end

local _ = function(Text: string, Init): number
	local _, EndIndex = string.find(Text, "^%s*", Init)
	
	return EndIndex + 1
end

local Callback = nil

local function parsePrimary(p1)
	-- upvalues: Callback (ref)
	local _, EndIndex = string.find(p1.text, "^%s*", p1.at)
	p1.at = EndIndex + 1
	
	if string.sub(p1.text, p1.at, p1.at) == "(" then
		p1.depth += 1
		
		if p1.depth > 32 then
			p1.failed = true
			
			return 0
		end
		p1.at += 1
		local CallbackResult = Callback(p1)
		p1.depth -= 1
		local _, EndIndex1 = string.find(p1.text, "^%s*", p1.at)
		p1.at = EndIndex1 + 1
		
		if string.sub(p1.text, p1.at, p1.at) == ")" then
			p1.at += 1
			
			return CallbackResult
		else
			p1.failed = true
			
			return 0
		end
	else
		local At = p1.at
		local Match, Match2 = string.match(p1.text, "^(%d*%.?%d*)()", At)
		local At1 = nil
		local v1 = nil
		
		if Match == nil or Match == "" or Match == "." then
			v1 = nil
			At1 = At
		else
			local Number: number? = tonumber(Match)
			
			if Number == nil or Number ~= Number then
				v1 = nil
				At1 = At
			else
				v1 = Number
				At1 = Match2
			end
		end
		if v1 == nil then
			p1.failed = true
			
			return 0
		else
			p1.at = At1
			
			return v1
		end
	end
end

local function parseFactor(p1)
	-- upvalues: Segments3 (copy), Segments2 (copy), parsePrimary (copy), parseFactor (copy)
	local _, EndIndex = string.find(p1.text, "^%s*", p1.at)
	p1.at = EndIndex + 1
	local Text: string = p1.text
	local At: number = p1.at
	local v1 = nil
	
	for _, value in Segments3 do
		if string.sub(Text, At, At + #value - 1) == value then
			v1 = value
			break
		end
	end
	local v2 = nil
	if v1 == nil then
		local Text1: string = p1.text
		local At1: number = p1.at
		v2 = nil
		
		for _, value1 in Segments2 do
			if string.sub(Text1, At1, At1 + #value1 - 1) == value1 then
				v2 = value1
				break
			end
		end
	else
		v2 = nil
	end
	local V39 = v1 or v2
	
	if V39 == nil then
		return (parsePrimary(p1))
	end
	p1.depth += 1
	
	if p1.depth > 32 then
		p1.failed = true
		
		return 0
	else
		p1.at += #V39
		local ParseFactorResult = parseFactor(p1)
		p1.depth -= 1
		
		return if v2 == nil then ParseFactorResult else -ParseFactorResult
	end
end

local function parseTerm(p2)
	-- upvalues: parseFactor (copy), Segments (copy), Segments1 (copy)
	local ParseFactorResult = parseFactor(p2)
	local v3 = nil
	local v4 = nil
	while not p2.failed do
		local _, EndIndex = string.find(p2.text, "^%s*", p2.at)
		p2.at = EndIndex + 1
		local Text: string = p2.text
		local At: number = p2.at
		v3 = nil
		
		for _, segment in Segments do
			if string.sub(Text, At, At + #segment - 1) == segment then
				v3 = segment
				break
			end
		end
		if v3 == nil then
			local Text1: string = p2.text
			local At1: number = p2.at
			v4 = nil
			
			for _, value in Segments1 do
				if string.sub(Text1, At1, At1 + #value - 1) == value then
					v4 = value
					break
				end
			end
		else
			v4 = nil
		end
		local V50 = v3 or v4
		
		if V50 == nil then break end
		p2.at += #V50
		local ParseFactorResult1 = parseFactor(p2)
		
		if p2.failed then
			return 0
		end
		if v4 == nil then
			ParseFactorResult *= ParseFactorResult1
		else
			if ParseFactorResult1 == 0 then
				p2.failed = true
				
				return 0
			end
			ParseFactorResult /= ParseFactorResult1
		end
	end
	return ParseFactorResult
end

Callback = function(p3)
	-- upvalues: parseTerm (copy), Segments2 (copy), Segments3 (copy)
	local ParseTermResult = parseTerm(p3)
	local v5 = nil
	local v6 = nil
	while not p3.failed do
		local _, EndIndex = string.find(p3.text, "^%s*", p3.at)
		p3.at = EndIndex + 1
		local Text: string = p3.text
		local At: number = p3.at
		v5 = nil
		
		for _, value in Segments2 do
			if string.sub(Text, At, At + #value - 1) == value then
				v5 = value
				break
			end
		end
		if v5 == nil then
			local Text1: string = p3.text
			local At1: number = p3.at
			v6 = nil
			
			for _, value1 in Segments3 do
				if string.sub(Text1, At1, At1 + #value1 - 1) == value1 then
					v6 = value1
					break
				end
			end
		else
			v6 = nil
		end
		local V61 = v5 or v6
		
		if V61 == nil then break end
		p3.at += #V61
		local ParseTermResult1 = parseTerm(p3)
		
		if p3.failed then
			return 0
		end
		if v5 == nil then
			ParseTermResult += ParseTermResult1
		else
			ParseTermResult -= ParseTermResult1
		end
	end
	return ParseTermResult
end

return {
	number = function(Text: string)
		-- upvalues: Segments2 (copy), Segments3 (copy)
		if type(Text) ~= "string" then
			return nil
		end
		local v7 = nil
		
		for _, value in Segments2 do
			if string.sub(Text, 1, #value + 1 - 1) == value then
				v7 = value
				break
			end
		end
		if not v7 then
			v7 = nil
			
			for _, value1 in Segments3 do
				if string.sub(Text, 1, #value1 + 1 - 1) == value1 then
					v7 = value1
					break
				end
			end
		end
		local Text1: string = if v7 == nil then Text else string.sub(Text, #v7 + 1)
		local Match, Match2 = string.match(Text1, "^(%d*%.?%d*)()", 1)
		local v8 = nil
		local v9 = nil
		
		if Match == nil or Match == "" or Match == "." then
			v8 = nil
			v9 = 1
		else
			local Number: number? = tonumber(Match)
			
			if Number == nil or Number ~= Number then
				v8 = nil
				v9 = 1
			else
				v8 = Number
				v9 = Match2
			end
		end
		return if v8 == nil or v9 ~= #Text1 + 1 then nil elseif v7 == nil or v7 == "+" then v8 else -v8
	end,
	incomplete = function(Text: string): boolean
		-- upvalues: Segments2 (copy), Segments3 (copy)
		if type(Text) ~= "string" then
			return true
		end
		local v10 = nil
		
		for _, value in Segments2 do
			if string.sub(Text, 1, #value + 1 - 1) == value then
				v10 = value
				break
			end
		end
		if not v10 then
			v10 = nil
			
			for _, value1 in Segments3 do
				if string.sub(Text, 1, #value1 + 1 - 1) == value1 then
					v10 = value1
					break
				end
			end
		end
		local Text1: string = if v10 == nil then Text else string.sub(Text, #v10 + 1)
		
		return Text1 == "" or Text1 == "."
	end,
	parse = function(Text)
		-- upvalues: Callback (ref)
		if type(Text) ~= "string" then
			return nil
		elseif #Text > 256 then
			return nil
		else
			local config = { at = 1, failed = false, depth = 0, text = Text }
			local CallbackResult: number = Callback(config)
			local _, EndIndex = string.find(config.text, "^%s*", config.at)
			config.at = EndIndex + 1
			
			return if config.failed or config.at ~= #config.text + 1 then nil elseif CallbackResult == CallbackResult and math.abs(CallbackResult) ~= 1e999 then CallbackResult else nil
		end
	end
}