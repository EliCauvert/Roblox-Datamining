local parent = script:FindFirstAncestor("ViewportUtils").Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local intersectBoundsModule = require(script.Parent.intersectBounds)
local fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold = sharedFlagsModule.FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold
local fIntLuaAppViewportBoundsScreenSizeThreshold = sharedFlagsModule.FIntLuaAppViewportBoundsScreenSizeThreshold

local function getGuiAncestors(p1)
	local t = {}
	local parent = p1.Parent
	while parent and (parent ~= game and parent:IsA("GuiObject")) do
		table.insert(t, parent)
		parent = parent.Parent
	end
	return t
end

local function _(p2)
	local absolutePosition = p2.AbsolutePosition
	
	return {
		min = absolutePosition,
		max = absolutePosition + p2.AbsoluteSize
	}
end

local function computeClipBounds(p2)
	-- upvalues: intersectBoundsModule (ref)
	local var1 = nil
	
	for i, v in p2 do
		if v.ClipsDescendants or v:GetStyled("ClipsDescendants") == true then
			local absolutePosition = v.AbsolutePosition
			local t = {
				min = absolutePosition,
				max = absolutePosition + v.AbsoluteSize
			}
			var1 = if var1 then intersectBoundsModule(var1, t) else t
		end
	end
	return var1
end

return function(p3)
	-- upvalues: reactModule (ref), computeClipBounds (ref), getGuiAncestors (ref), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (ref), fIntLuaAppViewportBoundsScreenSizeThreshold (ref)
	local var2, var3 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var3 (ref), computeClipBounds (copy), getGuiAncestors (copy), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy)
		local var4 = if p3 then p3.current else nil
		
		if var4 then
			local t = {}
			local t_1 = {}
			local var5 = nil
			
			local function _()
				-- upvalues: var5 (write)
				if var5 then
					task.cancel(var5)
					var5 = nil
				end
			end
			
			local _ = function()
				-- upvalues: var5 (write), var3 (copy), computeClipBounds (copy), t_1 (write)
				if var5 then
					return
				end
				var5 = task.defer(function()
					-- upvalues: var5 (copy), var3 (copy), computeClipBounds (copy), t_1 (copy)
					var5 = nil
					var3(computeClipBounds(t_1))
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
				-- upvalues: var5 (write), disconnectAncestorConnections (ref), t_1 (write), getGuiAncestors (copy), var4 (ref), var3 (copy), computeClipBounds (copy), t (write), connectToAncestors (ref), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy)
				if var5 then
					task.cancel(var5)
					var5 = nil
				end
				disconnectAncestorConnections()
				t_1 = getGuiAncestors(var4)
				var3(computeClipBounds(t_1))
				
				for i, v in t_1 do
					table.insert(t, v:GetPropertyChangedSignal("ClipsDescendants"):Connect(connectToAncestors))
					table.insert(t, v:GetStyledPropertyChangedSignal("ClipsDescendants"):Connect(connectToAncestors))
					
					if v.ClipsDescendants or v:GetStyled("ClipsDescendants") == true then
						local absolutePosition = v.AbsolutePosition
						table.insert(t, v:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
							-- upvalues: v (ref), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), absolutePosition (write), var5 (copy), var3 (copy), computeClipBounds (copy), t_1 (copy)
							local absolutePosition_1 = v.AbsolutePosition
							local var6 = absolutePosition_1 - absolutePosition
							
							if math.abs(var6.X) < fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold and math.abs(var6.Y) < fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold then return end
							absolutePosition = absolutePosition_1
							
							if var5 then
								return
							end
							var5 = task.defer(function()
								-- upvalues: var5 (copy), var3 (copy), computeClipBounds (copy), t_1 (copy)
								var5 = nil
								var3(computeClipBounds(t_1))
							end)
						end))
						local absoluteSize = v.AbsoluteSize
						table.insert(t, v:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							-- upvalues: v (ref), fIntLuaAppViewportBoundsScreenSizeThreshold (copy), absoluteSize (write), var5 (copy), var3 (copy), computeClipBounds (copy), t_1 (copy)
							local absoluteSize_1 = v.AbsoluteSize
							local var6 = absoluteSize_1 - absoluteSize
							
							if math.abs(var6.X) < fIntLuaAppViewportBoundsScreenSizeThreshold and math.abs(var6.Y) < fIntLuaAppViewportBoundsScreenSizeThreshold then return end
							absoluteSize = absoluteSize_1
							
							if var5 then
								return
							end
							var5 = task.defer(function()
								-- upvalues: var5 (copy), var3 (copy), computeClipBounds (copy), t_1 (copy)
								var5 = nil
								var3(computeClipBounds(t_1))
							end)
						end))
					end
				end
			end
			
			connectToAncestors()
			local ancestryChangedConnection = var4.AncestryChanged:Connect(function()
				-- upvalues: connectToAncestors (ref)
				connectToAncestors()
			end)
			
			return function()
				-- upvalues: var5 (write), ancestryChangedConnection (ref), disconnectAncestorConnections (ref)
				if var5 then
					task.cancel(var5)
					var5 = nil
				end
				ancestryChangedConnection:Disconnect()
				disconnectAncestorConnections()
			end
		end
		var3(nil)
	end, { p3 })
	
	return var2
end