local function _(p0)
	return function(_, ...)
		-- upvalues: p0 (ref)
		local var13 = p0(...)
		
		return {
			pass = var13.pass,
			message = function()
				-- upvalues: var13 (ref)
				return var13.message
			end
		}
	end
end

local t = {}
local aboveModule = require(script.Parent.above)

function t.toBeAbove(_, ...)
	-- upvalues: aboveModule (ref)
	local var13 = aboveModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local alignedHorizontallyModule = require(script.Parent.alignedHorizontally)

function t.toBeAlignedHorizontally(_, ...)
	-- upvalues: alignedHorizontallyModule (ref)
	local var13 = alignedHorizontallyModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local alignedVerticallyModule = require(script.Parent.alignedVertically)

function t.toBeAlignedVertically(_, ...)
	-- upvalues: alignedVerticallyModule (ref)
	local var13 = alignedVerticallyModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local belowModule = require(script.Parent.below)

function t.toBeBelow(_, ...)
	-- upvalues: belowModule (ref)
	local var13 = belowModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideModule = require(script.Parent.inside)

function t.toBeInside(_, ...)
	-- upvalues: insideModule (ref)
	local var13 = insideModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideAboveModule = require(script.Parent.insideAbove)

function t.toBeInsideAbove(_, ...)
	-- upvalues: insideAboveModule (ref)
	local var13 = insideAboveModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideBelowModule = require(script.Parent.insideBelow)

function t.toBeInsideBelow(_, ...)
	-- upvalues: insideBelowModule (ref)
	local var13 = insideBelowModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideLeftOfModule = require(script.Parent.insideLeftOf)

function t.toBeInsideLeftOf(_, ...)
	-- upvalues: insideLeftOfModule (ref)
	local var13 = insideLeftOfModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local insideRightOfModule = require(script.Parent.insideRightOf)

function t.toBeInsideRightOf(_, ...)
	-- upvalues: insideRightOfModule (ref)
	local var13 = insideRightOfModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local leftOfModule = require(script.Parent.leftOf)

function t.toBeLeftOf(_, ...)
	-- upvalues: leftOfModule (ref)
	local var13 = leftOfModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local rightOfModule = require(script.Parent.rightOf)

function t.toBeRightOf(_, ...)
	-- upvalues: rightOfModule (ref)
	local var13 = rightOfModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

local intersectModule = require(script.Parent.intersect)

function t.toIntersect(_, ...)
	-- upvalues: intersectModule (ref)
	local var13 = intersectModule(...)
	
	return {
		pass = var13.pass,
		message = function()
			-- upvalues: var13 (ref)
			return var13.message
		end
	}
end

return t