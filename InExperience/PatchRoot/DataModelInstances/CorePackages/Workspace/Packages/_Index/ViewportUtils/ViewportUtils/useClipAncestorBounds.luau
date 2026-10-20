local Parent = script:FindFirstAncestor("ViewportUtils").Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local IntersectBoundsModule = require(script.Parent.intersectBounds)
local FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold = SharedFlagsModule.FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold
local FIntLuaAppViewportBoundsScreenSizeThreshold = SharedFlagsModule.FIntLuaAppViewportBoundsScreenSizeThreshold

local function getGuiAncestors(Current)
	local List = {}
	local Parent = Current.Parent
	while Parent and (Parent ~= game and Parent:IsA("GuiObject")) do
		table.insert(List, Parent)
		Parent = Parent.Parent
	end
	return List
end

local function _(Frame: Frame)
	local AbsolutePosition = Frame.AbsolutePosition
	
	return {
		min = AbsolutePosition,
		max = AbsolutePosition + Frame.AbsoluteSize
	}
end

local function computeClipBounds(Frames)
	-- upvalues: IntersectBoundsModule (copy)
	local v1 = nil
	
	for _, frame in Frames do
		if frame.ClipsDescendants or frame:GetStyled("ClipsDescendants") == true then
			local AbsolutePosition = frame.AbsolutePosition
			local config = {
				min = AbsolutePosition,
				max = AbsolutePosition + frame.AbsoluteSize
			}
			
			if v1 then
				v1 = IntersectBoundsModule(v1, config)
			else
				v1 = config
			end
		end
	end
	return v1
end

return function(p1)
	-- upvalues: ReactModule (copy), computeClipBounds (copy), getGuiAncestors (copy), FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), FIntLuaAppViewportBoundsScreenSizeThreshold (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), computeClipBounds (upval), getGuiAncestors (upval), FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (upval), FIntLuaAppViewportBoundsScreenSizeThreshold (upval)
		local Current = if p1 then p1.current else nil
		
		if not Current then
			UseStateResult2(nil)
			
			return
		end
		local List = {}
		local Frames = {}
		local DeferredThread = nil
		
		local function _()
			-- upvalues: DeferredThread (ref)
			if DeferredThread then
				task.cancel(DeferredThread)
				DeferredThread = nil
			end
		end
		
		local _ = function()
			-- upvalues: DeferredThread (ref), UseStateResult2 (upval), computeClipBounds (upval), Frames (ref)
			if not DeferredThread then
				DeferredThread = task.defer(function()
					-- upvalues: DeferredThread (upval), UseStateResult2 (upval), computeClipBounds (upval), Frames (upval)
					DeferredThread = nil
					UseStateResult2((computeClipBounds(Frames)))
				end)
				
				return
			end
		end
		
		local function disconnectAncestorConnections()
			-- upvalues: List (ref)
			for _, Connection in List do
				if Connection.Connected then
					Connection:Disconnect()
				end
			end
			List = {}
		end
		
		local function connectToAncestors()
			-- upvalues: DeferredThread (ref), disconnectAncestorConnections (copy), Frames (ref), getGuiAncestors (upval), Current (copy), UseStateResult2 (upval), computeClipBounds (upval), List (ref), connectToAncestors (copy), FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (upval), FIntLuaAppViewportBoundsScreenSizeThreshold (upval)
			if DeferredThread then
				task.cancel(DeferredThread)
				DeferredThread = nil
			end
			disconnectAncestorConnections()
			Frames = getGuiAncestors(Current)
			UseStateResult2((computeClipBounds(Frames)))
			
			for _, frame in Frames do
				table.insert(List, frame:GetPropertyChangedSignal("ClipsDescendants"):Connect(connectToAncestors))
				table.insert(List, frame:GetStyledPropertyChangedSignal("ClipsDescendants"):Connect(connectToAncestors))
				
				if frame.ClipsDescendants or frame:GetStyled("ClipsDescendants") == true then
					local AbsolutePosition = frame.AbsolutePosition
					table.insert(List, frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
						-- upvalues: frame (copy), FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (upval), AbsolutePosition (ref), DeferredThread (upval), UseStateResult2 (upval), computeClipBounds (upval), Frames (upval)
						local AbsolutePosition1 = frame.AbsolutePosition
						local AbsolutePositionDelta = AbsolutePosition1 - AbsolutePosition
						
						if math.abs(AbsolutePositionDelta.X) < FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold and math.abs(AbsolutePositionDelta.Y) < FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold then return end
						AbsolutePosition = AbsolutePosition1
						
						if not DeferredThread then
							DeferredThread = task.defer(function()
								-- upvalues: DeferredThread (upval), UseStateResult2 (upval), computeClipBounds (upval), Frames (upval)
								DeferredThread = nil
								UseStateResult2((computeClipBounds(Frames)))
							end)
							
							return
						end
					end))
					local AbsoluteSize = frame.AbsoluteSize
					table.insert(List, frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
						-- upvalues: frame (copy), FIntLuaAppViewportBoundsScreenSizeThreshold (upval), AbsoluteSize (ref), DeferredThread (upval), UseStateResult2 (upval), computeClipBounds (upval), Frames (upval)
						local AbsoluteSize1 = frame.AbsoluteSize
						local AbsoluteSizeDelta = AbsoluteSize1 - AbsoluteSize
						
						if math.abs(AbsoluteSizeDelta.X) < FIntLuaAppViewportBoundsScreenSizeThreshold and math.abs(AbsoluteSizeDelta.Y) < FIntLuaAppViewportBoundsScreenSizeThreshold then return end
						AbsoluteSize = AbsoluteSize1
						
						if not DeferredThread then
							DeferredThread = task.defer(function()
								-- upvalues: DeferredThread (upval), UseStateResult2 (upval), computeClipBounds (upval), Frames (upval)
								DeferredThread = nil
								UseStateResult2((computeClipBounds(Frames)))
							end)
							
							return
						end
					end))
				end
			end
		end
		
		connectToAncestors()
		local AncestryChangedConnection = Current.AncestryChanged:Connect(function()
			-- upvalues: connectToAncestors (copy)
			connectToAncestors()
		end)
		
		return function()
			-- upvalues: DeferredThread (ref), AncestryChangedConnection (copy), disconnectAncestorConnections (copy)
			if DeferredThread then
				task.cancel(DeferredThread)
				DeferredThread = nil
			end
			AncestryChangedConnection:Disconnect()
			disconnectAncestorConnections()
		end
	end, { p1 })
	
	return UseStateResult
end