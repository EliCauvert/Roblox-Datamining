local BehaviorsModule = require(script.Parent.Behaviors)
local _ = require(script.Parent.Corner)
local GeometryModule = require(script.Parent.Geometry)
local _ = require(script.Parent.Stash)

local function _(Center, p1)
	-- upvalues: GeometryModule (copy)
	return {
		center = Center,
		normalizedPosition = GeometryModule.normalizedCenter(Center, p1)
	}
end

local _ = function(Corner, p1, p2)
	-- upvalues: GeometryModule (copy)
	return {
		center = GeometryModule.cornerTarget(p1, p2, Corner),
		corner = Corner,
		normalizedPosition = GeometryModule.normalizedCornerPosition(Corner)
	}
end

local _ = function(p1)
	-- upvalues: GeometryModule (copy)
	return p1.dock.corner or GeometryModule.nearestCorner(p1.center, p1.boundsSize)
end

return {
	[BehaviorsModule.Contained] = {
		animateRelease = false,
		release = function(p1)
			-- upvalues: GeometryModule (copy)
			local ClampCenterResult = GeometryModule.clampCenter(p1.center, p1.boundsSize, p1.windowSize)
			
			return {
				center = ClampCenterResult,
				normalizedPosition = GeometryModule.normalizedCenter(ClampCenterResult, p1.boundsSize)
			}
		end,
		rest = function(p1)
			-- upvalues: GeometryModule (copy)
			local ClampCenterResult = GeometryModule.clampCenter(p1.desiredCenter, p1.boundsSize, p1.windowSize)
			
			return {
				center = ClampCenterResult,
				normalizedPosition = GeometryModule.normalizedCenter(ClampCenterResult, p1.boundsSize)
			}
		end
	},
	[BehaviorsModule.CornerDock] = {
		animateRelease = true,
		release = function(p1)
			-- upvalues: GeometryModule (copy)
			local FixedAxisCornerResult = GeometryModule.fixedAxisCorner(p1.center, p1.boundsSize, p1.windowSize, p1.dock.corner or GeometryModule.nearestCorner(p1.center, p1.boundsSize))
			
			return {
				center = GeometryModule.cornerTarget(p1.boundsSize, p1.windowSize, FixedAxisCornerResult),
				corner = FixedAxisCornerResult,
				normalizedPosition = GeometryModule.normalizedCornerPosition(FixedAxisCornerResult)
			}
		end,
		rest = function(p1)
			-- upvalues: GeometryModule (copy)
			local Corner = p1.dock.corner or GeometryModule.nearestCorner(p1.center, p1.boundsSize)
			
			return {
				center = GeometryModule.cornerTarget(p1.boundsSize, p1.windowSize, Corner),
				corner = Corner,
				normalizedPosition = GeometryModule.normalizedCornerPosition(Corner)
			}
		end
	}
}