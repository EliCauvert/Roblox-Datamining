local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ScrollHostLifecyclePhaseModule = require(ViewRecyclerRoblox.RobloxAdapter.ScrollHostLifecyclePhase)
local AxisMapModule = require(ViewRecyclerRoblox.RobloxAdapter.axisMap)

local function _(Value: number, p1, p2): number --[[ Line: 56 | Named "normalizeScrollOffset" ]]
	return (math.clamp(Value, 0, (math.max(0, p2 - p1))))
end

return {
	new = function(p1) --[[ Line: 60 ]]
		-- upvalues: ScrollHostLifecyclePhaseModule (copy), AxisMapModule (copy), ViewRecyclerModule (copy), RunService (copy), UserInputService (copy)
		local GetCurrentFunction = p1.getCurrent
		local Configuration = p1.getConfiguration()
		local Axis = Configuration.axis
		local Disconnected = ScrollHostLifecyclePhaseModule.Disconnected
		local Count = 0
		local v1 = nil
		local List = {}
		local Count1 = 0
		local ScrollOffset = nil
		local ClampedValue = nil
		local ClampedValue1 = nil
		local CanvasOriginOffset = 0
		local Count2 = 0
		local HeartbeatConnection = nil
		local Tbl = {}
		local Flag = false
		local ScrollFrame = nil
		local Axis1 = nil
		local v2 = nil
		
		local function _() --[[ Line: 81 | Named "sampleConfiguration" ]]
			-- upvalues: Configuration (ref), p1 (copy)
			Configuration = p1.getConfiguration()
			
			return Configuration
		end
		
		local _ = function(p2) --[[ Line: 86 | Named "resolveInstance" ]]
			-- upvalues: p1 (copy)
			return p2 or p1.getInstance()
		end
		
		local function getViewportState(ScrollFrame) --[[ Line: 90 ]]
			-- upvalues: p1 (copy), Configuration (ref), AxisMapModule (upval)
			local ScrollFrame1 = ScrollFrame or p1.getInstance()
			
			if ScrollFrame1 == nil then
				return nil
			else
				local Axis = Configuration.axis
				
				return {
					scrollOffset = AxisMapModule.mainOf(ScrollFrame1.CanvasPosition, Axis),
					viewportLength = AxisMapModule.mainOf(ScrollFrame1.AbsoluteWindowSize, Axis),
					crossAxisLength = AxisMapModule.crossOf(ScrollFrame1.AbsoluteWindowSize, Axis)
				}
			end
		end
		
		local function setHostScrollOffset(X): boolean --[[ Line: 103 ]]
			-- upvalues: p1 (copy), Configuration (ref), ViewRecyclerModule (upval)
			local _Instance = p1.getInstance()
			
			if _Instance == nil then
				return false
			else
				local CanvasPosition = _Instance.CanvasPosition
				_Instance.CanvasPosition = if Configuration.axis == ViewRecyclerModule.Axis.X then Vector2.new(X, CanvasPosition.Y) else Vector2.new(CanvasPosition.X, X)
				
				return true
			end
		end
		
		local _ = function(Kind, Offset) --[[ Line: 115 | Named "observeHostOffset" ]]
			-- upvalues: p1 (copy)
			p1.observeScrollOffset({ kind = Kind, offset = Offset })
		end
		
		local _ = function(ViewportState): number --[[ Line: 122 | Named "getLogicalScrollOffset" ]]
			-- upvalues: CanvasOriginOffset (ref), GetCurrentFunction (copy)
			return (math.clamp(ViewportState.scrollOffset - CanvasOriginOffset, 0, (math.max(0, GetCurrentFunction().contentLength - ViewportState.viewportLength))))
		end
		
		local _ = function(p2) --[[ Line: 130 | Named "notifyLogicalScrollOffset" ]]
			-- upvalues: Configuration (ref), ClampedValue1 (ref)
			local OnScrollOffsetChangedFunction: (any) -> () = Configuration.onScrollOffsetChanged
			
			if OnScrollOffsetChangedFunction ~= nil and p2 ~= ClampedValue1 then
				OnScrollOffsetChangedFunction(p2)
				ClampedValue1 = p2
			end
		end
		
		local _ = function(Value, Enabled) --[[ Line: 138 | Named "setCanvasOriginOffset" ]]
			-- upvalues: CanvasOriginOffset (ref), p1 (copy)
			if CanvasOriginOffset == Value then return end
			CanvasOriginOffset = Value
			local OnCanvasOriginMovedFunction: () -> () = p1.onCanvasOriginMoved
			
			if OnCanvasOriginMovedFunction ~= nil and Enabled ~= false then
				OnCanvasOriginMovedFunction()
			end
		end
		
		local _ = function(ViewportState) --[[ Line: 149 | Named "reportHostWrite" ]]
			-- upvalues: CanvasOriginOffset (ref), GetCurrentFunction (copy), ViewRecyclerModule (upval), p1 (copy), ScrollOffset (ref), ClampedValue (ref)
			local ClampedValue1 = math.clamp(ViewportState.scrollOffset - CanvasOriginOffset, 0, (math.max(0, GetCurrentFunction().contentLength - ViewportState.viewportLength)))
			p1.observeScrollOffset({
				kind = ViewRecyclerModule.ScrollObservationKind.Programmatic,
				offset = ClampedValue1
			})
			ScrollOffset = ViewportState.scrollOffset
			ClampedValue = ClampedValue1
		end
		
		local function publishCanvas(): number --[[ Line: 159 ]]
			-- upvalues: GetCurrentFunction (copy), CanvasOriginOffset (ref), p1 (copy), ScrollFrame (ref), Axis1 (ref), Configuration (ref), v2 (ref), Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), AxisMapModule (upval), Count1 (ref), getViewportState (copy), setHostScrollOffset (copy), ViewRecyclerModule (upval), ScrollOffset (ref), ClampedValue (ref)
			local Largest = math.max(0, GetCurrentFunction().contentLength + CanvasOriginOffset)
			local _Instance = p1.getInstance()
			
			if _Instance ~= nil then
				local IsAxisMatch: boolean = ScrollFrame == _Instance and Axis1 == Configuration.axis
				local Largest1 = if IsAxisMatch then v2 else nil
				
				if Largest1 == Largest then
					return Largest
				end
				if Disconnected == ScrollHostLifecyclePhaseModule.Synchronized and Largest1 ~= nil then
					if Largest1 <= Largest then
						Count1 += 1
						_Instance.CanvasSize = AxisMapModule.canvasSizeFor(Largest, Configuration.axis)
						Count1 -= 1
					else
						local ViewportState = getViewportState(_Instance)
						Count1 += 1
						_Instance.CanvasSize = AxisMapModule.canvasSizeFor(Largest, Configuration.axis)
						
						if ViewportState ~= nil then
							local ClampedValue1 = math.clamp(ViewportState.scrollOffset, 0, (math.max(0, Largest - ViewportState.viewportLength)))
							
							if ClampedValue1 ~= ViewportState.scrollOffset then
								setHostScrollOffset(ClampedValue1)
								local config = {
									scrollOffset = ClampedValue1,
									viewportLength = ViewportState.viewportLength,
									crossAxisLength = ViewportState.crossAxisLength
								}
								local ClampedValue2 = math.clamp(config.scrollOffset - CanvasOriginOffset, 0, (math.max(0, GetCurrentFunction().contentLength - config.viewportLength)))
								p1.observeScrollOffset({
									kind = ViewRecyclerModule.ScrollObservationKind.Programmatic,
									offset = ClampedValue2
								})
								ScrollOffset = config.scrollOffset
								ClampedValue = ClampedValue2
							end
						end
						Count1 -= 1
					end
				else
					_Instance.CanvasSize = AxisMapModule.canvasSizeFor(Largest, Configuration.axis)
				end
				ScrollFrame = _Instance
				Axis1 = Configuration.axis
				v2 = Largest
			end
			return Largest
		end
		
		local function applyProgrammaticScrollOffset(ScrollOffset1) --[[ Line: 203 ]]
			-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), Count1 (ref), setHostScrollOffset (copy), p1 (copy), getViewportState (copy), CanvasOriginOffset (ref), GetCurrentFunction (copy), ViewRecyclerModule (upval), ScrollOffset (ref), ClampedValue (ref)
			if Disconnected ~= ScrollHostLifecyclePhaseModule.Synchronized then return end
			assert(ScrollOffset1 == ScrollOffset1 and (ScrollOffset1 ~= 1e999 and ScrollOffset1 ~= -1e999), "ScrollHost: invalid offset")
			Count1 += 1
			setHostScrollOffset(ScrollOffset1)
			local ViewportState = getViewportState((p1.getInstance()))
			
			if ViewportState ~= nil then
				local ClampedValue1 = math.clamp(ViewportState.scrollOffset - CanvasOriginOffset, 0, (math.max(0, GetCurrentFunction().contentLength - ViewportState.viewportLength)))
				p1.observeScrollOffset({
					kind = ViewRecyclerModule.ScrollObservationKind.Programmatic,
					offset = ClampedValue1
				})
				ScrollOffset = ViewportState.scrollOffset
				ClampedValue = ClampedValue1
			end
			Count1 -= 1
		end
		
		local _ = function() --[[ Line: 220 | Named "stopIdleObservation" ]]
			-- upvalues: HeartbeatConnection (ref), Count2 (ref)
			if HeartbeatConnection ~= nil then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
			Count2 = 0
		end
		
		local _ = function(ScrollingFrame) --[[ Line: 228 | Named "getScrollVelocity" ]]
			-- upvalues: AxisMapModule (upval), Configuration (ref)
			return AxisMapModule.mainOf(ScrollingFrame:GetScrollVelocity(), Configuration.axis)
		end
		
		local _ = function() --[[ Line: 232 | Named "isHostScrolling" ]]
			-- upvalues: Tbl (copy), p1 (copy), AxisMapModule (upval), Configuration (ref), Flag (ref)
			if next(Tbl) == nil then
				local _Instance = p1.getInstance()
				
				return _Instance ~= nil and (math.abs((AxisMapModule.mainOf(_Instance:GetScrollVelocity(), Configuration.axis))) >= 0.5 or Flag)
			else
				return true
			end
		end
		
		local _ = function(): boolean --[[ Line: 246 | Named "isAtLeadingScrollBoundary" ]]
			-- upvalues: p1 (copy), AxisMapModule (upval), Configuration (ref)
			local _Instance = p1.getInstance()
			
			return _Instance ~= nil and AxisMapModule.mainOf(_Instance.CanvasPosition, Configuration.axis) <= 0.5
		end
		
		local function settleCanvasOriginOffset(ScrollOffset) --[[ Line: 251 ]]
			-- upvalues: CanvasOriginOffset (ref), HeartbeatConnection (ref), Count2 (ref), getViewportState (copy), GetCurrentFunction (copy), p1 (copy), publishCanvas (copy), applyProgrammaticScrollOffset (copy), Configuration (ref), ClampedValue1 (ref)
			if CanvasOriginOffset == 0 then
				if HeartbeatConnection ~= nil then
					HeartbeatConnection:Disconnect()
					HeartbeatConnection = nil
				end
				Count2 = 0
				
				return
			else
				local ViewportState = getViewportState(nil)
				
				if ViewportState == nil then return end
				local ScrollOffset1 = ScrollOffset or math.clamp(ViewportState.scrollOffset - CanvasOriginOffset, 0, (math.max(0, GetCurrentFunction().contentLength - ViewportState.viewportLength)))
				
				if CanvasOriginOffset ~= 0 then
					CanvasOriginOffset = 0
					local OnCanvasOriginMovedFunction: () -> () = p1.onCanvasOriginMoved
					
					if OnCanvasOriginMovedFunction ~= nil then
						OnCanvasOriginMovedFunction()
					end
				end
				publishCanvas()
				applyProgrammaticScrollOffset(ScrollOffset1)
				local OnScrollOffsetChangedFunction: (any) -> () = Configuration.onScrollOffsetChanged
				
				if OnScrollOffsetChangedFunction ~= nil and ScrollOffset1 ~= ClampedValue1 then
					OnScrollOffsetChangedFunction(ScrollOffset1)
					ClampedValue1 = ScrollOffset1
				end
				if HeartbeatConnection ~= nil then
					HeartbeatConnection:Disconnect()
					HeartbeatConnection = nil
				end
				Count2 = 0
			end
		end
		
		local _ = function() --[[ Line: 268 | Named "observeUntilIdle" ]]
			-- upvalues: HeartbeatConnection (ref), CanvasOriginOffset (ref), RunService (upval), Flag (ref), Count2 (ref), Tbl (copy), p1 (copy), AxisMapModule (upval), Configuration (ref), settleCanvasOriginOffset (copy)
			if HeartbeatConnection == nil and CanvasOriginOffset ~= 0 then
				HeartbeatConnection = RunService.Heartbeat:Connect(function() --[[ Line: 272 ]]
					-- upvalues: Flag (upval), Count2 (upval), Tbl (upval), p1 (upval), AxisMapModule (upval), Configuration (upval), settleCanvasOriginOffset (upval)
					local v3: boolean = Flag
					Flag = false
					
					if v3 then
						Count2 = 0
						
						return
					end
					local IsMagnitudeAbove = nil
					if next(Tbl) == nil then
						local _Instance = p1.getInstance()
						IsMagnitudeAbove = _Instance ~= nil and (math.abs((AxisMapModule.mainOf(_Instance:GetScrollVelocity(), Configuration.axis))) >= 0.5 or Flag)
					else
						IsMagnitudeAbove = true
					end
					if IsMagnitudeAbove then
						Count2 = 0
						
						return
					end
					Count2 += 1
					
					if Count2 >= 2 then
						settleCanvasOriginOffset(nil)
					end
				end)
				
				return
			end
		end
		
		local function disconnectHost() --[[ Line: 290 ]]
			-- upvalues: HeartbeatConnection (ref), Count2 (ref), List (copy), Tbl (copy), v1 (ref), ScrollFrame (ref), Axis1 (ref), v2 (ref), ScrollOffset (ref), ClampedValue (ref), ClampedValue1 (ref), Flag (ref), CanvasOriginOffset (ref), p1 (copy)
			if HeartbeatConnection ~= nil then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
			Count2 = 0
			
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
			table.clear(Tbl)
			v1 = nil
			ScrollFrame = nil
			Axis1 = nil
			v2 = nil
			ScrollOffset = nil
			ClampedValue = nil
			ClampedValue1 = nil
			Flag = false
			
			if CanvasOriginOffset == 0 then return end
			CanvasOriginOffset = 0
			local OnCanvasOriginMovedFunction: () -> () = p1.onCanvasOriginMoved
			
			if OnCanvasOriginMovedFunction ~= nil then
				OnCanvasOriginMovedFunction()
			end
		end
		
		local function synchronizeViewport(p2) --[[ Line: 308 ]]
			-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), getViewportState (copy), p1 (copy), CanvasOriginOffset (ref), GetCurrentFunction (copy), ViewRecyclerModule (upval), ScrollOffset (ref), ClampedValue (ref), Configuration (ref)
			if Disconnected ~= ScrollHostLifecyclePhaseModule.Synchronized then return end
			local ViewportState = getViewportState(p2)
			
			if ViewportState == nil then return end
			p1.setViewportSize(ViewportState.viewportLength, ViewportState.crossAxisLength)
			local ViewportState1 = getViewportState(p2)
			
			if ViewportState1 ~= nil then
				ViewportState = ViewportState1
			end
			local ClampedValue1 = math.clamp(ViewportState.scrollOffset - CanvasOriginOffset, 0, (math.max(0, GetCurrentFunction().contentLength - ViewportState.viewportLength)))
			p1.observeScrollOffset({
				kind = ViewRecyclerModule.ScrollObservationKind.Programmatic,
				offset = ClampedValue1
			})
			ScrollOffset = ViewportState.scrollOffset
			ClampedValue = ClampedValue1
			local OnViewportChangedFunction: (any) -> () = Configuration.onViewportChanged
			
			if OnViewportChangedFunction ~= nil then
				OnViewportChangedFunction(p2.AbsoluteWindowSize)
			end
		end
		
		local function synchronizeScrollOffset(p2, Enabled) --[[ Line: 328 ]]
			-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), getViewportState (copy), CanvasOriginOffset (ref), GetCurrentFunction (copy), Count1 (ref), ScrollOffset (ref), ClampedValue (ref), ViewRecyclerModule (upval), p1 (copy), Flag (ref), Count2 (ref), settleCanvasOriginOffset (copy), Configuration (ref), ClampedValue1 (ref)
			if Disconnected ~= ScrollHostLifecyclePhaseModule.Synchronized then return end
			local ViewportState = getViewportState(p2)
			
			if ViewportState == nil then return end
			local ClampedValue2 = math.clamp(ViewportState.scrollOffset - CanvasOriginOffset, 0, (math.max(0, GetCurrentFunction().contentLength - ViewportState.viewportLength)))
			local IsCountMatch = Count1 == 0
			
			if IsCountMatch and ScrollOffset ~= nil then
				if math.abs(ViewportState.scrollOffset - ScrollOffset) < 0.5 then
					IsCountMatch = false
				else
					ScrollOffset = nil
				end
			end
			if IsCountMatch and ClampedValue2 ~= ClampedValue then
				p1.observeScrollOffset({
					kind = ViewRecyclerModule.ScrollObservationKind.User,
					offset = ClampedValue2
				})
				ClampedValue = ClampedValue2
			end
			if IsCountMatch and Enabled == true then
				Flag = true
			end
			if IsCountMatch and CanvasOriginOffset ~= 0 then
				Count2 = 0
				
				if ViewportState.scrollOffset <= 0.5 then
					settleCanvasOriginOffset(nil)
				end
			end
			local OnScrollOffsetChangedFunction: (any) -> () = Configuration.onScrollOffsetChanged
			
			if OnScrollOffsetChangedFunction ~= nil and ClampedValue2 ~= ClampedValue1 then
				OnScrollOffsetChangedFunction(ClampedValue2)
				ClampedValue1 = ClampedValue2
			end
		end
		
		local _ = function(Input): boolean --[[ Line: 365 | Named "isPointerInput" ]]
			return Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1
		end
		
		local function connectHost(Object) --[[ Line: 369 ]]
			-- upvalues: v1 (ref), disconnectHost (copy), List (copy), Configuration (ref), p1 (copy), publishCanvas (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy), Tbl (copy), UserInputService (upval)
			if v1 == Object then return end
			disconnectHost()
			v1 = Object
			
			if Object ~= nil and typeof(Object) == "Instance" then
				table.insert(List, Object:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 380 ]]
					-- upvalues: Configuration (upval), p1 (upval), publishCanvas (upval), synchronizeViewport (upval), Object (copy)
					Configuration = p1.getConfiguration()
					publishCanvas()
					synchronizeViewport(Object)
				end))
				table.insert(List, Object:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 388 ]]
					-- upvalues: Configuration (upval), p1 (upval), synchronizeScrollOffset (upval), Object (copy)
					Configuration = p1.getConfiguration()
					synchronizeScrollOffset(Object, true)
				end))
				table.insert(List, Object.InputBegan:Connect(function(Input) --[[ Line: 395 ]]
					-- upvalues: Tbl (upval)
					if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1 then
						Tbl[Input] = true
					end
				end))
				table.insert(List, Object.InputEnded:Connect(function(Input) --[[ Line: 403 ]]
					-- upvalues: Tbl (upval)
					Tbl[Input] = nil
				end))
				table.insert(List, UserInputService.InputEnded:Connect(function(Input) --[[ Line: 409 ]]
					-- upvalues: Tbl (upval)
					Tbl[Input] = nil
				end))
				
				return
			end
		end
		
		return {
			connect = function() --[[ Line: 443 ]]
				-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), Count (ref), Configuration (ref), p1 (copy), Axis (ref), connectHost (copy), publishCanvas (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy), disconnectHost (copy)
				assert(Disconnected == ScrollHostLifecyclePhaseModule.Disconnected, "ScrollHost: already connected")
				Count += 1
				local Count1: number = Count
				Configuration = p1.getConfiguration()
				Axis = Configuration.axis
				Disconnected = ScrollHostLifecyclePhaseModule.Priming
				connectHost(p1.getInstance())
				local Success, Result = pcall(function() --[[ Line: 451 ]]
					-- upvalues: Disconnected (upval), ScrollHostLifecyclePhaseModule (upval), publishCanvas (upval), p1 (upval), synchronizeViewport (upval), synchronizeScrollOffset (upval)
					Disconnected = ScrollHostLifecyclePhaseModule.Synchronized
					publishCanvas()
					local _Instance = p1.getInstance()
					
					if _Instance ~= nil then
						synchronizeViewport(_Instance)
						synchronizeScrollOffset(_Instance)
					end
				end)
				
				if not Success then
					Disconnected = ScrollHostLifecyclePhaseModule.Disconnected
					disconnectHost()
					error(Result, 0)
				end
				local Flag = false
				
				return function() --[[ Line: 466 ]]
					-- upvalues: Flag (ref), Disconnected (upval), ScrollHostLifecyclePhaseModule (upval), Count (upval), Count1 (copy), disconnectHost (upval)
					if Flag then return end
					Flag = true
					
					if Disconnected ~= ScrollHostLifecyclePhaseModule.Disconnected and Count == Count1 then
						Disconnected = ScrollHostLifecyclePhaseModule.Disconnected
						disconnectHost()
					end
				end
			end,
			scrollingFrameChanged = function() --[[ Line: 415 ]]
				-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), Configuration (ref), p1 (copy), connectHost (copy), publishCanvas (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy)
				if Disconnected == ScrollHostLifecyclePhaseModule.Disconnected then return end
				Configuration = p1.getConfiguration()
				local _Instance = p1.getInstance()
				connectHost(_Instance)
				
				if _Instance ~= nil then
					publishCanvas()
					synchronizeViewport(_Instance)
					synchronizeScrollOffset(_Instance)
				end
			end,
			configurationChanged = function() --[[ Line: 429 ]]
				-- upvalues: Configuration (ref), p1 (copy), Axis (ref), Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), publishCanvas (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy)
				Configuration = p1.getConfiguration()
				local Configuration1 = Configuration
				local IsNotAxisMatch = Configuration1.axis ~= Axis
				Axis = Configuration1.axis
				
				if Disconnected ~= ScrollHostLifecyclePhaseModule.Disconnected and IsNotAxisMatch then
					local _Instance = p1.getInstance()
					
					if _Instance ~= nil then
						publishCanvas()
						synchronizeViewport(_Instance)
						synchronizeScrollOffset(_Instance)
					end
				end
			end,
			applyRecord = function(p2, Callback: () -> ()) --[[ Line: 478 ]]
				-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), Configuration (ref), p1 (copy), CanvasOriginOffset (ref), Tbl (copy), AxisMapModule (upval), Flag (ref), publishCanvas (copy), Count2 (ref), HeartbeatConnection (ref), RunService (upval), settleCanvasOriginOffset (copy), ClampedValue (ref), ClampedValue1 (ref), applyProgrammaticScrollOffset (copy)
				if Disconnected == ScrollHostLifecyclePhaseModule.Disconnected then
					Callback()
					
					return
				end
				Configuration = p1.getConfiguration()
				local ScrollCorrection = p2.scrollCorrection
				local ScrollOffset = if p2.scrollPositionChanged then p2.scrollState.scrollOffset else nil
				local IsMagnitudeAbove = false
				repeat
					if ScrollCorrection == 0 then break end
					IsMagnitudeAbove = p2.scrollPositionFollowsCorrection
					
					if not IsMagnitudeAbove then break end
					if CanvasOriginOffset == 0 then
						if next(Tbl) == nil then
							local _Instance = p1.getInstance()
							IsMagnitudeAbove = _Instance ~= nil and (math.abs((AxisMapModule.mainOf(_Instance:GetScrollVelocity(), Configuration.axis))) >= 0.5 or Flag)
						else
							IsMagnitudeAbove = true
						end
						if not IsMagnitudeAbove then break end
					end
					local _Instance = p1.getInstance()
					IsMagnitudeAbove = not (_Instance ~= nil and AxisMapModule.mainOf(_Instance.CanvasPosition, Configuration.axis) <= 0.5)
				until true
				if IsMagnitudeAbove then
					local CanvasOriginOffsetDelta = CanvasOriginOffset - ScrollCorrection
					
					if CanvasOriginOffset ~= CanvasOriginOffsetDelta then
						CanvasOriginOffset = CanvasOriginOffsetDelta
						
						if p1.onCanvasOriginMoved == nil then
						end
					end
					Callback()
					
					if p1.onCanvasOriginMoved ~= nil then
						p1.onCanvasOriginMoved()
					end
					publishCanvas()
					Count2 = 0
					
					if HeartbeatConnection == nil and CanvasOriginOffset ~= 0 then
						HeartbeatConnection = RunService.Heartbeat:Connect(function() --[[ Line: 272 ]]
							-- upvalues: Flag (upval), Count2 (upval), Tbl (upval), p1 (upval), AxisMapModule (upval), Configuration (upval), settleCanvasOriginOffset (upval)
							local v3: boolean = Flag
							Flag = false
							
							if v3 then
								Count2 = 0
								
								return
							end
							local IsMagnitudeAbove = nil
							if next(Tbl) == nil then
								local _Instance = p1.getInstance()
								IsMagnitudeAbove = _Instance ~= nil and (math.abs((AxisMapModule.mainOf(_Instance:GetScrollVelocity(), Configuration.axis))) >= 0.5 or Flag)
							else
								IsMagnitudeAbove = true
							end
							if IsMagnitudeAbove then
								Count2 = 0
								
								return
							end
							Count2 += 1
							
							if Count2 >= 2 then
								settleCanvasOriginOffset(nil)
							end
						end)
					end
					if ScrollOffset ~= nil then
						ClampedValue = ScrollOffset
						local OnScrollOffsetChangedFunction: (any) -> () = Configuration.onScrollOffsetChanged
						
						if OnScrollOffsetChangedFunction ~= nil and ScrollOffset ~= ClampedValue1 then
							OnScrollOffsetChangedFunction(ScrollOffset)
							ClampedValue1 = ScrollOffset
						end
					end
				else
					Callback()
					
					if CanvasOriginOffset == 0 then
						if p2.scrollPositionChanged or p2.contentLengthChanged then
							publishCanvas()
						end
						if ScrollOffset ~= nil then
							applyProgrammaticScrollOffset(ScrollOffset)
						end
					else
						settleCanvasOriginOffset(ScrollOffset)
					end
				end
				if p2.contentLengthChanged then
					local OnContentLengthChangedFunction: (any) -> () = Configuration.onContentLengthChanged
					
					if OnContentLengthChangedFunction ~= nil then
						OnContentLengthChangedFunction(p2.contentLength)
					end
				end
				if p2.startReached and Configuration.onStartReached ~= nil then
					Configuration.onStartReached()
				end
				if p2.endReached and Configuration.onEndReached ~= nil then
					Configuration.onEndReached()
				end
			end,
			getCanvasOriginOffset = function() --[[ Line: 541 ]]
				-- upvalues: CanvasOriginOffset (ref)
				return CanvasOriginOffset
			end,
			isReady = function(): boolean --[[ Line: 544 ]]
				-- upvalues: Configuration (ref), p1 (copy), getViewportState (copy)
				Configuration = p1.getConfiguration()
				
				return getViewportState(nil) ~= nil
			end
		}
	end
}