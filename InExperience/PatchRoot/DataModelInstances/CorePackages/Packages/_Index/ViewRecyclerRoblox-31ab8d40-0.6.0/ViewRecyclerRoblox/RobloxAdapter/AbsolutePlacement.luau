local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(viewRecyclerRoblox.Parent.ViewRecycler)
local canvasItemPlacerModule = require(viewRecyclerRoblox.RobloxAdapter.CanvasItemPlacer)
local endLimitFrameModule = require(viewRecyclerRoblox.RobloxAdapter.EndLimitFrame)
local hostPresentationPhaseModule = require(viewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)

return {
	new = function(p1, p2, p3)
		-- upvalues: canvasItemPlacerModule (ref), hostPresentationPhaseModule (ref), endLimitFrameModule (ref)
		local t = {}
		
		local function _(p4)
			local endLimitFrame = p4.endLimitFrame
			
			if endLimitFrame ~= nil then
				p4.endLimitFrame = nil
				endLimitFrame.destroy()
			end
		end
		
		local _ = function(p4, p5, p6)
			-- upvalues: canvasItemPlacerModule (copy), p1 (write), p2 (write)
			local state = p4.state
			
			return canvasItemPlacerModule.getGeometry(state.itemLayout, p5, p1, p2 or state.index == nil, if p6 == nil then 0 else state.contentStartOffset + p6, p4.geometry)
		end
		
		return {
			place = function(p4, p5, p6, p7, p8, p9)
				-- upvalues: t (ref), hostPresentationPhaseModule (copy), canvasItemPlacerModule (copy), p1 (write), p2 (write), endLimitFrameModule (copy), p3 (ref)
				local var1 = if p8 then p7.canvasPlacement else p7.viewportPlacement
				local var2 = t[p4]
				
				if var2 == nil then
					var2 = {
						originOffset = nil,
						endLimitFrame = nil,
						placerState = p5,
						state = p7,
						geometry = {}
					}
					t[p4] = var2
				end
				var2.placerState = p5
				var2.state = p7
				local var3 = p9 ~= hostPresentationPhaseModule.Hidden
				local mainAxisEndLimit = var1.mainAxisEndLimit
				
				if mainAxisEndLimit ~= nil then
					local state = var2.state
					local geometry = canvasItemPlacerModule.getGeometry(state.itemLayout, {
						mainAxisOffset = 0,
						mainAxisLength = var1.mainAxisLength,
						zIndex = var1.zIndex
					}, p1, p2 or state.index == nil, 0, var2.geometry)
					local endLimitFrame = var2.endLimitFrame or endLimitFrameModule.new()
					var2.endLimitFrame = endLimitFrame
					canvasItemPlacerModule.place(p4, endLimitFrame.instance, geometry, p5, var3)
					endLimitFrame.place(p6, p1, var1.mainAxisOffset or 0, mainAxisEndLimit, p4.ZIndex)
					var2.originOffset = nil
					
					return var3
				end
				local var4 = if p8 then p3() else nil
				local state = var2.state
				canvasItemPlacerModule.place(p4, p6, canvasItemPlacerModule.getGeometry(state.itemLayout, var1, p1, p2 or state.index == nil, if var4 == nil then 0 else state.contentStartOffset + var4, var2.geometry), p5, var3)
				local endLimitFrame = var2.endLimitFrame
				
				if endLimitFrame ~= nil then
					var2.endLimitFrame = nil
					endLimitFrame.destroy()
				end
				var2.originOffset = var4
				
				return var3
			end,
			remove = function(p4)
				-- upvalues: t (ref)
				local var1 = t[p4]
				
				if var1 ~= nil then
					t[p4] = nil
					local endLimitFrame = var1.endLimitFrame
					
					if endLimitFrame ~= nil then
						var1.endLimitFrame = nil
						endLimitFrame.destroy()
					end
				end
			end,
			setConfiguration = function(value, p4)
				-- upvalues: p1 (write), p2 (write)
				p1 = value
				p2 = p4
			end,
			setOriginOffset = function(value)
				-- upvalues: t (ref), canvasItemPlacerModule (copy), p1 (write), p2 (write)
				for i, v in t do
					if v.originOffset ~= nil and v.originOffset ~= value then
						local state = v.state
						canvasItemPlacerModule.updatePosition(i, canvasItemPlacerModule.getGeometry(state.itemLayout, v.state.canvasPlacement, p1, p2 or state.index == nil, if value == nil then 0 else state.contentStartOffset + value, v.geometry), v.placerState)
						v.originOffset = value
					end
				end
			end,
			destroy = function()
				-- upvalues: t (ref)
				for i, v in t do
					local endLimitFrame = v.endLimitFrame
					
					if endLimitFrame ~= nil then
						v.endLimitFrame = nil
						endLimitFrame.destroy()
					end
				end
				table.clear(t)
			end
		}
	end
}