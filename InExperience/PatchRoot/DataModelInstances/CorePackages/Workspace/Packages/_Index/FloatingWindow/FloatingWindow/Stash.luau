local _ = require(script.Parent.Corner)
local EdgeModule = require(script.Parent.Edge)
local GeometryModule = require(script.Parent.Geometry)
local _ = require(script.Parent.Types)

local function _(Vector, p1, Vector1: number, Left)
	-- upvalues: EdgeModule (copy)
	local VectorRatio = Vector1 / 2
	
	return if Left == EdgeModule.Left then (VectorRatio.X - Vector.X) / Vector1.X else (Vector.X + VectorRatio.X - p1.X) / Vector1.X
end

local StashModule = {
	resolveEdge = function(Center, BoundsSize, WindowSize: number, p1)
		-- upvalues: EdgeModule (copy)
		local v1 = nil
		local MinimumHiddenFraction = p1.minimumHiddenFraction
		
		for _, edge in p1.edges do
			local WindowSizeRatio = WindowSize / 2
			local XRatio = if edge == EdgeModule.Left then (WindowSizeRatio.X - Center.X) / WindowSize.X else (Center.X + WindowSizeRatio.X - BoundsSize.X) / WindowSize.X
			
			if MinimumHiddenFraction < XRatio then
				v1 = edge
				MinimumHiddenFraction = XRatio
			end
		end
		return v1
	end,
	target = function(Center, BoundsSize, WindowSize: number, p2, Edge, ScreenInsetResult): Vector2
		-- upvalues: GeometryModule (copy), EdgeModule (copy)
		local ClampCenterResult = GeometryModule.clampCenter(Center, BoundsSize, WindowSize)
		local WindowSizeRatio = WindowSize / 2
		
		return if Edge == EdgeModule.Left then Vector2.new(p2.visiblePixels - WindowSizeRatio.X - ScreenInsetResult, ClampCenterResult.Y) else Vector2.new(BoundsSize.X + WindowSizeRatio.X - p2.visiblePixels + ScreenInsetResult, ClampCenterResult.Y)
	end,
	clampCenter = function(Center, BoundsSize, WindowSize, p2)
		-- upvalues: GeometryModule (copy), EdgeModule (copy)
		local CenterLimitsResult = GeometryModule.centerLimits(BoundsSize, WindowSize)
		
		if table.find(p2.edges, EdgeModule.Left) ~= nil then
			CenterLimitsResult.left = -1e999
		end
		if table.find(p2.edges, EdgeModule.Right) ~= nil then
			CenterLimitsResult.right = 1e999
		end
		return GeometryModule.clampToLimits(Center, CenterLimitsResult)
	end
}

local function stashedSpot(p2, p3, p4, Edge)
	-- upvalues: StashModule (copy), GeometryModule (copy), EdgeModule (copy)
	local TargetResult = StashModule.target(p3.center, p3.boundsSize, p3.windowSize, p4, Edge, p3.screenInset(Edge))
	
	return {
		center = TargetResult,
		corner = p2.corner,
		edge = Edge,
		normalizedPosition = Vector2.new(if Edge == EdgeModule.Left then 0 else 1, GeometryModule.normalizedCenter(TargetResult, p3.boundsSize).Y)
	}
end

local _ = function(Value, p2)
	return if Value == nil or table.find(p2.edges, Value) == nil then nil else Value
end

function StashModule.follow(p2, p3)
	-- upvalues: StashModule (copy)
	local Edge = p2.dock.edge
	local Edge1 = if Edge == nil or table.find(p3.edges, Edge) == nil then nil else Edge
	
	return if Edge1 == nil then StashModule.clampCenter(p2.center, p2.boundsSize, p2.windowSize, p3) else StashModule.target(p2.center, p2.boundsSize, p2.windowSize, p3, Edge1, p2.screenInset(Edge1))
end

function StashModule.release(p2, p3, p4)
	-- upvalues: StashModule (copy), stashedSpot (copy)
	local ResolveEdgeResult = StashModule.resolveEdge(p3.center, p3.boundsSize, p3.windowSize, p4)
	
	return if ResolveEdgeResult == nil then p2 else stashedSpot(p2, p3, p4, ResolveEdgeResult)
end

function StashModule.rest(p2, p3, p4)
	-- upvalues: stashedSpot (copy)
	local Edge = p3.dock.edge
	local Edge1 = if Edge == nil or table.find(p4.edges, Edge) == nil then nil else Edge
	
	return if Edge1 == nil then p2 else stashedSpot(p2, p3, p4, Edge1)
end

return StashModule