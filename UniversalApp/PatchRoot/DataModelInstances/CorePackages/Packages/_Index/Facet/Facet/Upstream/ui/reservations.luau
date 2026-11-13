local self = setmetatable({}, { __mode = "k" })
local self1 = setmetatable({}, { __mode = "k" })
local self2 = setmetatable({}, { __mode = "k" })

local function publish(Gui)
	-- upvalues: self (copy)
	local Y = if Gui:IsA("GuiBase2d") then Gui.AbsoluteSize.Y else 0
	local Largest = 0
	local Largest1 = 0
	
	for _, value in self[Gui] or {} do
		if value.edge == "top" then
			Largest = math.max(Largest, value.y + value.h)
		else
			Largest1 = math.max(Largest1, Y - value.y)
		end
	end
	Gui:SetAttribute("FacetInsetTop", Largest)
	Gui:SetAttribute("FacetInsetBottom", Largest1)
end

return {
	set = function(Gui, Key, Edge, p1, p2: number)
		-- upvalues: self (copy), publish (copy)
		local SelfEntry = self[Gui]
		
		if SelfEntry == nil then
			SelfEntry = {}
			self[Gui] = SelfEntry
		end
		local v1 = assert(SelfEntry)
		
		if p1 == nil or p2 == nil or p2 <= 0 then
			v1[Key] = nil
		else
			v1[Key] = { edge = Edge, y = p1, h = p2 }
		end
		publish(Gui)
	end,
	reserved = function(Frame: Frame, Edge, p1): number
		-- upvalues: self (copy)
		local Parent = Frame.Parent
		local Children = if Parent then Parent:GetChildren() else { Frame }
		local Y = Frame.AbsolutePosition.Y
		local NewY = Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y
		local Largest = 0
		
		for _, child in Children do
			local SelfEntry = self[child]
			local IsFrameMatch = child == Frame or (not child:IsA("LayerCollector") or child.Enabled)
			
			if SelfEntry and IsFrameMatch and child:IsA("GuiBase2d") then
				local Y1 = child.AbsolutePosition.Y
				
				for i, value in SelfEntry do
					if value.edge == Edge and (not p1 or not p1[i]) then
						Largest = math.max(Largest, if Edge == "top" then Y1 + value.y + value.h - Y else NewY - Y1 - value.y)
					end
				end
			end
		end
		return Largest
	end,
	clear = function(Gui, Key)
		-- upvalues: self (copy), publish (copy)
		local SelfEntry = self[Gui]
		
		if SelfEntry and SelfEntry[Key] then
			SelfEntry[Key] = nil
			publish(Gui)
		end
	end,
	setZones = function(Key, Key1, Zones, Scope): boolean
		-- upvalues: self1 (copy)
		local SelfEntry = self1[Key]
		
		if SelfEntry == nil then
			SelfEntry = {}
			self1[Key] = SelfEntry
		end
		local v1 = assert(SelfEntry)
		local v2 = v1[Key1]
		local IsScopeMatch: boolean = v2 ~= nil and v2.scope == Scope
		
		if v2 then
			for zone in v2.zones do
				IsScopeMatch = IsScopeMatch and Zones[zone] == true
			end
			for zone1 in Zones do
				IsScopeMatch = IsScopeMatch and v2.zones[zone1] == true
			end
		end
		v1[Key1] = { zones = Zones, scope = Scope }
		
		return not IsScopeMatch
	end,
	clearZones = function(Key, Key1)
		-- upvalues: self1 (copy)
		local SelfEntry = self1[Key]
		
		if SelfEntry then
			SelfEntry[Key1] = nil
			
			if next(SelfEntry) == nil then
				self1[Key] = nil
			end
		end
	end,
	contests = function(LayerCollector, Token)
		-- upvalues: self1 (copy), self2 (copy)
		local List = {}
		local SelfEntry = self1[LayerCollector]
		local SelfEntry1 = if SelfEntry then SelfEntry[Token] else nil
		
		if SelfEntry1 == nil or next(SelfEntry1.zones) == nil then
			return List
		end
		local Parent = LayerCollector.Parent
		local SelfEntry2 = self2[Token]
		
		for LayerCollector1, value in self1 do
			local IsLayerCollectorMatch = LayerCollector1 == LayerCollector or (not LayerCollector1:IsA("LayerCollector") or LayerCollector1.Enabled)
			
			if (LayerCollector1 == LayerCollector or Parent ~= nil and LayerCollector1.Parent == Parent) and IsLayerCollectorMatch then
				for Token1, value1 in value do
					local SelfEntry21 = if SelfEntry2 then SelfEntry2[Token1] else nil
					
					if Token1 ~= Token and value1.scope == SelfEntry1.scope then
						for zone in SelfEntry1.zones do
							if value1.zones[zone] and (not SelfEntry21 or not SelfEntry21[zone]) then
								table.insert(List, { token = Token1, zone = zone })
							end
						end
					end
				end
			end
		end
		return List
	end,
	note = function(p2, p3, Key)
		-- upvalues: self2 (copy)
		for _, value in { { p2, p3 }, { p3, p2 } } do
			local v3 = value[1]
			local v4 = value[2]
			local SelfEntry = self2[v3]
			
			if SelfEntry == nil then
				SelfEntry = setmetatable({}, { __mode = "k" })
				self2[v3] = SelfEntry
			end
			local v5 = assert(SelfEntry)
			local v6 = v5[v4] or {}
			v6[Key] = true
			v5[v4] = v6
		end
	end
}