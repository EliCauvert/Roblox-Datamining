local _ = require("./types")
local _ = require("../vendor/compose/core")
local TextMeasureModule = require("./text_measure")
local self = setmetatable({}, { __mode = "k" })

local function painted(Object): boolean
	-- upvalues: TextMeasureModule (copy), painted (copy)
	if Object:IsA("GuiObject") then
		if not Object.Visible then
			return true
		end
		if Object:GetAttribute("FacetBuilt") == false then
			return false
		end
		if Object:IsA("ViewportFrame") and Object:GetAttribute("FacetMediaReady") == false then
			return false
		end
		if (Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox")) and Object.Text ~= "" and Object.TextTransparency < 1 then
			if TextMeasureModule.pending(Object) then
				return false
			end
			local AbsoluteSize = Object.AbsoluteSize
			local TextBounds = Object.TextBounds
			
			if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 or TextBounds.X <= 0 or TextBounds.Y <= 0 then
				return false
			end
		end
	end
	for _, child in Object:GetChildren() do
		if not painted(child) then
			return false
		end
	end
	return true
end

local function listen(Object, Frame, List, Callback)
	if Object:IsA("GuiObject") then
		if Object ~= Frame then
			table.insert(List, Object:GetPropertyChangedSignal("AbsoluteSize"):Connect(Callback))
		end
		table.insert(List, Object:GetPropertyChangedSignal("Visible"):Connect(Callback))
		
		if Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox") then
			table.insert(List, Object:GetPropertyChangedSignal("TextBounds"):Connect(Callback))
		end
	end
end

return function(p1, Frame: Frame, Callback, p2, Enabled)
	-- upvalues: painted (copy), self (copy), listen (copy)
	local function sample()
		-- upvalues: Frame (copy), painted (upval)
		local AbsoluteSize = Frame.AbsoluteSize
		
		return AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 and painted(Frame)
	end
	
	if p2 and p1.runtime.host.frames then
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 or not painted(Frame) then
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(Frame)
			
			return p1.runtime.settled({
				restart = function(Callback1): boolean
					-- upvalues: AbsoluteSizeResult (copy), Callback (copy)
					local CallbackResult = Callback1(AbsoluteSizeResult)
					
					if Callback then
						Callback(Callback1, CallbackResult)
					end
					return CallbackResult.X > 0 and CallbackResult.Y > 0
				end,
				ready = sample,
				sample = function()
					-- upvalues: Frame (copy)
					local List = {}
					
					local function _(Vector)
						-- upvalues: List (copy)
						table.insert(List, Vector.X)
						table.insert(List, Vector.Y)
					end
					
					local AbsoluteSize = Frame.AbsoluteSize
					table.insert(List, AbsoluteSize.X)
					table.insert(List, AbsoluteSize.Y)
					local Parent = Frame.Parent
					
					if Parent and Parent:IsA("GuiObject") then
						local AbsoluteSize1 = Parent.AbsoluteSize
						table.insert(List, AbsoluteSize1.X)
						table.insert(List, AbsoluteSize1.Y)
					end
					for _, descendant in Frame:GetDescendants() do
						if descendant:IsA("GuiObject") then
							local AbsoluteSize2 = descendant.AbsoluteSize
							table.insert(List, AbsoluteSize2.X)
							table.insert(List, AbsoluteSize2.Y)
							
							if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
								local TextBounds = descendant.TextBounds
								table.insert(List, TextBounds.X)
								table.insert(List, TextBounds.Y)
							end
						end
					end
					return List
				end,
				equals = function(List, p3): boolean
					if #List ~= #p3 then
						return false
					end
					for i, value in List do
						if p3[i] ~= value then
							return false
						end
					end
					return true
				end
			}), nil
		end
	end
	local CellResult = p1.Compose.cell(false)
	local PreRender = p1.config.services.RunService and p1.config.services.RunService.PreRender
	local Frames = p1.runtime.host.frames
	local IsEnabled: boolean = Enabled == true or not PreRender and not Frames
	local Flag = false
	local Flag1 = false
	local Count = 0
	local v1 = nil
	local Tbl = {}
	local v2 = nil
	
	local function halt()
		-- upvalues: Tbl (copy), v1 (ref), Flag (ref), v2 (ref)
		for _, Connection in Tbl do
			Connection:Disconnect()
		end
		table.clear(Tbl)
		local v3 = v1
		
		if not Flag or v3 == nil then return end
		Flag = false
		v3.steps[v2] = nil
		v3.count -= 1
		local StopFunction: () -> () = v3.stop
		
		if v3.count == 0 and StopFunction then
			v3.stop = nil
			StopFunction()
		end
	end
	
	local function arm()
		-- upvalues: Flag1 (ref), Flag (ref), PreRender (copy), Frames (copy), p1 (copy), self (upval), v1 (ref), v2 (ref)
		if Flag1 or Flag or not PreRender and not Frames then return end
		local Runtime = p1.runtime
		local SelfEntry = self[Runtime]
		
		if SelfEntry == nil then
			SelfEntry = { count = 0, steps = {}, queue = {} }
			self[Runtime] = SelfEntry
		end
		local SelfEntry1 = SelfEntry
		v1 = SelfEntry1
		Flag = true
		SelfEntry1.steps[v2] = true
		SelfEntry1.count += 1
		
		if SelfEntry1.stop then return end
		local function run()
			-- upvalues: SelfEntry1 (copy)
			for step in SelfEntry1.steps do
				table.insert(SelfEntry1.queue, step)
			end
			for _, value in SelfEntry1.queue do
				if SelfEntry1.steps[value] then
					value()
				end
			end
			table.clear(SelfEntry1.queue)
		end
		
		if PreRender then
			local Connection = PreRender:Connect(run)
			
			function SelfEntry1.stop()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
			
			return
		else
			SelfEntry1.stop = assert(Frames).onFrame(run)
		end
	end
	
	v2 = function()
		-- upvalues: Flag1 (ref), Frame (copy), CellResult (copy), IsEnabled (copy), halt (copy), arm (copy), Count (ref), painted (upval), Tbl (copy), listen (upval)
		if Flag1 then return end
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
			CellResult:set(false)
			
			if IsEnabled then
				halt()
				
				return
			else
				arm()
				
				return
			end
		else
			if not CellResult:peek() then
				Count += 1
				local AbsoluteSize1 = Frame.AbsoluteSize
				
				if AbsoluteSize1.X > 0 and AbsoluteSize1.Y > 0 and painted(Frame) or Count >= 120 then
					CellResult:set(true)
					
					if IsEnabled then
						halt()
						
						return
					else
						arm()
						
						return
					end
				else
					if IsEnabled and #Tbl == 0 then
						listen(Frame, Frame, Tbl, arm)
						
						for _, descendant in Frame:GetDescendants() do
							listen(descendant, Frame, Tbl, arm)
						end
					end
					arm()
					
					return
				end
			elseif IsEnabled then
				halt()
			end
		end
	end
	
	local Connection = if IsEnabled then Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(arm) else nil
	local CleanupResult = p1.Compose.cleanup(function()
		-- upvalues: Flag1 (ref), Connection (copy), halt (copy)
		if Flag1 then return end
		Flag1 = true
		
		if Connection then
			Connection:Disconnect()
		end
		halt()
	end)
	
	if Callback then
		local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Frame)
		p1.Compose.watch(function(Callback1)
			-- upvalues: Callback (copy), AbsoluteSizeResult1 (copy), v2 (ref)
			Callback(Callback1, Callback1(AbsoluteSizeResult1))
			v2()
		end)
	else
		v2()
	end
	return CellResult, CleanupResult
end