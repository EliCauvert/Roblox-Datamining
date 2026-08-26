local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)
local createCoordinator = viewRecyclerModule.Adapter.ScrollPolicy.createCoordinator

return {
	new = function(p1)
		-- upvalues: axisMapModule (ref), viewRecyclerModule (ref), createCoordinator (ref)
		local dispatch = p1.dispatch
		local getSnapshot = p1.getSnapshot
		local query = p1.query
		local configuration = p1.getConfiguration()
		local axis = configuration.axis
		local dataSource = configuration.dataSource
		local var1 = "disconnected"
		local var2 = 0
		local var3 = nil
		local t = {}
		local var4 = 0
		local var5 = nil
		
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
			-- upvalues: observeHostOffset (ref), viewRecyclerModule (copy), var5 (write)
			observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, p2)
			var5 = p2
		end
		
		local var6 = createCoordinator({
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
			-- upvalues: getSnapshot (ref), p1 (ref), var1 (write), axisMapModule (copy), configuration (write), getViewportState (ref), var4 (write), observeHostOffset (ref), viewRecyclerModule (copy), var5 (write)
			local contentLength = getSnapshot().contentLength
			local instance = p1.getInstance()
			
			if instance ~= nil then
				if var1 ~= "synchronized" then
					instance.CanvasSize = axisMapModule.canvasSizeFor(contentLength, configuration.axis)
					
					return contentLength
				end
				local var7 = getViewportState(instance)
				var4 += 1
				instance.CanvasSize = axisMapModule.canvasSizeFor(contentLength, configuration.axis)
				local var8 = getViewportState(instance)
				
				if var7 ~= nil and var8 ~= nil and var8.scrollOffset ~= var7.scrollOffset then
					local scrollOffset = var8.scrollOffset
					observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, scrollOffset)
					var5 = scrollOffset
				end
				var4 -= 1
			end
			return contentLength
		end
		
		local function applyProgrammaticScrollOffset(value)
			-- upvalues: var1 (write), var4 (write), setHostScrollOffset (ref), p1 (ref), getViewportState (ref), observeHostOffset (ref), viewRecyclerModule (copy), var5 (write)
			if var1 ~= "synchronized" then return end
			assert(value == value and (value ~= 1e999 and value ~= -1e999), "ScrollHostCoordinator: invalid offset")
			var4 += 1
			setHostScrollOffset(value)
			local var7 = getViewportState(p1.getInstance())
			
			if var7 ~= nil then
				local scrollOffset = var7.scrollOffset
				observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, scrollOffset)
				var5 = scrollOffset
			end
			var4 -= 1
		end
		
		local _ = function()
			-- upvalues: t (ref), var3 (write), var5 (write)
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			var3 = nil
			var5 = nil
		end
		
		local function synchronizeViewport(p2)
			-- upvalues: var1 (write), getViewportState (ref), dispatch (ref), viewRecyclerModule (copy), observeHostOffset (ref), var5 (write), var6 (ref), configuration (write)
			if var1 ~= "synchronized" then return end
			local var7 = getViewportState(p2)
			
			if var7 == nil then return end
			dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.SetViewportSize,
				scrollAxisLength = var7.viewportLength,
				crossAxisLength = var7.crossAxisLength
			})
			local var8 = getViewportState(p2)
			
			if var8 ~= nil then
				var7 = var8
			end
			local scrollOffset = var7.scrollOffset
			observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, scrollOffset)
			var5 = scrollOffset
			var6.onViewportChanged()
			var6.checkEdges()
			local onViewportChanged = configuration.onViewportChanged
			
			if onViewportChanged ~= nil then
				onViewportChanged(p2.AbsoluteWindowSize)
			end
		end
		
		local function synchronizeScrollOffset(value)
			-- upvalues: var1 (write), getViewportState (ref), var4 (write), var5 (write), observeHostOffset (ref), viewRecyclerModule (copy), var6 (ref), configuration (write)
			if var1 ~= "synchronized" then return end
			local var7 = getViewportState(value)
			
			if var7 == nil then return end
			local var8 = var4 == 0
			
			if var8 and var5 ~= nil then
				if math.abs(var7.scrollOffset - var5) < 0.5 then
					var8 = false
				else
					var5 = nil
				end
			end
			if var8 then
				observeHostOffset(viewRecyclerModule.ScrollObservationKind.User, var7.scrollOffset)
				var6.onScrollOffsetChanged()
			end
			var6.checkEdges()
			local onScrollOffsetChanged = configuration.onScrollOffsetChanged
			
			if onScrollOffsetChanged ~= nil then
				onScrollOffsetChanged(var7.scrollOffset)
			end
		end
		
		local function connectHost(p2)
			-- upvalues: var3 (write), t (ref), var5 (write), configuration (write), p1 (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
			if var3 == p2 then return end
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			var3 = nil
			var5 = nil
			var3 = p2
			
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
				-- upvalues: var1 (write), var2 (write), configuration (write), p1 (ref), axis (write), dataSource (write), connectHost (ref), var6 (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref), t (ref), var3 (write), var5 (write)
				assert(var1 == "disconnected", "ScrollHostCoordinator: already connected")
				var2 += 1
				local var7 = var2
				configuration = p1.getConfiguration()
				axis = configuration.axis
				dataSource = configuration.dataSource
				var1 = "priming"
				connectHost(p1.getInstance())
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var6 (copy), publishCanvas (copy), p1 (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy)
					var1 = "synchronized"
					var6.onContentLengthChanged(publishCanvas())
					local instance = p1.getInstance()
					
					if instance ~= nil then
						synchronizeViewport(instance)
						synchronizeScrollOffset(instance)
					end
				end)
				
				if not ok then
					var1 = "disconnected"
					
					for i, v in t do
						v:Disconnect()
					end
					table.clear(t)
					var3 = nil
					var5 = nil
					error(status, 0)
				end
				local var8 = false
				
				return function()
					-- upvalues: var8 (write), var1 (copy), var2 (copy), var7 (ref), t (copy), var3 (copy), var5 (copy)
					if var8 then return end
					var8 = true
					
					if var1 ~= "disconnected" and var2 == var7 then
						var1 = "disconnected"
						
						for i, v in t do
							v:Disconnect()
						end
						table.clear(t)
						var3 = nil
						var5 = nil
					end
				end
			end,
			hostChanged = function()
				-- upvalues: var1 (write), configuration (write), p1 (ref), connectHost (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
				if var1 == "disconnected" then return end
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
				-- upvalues: configuration (write), p1 (ref), dataSource (write), axis (write), var6 (ref), var1 (write), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
				configuration = p1.getConfiguration()
				local var9 = configuration
				local var10 = var9.dataSource ~= dataSource
				local var11 = var9.axis ~= axis
				dataSource = var9.dataSource
				axis = var9.axis
				
				if var10 then
					var6.onDataSourceReplaced()
				end
				if var1 ~= "disconnected" and var11 then
					local instance = p1.getInstance()
					
					if instance ~= nil then
						publishCanvas()
						synchronizeViewport(instance)
						synchronizeScrollOffset(instance)
					end
				end
				if var1 ~= "disconnected" then
					var6.checkEdges()
				end
			end,
			handleUpdate = function(p3, p4)
				-- upvalues: var1 (write), configuration (write), p1 (ref), var6 (ref), publishCanvas (ref), viewRecyclerModule (copy), applyProgrammaticScrollOffset (ref)
				if var1 == "disconnected" then return end
				configuration = p1.getConfiguration()
				
				if p3.contentLength ~= p4.snapshot.contentLength then
					var6.onContentLengthChanged(publishCanvas())
				end
				for i, v in p4.effects do
					if v.type == viewRecyclerModule.VirtualizerEffectType.ScrollPositionChanged then
						publishCanvas()
						applyProgrammaticScrollOffset(v.offset)
					elseif v.type == viewRecyclerModule.VirtualizerEffectType.DataSourceChanged then
						var6.onDataSourceChanged(v.changeBatch, v.before)
					end
				end
			end,
			isHostReady = function()
				-- upvalues: configuration (write), p1 (ref), getViewportState (ref)
				configuration = p1.getConfiguration()
				
				return getViewportState(nil) ~= nil
			end
		}
	end
}