local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local ScrollHostLifecyclePhaseModule = require(ViewRecyclerRoblox.RobloxAdapter.ScrollHostLifecyclePhase)
local AxisMapModule = require(ViewRecyclerRoblox.RobloxAdapter.axisMap)
local CreateCoordinatorFunction = ViewRecyclerModule.Adapter.ScrollPolicy.createCoordinator

return {
	new = function(p1) --[[ Line: 48 ]]
		-- upvalues: ScrollHostLifecyclePhaseModule (copy), AxisMapModule (copy), ViewRecyclerModule (copy), CreateCoordinatorFunction (copy)
		local DispatchFunction = p1.dispatch
		local GetSnapshotFunction = p1.getSnapshot
		local QueryFunction = p1.query
		local Configuration = p1.getConfiguration()
		local Axis = Configuration.axis
		local DataSource = Configuration.dataSource
		local Disconnected = ScrollHostLifecyclePhaseModule.Disconnected
		local Count = 0
		local v1 = nil
		local Tbl = {}
		local Count1 = 0
		local v2 = nil
		
		local function _() --[[ Line: 62 | Named "sampleConfiguration" ]]
			-- upvalues: Configuration (ref), p1 (copy)
			Configuration = p1.getConfiguration()
			
			return Configuration
		end
		
		local _ = function(p2) --[[ Line: 67 | Named "resolveInstance" ]]
			-- upvalues: p1 (copy)
			return p2 or p1.getInstance()
		end
		
		local function getViewportState(ScrollFrame) --[[ Line: 71 ]]
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
		
		local function setHostScrollOffset(X): boolean --[[ Line: 84 ]]
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
		
		local function observeHostOffset(Programmatic, ScrollOffset) --[[ Line: 96 ]]
			-- upvalues: DispatchFunction (copy), ViewRecyclerModule (upval)
			DispatchFunction({
				type = ViewRecyclerModule.VirtualizerCommandType.ObserveScrollOffset,
				observation = { kind = Programmatic, offset = ScrollOffset }
			})
		end
		
		local _ = function(Offset) --[[ Line: 106 | Named "reportHostWrite" ]]
			-- upvalues: observeHostOffset (copy), ViewRecyclerModule (upval), v2 (ref)
			observeHostOffset(ViewRecyclerModule.ScrollObservationKind.Programmatic, Offset)
			v2 = Offset
		end
		
		local Coordinator = CreateCoordinatorFunction({
			getItemCount = function() --[[ Line: 115 ]]
				-- upvalues: Configuration (ref)
				return Configuration.dataSource.getItemCount()
			end,
			getScrollState = function() --[[ Line: 118 ]]
				-- upvalues: QueryFunction (copy), ViewRecyclerModule (upval)
				return QueryFunction({
					type = ViewRecyclerModule.VirtualizerQueryType.GetScrollState
				})
			end,
			getScrollOffsetForItem = function(Index, Alignment) --[[ Line: 121 ]]
				-- upvalues: QueryFunction (copy), ViewRecyclerModule (upval)
				return QueryFunction({
					type = ViewRecyclerModule.VirtualizerQueryType.GetScrollOffsetForItem,
					index = Index,
					alignment = Alignment
				})
			end,
			applyScrollAnchorOffset = function(Offset) --[[ Line: 128 ]]
				-- upvalues: DispatchFunction (copy), ViewRecyclerModule (upval)
				return DispatchFunction({
					type = ViewRecyclerModule.VirtualizerCommandType.ApplyScrollAnchorOffset,
					offset = Offset
				}).result
			end,
			getViewportState = getViewportState,
			getInitialScrollAlignment = function() --[[ Line: 132 ]]
				-- upvalues: Configuration (ref)
				return Configuration.initialScrollAlignment
			end,
			getAutoScrollPolicy = function() --[[ Line: 135 ]]
				-- upvalues: Configuration (ref)
				return Configuration.autoScrollOnChange
			end,
			getStartReachedThreshold = function() --[[ Line: 138 ]]
				-- upvalues: Configuration (ref)
				return Configuration.startReachedThreshold
			end,
			getOnStartReached = function() --[[ Line: 141 ]]
				-- upvalues: Configuration (ref)
				return Configuration.onStartReached
			end,
			getOnEndReached = function() --[[ Line: 144 ]]
				-- upvalues: Configuration (ref)
				return Configuration.onEndReached
			end,
			onContentLengthChanged = function(p2) --[[ Line: 147 ]]
				-- upvalues: Configuration (ref)
				local OnContentLengthChangedFunction: (any) -> () = Configuration.onContentLengthChanged
				
				if OnContentLengthChangedFunction ~= nil then
					OnContentLengthChangedFunction(p2)
				end
			end
		})
		
		local function publishCanvas() --[[ Line: 155 ]]
			-- upvalues: GetSnapshotFunction (copy), p1 (copy), Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), AxisMapModule (upval), Configuration (ref), getViewportState (copy), Count1 (ref), observeHostOffset (copy), ViewRecyclerModule (upval), v2 (ref)
			local ContentLength = GetSnapshotFunction().contentLength
			local _Instance = p1.getInstance()
			
			if _Instance ~= nil then
				if Disconnected ~= ScrollHostLifecyclePhaseModule.Synchronized then
					_Instance.CanvasSize = AxisMapModule.canvasSizeFor(ContentLength, Configuration.axis)
					
					return ContentLength
				end
				local ViewportState = getViewportState(_Instance)
				Count1 += 1
				_Instance.CanvasSize = AxisMapModule.canvasSizeFor(ContentLength, Configuration.axis)
				local ViewportState1 = getViewportState(_Instance)
				
				if ViewportState ~= nil and ViewportState1 ~= nil and ViewportState1.scrollOffset ~= ViewportState.scrollOffset then
					local ScrollOffset = ViewportState1.scrollOffset
					observeHostOffset(ViewRecyclerModule.ScrollObservationKind.Programmatic, ScrollOffset)
					v2 = ScrollOffset
				end
				Count1 -= 1
			end
			return ContentLength
		end
		
		local function applyProgrammaticScrollOffset(Offset) --[[ Line: 175 ]]
			-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), Count1 (ref), setHostScrollOffset (copy), p1 (copy), getViewportState (copy), observeHostOffset (copy), ViewRecyclerModule (upval), v2 (ref)
			if Disconnected ~= ScrollHostLifecyclePhaseModule.Synchronized then return end
			assert(Offset == Offset and (Offset ~= 1e999 and Offset ~= -1e999), "ScrollingFrameSync: invalid offset")
			Count1 += 1
			setHostScrollOffset(Offset)
			local ViewportState = getViewportState((p1.getInstance()))
			
			if ViewportState ~= nil then
				local ScrollOffset = ViewportState.scrollOffset
				observeHostOffset(ViewRecyclerModule.ScrollObservationKind.Programmatic, ScrollOffset)
				v2 = ScrollOffset
			end
			Count1 -= 1
		end
		
		local _ = function() --[[ Line: 195 | Named "disconnectHost" ]]
			-- upvalues: Tbl (copy), v1 (ref), v2 (ref)
			for _, Connection in Tbl do
				Connection:Disconnect()
			end
			table.clear(Tbl)
			v1 = nil
			v2 = nil
		end
		
		local function synchronizeViewport(p2) --[[ Line: 204 ]]
			-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), getViewportState (copy), DispatchFunction (copy), ViewRecyclerModule (upval), observeHostOffset (copy), v2 (ref), Coordinator (copy), Configuration (ref)
			if Disconnected ~= ScrollHostLifecyclePhaseModule.Synchronized then return end
			local ViewportState = getViewportState(p2)
			
			if ViewportState == nil then return end
			DispatchFunction({
				type = ViewRecyclerModule.VirtualizerCommandType.SetViewportSize,
				scrollAxisLength = ViewportState.viewportLength,
				crossAxisLength = ViewportState.crossAxisLength
			})
			local ViewportState1 = getViewportState(p2)
			
			if ViewportState1 ~= nil then
				ViewportState = ViewportState1
			end
			local ScrollOffset = ViewportState.scrollOffset
			observeHostOffset(ViewRecyclerModule.ScrollObservationKind.Programmatic, ScrollOffset)
			v2 = ScrollOffset
			Coordinator.onViewportChanged()
			Coordinator.checkEdges()
			local OnViewportChangedFunction: (any) -> () = Configuration.onViewportChanged
			
			if OnViewportChangedFunction ~= nil then
				OnViewportChangedFunction(p2.AbsoluteWindowSize)
			end
		end
		
		local function synchronizeScrollOffset(p2) --[[ Line: 230 ]]
			-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), getViewportState (copy), Count1 (ref), v2 (ref), observeHostOffset (copy), ViewRecyclerModule (upval), Coordinator (copy), Configuration (ref)
			if Disconnected ~= ScrollHostLifecyclePhaseModule.Synchronized then return end
			local ViewportState = getViewportState(p2)
			
			if ViewportState == nil then return end
			local IsCountMatch = Count1 == 0
			
			if IsCountMatch and v2 ~= nil then
				if math.abs(ViewportState.scrollOffset - v2) < 0.5 then
					IsCountMatch = false
				else
					v2 = nil
				end
			end
			if IsCountMatch then
				observeHostOffset(ViewRecyclerModule.ScrollObservationKind.User, ViewportState.scrollOffset)
				Coordinator.onScrollOffsetChanged()
			end
			Coordinator.checkEdges()
			local OnScrollOffsetChangedFunction: (any) -> () = Configuration.onScrollOffsetChanged
			
			if OnScrollOffsetChangedFunction ~= nil then
				OnScrollOffsetChangedFunction(ViewportState.scrollOffset)
			end
		end
		
		local function connectHost(Object) --[[ Line: 258 ]]
			-- upvalues: v1 (ref), Tbl (copy), v2 (ref), Configuration (ref), p1 (copy), publishCanvas (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy)
			if v1 == Object then return end
			for _, Connection in Tbl do
				Connection:Disconnect()
			end
			table.clear(Tbl)
			v1 = nil
			v2 = nil
			v1 = Object
			
			if Object ~= nil and typeof(Object) == "Instance" then
				table.insert(Tbl, Object:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 269 ]]
					-- upvalues: Configuration (upval), p1 (upval), publishCanvas (upval), synchronizeViewport (upval), Object (copy)
					Configuration = p1.getConfiguration()
					publishCanvas()
					synchronizeViewport(Object)
				end))
				table.insert(Tbl, Object:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 277 ]]
					-- upvalues: Configuration (upval), p1 (upval), synchronizeScrollOffset (upval), Object (copy)
					Configuration = p1.getConfiguration()
					synchronizeScrollOffset(Object)
				end))
				
				return
			end
		end
		
		return {
			connect = function() --[[ Line: 320 ]]
				-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), Count (ref), Configuration (ref), p1 (copy), Axis (ref), DataSource (ref), connectHost (copy), Coordinator (copy), publishCanvas (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy), Tbl (copy), v1 (ref), v2 (ref)
				assert(Disconnected == ScrollHostLifecyclePhaseModule.Disconnected, "ScrollingFrameSync: already connected")
				Count += 1
				local Count1: number = Count
				Configuration = p1.getConfiguration()
				Axis = Configuration.axis
				DataSource = Configuration.dataSource
				Disconnected = ScrollHostLifecyclePhaseModule.Priming
				connectHost(p1.getInstance())
				local Success, Result = pcall(function() --[[ Line: 329 ]]
					-- upvalues: Disconnected (upval), ScrollHostLifecyclePhaseModule (upval), Coordinator (upval), publishCanvas (upval), p1 (upval), synchronizeViewport (upval), synchronizeScrollOffset (upval)
					Disconnected = ScrollHostLifecyclePhaseModule.Synchronized
					Coordinator.onContentLengthChanged((publishCanvas()))
					local _Instance = p1.getInstance()
					
					if _Instance ~= nil then
						synchronizeViewport(_Instance)
						synchronizeScrollOffset(_Instance)
					end
				end)
				
				if not Success then
					Disconnected = ScrollHostLifecyclePhaseModule.Disconnected
					
					for _, Connection in Tbl do
						Connection:Disconnect()
					end
					table.clear(Tbl)
					v1 = nil
					v2 = nil
					error(Result, 0)
				end
				local Flag = false
				
				return function() --[[ Line: 344 ]]
					-- upvalues: Flag (ref), Disconnected (upval), ScrollHostLifecyclePhaseModule (upval), Count (upval), Count1 (copy), Tbl (upval), v1 (upval), v2 (upval)
					if Flag then return end
					Flag = true
					
					if Disconnected ~= ScrollHostLifecyclePhaseModule.Disconnected and Count == Count1 then
						Disconnected = ScrollHostLifecyclePhaseModule.Disconnected
						
						for _, Connection in Tbl do
							Connection:Disconnect()
						end
						table.clear(Tbl)
						v1 = nil
						v2 = nil
					end
				end
			end,
			scrollingFrameChanged = function() --[[ Line: 284 ]]
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
			configurationChanged = function() --[[ Line: 298 ]]
				-- upvalues: Configuration (ref), p1 (copy), DataSource (ref), Axis (ref), Coordinator (copy), Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), publishCanvas (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy)
				Configuration = p1.getConfiguration()
				local Configuration1 = Configuration
				local IsNotDataSourceMatch = Configuration1.dataSource ~= DataSource
				local IsNotAxisMatch = Configuration1.axis ~= Axis
				DataSource = Configuration1.dataSource
				Axis = Configuration1.axis
				
				if IsNotDataSourceMatch then
					Coordinator.onDataSourceReplaced()
				end
				if Disconnected ~= ScrollHostLifecyclePhaseModule.Disconnected and IsNotAxisMatch then
					local _Instance = p1.getInstance()
					
					if _Instance ~= nil then
						publishCanvas()
						synchronizeViewport(_Instance)
						synchronizeScrollOffset(_Instance)
					end
				end
				if Disconnected ~= ScrollHostLifecyclePhaseModule.Disconnected then
					Coordinator.checkEdges()
				end
			end,
			applyVirtualizerUpdate = function(p2, p3) --[[ Line: 360 ]]
				-- upvalues: Disconnected (ref), ScrollHostLifecyclePhaseModule (upval), Configuration (ref), p1 (copy), Coordinator (copy), publishCanvas (copy), ViewRecyclerModule (upval), applyProgrammaticScrollOffset (copy)
				if Disconnected == ScrollHostLifecyclePhaseModule.Disconnected then return end
				Configuration = p1.getConfiguration()
				
				if p2.contentLength ~= p3.snapshot.contentLength then
					Coordinator.onContentLengthChanged((publishCanvas()))
				end
				for _, effect in p3.effects do
					if effect.type == ViewRecyclerModule.VirtualizerEffectType.ScrollPositionChanged then
						publishCanvas()
						applyProgrammaticScrollOffset(effect.offset)
					elseif effect.type == ViewRecyclerModule.VirtualizerEffectType.DataSourceChanged then
						Coordinator.onDataSourceChanged(effect.changeBatch, effect.before)
					end
				end
			end,
			isReady = function(): boolean --[[ Line: 378 ]]
				-- upvalues: Configuration (ref), p1 (copy), getViewportState (copy)
				Configuration = p1.getConfiguration()
				
				return getViewportState(nil) ~= nil
			end
		}
	end
}