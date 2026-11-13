local _ = require("./types")
local _ = require("./environment_types")
local _ = require("./drag_types")
local MotionModule = require("./motion")
local DragTravelModule = require("./drag_travel")
local DragPlaneModule = require("./drag_plane")

return function(p1, p2, p3, Vector)
	-- upvalues: DragPlaneModule (copy), MotionModule (copy), DragTravelModule (copy)
	local Pivot = p2:GetPivot()
	local NewRotation = Pivot
	local PositionDelta = nil
	local Flag = false
	local Callback: (() -> ())? = nil
	
	local function _(Vector)
		-- upvalues: p1 (copy), DragPlaneModule (upval), p3 (copy)
		local Workspace = p1.config.services.Workspace
		local CurrentCamera = Workspace and Workspace.CurrentCamera
		
		if CurrentCamera then
			local v1 = CurrentCamera:ScreenPointToRay(Vector.X, Vector.Y)
			
			return DragPlaneModule(v1.Origin, v1.Direction, p3.plane)
		else
			return nil
		end
	end
	
	if Vector then
		local Workspace = p1.config.services.Workspace
		local CurrentCamera = Workspace and Workspace.CurrentCamera
		local v1 = nil
		
		if CurrentCamera then
			local v2 = CurrentCamera:ScreenPointToRay(Vector.X, Vector.Y)
			v1 = DragPlaneModule(v2.Origin, v2.Direction, p3.plane)
		else
			v1 = nil
		end
		if v1 then
			PositionDelta = Pivot.Position - v1
		end
	end
	local TweenResult = nil
	local ReducedResult = nil
	
	local _ = function()
		-- upvalues: Flag (ref), p2 (copy), ReducedResult (ref), TweenResult (ref), NewRotation (ref), p3 (copy)
		if not Flag and p2.Parent then
			p2:PivotTo(NewRotation + p3.plane.UpVector * (if ReducedResult and ReducedResult(nil) then 0 elseif TweenResult then TweenResult:peek() else 0))
		end
	end
	
	local MountResult = p1.runtime.mount(function()
		-- upvalues: ReducedResult (ref), MotionModule (upval), p1 (copy), TweenResult (ref), p3 (copy), Flag (ref), p2 (copy), NewRotation (ref)
		ReducedResult = MotionModule.reduced(p1)
		local CellResult = p1.Compose.cell(false)
		TweenResult = p1.runtime.tween(function(Callback)
			-- upvalues: CellResult (copy), p3 (upval)
			return Callback(CellResult) and p3.lift or 0
		end, {
			seconds = function(p4)
				-- upvalues: p1 (upval)
				return p1.metric("motion.durations.pressLift", p4)
			end,
			ease = p1.motionEase("present"),
			reducedMotion = ReducedResult
		})
		p1.Compose.watch(function(Callback: (any) -> ())
			-- upvalues: TweenResult (upval), ReducedResult (upval), Flag (upval), p2 (upval), NewRotation (upval), p3 (upval)
			Callback(assert(TweenResult))
			assert(ReducedResult)(Callback)
			
			if not Flag and p2.Parent then
				p2:PivotTo(NewRotation + p3.plane.UpVector * (if ReducedResult and ReducedResult(nil) then 0 elseif TweenResult then TweenResult:peek() else 0))
			end
		end)
		CellResult:set(true)
		
		return p1.Host.Folder({ Name = "FacetWorldDragLift" })
	end, p2)
	
	local _ = function()
		-- upvalues: Flag (ref), MountResult (copy), Callback (ref)
		Flag = true
		MountResult()
		
		if Callback then
			Callback()
			Callback = nil
		end
	end
	
	local function animate(CF, Callback1: () -> ())
		-- upvalues: Flag (ref), MountResult (copy), Callback (ref), ReducedResult (ref), p2 (copy), DragTravelModule (upval), p1 (copy)
		Flag = true
		MountResult()
		
		if Callback then
			Callback()
			Callback = nil
		end
		if ReducedResult and ReducedResult(nil) then
			if p2.Parent then
				p2:PivotTo(CF)
			end
			Callback1()
			
			return
		else
			local Pivot = p2:GetPivot()
			local Flag1 = false
			local DragTravelModuleResult: () -> () = DragTravelModule(p1, p2, function(Alpha)
				-- upvalues: p2 (upval), Pivot (copy), CF (copy)
				if p2.Parent then
					p2:PivotTo(Pivot:Lerp(CF, Alpha))
				end
			end, function()
				-- upvalues: Flag1 (ref), Callback (upval), Callback1 (copy)
				Flag1 = true
				
				if Callback then
					local Callback2: () -> () = Callback
					Callback = nil
					Callback2()
				end
				Callback1()
			end)
			
			if Flag1 then
				DragTravelModuleResult()
			else
				Callback = DragTravelModuleResult
			end
		end
	end
	
	return {
		move = function(Vector, p4)
			-- upvalues: Flag (ref), NewRotation (ref), p1 (copy), DragPlaneModule (upval), p3 (copy), Pivot (copy), PositionDelta (ref), p2 (copy), ReducedResult (ref), TweenResult (ref)
			if Flag then return end
			if p4 then
				NewRotation = p4
			elseif Vector then
				local Workspace = p1.config.services.Workspace
				local CurrentCamera = Workspace and Workspace.CurrentCamera
				local v3 = nil
				
				if CurrentCamera then
					local v4 = CurrentCamera:ScreenPointToRay(Vector.X, Vector.Y)
					v3 = DragPlaneModule(v4.Origin, v4.Direction, p3.plane)
				else
					v3 = nil
				end
				if v3 then
					NewRotation = Pivot.Rotation + v3 + (PositionDelta or p1.types.Vector3.zero)
				end
			else
				NewRotation = Pivot
			end
			if not Flag and p2.Parent then
				p2:PivotTo(NewRotation + p3.plane.UpVector * (if ReducedResult and ReducedResult(nil) then 0 elseif TweenResult then TweenResult:peek() else 0))
			end
		end,
		land = function(p4)
			-- upvalues: animate (copy), NewRotation (ref)
			animate(NewRotation, p4)
		end,
		release = function(p4, Callback1: () -> ())
			-- upvalues: Flag (ref), MountResult (copy), Callback (ref), animate (copy), Pivot (copy), p2 (copy)
			if p4 then
				Flag = true
				MountResult()
				
				if Callback then
					Callback()
					Callback = nil
				end
				Callback1()
			else
				animate(Pivot, Callback1)
			end
			return function()
				-- upvalues: Flag (upval), MountResult (upval), Callback (upval), p4 (copy), p2 (upval), Pivot (upval), Callback1 (copy)
				Flag = true
				MountResult()
				
				if Callback then
					Callback()
					Callback = nil
				end
				if not p4 and p2.Parent then
					p2:PivotTo(Pivot)
				end
				Callback1()
			end
		end
	}
end