local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local BehaviorsModule = require(Parent.Behaviors)
local _ = require(Parent.Corner)
local EdgeModule = require(Parent.Edge)
local GeometryModule = require(Parent.Geometry)
local PlacementKindModule = require(Parent.PlacementKind)
local SnapModule = require(Parent.Snap)
local StashModule = require(Parent.Stash)
local _ = require(Parent.Types)
local _UDim2 = UDim2.fromScale(0.5, 0.5)
local config = {
	minimumHiddenFraction = 0.25,
	visiblePixels = 28,
	edges = { EdgeModule.Left, EdgeModule.Right }
}
local config1 = { dampingRatio = 1, frequency = 4 }

local function toVector2(Vector): Vector2
	return Vector2.new(Vector.x, Vector.y)
end

local function _(Frame: Frame, Left)
	-- upvalues: EdgeModule (copy)
	local Parent = Frame.Parent
	local XDelta = Frame.AbsolutePosition.X - Parent.AbsolutePosition.X
	
	return if Left == EdgeModule.Left then XDelta else Parent.AbsoluteSize.X - Frame.AbsoluteSize.X - XDelta
end

local function toPlacement(Corner, Edge)
	-- upvalues: PlacementKindModule (copy)
	return if Edge == nil then if Corner == nil then { kind = PlacementKindModule.Free } else { kind = PlacementKindModule.CornerDocked, corner = Corner } else { kind = PlacementKindModule.Stashed, edge = Edge }
end

return function(p1)
	-- upvalues: BehaviorsModule (copy), config (copy), ReactModule (copy), toPlacement (copy), toVector2 (copy), ReactOtterModule (copy), config1 (copy), EdgeModule (copy), GeometryModule (copy), _UDim2 (copy), SnapModule (copy), StashModule (copy)
	local Behavior = p1.behavior or BehaviorsModule.Contained
	local StashOptions = if p1.enableStash and p1.draggable ~= false then p1.stashOptions or config else nil
	local DragThreshold = p1.dragThreshold or 25
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult2 = ReactModule.useRef({})
	local Idle = ReactModule.useRef("Idle")
	local UseRefResult3 = ReactModule.useRef(Vector2.zero)
	local UseRefResult4 = ReactModule.useRef(Vector2.zero)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(false)
	local UseRefResult7 = ReactModule.useRef(p1.onPlacementChanged)
	UseRefResult7.current = p1.onPlacementChanged
	local UseRefResult8 = ReactModule.useRef(false)
	
	local function setDock(Corner, Edge)
		-- upvalues: UseRefResult2 (copy), UseRefResult8 (copy), UseRefResult7 (copy), toPlacement (upval)
		local Current = UseRefResult2.current
		
		if UseRefResult8.current and Current.corner == Corner and Current.edge == Edge then return end
		UseRefResult8.current = true
		UseRefResult2.current = { corner = Corner, edge = Edge }
		local CurrentFunction: (any) -> () = UseRefResult7.current
		
		if CurrentFunction ~= nil then
			CurrentFunction((toPlacement(Corner, Edge)))
		end
	end
	
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult6 (copy)
		UseRefResult6.current = false
	end, {})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local UseMotorResult = ReactOtterModule.useMotor({ x = 0, y = 0 }, ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult2 (copy), toVector2 (upval)
		UseBindingResult2(toVector2(p2))
	end, {}), UseResult)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy)
		return UseBindingResult:map(function(Vector): UDim2
			return UDim2.fromOffset(Vector.X, Vector.Y)
		end)
	end, { UseBindingResult })
	local UseResult1 = ReactModule.useCallback(function(Vector)
		-- upvalues: UseBindingResult2 (copy), UseMotorResult (copy), ReactOtterModule (upval)
		UseBindingResult2(Vector)
		UseMotorResult({
			x = ReactOtterModule.instant(Vector.X),
			y = ReactOtterModule.instant(Vector.Y)
		})
	end, {})
	
	local function moveTo(RestResult, p2)
		-- upvalues: setDock (copy), UseRefResult6 (copy), UseMotorResult (copy), ReactOtterModule (upval), config1 (upval), UseResult1 (copy)
		setDock(RestResult.corner, RestResult.edge)
		
		if p2 then
			UseRefResult6.current = true
			UseMotorResult({
				x = ReactOtterModule.spring(RestResult.center.X, config1),
				y = ReactOtterModule.spring(RestResult.center.Y, config1)
			})
			
			return
		else
			UseResult1(RestResult.center)
		end
	end
	
	local function _(Current)
		-- upvalues: setDock (copy), UseResult1 (copy)
		setDock(Current.corner, Current.edge)
		UseResult1(Current.center)
	end
	
	local _ = function(p2)
		-- upvalues: moveTo (copy)
		moveTo(p2, true)
	end
	
	local function placeFor(Center)
		-- upvalues: UseRefResult (copy), UseRefResult5 (copy), UseRefResult1 (copy), UseRefResult2 (copy), EdgeModule (upval)
		local Current = UseRefResult.current
		
		return {
			center = Center,
			desiredCenter = UseRefResult5.current,
			boundsSize = Current.AbsoluteSize,
			windowSize = UseRefResult1.current.AbsoluteSize,
			dock = UseRefResult2.current,
			screenInset = function(Left)
				-- upvalues: Current (copy), EdgeModule (upval)
				local Parent = Current.Parent
				local XDelta = Current.AbsolutePosition.X - Parent.AbsolutePosition.X
				
				return if Left == EdgeModule.Left then XDelta else Parent.AbsoluteSize.X - Current.AbsoluteSize.X - XDelta
			end
		}
	end
	
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), GeometryModule (upval), UseRefResult5 (copy), p1 (copy), _UDim2 (upval), Idle (copy), UseBindingResult (copy), placeFor (copy), SnapModule (upval), Behavior (copy), StashOptions (copy), StashModule (upval), UseRefResult6 (copy), moveTo (copy), setDock (copy), UseResult1 (copy), UseStateResult2 (copy)
		local AbsoluteSize = UseRefResult.current.AbsoluteSize
		local AbsoluteSize1 = UseRefResult1.current.AbsoluteSize
		
		if not GeometryModule.hasPositiveSize(AbsoluteSize) or not GeometryModule.hasPositiveSize(AbsoluteSize1) then return end
		local NoCurrent = UseRefResult5.current == nil
		
		if NoCurrent then
			UseRefResult5.current = GeometryModule.resolveCenter(p1.initialCenter or _UDim2, AbsoluteSize)
		elseif Idle.current ~= "Idle" then return end
		local PlaceForResult = placeFor(if NoCurrent then UseRefResult5.current else UseBindingResult:getValue())
		local RestResult = SnapModule[Behavior].rest(PlaceForResult)
		
		if StashOptions ~= nil then
			RestResult = StashModule.rest(RestResult, PlaceForResult, StashOptions)
		end
		if UseRefResult6.current then
			moveTo(RestResult, true)
		else
			setDock(RestResult.corner, RestResult.edge)
			UseResult1(RestResult.center)
		end
		if NoCurrent then
			UseStateResult2(true)
		end
	end, { Behavior, p1.initialCenter, StashOptions })
	local UseRefResult9 = ReactModule.useRef(UseResult11)
	UseRefResult9.current = UseResult11
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseResult11 (copy)
		UseResult11()
	end, { UseResult11 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: Idle (copy), UseRefResult9 (copy)
		if Idle.current ~= "Idle" then
			Idle.current = "Idle"
			UseRefResult9.current()
			
			return
		end
	end, { p1.draggable, p1.dragInputTarget })
	local UseResult2 = ReactModule.useCallback(function(_, p2)
		-- upvalues: UseRefResult3 (copy), Idle (copy), DragThreshold (copy), UseRefResult4 (copy), UseRefResult5 (copy), placeFor (copy), StashOptions (copy), StashModule (upval), GeometryModule (upval), UseResult1 (copy)
		local Direction = p2 - UseRefResult3.current
		local Magnitude: number = Direction.Magnitude
		
		if Idle.current == "Pressed" and Magnitude <= DragThreshold then
			return nil
		else
			Idle.current = "Dragging"
			local Largest = math.max(Magnitude - DragThreshold, 0)
			local NewCurrent = UseRefResult4.current + (if Magnitude > 0 then Direction.Unit * Largest else Vector2.zero)
			UseRefResult5.current = NewCurrent
			local PlaceForResult = placeFor(NewCurrent)
			local ClampCenterResult = if StashOptions == nil then GeometryModule.clampCenter(PlaceForResult.center, PlaceForResult.boundsSize, PlaceForResult.windowSize) else StashModule.follow(PlaceForResult, StashOptions)
			UseResult1(ClampCenterResult)
			
			return ClampCenterResult
		end
	end, { DragThreshold, StashOptions })
	
	return {
		boundsRef = UseRefResult,
		initialized = UseStateResult,
		onDragContinue = UseResult2,
		onDragEnd = ReactModule.useCallback(function(_, p2)
			-- upvalues: UseResult2 (copy), Idle (copy), SnapModule (upval), Behavior (copy), UseRefResult2 (copy), placeFor (copy), UseRefResult4 (copy), moveTo (copy), p1 (copy), StashOptions (copy), StashModule (upval), setDock (copy), UseResult1 (copy)
			local UseResultResult = UseResult2(nil, p2)
			Idle.current = "Idle"
			local SnapModuleEntry = SnapModule[Behavior]
			
			if UseResultResult == nil then
				local HasEdge = UseRefResult2.current.edge ~= nil
				moveTo(SnapModuleEntry.rest((placeFor(UseRefResult4.current))), true)
				
				if not HasEdge and p1.onActivated ~= nil then
					p1.onActivated()
				end
				return
			else
				local PlaceForResult = placeFor(UseResultResult)
				local ReleaseResult = SnapModuleEntry.release(PlaceForResult)
				
				if StashOptions ~= nil then
					ReleaseResult = StashModule.release(ReleaseResult, PlaceForResult, StashOptions)
				end
				if ReleaseResult.edge == nil and not SnapModuleEntry.animateRelease then
					setDock(ReleaseResult.corner, ReleaseResult.edge)
					UseResult1(ReleaseResult.center)
					
					return
				else
					moveTo(ReleaseResult, true)
				end
			end
		end, { Behavior, UseResult2, p1.onActivated, StashOptions }),
		onDragStart = ReactModule.useCallback(function(_, Current)
			-- upvalues: UseRefResult6 (copy), UseBindingResult (copy), UseResult1 (copy), UseRefResult3 (copy), UseRefResult4 (copy), Idle (copy)
			UseRefResult6.current = false
			local Value = UseBindingResult:getValue()
			UseResult1(Value)
			UseRefResult3.current = Current
			UseRefResult4.current = Value
			Idle.current = "Pressed"
		end, {}),
		position = UseMemoResult,
		refit = UseResult11,
		windowRef = UseRefResult1
	}
end