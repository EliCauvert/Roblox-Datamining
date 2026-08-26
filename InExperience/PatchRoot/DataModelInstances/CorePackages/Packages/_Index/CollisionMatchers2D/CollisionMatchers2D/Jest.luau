local function _(p1)
	return function(_, ...)
		-- upvalues: p1 (ref)
		local var1 = p1(...)
		
		return {
			pass = var1.pass,
			message = function()
				-- upvalues: var1 (ref)
				return var1.message
			end
		}
	end
end

local t = {}
local aboveModule = require(script.Parent.above)

function t.toBeAbove(_, ...)
	-- upvalues: aboveModule (ref)
	local var1 = aboveModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local alignedHorizontallyModule = require(script.Parent.alignedHorizontally)

function t.toBeAlignedHorizontally(_, ...)
	-- upvalues: alignedHorizontallyModule (ref)
	local var1 = alignedHorizontallyModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local alignedVerticallyModule = require(script.Parent.alignedVertically)

function t.toBeAlignedVertically(_, ...)
	-- upvalues: alignedVerticallyModule (ref)
	local var1 = alignedVerticallyModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local belowModule = require(script.Parent.below)

function t.toBeBelow(_, ...)
	-- upvalues: belowModule (ref)
	local var1 = belowModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local insideModule = require(script.Parent.inside)

function t.toBeInside(_, ...)
	-- upvalues: insideModule (ref)
	local var1 = insideModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local insideAboveModule = require(script.Parent.insideAbove)

function t.toBeInsideAbove(_, ...)
	-- upvalues: insideAboveModule (ref)
	local var1 = insideAboveModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local insideBelowModule = require(script.Parent.insideBelow)

function t.toBeInsideBelow(_, ...)
	-- upvalues: insideBelowModule (ref)
	local var1 = insideBelowModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local insideLeftOfModule = require(script.Parent.insideLeftOf)

function t.toBeInsideLeftOf(_, ...)
	-- upvalues: insideLeftOfModule (ref)
	local var1 = insideLeftOfModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local insideRightOfModule = require(script.Parent.insideRightOf)

function t.toBeInsideRightOf(_, ...)
	-- upvalues: insideRightOfModule (ref)
	local var1 = insideRightOfModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local leftOfModule = require(script.Parent.leftOf)

function t.toBeLeftOf(_, ...)
	-- upvalues: leftOfModule (ref)
	local var1 = leftOfModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local rightOfModule = require(script.Parent.rightOf)

function t.toBeRightOf(_, ...)
	-- upvalues: rightOfModule (ref)
	local var1 = rightOfModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

local intersectModule = require(script.Parent.intersect)

function t.toIntersect(_, ...)
	-- upvalues: intersectModule (ref)
	local var1 = intersectModule(...)
	
	return {
		pass = var1.pass,
		message = function()
			-- upvalues: var1 (ref)
			return var1.message
		end
	}
end

return t