local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local scrollHostLifecyclePhaseModule = require(viewRecyclerRoblox.RobloxAdapter.ScrollHostLifecyclePhase)
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)

local function _(value, p1, p2)
	return math.clamp(value, 0, math.max(0, p2 - p1))
end

return {
	new = function(p1)
		-- upvalues: scrollHostLifecyclePhaseModule (ref), axisMapModule (ref), viewRecyclerModule (ref), runService (ref), userInputService (ref)
		local getCurrent = p1.getCurrent
		local configuration = p1.getConfiguration()
		local axis = configuration.axis
		local disconnected = scrollHostLifecyclePhaseModule.Disconnected
		local var1 = 0
		local var2 = nil
		local t = {}
		local var3 = 0
		local var4 = nil
		local var5 = nil
		local var6 = nil
		local var7 = 0
		local var8 = 0
		local var9 = nil
		local t_1 = {}
		local var10 = false
		local var11 = nil
		local var12 = nil
		local var13 = nil
		
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
		
		local _ = function(value, p2)
			-- upvalues: p1 (ref)
			p1.observeScrollOffset({ kind = value, offset = p2 })
		end
		
		local _ = function(value)
			-- upvalues: var7 (write), getCurrent (ref)
			return math.clamp(value.scrollOffset - var7, 0, math.max(0, getCurrent().contentLength - value.viewportLength))
		end
		
		local _ = function(value)
			-- upvalues: configuration (write), var6 (write)
			local onScrollOffsetChanged = configuration.onScrollOffsetChanged
			
			if onScrollOffsetChanged ~= nil and value ~= var6 then
				onScrollOffsetChanged(value)
				var6 = value
			end
		end
		
		local _ = function(value, p2)
			-- upvalues: var7 (write), p1 (ref)
			if var7 == value then return end
			var7 = value
			local onCanvasOriginMoved = p1.onCanvasOriginMoved
			
			if onCanvasOriginMoved ~= nil and p2 ~= false then
				onCanvasOriginMoved()
			end
		end
		
		local _ = function(p2)
			-- upvalues: var7 (write), getCurrent (ref), viewRecyclerModule (copy), p1 (ref), var4 (write), var5 (write)
			local clampedValue = math.clamp(p2.scrollOffset - var7, 0, math.max(0, getCurrent().contentLength - p2.viewportLength))
			p1.observeScrollOffset({
				kind = viewRecyclerModule.ScrollObservationKind.Programmatic,
				offset = clampedValue
			})
			var4 = p2.scrollOffset
			var5 = clampedValue
		end
		
		local function publishCanvas()
			-- upvalues: getCurrent (ref), var7 (write), p1 (ref), var11 (write), var12 (write), configuration (write), var13 (write), disconnected (write), scrollHostLifecyclePhaseModule (copy), axisMapModule (copy), var3 (write), getViewportState (ref), setHostScrollOffset (ref), viewRecyclerModule (copy), var4 (write), var5 (write)
			local maxValue = math.max(0, getCurrent().contentLength + var7)
			local instance = p1.getInstance()
			
			if instance ~= nil then
				local var14 = if var11 == instance and var12 == configuration.axis then var13 else nil
				
				if var14 == maxValue then
					return maxValue
				elseif disconnected ~= scrollHostLifecyclePhaseModule.Synchronized or var14 == nil then
					instance.CanvasSize = axisMapModule.canvasSizeFor(maxValue, configuration.axis)
				elseif var14 <= maxValue then
					var3 += 1
					instance.CanvasSize = axisMapModule.canvasSizeFor(maxValue, configuration.axis)
					var3 -= 1
				else
					local var15 = getViewportState(instance)
					var3 += 1
					instance.CanvasSize = axisMapModule.canvasSizeFor(maxValue, configuration.axis)
					
					if var15 ~= nil then
						local clampedValue = math.clamp(var15.scrollOffset, 0, math.max(0, maxValue - var15.viewportLength))
						
						if clampedValue ~= var15.scrollOffset then
							setHostScrollOffset(clampedValue)
							local t = {
								scrollOffset = clampedValue,
								viewportLength = var15.viewportLength,
								crossAxisLength = var15.crossAxisLength
							}
							local clampedValue_1 = math.clamp(t.scrollOffset - var7, 0, math.max(0, getCurrent().contentLength - t.viewportLength))
							p1.observeScrollOffset({
								kind = viewRecyclerModule.ScrollObservationKind.Programmatic,
								offset = clampedValue_1
							})
							var4 = t.scrollOffset
							var5 = clampedValue_1
						end
					end
					var3 -= 1
				end
				var11 = instance
				var12 = configuration.axis
				var13 = maxValue
			end
			return maxValue
		end
		
		local function applyProgrammaticScrollOffset(value)
			-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), var3 (write), setHostScrollOffset (ref), p1 (ref), getViewportState (ref), var7 (write), getCurrent (ref), viewRecyclerModule (copy), var4 (write), var5 (write)
			if disconnected ~= scrollHostLifecyclePhaseModule.Synchronized then return end
			assert(value == value and (value ~= 1e999 and value ~= -1e999), "ScrollHost: invalid offset")
			var3 += 1
			setHostScrollOffset(value)
			local var14 = getViewportState(p1.getInstance())
			
			if var14 ~= nil then
				local clampedValue = math.clamp(var14.scrollOffset - var7, 0, math.max(0, getCurrent().contentLength - var14.viewportLength))
				p1.observeScrollOffset({
					kind = viewRecyclerModule.ScrollObservationKind.Programmatic,
					offset = clampedValue
				})
				var4 = var14.scrollOffset
				var5 = clampedValue
			end
			var3 -= 1
		end
		
		local _ = function()
			-- upvalues: var9 (write), var8 (write)
			if var9 ~= nil then
				var9:Disconnect()
				var9 = nil
			end
			var8 = 0
		end
		
		local _ = function(p2)
			-- upvalues: axisMapModule (copy), configuration (write)
			return axisMapModule.mainOf(p2:GetScrollVelocity(), configuration.axis)
		end
		
		local _ = function()
			-- upvalues: t_1 (ref), p1 (ref), axisMapModule (copy), configuration (write), var10 (write)
			if next(t_1) ~= nil then
				return true
			end
			local instance = p1.getInstance()
			
			return if instance == nil then false else math.abs(axisMapModule.mainOf(instance:GetScrollVelocity(), configuration.axis)) >= 0.5 or var10
		end
		
		local _ = function()
			-- upvalues: p1 (ref), axisMapModule (copy), configuration (write)
			local instance = p1.getInstance()
			
			return instance ~= nil and axisMapModule.mainOf(instance.CanvasPosition, configuration.axis) <= 0.5
		end
		
		local function settleCanvasOriginOffset(value)
			-- upvalues: var7 (write), var9 (write), var8 (write), getViewportState (ref), getCurrent (ref), p1 (ref), publishCanvas (ref), applyProgrammaticScrollOffset (ref), configuration (write), var6 (write)
			if var7 == 0 then
				if var9 ~= nil then
					var9:Disconnect()
					var9 = nil
				end
				var8 = 0
				
				return
			else
				local var14 = getViewportState(nil)
				
				if var14 == nil then return end
				local value_1 = value or math.clamp(var14.scrollOffset - var7, 0, math.max(0, getCurrent().contentLength - var14.viewportLength))
				
				if var7 ~= 0 then
					var7 = 0
					local onCanvasOriginMoved = p1.onCanvasOriginMoved
					
					if onCanvasOriginMoved ~= nil then
						onCanvasOriginMoved()
					end
				end
				publishCanvas()
				applyProgrammaticScrollOffset(value_1)
				local onScrollOffsetChanged = configuration.onScrollOffsetChanged
				
				if onScrollOffsetChanged ~= nil and value_1 ~= var6 then
					onScrollOffsetChanged(value_1)
					var6 = value_1
				end
				if var9 ~= nil then
					var9:Disconnect()
					var9 = nil
				end
				var8 = 0
			end
		end
		
		local _ = function()
			-- upvalues: var9 (write), var7 (write), runService (copy), var10 (write), var8 (write), t_1 (ref), p1 (ref), axisMapModule (copy), configuration (write), settleCanvasOriginOffset (ref)
			if var9 == nil and var7 ~= 0 then
				var9 = runService.Heartbeat:Connect(function()
					-- upvalues: var10 (copy), var8 (copy), t_1 (copy), p1 (copy), axisMapModule (copy), configuration (copy), settleCanvasOriginOffset (copy)
					local var14
					var10 = false
					
					if var10 then
						var8 = 0
						
						return
					elseif next(t_1) == nil then
						local instance = p1.getInstance()
						var14 = if instance == nil then false else math.abs(axisMapModule.mainOf(instance:GetScrollVelocity(), configuration.axis)) >= 0.5 or var10
					else
						var14 = true
					end
					if var14 then
						var8 = 0
						
						return
					end
					var8 += 1
					
					if var8 >= 2 then
						settleCanvasOriginOffset(nil)
					end
				end)
				
				return
			end
		end
		
		local function disconnectHost()
			-- upvalues: var9 (write), var8 (write), t (ref), t_1 (ref), var2 (write), var11 (write), var12 (write), var13 (write), var4 (write), var5 (write), var6 (write), var10 (write), var7 (write), p1 (ref)
			if var9 ~= nil then
				var9:Disconnect()
				var9 = nil
			end
			var8 = 0
			
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			table.clear(t_1)
			var2 = nil
			var11 = nil
			var12 = nil
			var13 = nil
			var4 = nil
			var5 = nil
			var6 = nil
			var10 = false
			
			if var7 == 0 then return end
			var7 = 0
			local onCanvasOriginMoved = p1.onCanvasOriginMoved
			
			if onCanvasOriginMoved ~= nil then
				onCanvasOriginMoved()
			end
		end
		
		local function synchronizeViewport(p2)
			-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), getViewportState (ref), p1 (ref), var7 (write), getCurrent (ref), viewRecyclerModule (copy), var4 (write), var5 (write), configuration (write)
			if disconnected ~= scrollHostLifecyclePhaseModule.Synchronized then return end
			local var14 = getViewportState(p2)
			
			if var14 == nil then return end
			p1.setViewportSize(var14.viewportLength, var14.crossAxisLength)
			local var15 = getViewportState(p2)
			
			if var15 ~= nil then
				var14 = var15
			end
			local clampedValue = math.clamp(var14.scrollOffset - var7, 0, math.max(0, getCurrent().contentLength - var14.viewportLength))
			p1.observeScrollOffset({
				kind = viewRecyclerModule.ScrollObservationKind.Programmatic,
				offset = clampedValue
			})
			var4 = var14.scrollOffset
			var5 = clampedValue
			local onViewportChanged = configuration.onViewportChanged
			
			if onViewportChanged ~= nil then
				onViewportChanged(p2.AbsoluteWindowSize)
			end
		end
		
		local function synchronizeScrollOffset(value, p2)
			-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), getViewportState (ref), var7 (write), getCurrent (ref), var3 (write), var4 (write), var5 (write), viewRecyclerModule (copy), p1 (ref), var10 (write), var8 (write), settleCanvasOriginOffset (ref), configuration (write), var6 (write)
			if disconnected ~= scrollHostLifecyclePhaseModule.Synchronized then return end
			local var14 = getViewportState(value)
			
			if var14 == nil then return end
			local clampedValue = math.clamp(var14.scrollOffset - var7, 0, math.max(0, getCurrent().contentLength - var14.viewportLength))
			local var15 = var3 == 0
			
			if var15 and var4 ~= nil then
				if math.abs(var14.scrollOffset - var4) < 0.5 then
					var15 = false
				else
					var4 = nil
				end
			end
			if var15 and clampedValue ~= var5 then
				p1.observeScrollOffset({
					kind = viewRecyclerModule.ScrollObservationKind.User,
					offset = clampedValue
				})
				var5 = clampedValue
			end
			if var15 and p2 == true then
				var10 = true
			end
			if var15 and var7 ~= 0 then
				var8 = 0
				
				if var14.scrollOffset <= 0.5 then
					settleCanvasOriginOffset(nil)
				end
			end
			local onScrollOffsetChanged = configuration.onScrollOffsetChanged
			
			if onScrollOffsetChanged ~= nil and clampedValue ~= var6 then
				onScrollOffsetChanged(clampedValue)
				var6 = clampedValue
			end
		end
		
		local _ = function(p2)
			return if p2.UserInputType ~= Enum.UserInputType.Touch then p2.UserInputType == Enum.UserInputType.MouseButton1 else true
		end
		
		local function connectHost(p2)
			-- upvalues: var2 (write), disconnectHost (ref), t (ref), configuration (write), p1 (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref), t_1 (ref), userInputService (copy)
			if var2 == p2 then return end
			disconnectHost()
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
				synchronizeScrollOffset(p2, true)
			end))
			table.insert(t, p2.InputBegan:Connect(function(p3)
				-- upvalues: t_1 (copy)
				if if p3.UserInputType ~= Enum.UserInputType.Touch then p3.UserInputType == Enum.UserInputType.MouseButton1 else true then
					t_1[p3] = true
				end
			end))
			table.insert(t, p2.InputEnded:Connect(function(p3)
				-- upvalues: t_1 (copy)
				t_1[p3] = nil
			end))
			table.insert(t, userInputService.InputEnded:Connect(function(p3)
				-- upvalues: t_1 (copy)
				t_1[p3] = nil
			end))
		end
		
		return {
			connect = function()
				-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), var1 (write), configuration (write), p1 (ref), axis (write), connectHost (ref), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref), disconnectHost (ref)
				assert(disconnected == scrollHostLifecyclePhaseModule.Disconnected, "ScrollHost: already connected")
				var1 += 1
				local var14 = var1
				configuration = p1.getConfiguration()
				axis = configuration.axis
				disconnected = scrollHostLifecyclePhaseModule.Priming
				connectHost(p1.getInstance())
				local ok, status = pcall(function()
					-- upvalues: disconnected (copy), scrollHostLifecyclePhaseModule (copy), publishCanvas (copy), p1 (copy), synchronizeViewport (copy), synchronizeScrollOffset (copy)
					disconnected = scrollHostLifecyclePhaseModule.Synchronized
					publishCanvas()
					local instance = p1.getInstance()
					
					if instance ~= nil then
						synchronizeViewport(instance)
						synchronizeScrollOffset(instance)
					end
				end)
				
				if not ok then
					disconnected = scrollHostLifecyclePhaseModule.Disconnected
					disconnectHost()
					error(status, 0)
				end
				local var15 = false
				
				return function()
					-- upvalues: var15 (write), disconnected (copy), scrollHostLifecyclePhaseModule (copy), var1 (copy), var14 (ref), disconnectHost (copy)
					if var15 then return end
					var15 = true
					
					if disconnected ~= scrollHostLifecyclePhaseModule.Disconnected and var1 == var14 then
						disconnected = scrollHostLifecyclePhaseModule.Disconnected
						disconnectHost()
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
				-- upvalues: configuration (write), p1 (ref), axis (write), disconnected (write), scrollHostLifecyclePhaseModule (copy), publishCanvas (ref), synchronizeViewport (ref), synchronizeScrollOffset (ref)
				configuration = p1.getConfiguration()
				local var14 = configuration
				local var15 = var14.axis ~= axis
				axis = var14.axis
				
				if disconnected ~= scrollHostLifecyclePhaseModule.Disconnected and var15 then
					local instance = p1.getInstance()
					
					if instance ~= nil then
						publishCanvas()
						synchronizeViewport(instance)
						synchronizeScrollOffset(instance)
					end
				end
			end,
			applyRecord = function(p2, p3)
				-- upvalues: disconnected (write), scrollHostLifecyclePhaseModule (copy), configuration (write), p1 (ref), var7 (write), t_1 (ref), axisMapModule (copy), var10 (write), publishCanvas (ref), var8 (write), var9 (write), runService (copy), settleCanvasOriginOffset (ref), var5 (write), var6 (write), applyProgrammaticScrollOffset (ref)
				if disconnected == scrollHostLifecyclePhaseModule.Disconnected then
					p3()
					
					return
				end
				configuration = p1.getConfiguration()
				local scrollCorrection = p2.scrollCorrection
				local var14 = if p2.scrollPositionChanged then p2.scrollState.scrollOffset else nil
				local var15 = false
				
				if scrollCorrection ~= 0 then
					var15 = p2.scrollPositionFollowsCorrection
					
					if var15 then
						if var7 == 0 then
							if next(t_1) == nil then
								local instance = p1.getInstance()
								var15 = if instance == nil then false else math.abs(axisMapModule.mainOf(instance:GetScrollVelocity(), configuration.axis)) >= 0.5 or var10
							else
								var15 = true
							end
							if var15 then
								local instance = p1.getInstance()
								var15 = not (instance ~= nil and axisMapModule.mainOf(instance.CanvasPosition, configuration.axis) <= 0.5)
							end
						end
					end
				end
				if var15 then
					local var16 = var7 - scrollCorrection
					
					if var7 ~= var16 then
						var7 = var16
						local _ = p1.onCanvasOriginMoved ~= nil
					end
					p3()
					
					if p1.onCanvasOriginMoved ~= nil then
						p1.onCanvasOriginMoved()
					end
					publishCanvas()
					var8 = 0
					
					if var9 == nil and var7 ~= 0 then
						var9 = runService.Heartbeat:Connect(function()
							-- upvalues: var10 (copy), var8 (copy), t_1 (copy), p1 (copy), axisMapModule (copy), configuration (copy), settleCanvasOriginOffset (copy)
							local var17
							var10 = false
							
							if var10 then
								var8 = 0
								
								return
							elseif next(t_1) == nil then
								local instance = p1.getInstance()
								var17 = if instance == nil then false else math.abs(axisMapModule.mainOf(instance:GetScrollVelocity(), configuration.axis)) >= 0.5 or var10
							else
								var17 = true
							end
							if var17 then
								var8 = 0
								
								return
							end
							var8 += 1
							
							if var8 >= 2 then
								settleCanvasOriginOffset(nil)
							end
						end)
					end
					if var14 ~= nil then
						var5 = var14
						local onScrollOffsetChanged = configuration.onScrollOffsetChanged
						
						if onScrollOffsetChanged ~= nil and var14 ~= var6 then
							onScrollOffsetChanged(var14)
							var6 = var14
						end
					end
				else
					p3()
					
					if var7 == 0 then
						if p2.scrollPositionChanged or p2.contentLengthChanged then
							publishCanvas()
						end
						if var14 ~= nil then
							applyProgrammaticScrollOffset(var14)
						end
					else
						settleCanvasOriginOffset(var14)
					end
				end
				if p2.contentLengthChanged then
					local onContentLengthChanged = configuration.onContentLengthChanged
					
					if onContentLengthChanged ~= nil then
						onContentLengthChanged(p2.contentLength)
					end
				end
				if p2.startReached and configuration.onStartReached ~= nil then
					configuration.onStartReached()
				end
				if p2.endReached and configuration.onEndReached ~= nil then
					configuration.onEndReached()
				end
			end,
			getCanvasOriginOffset = function()
				-- upvalues: var7 (write)
				return var7
			end,
			isReady = function()
				-- upvalues: configuration (write), p1 (ref), getViewportState (ref)
				configuration = p1.getConfiguration()
				
				return getViewportState(nil) ~= nil
			end
		}
	end
}