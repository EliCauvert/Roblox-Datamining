local function _(Callback) --[[ Line: 1 | Named "makeJestCompatible" ]]
	return function(_, ...) --[[ Line: 2 ]]
		-- upvalues: Callback (copy)
		local CallbackResult = Callback(...)
		
		return {
			pass = CallbackResult.pass,
			message = function() --[[ Line: 7 ]]
				-- upvalues: CallbackResult (copy)
				return CallbackResult.message
			end
		}
	end
end

local AboveModule = require(script.Parent.above)

local function ToBeAbove(_, ...) --[[ Line: 2 ]]
	-- upvalues: AboveModule (copy)
	local CallbackResult = AboveModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local AlignedHorizontallyModule = require(script.Parent.alignedHorizontally)

local function ToBeAlignedHorizontally(_, ...) --[[ Line: 2 ]]
	-- upvalues: AlignedHorizontallyModule (copy)
	local CallbackResult = AlignedHorizontallyModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local AlignedVerticallyModule = require(script.Parent.alignedVertically)

local function ToBeAlignedVertically(_, ...) --[[ Line: 2 ]]
	-- upvalues: AlignedVerticallyModule (copy)
	local CallbackResult = AlignedVerticallyModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local BelowModule = require(script.Parent.below)

local function ToBeBelow(_, ...) --[[ Line: 2 ]]
	-- upvalues: BelowModule (copy)
	local CallbackResult = BelowModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local InsideModule = require(script.Parent.inside)

local function ToBeInside(_, ...) --[[ Line: 2 ]]
	-- upvalues: InsideModule (copy)
	local CallbackResult = InsideModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local InsideAboveModule = require(script.Parent.insideAbove)

local function ToBeInsideAbove(_, ...) --[[ Line: 2 ]]
	-- upvalues: InsideAboveModule (copy)
	local CallbackResult = InsideAboveModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local InsideBelowModule = require(script.Parent.insideBelow)

local function ToBeInsideBelow(_, ...) --[[ Line: 2 ]]
	-- upvalues: InsideBelowModule (copy)
	local CallbackResult = InsideBelowModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local InsideLeftOfModule = require(script.Parent.insideLeftOf)

local function ToBeInsideLeftOf(_, ...) --[[ Line: 2 ]]
	-- upvalues: InsideLeftOfModule (copy)
	local CallbackResult = InsideLeftOfModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local InsideRightOfModule = require(script.Parent.insideRightOf)

local function ToBeInsideRightOf(_, ...) --[[ Line: 2 ]]
	-- upvalues: InsideRightOfModule (copy)
	local CallbackResult = InsideRightOfModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local LeftOfModule = require(script.Parent.leftOf)

local function ToBeLeftOf(_, ...) --[[ Line: 2 ]]
	-- upvalues: LeftOfModule (copy)
	local CallbackResult = LeftOfModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local RightOfModule = require(script.Parent.rightOf)

local function ToBeRightOf(_, ...) --[[ Line: 2 ]]
	-- upvalues: RightOfModule (copy)
	local CallbackResult = RightOfModule(...)
	
	return {
		pass = CallbackResult.pass,
		message = function() --[[ Line: 7 ]]
			-- upvalues: CallbackResult (copy)
			return CallbackResult.message
		end
	}
end

local IntersectModule = require(script.Parent.intersect)

return {
	toBeAbove = ToBeAbove,
	toBeAlignedHorizontally = ToBeAlignedHorizontally,
	toBeAlignedVertically = ToBeAlignedVertically,
	toBeBelow = ToBeBelow,
	toBeInside = ToBeInside,
	toBeInsideAbove = ToBeInsideAbove,
	toBeInsideBelow = ToBeInsideBelow,
	toBeInsideLeftOf = ToBeInsideLeftOf,
	toBeInsideRightOf = ToBeInsideRightOf,
	toBeLeftOf = ToBeLeftOf,
	toBeRightOf = ToBeRightOf,
	toIntersect = function(_, ...) --[[ Line: 2 ]]
		-- upvalues: IntersectModule (copy)
		local CallbackResult = IntersectModule(...)
		
		return {
			pass = CallbackResult.pass,
			message = function() --[[ Line: 7 ]]
				-- upvalues: CallbackResult (copy)
				return CallbackResult.message
			end
		}
	end
}