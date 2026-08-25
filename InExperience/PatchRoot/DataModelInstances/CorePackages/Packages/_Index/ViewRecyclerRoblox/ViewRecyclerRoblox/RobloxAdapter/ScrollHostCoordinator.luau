local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)
local createCoordinator = viewRecyclerModule.Adapter.ScrollPolicy.createCoordinator

return {
	new = function(p0)
		-- upvalues: axisMapModule (ref), viewRecyclerModule (ref), createCoordinator (ref)
		local dispatch = p0.dispatch
		local getSnapshot = p0.getSnapshot
		local query = p0.query
		local configuration = p0.getConfiguration()
		local axis = configuration.axis
		local dataSource = configuration.dataSource
		local var4 = "disconnected"
		local var5 = 0
		local var6 = nil
		local t = {}
		local var8 = 0
		local var9 = nil
		
		local function _()
			-- upvalues: configuration (write), p0 (ref)
			configuration = p0.getConfiguration()
			
			return configuration
		end
		
		local _ = function(p1)
			-- upvalues: p0 (ref)
			return p1 or p0.getInstance()
		end
		
		local function getViewportState(p2)
			-- upvalues: p0 (ref), configuration (write), axisMapModule (copy)
			p2 = p2 or p0.getInstance()
			
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
			-- upvalues: p0 (ref), configuration (write), viewRecyclerModule (copy)
			local instance = p0.getInstance()
			
			if instance == nil then
				return false
			end
			local canvasPosition = instance.CanvasPosition
			instance.CanvasPosition = if configuration.axis == viewRecyclerModule.Axis.X then Vector2.new(value, canvasPosition.Y) else Vector2.new(canvasPosition.X, value)
			
			return true
		end
		
		local function observeHostOffset(value, p3)
			-- upvalues: dispatch (ref), viewRecyclerModule (copy)
			dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.ObserveScrollOffset,
				observation = { kind = value, offset = p3 }
			})
		end
		
		local _ = function(p4)
			-- upvalues: observeHostOffset (ref), viewRecyclerModule (copy), var9 (write)
			observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, p4)
			var9 = p4
		end
		
		local var13 = createCoordinator({
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
			getScrollOffsetForItem = function(value, p5)
				-- upvalues: query (ref), viewRecyclerModule (copy)
				return query({
					type = viewRecyclerModule.VirtualizerQueryType.GetScrollOffsetForItem,
					index = value,
					alignment = p5
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
			onContentLengthChanged = function(p6)
				-- upvalues: configuration (write)
				local onContentLengthChanged = configuration.onContentLengthChanged
				
				if onContentLengthChanged ~= nil then
					onContentLengthChanged(p6)
				end
			end
		})
		
		local function publishCanvas()
			-- upvalues: getSnapshot (ref), p0 (ref), var4 (write), axisMapModule (copy), configuration (write), getViewportState (ref), var8 (write), observeHostOffset (ref), viewRecyclerModule (copy), var9 (write)
			local contentLength = getSnapshot().contentLength
			local instance = p0.getInstance()
			
			if instance ~= nil then
				if var4 ~= "synchronized" then
					instance.CanvasSize = axisMapModule.canvasSizeFor(contentLength, configuration.axis)
					
					return contentLength
				end
				local var22 = getViewportState(instance)
				var8 += 1
				instance.CanvasSize = axisMapModule.canvasSizeFor(contentLength, configuration.axis)
				local var23 = getViewportState(instance)
				
				if var22 ~= nil and var23 ~= nil and var23.scrollOffset ~= var22.scrollOffset then
					local scrollOffset = var23.scrollOffset
					observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, scrollOffset)
					var9 = scrollOffset
				end
				var8 -= 1
			end
			return contentLength
		end
		
		local function applyProgrammaticScrollOffset(value)
			-- upvalues: var4 (write), var8 (write), setHostScrollOffset (ref), p0 (ref), getViewportState (ref), observeHostOffset (ref), viewRecyclerModule (copy), var9 (write)
			if var4 ~= "synchronized" then return end
			assert(value == value and (value ~= 1e999 and value ~= -1e999), "ScrollHostCoordinator: invalid offset")
			var8 += 1
			setHostScrollOffset(value)
			local var24 = getViewportState(p0.getInstance())
			
			if var24 ~= nil then
				local scrollOffset = var24.scrollOffset
				observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, scrollOffset)
				var9 = scrollOffset
			end
			var8 -= 1
		end
		
		local _ = function()
			-- upvalues: t (ref), var6 (write), var9 (write)
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			var6 = nil
			var9 = nil
		end
		
		local function synchronizeViewport(p7)
			-- upvalues: var4 (write), getViewportState (ref), dispatch (ref), viewRecyclerModule (copy), observeHostOffset (ref), var9 (write), var13 (ref), configuration (write)
			if var4 ~= "synchronized" then return end
			local var25 = getViewportState(p7)
			
			if var25 == nil then return end
			dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.SetViewportSize,
				scrollAxisLength = var25.viewportLength,
				crossAxisLength = var25.crossAxisLength
			})
			local var26 = getViewportState(p7)
			
			if var26 ~= nil then
				var25 = var26
			end
			local scrollOffset = var25.scrollOffset
			observeHostOffset(viewRecyclerModule.ScrollObservationKind.Programmatic, scrollOffset)
			var9 = scrollOffset
			var13.onViewportChanged()
			var13.checkEdges()
			local onViewportChanged = configuration.onViewportChanged
			
			if onViewportChanged ~= nil then
				onViewportChanged(p7.AbsoluteWindowSize)
			end
		end
		
		local function synchronizeScrollOffset(value)
			-- upvalues: var4 (write), getViewportState (ref), var8 (write), var9 (write), observeHostOffset (ref), viewRecyclerModule (copy), var13 (ref), configuration (write)
			if var4 ~= "synchronized" then return end
			local var27 = getViewportState(value)
			
			if var27 == nil then return end
			local var28 = var8 == 0
			
			if var28 and var9 ~= nil then
				if math.abs(var27.scrollOffset - var9) < 0.5 then
					var28 = false
				else
					var9 = nil
				end
			end
			if var28 then
				observeHostOffset(viewRecyclerModule.ScrollObservationKind.User, var27.scrollOffset)
				var13.onScrollOffsetChanged()
			end
			var13.checkEdges()
			local onScrollOffsetChanged = configuration.onScrollOffsetChanged
			
			if onScrollOffsetChanged ~= nil then
				onScrollOffsetChanged(var27.scrollOffset)
			end
		end
		
		local function connectHost(p8)
			-- upvalues: var6 (write), t (ref), var9 (write), configuration (write), p0 (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
			if var6 == p8 then return end
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			var6 = nil
			var9 = nil
			var6 = p8
			
			if p8 == nil or typeof(p8) ~= "Instance" then
				return
			end
			table.insert(t, p8:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: configuration (copy), p0 (copy), publishCanvas (copy), synchronizeViewport (copy), p8 (ref)
				configuration = p0.getConfiguration()
				publishCanvas()
				synchronizeViewport(p8)
			end))
			table.insert(t, p8:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: configuration (copy), p0 (copy), synchronizeScrollOffset (copy), p8 (ref)
				configuration = p0.getConfiguration()
				synchronizeScrollOffset(p8)
			end))
		end
		
		return {
			connect = function()
				-- upvalues: var4 (write), var5 (write), configuration (write), p0 (ref), axis (write), dataSource (write), connectHost (ref), var13 (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref), t (ref), var6 (write), var9 (write)
				assert(var4 == "disconnected", "ScrollHostCoordinator: already connected")
				var5 += 1
				local var29 = var5
				configuration = p0.getConfiguration()
				axis = configuration.axis
				dataSource = configuration.dataSource
				var4 = "priming"
				connectHost(p0.getInstance())
				local ok, status = pcall(function()
					-- upvalues: var4 (copy), var13 (copy), publishCanvas (copy), p0 (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy)
					var4 = "synchronized"
					var13.onContentLengthChanged(publishCanvas())
					local instance = p0.getInstance()
					
					if instance ~= nil then
						synchronizeViewport(instance)
						synchronizeScrollOffset(instance)
					end
				end)
				
				if not ok then
					var4 = "disconnected"
					
					for i, v in t do
						v:Disconnect()
					end
					table.clear(t)
					var6 = nil
					var9 = nil
					error(status, 0)
				end
				local var30 = false
				
				return function()
					-- upvalues: var30 (write), var4 (copy), var5 (copy), var29 (ref), t (copy), var6 (copy), var9 (copy)
					if var30 then return end
					var30 = true
					
					if var4 ~= "disconnected" and var5 == var29 then
						var4 = "disconnected"
						
						for i, v in t do
							v:Disconnect()
						end
						table.clear(t)
						var6 = nil
						var9 = nil
					end
				end
			end,
			hostChanged = function()
				-- upvalues: var4 (write), configuration (write), p0 (ref), connectHost (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
				if var4 == "disconnected" then return end
				configuration = p0.getConfiguration()
				local instance = p0.getInstance()
				connectHost(instance)
				
				if instance ~= nil then
					publishCanvas()
					synchronizeViewport(instance)
					synchronizeScrollOffset(instance)
				end
			end,
			configurationChanged = function()
				-- upvalues: configuration (write), p0 (ref), dataSource (write), axis (write), var13 (ref), var4 (write), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
				configuration = p0.getConfiguration()
				local var33 = configuration
				local var34 = var33.dataSource ~= dataSource
				local var35 = var33.axis ~= axis
				dataSource = var33.dataSource
				axis = var33.axis
				
				if var34 then
					var13.onDataSourceReplaced()
				end
				if var4 ~= "disconnected" and var35 then
					local instance = p0.getInstance()
					
					if instance ~= nil then
						publishCanvas()
						synchronizeViewport(instance)
						synchronizeScrollOffset(instance)
					end
				end
				if var4 ~= "disconnected" then
					var13.checkEdges()
				end
			end,
			handleUpdate = function(p9, p10)
				-- upvalues: var4 (write), configuration (write), p0 (ref), var13 (ref), publishCanvas (ref), viewRecyclerModule (copy), applyProgrammaticScrollOffset (ref)
				if var4 == "disconnected" then return end
				configuration = p0.getConfiguration()
				
				if p9.contentLength ~= p10.snapshot.contentLength then
					var13.onContentLengthChanged(publishCanvas())
				end
				for i, v in p10.effects do
					if v.type == viewRecyclerModule.VirtualizerEffectType.ScrollPositionChanged then
						publishCanvas()
						applyProgrammaticScrollOffset(v.offset)
					elseif v.type == viewRecyclerModule.VirtualizerEffectType.DataSourceChanged then
						var13.onDataSourceChanged(v.changeBatch, v.before)
					end
				end
			end,
			isHostReady = function()
				-- upvalues: configuration (write), p0 (ref), getViewportState (ref)
				configuration = p0.getConfiguration()
				
				return getViewportState(nil) ~= nil
			end
		}
	end
}