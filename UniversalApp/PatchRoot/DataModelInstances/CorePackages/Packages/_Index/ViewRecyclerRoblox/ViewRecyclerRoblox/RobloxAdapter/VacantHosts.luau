local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ReparentableHostModule = require(ViewRecyclerRoblox.RobloxAdapter.ReparentableHost)
local TransparentFrameModule = require(ViewRecyclerRoblox.RobloxAdapter.transparentFrame)
local self = setmetatable({}, { __mode = "k" })

local function scaleOf(Frame): number
	local ScaledScale = 1
	while Frame ~= nil do
		local UIScale = Frame:FindFirstChildOfClass("UIScale")
		
		if UIScale ~= nil then
			ScaledScale *= UIScale.Scale
		end
		Frame = Frame.Parent
	end
	return ScaledScale
end

local function _(p1)
	-- upvalues: ReparentableHostModule (copy)
	ReparentableHostModule.clearSelection(p1)
	
	if p1.Visible then
		p1.Visible = false
	end
end

return {
	register = function(Key, p1)
		-- upvalues: self (copy)
		self[Key] = p1
	end,
	forScope = function(p1)
		-- upvalues: self (copy)
		local SelfEntry = self[p1]
		assert(SelfEntry ~= nil, "ViewRecycler: the Recycling scope has no place for Vacant Hosts; create it with RobloxAdapter.createRecyclingScope")
		
		return SelfEntry
	end,
	new = function()
		-- upvalues: TransparentFrameModule (copy), scaleOf (copy), ReparentableHostModule (copy)
		local ViewRecyclerVacantHosts = TransparentFrameModule("ViewRecyclerVacantHosts")
		ViewRecyclerVacantHosts.Size = UDim2.fromScale(1, 1)
		ViewRecyclerVacantHosts.Visible = false
		local Tbl = {}
		local self = setmetatable({}, { __mode = "k" })
		
		local function frameFor(Scale: number)
			-- upvalues: ViewRecyclerVacantHosts (copy), Tbl (copy), TransparentFrameModule (upval)
			if math.abs(Scale - 1) < 0.000001 then
				return ViewRecyclerVacantHosts
			end
			local Formatted = string.format("%.6f", Scale)
			local Entry = Tbl[Formatted]
			
			if Entry == nil then
				Entry = TransparentFrameModule("Scaled")
				Entry.Size = UDim2.fromScale(1, 1)
				local Scale1 = Instance.new("UIScale")
				Scale1.Scale = Scale
				Scale1.Parent = Entry
				Entry.Parent = ViewRecyclerVacantHosts
				Tbl[Formatted] = Entry
			end
			return Entry
		end
		
		local function hold(List)
			-- upvalues: ViewRecyclerVacantHosts (copy), scaleOf (upval), self (copy), ReparentableHostModule (upval), frameFor (copy)
			local HasLayerCollector = ViewRecyclerVacantHosts:FindFirstAncestorWhichIsA("LayerCollector") ~= nil
			local ScaleOfResult = scaleOf(ViewRecyclerVacantHosts)
			local Buffer = table.create(#List)
			local Buffer1 = table.create(#List)
			
			for i, Frame in List do
				self[Frame] = nil
				ReparentableHostModule.clearSelection(Frame)
				
				if Frame.Visible then
					Frame.Visible = false
				end
				if Frame:FindFirstAncestorWhichIsA("LayerCollector") == nil then
					Buffer[i] = false
				elseif HasLayerCollector then
					Buffer[i] = Frame.AbsoluteSize / scaleOf(Frame)
					Buffer1[i] = scaleOf(Frame.Parent) / ScaleOfResult
				end
			end
			for i1, value in List do
				local BufferEntry = Buffer[i1]
				
				if BufferEntry == false then
					value.Position = UDim2.new()
					value.Parent = ViewRecyclerVacantHosts
				elseif BufferEntry ~= nil then
					value.Position = UDim2.new()
					value.Size = UDim2.fromOffset(BufferEntry.X, BufferEntry.Y)
					value.Parent = frameFor(Buffer1[i1])
				end
			end
		end
		
		return {
			setParent = function(Parent)
				-- upvalues: ViewRecyclerVacantHosts (copy)
				if ViewRecyclerVacantHosts.Parent ~= Parent then
					ViewRecyclerVacantHosts.Parent = Parent
				end
			end,
			leave = function(Key)
				-- upvalues: ReparentableHostModule (upval), self (copy)
				ReparentableHostModule.clearSelection(Key)
				
				if Key.Visible then
					Key.Visible = false
				end
				self[Key] = true
			end,
			reclaim = function(Key)
				-- upvalues: self (copy)
				self[Key] = nil
			end,
			evacuate = function(Callback)
				-- upvalues: self (copy), hold (copy)
				local List = {}
				
				for i in self do
					local Parent = i.Parent
					
					if Parent ~= nil and Callback(Parent) then
						table.insert(List, i)
					end
				end
				if #List > 0 then
					hold(List)
				end
			end,
			hold = hold,
			destroy = function()
				-- upvalues: ViewRecyclerVacantHosts (copy), Tbl (copy), self (copy)
				ViewRecyclerVacantHosts:Destroy()
				table.clear(Tbl)
				table.clear(self)
			end
		}
	end
}