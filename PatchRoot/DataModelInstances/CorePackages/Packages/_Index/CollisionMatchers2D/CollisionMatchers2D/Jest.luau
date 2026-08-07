-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local function _(p0) --[[ line: 1 | named "makeJestCompatible" ]]
	return function(_, ...) --[[ line: 2 ]]
		-- upvalues: p0 (ref)
		local var13 = p0(...)
		
		return {
			pass = var13.pass,
			message = function() --[[ line: 7 ]]
				-- upvalues: var13 (ref)
				return var13.message
			end
		}
	end
end

local t = {}
local aboveModule = require(script.Parent.above)

function t.toBeAbove(_, ...) --[[ line: 2 ]]
	-- upvalues: aboveModule (ref)
	local var13 = aboveModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local alignedHorizontallyModule = require(script.Parent.alignedHorizontally)

function t.toBeAlignedHorizontally(_, ...) --[[ line: 2 ]]
	-- upvalues: alignedHorizontallyModule (ref)
	local var13 = alignedHorizontallyModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local alignedVerticallyModule = require(script.Parent.alignedVertically)

function t.toBeAlignedVertically(_, ...) --[[ line: 2 ]]
	-- upvalues: alignedVerticallyModule (ref)
	local var13 = alignedVerticallyModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local belowModule = require(script.Parent.below)

function t.toBeBelow(_, ...) --[[ line: 2 ]]
	-- upvalues: belowModule (ref)
	local var13 = belowModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideModule = require(script.Parent.inside)

function t.toBeInside(_, ...) --[[ line: 2 ]]
	-- upvalues: insideModule (ref)
	local var13 = insideModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideAboveModule = require(script.Parent.insideAbove)

function t.toBeInsideAbove(_, ...) --[[ line: 2 ]]
	-- upvalues: insideAboveModule (ref)
	local var13 = insideAboveModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideBelowModule = require(script.Parent.insideBelow)

function t.toBeInsideBelow(_, ...) --[[ line: 2 ]]
	-- upvalues: insideBelowModule (ref)
	local var13 = insideBelowModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideLeftOfModule = require(script.Parent.insideLeftOf)

function t.toBeInsideLeftOf(_, ...) --[[ line: 2 ]]
	-- upvalues: insideLeftOfModule (ref)
	local var13 = insideLeftOfModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideRightOfModule = require(script.Parent.insideRightOf)

function t.toBeInsideRightOf(_, ...) --[[ line: 2 ]]
	-- upvalues: insideRightOfModule (ref)
	local var13 = insideRightOfModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local leftOfModule = require(script.Parent.leftOf)

function t.toBeLeftOf(_, ...) --[[ line: 2 ]]
	-- upvalues: leftOfModule (ref)
	local var13 = leftOfModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local rightOfModule = require(script.Parent.rightOf)

function t.toBeRightOf(_, ...) --[[ line: 2 ]]
	-- upvalues: rightOfModule (ref)
	local var13 = rightOfModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local intersectModule = require(script.Parent.intersect)

function t.toIntersect(_, ...) --[[ line: 2 ]]
	-- upvalues: intersectModule (ref)
	local var13 = intersectModule(...)
	
	return {
		pass = var13.pass,
		message = function() --[[ line: 7 ]]
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

return t