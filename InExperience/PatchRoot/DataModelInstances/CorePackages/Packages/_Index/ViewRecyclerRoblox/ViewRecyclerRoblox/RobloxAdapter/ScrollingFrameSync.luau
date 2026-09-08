local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local scrollHostLifecyclePhaseModule = require(viewRecyclerRoblox.RobloxAdapter.ScrollHostLifecyclePhase)
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)
local createCoordinator = viewRecyclerModule.Adapter.ScrollPolicy.createCoordinator

return {
	new = function(p1)
		-- upvalues: scrollHostLifecyclePhaseModule (ref), axisMapModule (ref), viewRecyclerModule (ref), createCoordinator (ref)
		local dispatch = p1.dispatch
		local getSnapshot = p1.getSnapshot
		local query = p1.query
		local configuration = p1.getConfiguration()
		local axis = configuration.axis
		local dataSource = configuration.dataSource
		local disconnected = scrollHostLifecyclePhaseModule.Disconnected
		local var1 = 0
		local var2 = nil
		local t = {}
		local var3 = 0
		local var4 = nil
		
		local function _()
			-- upvalues: configuration (write), p1 (ref)
			configuration = p1.getConfiguration()
			
			return configuration
		end
		
		local _ = function(p2)
			-- upvalues: p1 (ref)
			return p2 or p1.getInstance()
		end
		
		local function getViewportState(p2)
			-- upvalues: p1 (ref), configuration (write), axisMapModule (copy)
			p2 = p2 or p1.getInstance()
			
			if p2 == nil then
				return nil
			end
			local axis = configuration.axis
			
			return {
				scrollOffset = axisMapModule.mainOf(p2.CanvasPosition, axis),
				viewportLength = axisMapModule.mainOf(p2.AbsoluteWindowSize, axis),
				crossAxisLength = axisMapModule.crossOf(p2.AbsoluteWindowSize, axis)
			}
		end
		
		local function setHostScrollOffset(value)
			-- upvalues: p1 (ref), configuration (write), viewRecyclerModule (copy)
			local instance = p1.getInstance()
			
			if instance == nil then
				return false
			end
			local canvasPosition = instance.CanvasPosition
			instance.CanvasPosition = if configuration.axis == viewRecyclerModule.Axis.X then Vector2.new(value, canvasPosition.Y) else Vector2.new(canvasPosition.X, value)
			
			return true
		end
		
		local function observeHostOffset(value, p2)
			-- upvalues: dispatch (ref), viewRecyclerModule (copy)
			dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.ObserveScrollOffset,
				observation = { kind = value, offset = p2 }
			})
		end
		
		local _ = function(p2)
			-- upvalues: observeHostOffset (ref), viewRecyclerModule (copy), var4 (write)
			observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, p2)
			var4 = p2
		end
		
		local var5 = createCoordinator({
			getItemCount = function()
				-- upvalues: configuration (write)
				return configuration.dataSource.getItemCount()
			end,
			getScrollState = function()
				-- upvalues: query (ref), viewRecyclerModule (copy)
				return query({
					type = viewRecyclerModule.VirtualizerQueryType.GetScrollState
				})
			end,
			getScrollOffsetForItem = function(value, p2)
				-- upvalues: query (ref), viewRecyclerModule (copy)
				return query({
					type = viewRecyclerModule.VirtualizerQueryType.GetScrollOffsetForItem,
					index = value,
					alignment = p2
				})
			end,
			applyScrollAnchorOffset = function(value)
				-- upvalues: dispatch (ref), viewRecyclerModule (copy)
				return dispatch({
					type = viewRecyclerModule.VirtualizerCommandType.ApplyScrollAnchorOffset,
					offset = value
				}).result
			end,
			getViewportState = getViewportState,
			getInitialScrollAlignment = function()
				-- upvalues: configuration (write)
				return configuration.initialScrollAlignment
			end,
			getAutoScrollPolicy = function()
				-- upvalues: configuration (write)
				return configuration.autoScrollOnChange
			end,
			getStartReachedThreshold = function()
				-- upvalues: configuration (write)
				return configuration.startReachedThreshold
			end,
			getOnStartReached = function()
				-- upvalues: configuration (write)
				return configuration.onStartReached
			end,
			getOnEndReached = function()
				-- upvalues: configuration (write)
				return configuration.onEndReached
			end,
			onContentLengthChanged = function(p2)
				-- upvalues: configuration (write)
				local onContentLengthChanged = configuration.onContentLengthChanged
				
				if onContentLengthChanged ~= nil then
					onContentLengthChanged(p2)
				end
			end
		})
		
		local function publishCanvas()
			-- upvalues: getSnapshot (ref), p1 (ref), disconnected (write), scrollHostLifecyclePhaseModule (copy), axisMapModule (copy), configuration (write), getViewportState (ref), var3 (write), observeHostOffset (ref), viewRecyclerModule (copy), var4 (write)
			local contentLength = getSnapshot().contentLength
			local instance = p1.getInstance()
			
			if instance ~= nil then
				if disconnected ~= scrollHostLifecyclePhaseModule.Synchronized then
					instance.CanvasSize = axisMapModule.canvasSizeFor(contentLength, configuration.axis)
					
					return contentLength
				end
				local var6 = getViewportState(instance)
				var3 += 1
				instance.CanvasSize = axisMapModule.canvasSizeFor(contentLength, configuration.axis)
				local var7 = getViewportState(instance)
				
				if var6 ~= nil and var7 ~= nil and var7.scrollOffset ~= var6.scrollOffset then
					local scrollOffset = var7.scrollOffset
					observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, scrollOffset)
					var4 = scrollOffset
				end
				var3 -= 1
			end
			return contentLength
		end
		
		local function applyProgrammaticScrollOffset(value)
			-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), var3 (write), setHostScrollOffset (ref), p1 (ref), getViewportState (ref), observeHostOffset (ref), viewRecyclerModule (copy), var4 (write)
			if disconnected ~= scrollHostLifecyclePhaseModule.Synchronized then return end
			assert(value == value and (value ~= 1e999 and value ~= -1e999), "ScrollingFrameSync: invalid offset")
			var3 += 1
			setHostScrollOffset(value)
			local var6 = getViewportState(p1.getInstance())
			
			if var6 ~= nil then
				local scrollOffset = var6.scrollOffset
				observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, scrollOffset)
				var4 = scrollOffset
			end
			var3 -= 1
		end
		
		local _ = function()
			-- upvalues: t (ref), var2 (write), var4 (write)
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			var2 = nil
			var4 = nil
		end
		
		local function synchronizeViewport(p2)
			-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), getViewportState (ref), dispatch (ref), viewRecyclerModule (copy), observeHostOffset (ref), var4 (write), var5 (ref), configuration (write)
			if disconnected ~= scrollHostLifecyclePhaseModule.Synchronized then return end
			local var6 = getViewportState(p2)
			
			if var6 == nil then return end
			dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.SetViewportSize,
				scrollAxisLength = var6.viewportLength,
				crossAxisLength = var6.crossAxisLength
			})
			local var7 = getViewportState(p2)
			
			if var7 ~= nil then
				var6 = var7
			end
			local scrollOffset = var6.scrollOffset
			observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, scrollOffset)
			var4 = scrollOffset
			var5.onViewportChanged()
			var5.checkEdges()
			local onViewportChanged = configuration.onViewportChanged
			
			if onViewportChanged ~= nil then
				onViewportChanged(p2.AbsoluteWindowSize)
			end
		end
		
		local function synchronizeScrollOffset(value)
			-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), getViewportState (ref), var3 (write), var4 (write), observeHostOffset (ref), viewRecyclerModule (copy), var5 (ref), configuration (write)
			if disconnected ~= scrollHostLifecyclePhaseModule.Synchronized then return end
			local var6 = getViewportState(value)
			
			if var6 == nil then return end
			local var7 = var3 == 0
			
			if var7 and var4 ~= nil then
				if math.abs(var6.scrollOffset - var4) < 0.5 then
					var7 = false
				else
					var4 = nil
				end
			end
			if var7 then
				observeHostOffset(viewRecyclerModule.ScrollObservationKind.User, var6.scrollOffset)
				var5.onScrollOffsetChanged()
			end
			var5.checkEdges()
			local onScrollOffsetChanged = configuration.onScrollOffsetChanged
			
			if onScrollOffsetChanged ~= nil then
				onScrollOffsetChanged(var6.scrollOffset)
			end
		end
		
		local function connectHost(p2)
			-- upvalues: var2 (write), t (ref), var4 (write), configuration (write), p1 (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
			if var2 == p2 then return end
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			var2 = nil
			var4 = nil
			var2 = p2
			
			if p2 == nil or typeof(p2) ~= "Instance" then
				return
			end
			table.insert(t, p2:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: configuration (copy), p1 (copy), publishCanvas (copy), synchronizeViewport (copy), p2 (ref)
				configuration = p1.getConfiguration()
				publishCanvas()
				synchronizeViewport(p2)
			end))
			table.insert(t, p2:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: configuration (copy), p1 (copy), synchronizeScrollOffset (copy), p2 (ref)
				configuration = p1.getConfiguration()
				synchronizeScrollOffset(p2)
			end))
		end
		
		return {
			connect = function()
				-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), var1 (write), configuration (write), p1 (ref), axis (write), dataSource (write), connectHost (ref), var5 (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref), t (ref), var2 (write), var4 (write)
				assert(disconnected == scrollHostLifecyclePhaseModule.Disconnected, "ScrollingFrameSync: already connected")
				var1 += 1
				local var6 = var1
				configuration = p1.getConfiguration()
				axis = configuration.axis
				dataSource = configuration.dataSource
				disconnected = scrollHostLifecyclePhaseModule.Priming
				connectHost(p1.getInstance())
				local ok, status = pcall(function()
					-- upvalues: disconnected (copy), scrollHostLifecyclePhaseModule (copy), var5 (copy), publishCanvas (copy), p1 (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy)
					disconnected = scrollHostLifecyclePhaseModule.Synchronized
					var5.onContentLengthChanged(publishCanvas())
					local instance = p1.getInstance()
					
					if instance ~= nil then
						synchronizeViewport(instance)
						synchronizeScrollOffset(instance)
					end
				end)
				
				if not ok then
					disconnected = scrollHostLifecyclePhaseModule.Disconnected
					
					for i, v in t do
						v:Disconnect()
					end
					table.clear(t)
					var2 = nil
					var4 = nil
					error(status, 0)
				end
				local var7 = false
				
				return function()
					-- upvalues: var7 (write), disconnected (copy), scrollHostLifecyclePhaseModule (copy), var1 (copy), var6 (ref), t (copy), var2 (copy), var4 (copy)
					if var7 then return end
					var7 = true
					
					if disconnected ~= scrollHostLifecyclePhaseModule.Disconnected and var1 == var6 then
						disconnected = scrollHostLifecyclePhaseModule.Disconnected
						
						for i, v in t do
							v:Disconnect()
						end
						table.clear(t)
						var2 = nil
						var4 = nil
					end
				end
			end,
			scrollingFrameChanged = function()
				-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), configuration (write), p1 (ref), connectHost (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
				if disconnected == scrollHostLifecyclePhaseModule.Disconnected then return end
				configuration = p1.getConfiguration()
				local instance = p1.getInstance()
				connectHost(instance)
				
				if instance ~= nil then
					publishCanvas()
					synchronizeViewport(instance)
					synchronizeScrollOffset(instance)
				end
			end,
			configurationChanged = function()
				-- upvalues: configuration (write), p1 (ref), dataSource (write), axis (write), var5 (ref), disconnected (write), scrollHostLifecyclePhaseModule (copy), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
				configuration = p1.getConfiguration()
				local var8 = configuration
				local var9 = var8.dataSource ~= dataSource
				local var10 = var8.axis ~= axis
				dataSource = var8.dataSource
				axis = var8.axis
				
				if var9 then
					var5.onDataSourceReplaced()
				end
				if disconnected ~= scrollHostLifecyclePhaseModule.Disconnected and var10 then
					local instance = p1.getInstance()
					
					if instance ~= nil then
						publishCanvas()
						synchronizeViewport(instance)
						synchronizeScrollOffset(instance)
					end
				end
				if disconnected ~= scrollHostLifecyclePhaseModule.Disconnected then
					var5.checkEdges()
				end
			end,
			applyVirtualizerUpdate = function(p3, p4)
				-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), configuration (write), p1 (ref), var5 (ref), publishCanvas (ref), viewRecyclerModule (copy), applyProgrammaticScrollOffset (ref)
				if disconnected == scrollHostLifecyclePhaseModule.Disconnected then return end
				configuration = p1.getConfiguration()
				
				if p3.contentLength ~= p4.snapshot.contentLength then
					var5.onContentLengthChanged(publishCanvas())
				end
				for i, v in p4.effects do
					if v.type == viewRecyclerModule.VirtualizerEffectType.ScrollPositionChanged then
						publishCanvas()
						applyProgrammaticScrollOffset(v.offset)
					elseif v.type == viewRecyclerModule.VirtualizerEffectType.DataSourceChanged then
						var5.onDataSourceChanged(v.changeBatch, v.before)
					end
				end
			end,
			isReady = function()
				-- upvalues: configuration (write), p1 (ref), getViewportState (ref)
				configuration = p1.getConfiguration()
				
				return getViewportState(nil) ~= nil
			end
		}
	end
}