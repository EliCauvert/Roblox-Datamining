local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local CanvasItemPlacerModule = require(ViewRecyclerRoblox.RobloxAdapter.CanvasItemPlacer)
local EndLimitFrameModule = require(ViewRecyclerRoblox.RobloxAdapter.EndLimitFrame)
local HostPresentationPhaseModule = require(ViewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)

return {
	new = function(Configuration, Configuration1, Callback)
		-- upvalues: CanvasItemPlacerModule (copy), HostPresentationPhaseModule (copy), EndLimitFrameModule (copy)
		local Tbl = {}
		
		local function _(p1)
			local EndLimitFrame = p1.endLimitFrame
			
			if EndLimitFrame ~= nil then
				p1.endLimitFrame = nil
				EndLimitFrame.destroy()
			end
		end
		
		local _ = function(p1, p2, p3, p4, OriginOffset)
			-- upvalues: Configuration (ref)
			local OriginOffset1 = OriginOffset or 0
			p1.endLimitFrame.place(p3, Configuration, (p2.mainAxisOffset or 0) + OriginOffset1, p2.mainAxisEndLimit + OriginOffset1, p4)
			p1.originOffset = OriginOffset
		end
		
		local _ = function(p1, p2, p3)
			-- upvalues: CanvasItemPlacerModule (upval), Configuration (ref), Configuration1 (ref)
			local State = p1.state
			
			return CanvasItemPlacerModule.getGeometry(State.itemLayout, p2, Configuration, Configuration1 or State.index == nil, if p3 == nil then 0 else State.contentStartOffset + p3, p1.geometry)
		end
		
		return {
			place = function(Key, PlacerState, Geometry, State, IsNotHiddenMatch, Hidden): boolean
				-- upvalues: Tbl (copy), HostPresentationPhaseModule (upval), CanvasItemPlacerModule (upval), Configuration (ref), Configuration1 (ref), EndLimitFrameModule (upval), Callback (copy)
				local CanvasPlacement = if IsNotHiddenMatch then State.canvasPlacement else State.viewportPlacement
				local Entry = Tbl[Key]
				
				if Entry == nil then
					Entry = {
						originOffset = nil,
						endLimitFrame = nil,
						placerState = PlacerState,
						state = State,
						geometry = {}
					}
					Tbl[Key] = Entry
				end
				Entry.placerState = PlacerState
				Entry.state = State
				local IsNotHiddenMatch1 = Hidden ~= HostPresentationPhaseModule.Hidden
				
				if CanvasPlacement.mainAxisEndLimit ~= nil then
					local State1 = Entry.state
					local EndLimitFrame = Entry.endLimitFrame or EndLimitFrameModule.new()
					Entry.endLimitFrame = EndLimitFrame
					CanvasItemPlacerModule.place(Key, EndLimitFrame.instance, CanvasItemPlacerModule.getGeometry(State1.itemLayout, {
						mainAxisOffset = 0,
						mainAxisLength = CanvasPlacement.mainAxisLength,
						zIndex = CanvasPlacement.zIndex
					}, Configuration, Configuration1 or State1.index == nil, 0, Entry.geometry), PlacerState, IsNotHiddenMatch1)
					local CallbackResult = if IsNotHiddenMatch then Callback() else nil
					local CallbackResult1 = CallbackResult or 0
					Entry.endLimitFrame.place(Geometry, Configuration, (CanvasPlacement.mainAxisOffset or 0) + CallbackResult1, CanvasPlacement.mainAxisEndLimit + CallbackResult1, Key.ZIndex)
					Entry.originOffset = CallbackResult
					
					return IsNotHiddenMatch1
				end
				local CallbackResult = if IsNotHiddenMatch then Callback() else nil
				local State2 = Entry.state
				CanvasItemPlacerModule.place(Key, Geometry, CanvasItemPlacerModule.getGeometry(State2.itemLayout, CanvasPlacement, Configuration, Configuration1 or State2.index == nil, if CallbackResult == nil then 0 else State2.contentStartOffset + CallbackResult, Entry.geometry), PlacerState, IsNotHiddenMatch1)
				local Entry1 = Entry
				local EndLimitFrame = Entry1.endLimitFrame
				
				if EndLimitFrame ~= nil then
					Entry1.endLimitFrame = nil
					EndLimitFrame.destroy()
				end
				Entry.originOffset = CallbackResult
				
				return IsNotHiddenMatch1
			end,
			remove = function(Key)
				-- upvalues: Tbl (copy)
				local Entry = Tbl[Key]
				
				if Entry ~= nil then
					Tbl[Key] = nil
					local EndLimitFrame = Entry.endLimitFrame
					
					if EndLimitFrame ~= nil then
						Entry.endLimitFrame = nil
						EndLimitFrame.destroy()
					end
				end
			end,
			setConfiguration = function(Value, Value1)
				-- upvalues: Configuration (ref), Configuration1 (ref)
				Configuration = Value
				Configuration1 = Value1
			end,
			setOriginOffset = function(OriginOffset)
				-- upvalues: Tbl (copy), Configuration (ref), CanvasItemPlacerModule (upval), Configuration1 (ref)
				for i, value in Tbl do
					if value.originOffset ~= nil and value.originOffset ~= OriginOffset then
						local EndLimitFrame = value.endLimitFrame
						
						if EndLimitFrame == nil then
							local State = value.state
							CanvasItemPlacerModule.updatePosition(i, CanvasItemPlacerModule.getGeometry(State.itemLayout, value.state.canvasPlacement, Configuration, Configuration1 or State.index == nil, if OriginOffset == nil then 0 else State.contentStartOffset + OriginOffset, value.geometry), value.placerState)
							value.originOffset = OriginOffset
						else
							local CanvasPlacement = value.state.canvasPlacement
							local OriginOffset1 = OriginOffset or 0
							value.endLimitFrame.place(EndLimitFrame.instance.Parent, Configuration, (CanvasPlacement.mainAxisOffset or 0) + OriginOffset1, CanvasPlacement.mainAxisEndLimit + OriginOffset1, i.ZIndex)
							value.originOffset = OriginOffset
						end
					end
				end
			end,
			destroy = function()
				-- upvalues: Tbl (copy)
				for _, value in Tbl do
					local EndLimitFrame = value.endLimitFrame
					
					if EndLimitFrame ~= nil then
						value.endLimitFrame = nil
						EndLimitFrame.destroy()
					end
				end
				table.clear(Tbl)
			end
		}
	end
}