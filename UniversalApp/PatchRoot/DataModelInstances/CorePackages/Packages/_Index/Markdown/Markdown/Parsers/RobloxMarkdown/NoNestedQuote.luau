local NewResult = require(script:FindFirstAncestor("Markdown").Parent.CommonMark).Internal.BlockQuoteParser.Factory.new()

local function _(p1): boolean
	while p1 ~= nil do
		if p1.kind == "BlockQuote" then
			return true
		end
		p1 = p1:getParent()
	end
	return false
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:tryStart(p2, p3)
	-- upvalues: NewResult (copy)
	local TryStartResult = NewResult:tryStart(p2, p3)
	
	if TryStartResult ~= nil then
		local Block = p3:getMatchedBlockParser():getBlock()
		local Flag = nil
		while Block ~= nil do
			if Block.kind ~= "BlockQuote" then
				Block = Block:getParent()
				continue
			end
			Flag = true
			if not Flag then
				return TryStartResult
			end
		end
		Flag = false
	end
	return nil
end

return {
	Factory = Module,
	extension = function()
		-- upvalues: Module (copy)
		return {
			extendParser = function(p4)
				-- upvalues: Module (upval)
				p4:customBlockParserFactory(Module.new())
			end
		}
	end
}