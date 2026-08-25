local parent = script:FindFirstAncestor("ViewportUtils").Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local intersectBoundsModule = require(script.Parent.intersectBounds)
local fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold = sharedFlagsModule.FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold
local fIntLuaAppViewportBoundsScreenSizeThreshold = sharedFlagsModule.FIntLuaAppViewportBoundsScreenSizeThreshold

local function getGuiAncestors(p0)
	local t = {}
	local parent = p0.Parent
	while parent and (parent ~= game and parent:IsA("GuiObject")) do
		table.insert(t, parent)
		parent = parent.Parent
	end
	return t
end

local function _(p1)
	local absolutePosition = p1.AbsolutePosition
	
	return {
		min = absolutePosition,
		max = absolutePosition + p1.AbsoluteSize
	}
end

local function computeClipBounds(p2)
	-- upvalues: intersectBoundsModule (ref)
	local var6 = nil
	
	for i, v in p2 do
		if v.ClipsDescendants or v:GetStyled("ClipsDescendants") == true then
			local absolutePosition = v.AbsolutePosition
			local t = {
				min = absolutePosition,
				max = absolutePosition + v.AbsoluteSize
			}
			var6 = if var6 then intersectBoundsModule(var6, t) else t
		end
	end
	return var6
end

return function(p3)
	-- upvalues: reactModule (ref), computeClipBounds (ref), getGuiAncestors (ref), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (ref), fIntLuaAppViewportBoundsScreenSizeThreshold (ref)
	local var8, var9 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var9 (ref), computeClipBounds (copy), getGuiAncestors (copy), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy)
		local var10 = if p3 then p3.current else nil
		
		if var10 then
			local t = {}
			local t_1 = {}
			local var13 = nil
			
			local function _()
				-- upvalues: var13 (write)
				if var13 then
					task.cancel(var13)
					var13 = nil
				end
			end
			
			local _ = function()
				-- upvalues: var13 (write), var9 (copy), computeClipBounds (copy), t_1 (write)
				if var13 then
					return
				end
				var13 = task.defer(function()
					-- upvalues: var13 (copy), var9 (copy), computeClipBounds (copy), t_1 (copy)
					var13 = nil
					var9(computeClipBounds(t_1))
				end)
			end
			
			local function disconnectAncestorConnections()
				-- upvalues: t (write)
				for i, v in t do
					if v.Connected then
						v:Disconnect()
					end
				end
				t = {}
			end
			
			local function connectToAncestors()
				-- upvalues: var13 (write), disconnectAncestorConnections (ref), t_1 (write), getGuiAncestors (copy), var10 (ref), var9 (copy), computeClipBounds (copy), t (write), connectToAncestors (ref), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy)
				if var13 then
					task.cancel(var13)
					var13 = nil
				end
				disconnectAncestorConnections()
				t_1 = getGuiAncestors(var10)
				var9(computeClipBounds(t_1))
				
				for i, v in t_1 do
					table.insert(t, v:GetPropertyChangedSignal("ClipsDescendants"):Connect(connectToAncestors))
					table.insert(t, v:GetStyledPropertyChangedSignal("ClipsDescendants"):Connect(connectToAncestors))
					
					if v.ClipsDescendants or v:GetStyled("ClipsDescendants") == true then
						local absolutePosition = v.AbsolutePosition
						table.insert(t, v:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
							-- upvalues: v (ref), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), absolutePosition (write), var13 (copy), var9 (copy), computeClipBounds (copy), t_1 (copy)
							local absolutePosition_1 = v.AbsolutePosition
							local var17 = absolutePosition_1 - absolutePosition
							
							if math.abs(var17.X) < fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold and math.abs(var17.Y) < fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold then return end
							absolutePosition = absolutePosition_1
							
							if var13 then
								return
							end
							var13 = task.defer(function()
								-- upvalues: var13 (copy), var9 (copy), computeClipBounds (copy), t_1 (copy)
								var13 = nil
								var9(computeClipBounds(t_1))
							end)
						end))
						local absoluteSize = v.AbsoluteSize
						table.insert(t, v:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							-- upvalues: v (ref), fIntLuaAppViewportBoundsScreenSizeThreshold (copy), absoluteSize (write), var13 (copy), var9 (copy), computeClipBounds (copy), t_1 (copy)
							local absoluteSize_1 = v.AbsoluteSize
							local var18 = absoluteSize_1 - absoluteSize
							
							if math.abs(var18.X) < fIntLuaAppViewportBoundsScreenSizeThreshold and math.abs(var18.Y) < fIntLuaAppViewportBoundsScreenSizeThreshold then return end
							absoluteSize = absoluteSize_1
							
							if var13 then
								return
							end
							var13 = task.defer(function()
								-- upvalues: var13 (copy), var9 (copy), computeClipBounds (copy), t_1 (copy)
								var13 = nil
								var9(computeClipBounds(t_1))
							end)
						end))
					end
				end
			end
			
			connectToAncestors()
			local ancestryChangedConnection = var10.AncestryChanged:Connect(function()
				-- upvalues: connectToAncestors (ref)
				connectToAncestors()
			end)
			
			return function()
				-- upvalues: var13 (write), ancestryChangedConnection (ref), disconnectAncestorConnections (ref)
				if var13 then
					task.cancel(var13)
					var13 = nil
				end
				ancestryChangedConnection:Disconnect()
				disconnectAncestorConnections()
			end
		end
		var9(nil)
	end, { p3 })
	
	return var8
end