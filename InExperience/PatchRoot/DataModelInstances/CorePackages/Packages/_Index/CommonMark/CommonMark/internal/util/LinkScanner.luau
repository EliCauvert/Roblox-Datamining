local _ = require(script:FindFirstAncestor("CommonMark").parser.beta.Scanner)
local ByteFunction = string.byte
local t = {}

for i = 1, 32 do
	t[ByteFunction("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~", i)] = true
end
local function _(p1): boolean
	-- upvalues: t (copy)
	return t[p1] == true
end

local function scanLinkDestinationWithBalancedParens(p1): boolean
	-- upvalues: t (copy)
	local Count = 0
	local Flag = true
	while p1:hasNext() do
		local PeekResult: number = p1:peek()
		
		if PeekResult == 32 then
			return not Flag
		end
		if PeekResult == 92 then
			p1:next()
			
			if t[p1:peek()] == true then
				p1:next()
			end
		elseif PeekResult == 40 then
			Count += 1
			
			if Count > 32 then
				return false
			end
			p1:next()
		elseif PeekResult == 41 then
			if Count == 0 then
				return true
			end
			Count -= 1
			p1:next()
		else
			if PeekResult < 32 or PeekResult == 127 then
				return not Flag
			end
			p1:next()
		end
		Flag = false
	end
	return true
end

local LinkScannerModule = {
	scanLinkLabelContent = function(p2): boolean
		-- upvalues: t (copy)
		while p2:hasNext() do
			local PeekResult = p2:peek()
			
			if PeekResult == 92 then
				p2:next()
				
				if t[p2:peek()] == true then
					p2:next()
				end
			else
				if PeekResult == 93 then
					return true
				end
				if PeekResult == 91 then
					return false
				end
				p2:next()
			end
		end
		return true
	end,
	scanLinkDestination = function(p3)
		-- upvalues: t (copy), scanLinkDestinationWithBalancedParens (copy)
		if not p3:hasNext() then
			return false
		end
		if not p3:nextChar(60) then
			return (scanLinkDestinationWithBalancedParens(p3))
		end
		while p3:hasNext() do
			local PeekResult = p3:peek()
			
			if PeekResult == 92 then
				p3:next()
				
				if t[p3:peek()] == true then
					p3:next()
				end
			else
				if PeekResult == 10 or PeekResult == 60 then
					return false
				end
				if PeekResult == 62 then
					p3:next()
					
					return true
				end
				p3:next()
			end
		end
		return false
	end
}

function LinkScannerModule.scanLinkTitle(p4): boolean
	-- upvalues: LinkScannerModule (copy)
	if not p4:hasNext() then
		return false
	end
	local v1: number? = nil
	local PeekResult = p4:peek()
	
	if PeekResult == 34 then
		v1 = 34
	elseif PeekResult == 39 then
		v1 = 39
	else
		if PeekResult ~= 40 then
			return false
		end
		v1 = 41
	end
	p4:next()
	
	if not LinkScannerModule.scanLinkTitleContent(p4, v1) then
		return false
	elseif p4:hasNext() then
		p4:next()
		
		return true
	else
		return false
	end
end

function LinkScannerModule.scanLinkTitleContent(p4, p5): boolean
	-- upvalues: t (copy)
	while p4:hasNext() do
		local PeekResult = p4:peek()
		
		if PeekResult == 92 then
			p4:next()
			
			if t[p4:peek()] == true then
				p4:next()
			end
		else
			if PeekResult == p5 then
				return true
			end
			if p5 == 41 and PeekResult == 40 then
				return false
			end
			p4:next()
		end
	end
	return true
end

return LinkScannerModule