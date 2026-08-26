local color3 = Color3.new(0.105882352941, 0.988235294118, 0.419607843137)
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local create = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create
local var1 = guiService:IsTenFootInterface()
local t = {
	IsEnabled = function(_)
		-- upvalues: var1 (ref)
		return var1
	end
}
local var2 = (function()
	-- upvalues: create (ref), robloxGui (ref), color3 (ref), playersService (ref)
	local t = { Container = nil }
	local t_1 = {}
	local bindableEvent = Instance.new("BindableEvent")
	local bindableEvent_1 = Instance.new("BindableEvent")
	
	local function createContainer()
		-- upvalues: t (ref), create (copy), robloxGui (copy)
		if not t.Container then
			t.Container = create("ImageButton")({
				Name = "TopRightContainer",
				AutoButtonColor = false,
				Image = "",
				Active = false,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 350, 0, 100),
				Position = UDim2.new(1, -415, 0, 10),
				Parent = robloxGui
			})
		end
	end
	
	function removeFromDisplayStack(p1)
		-- upvalues: t_1 (ref), bindableEvent (ref)
		local var3 = nil
		
		for i = 1, #t_1 do
			if t_1[i] ~= p1 then
				continue
			end
			var3 = i + 1
			break
		end
		local var4 = p1
		
		for i_1 = var3, #t_1 do
			local var5 = t_1[i_1]
			var5.Position = UDim2.new(var5.Position.X.Scale, var5.Position.X.Offset, var5.Position.Y.Scale, var4.AbsolutePosition.Y)
			var4 = var5
		end
		bindableEvent:Fire()
	end
	
	function addBackToDisplayStack(p2)
		-- upvalues: t_1 (ref), bindableEvent (ref)
		local var6 = 0
		
		for i = 1, #t_1 do
			if t_1[i] ~= p2 then
				continue
			end
			var6 = i + 1
			break
		end
		local var7 = p2
		
		for i_1 = var6, #t_1 do
			local var8 = t_1[i_1]
			var8.Position = UDim2.new(var8.Position.X.Scale, var8.Position.X.Offset, var8.Position.Y.Scale, var7.AbsolutePosition.Y + var7.AbsoluteSize.Y + 4)
			var7 = var8
		end
		bindableEvent:Fire()
	end
	
	function addToDisplayStack(p3)
		-- upvalues: t_1 (ref), createContainer (ref), t (ref), bindableEvent (ref)
		local var9 = if #t_1 > 0 then t_1[#t_1] else nil
		t_1[#t_1 + 1] = p3
		p3.Position = UDim2.new(p3.Position.X.Scale, p3.Position.X.Offset, p3.Position.Y.Scale, if var9 then var9.AbsolutePosition.Y + var9.AbsoluteSize.Y + 4 else 0)
		createContainer()
		p3.Parent = t.Container
		p3.Changed:connect(function(p4)
			-- upvalues: p3 (ref)
			if p4 == "Visible" then
				if not p3.Visible then
					removeFromDisplayStack(p3)
					
					return
				end
				addBackToDisplayStack(p3)
			end
		end)
		bindableEvent:Fire()
	end
	
	function t.CreateHealthBar(_)
		-- upvalues: t (ref), create (copy), color3 (copy), createContainer (ref), bindableEvent_1 (ref)
		t.HealthContainer = create("Frame")({
			Name = "HealthContainer",
			BorderSizePixel = 0,
			BackgroundTransparency = 0.5,
			Size = UDim2.new(1, -86, 0, 50),
			Position = UDim2.new(0, 92, 0, 0),
			BackgroundColor3 = Color3.new(0, 0, 0)
		})
		local var9 = create("Frame")({
			Name = "HealthFill",
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = color3,
			Parent = create("Frame")({
				Name = "HealthFillHolder",
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -10, 1, -10),
				Position = UDim2.new(0, 5, 0, 5),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Parent = t.HealthContainer
			})
		})
		local _ = create("TextLabel")({
			Name = "HealthText",
			BackgroundTransparency = 0.5,
			Text = "Health",
			BorderSizePixel = 0,
			Size = UDim2.new(0, 98, 0, 50),
			Position = UDim2.new(0, -100, 0, 0),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Font = Enum.Font.SourceSans,
			FontSize = Enum.FontSize.Size36,
			TextColor3 = Color3.new(1, 1, 1),
			Parent = t.HealthContainer
		})
		local var10 = create("TextLabel")({ Visible = false })
		local var11 = create("TextLabel")({ Visible = false })
		addToDisplayStack(t.HealthContainer)
		createContainer()
		t.HealthContainer.Changed:connect(function()
			-- upvalues: bindableEvent_1 (copy)
			bindableEvent_1:Fire()
		end)
		
		return t.Container, var10, t.HealthContainer, var9, var11
	end
	
	function t.CreateAccountType(_, p3)
		-- upvalues: t (ref), create (copy), robloxGui (copy)
		t.AccountTypeContainer = create("Frame")({
			Name = "AccountTypeContainer",
			BorderSizePixel = 0,
			BackgroundTransparency = 0.5,
			Size = UDim2.new(0, 50, 0, 50),
			Position = UDim2.new(1, -55, 0, 10),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Parent = robloxGui
		})
		local _ = create("TextLabel")({
			Name = "AccountTypeText",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Font = Enum.Font.SourceSans,
			FontSize = Enum.FontSize.Size36,
			Text = p3,
			TextColor3 = Color3.new(1, 1, 1),
			Parent = t.AccountTypeContainer,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	end
	
	function t.SetupTopStat(_)
		-- upvalues: create (copy), playersService (copy)
		local var9 = true
		local var10 = nil
		local var11 = nil
		local var12 = nil
		local var13 = nil
		local var14 = nil
		
		local function makeTenFootInterfaceStat()
			-- upvalues: var14 (write), create (copy)
			if var14 then
				return
			end
			var14 = create("Frame")({
				Name = "OneStatFrame",
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 36),
				Position = UDim2.new(0, 0, 0, 0)
			})
			local statValue = create("TextLabel")({
				Name = "StatName",
				BackgroundTransparency = 1,
				TextStrokeTransparency = 0,
				Text = " StatName:",
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Size = UDim2.new(0.5, 0, 0, 36),
				Font = Enum.Font.SourceSans,
				FontSize = Enum.FontSize.Size36,
				TextStrokeColor3 = Color3.new(0.407843137255, 0.407843137255, 0.407843137255),
				TextColor3 = Color3.new(1, 1, 1),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = var14
			}):clone()
			statValue.Position = UDim2.new(0.5, 0, 0, 0)
			statValue.Name = "StatValue"
			statValue.Text = "123,643,231"
			statValue.TextXAlignment = Enum.TextXAlignment.Right
			statValue.Parent = var14
			addToDisplayStack(var14)
		end
		
		local updateTenFootStat = nil
		
		local function setDisplayedStat(value)
			-- upvalues: var11 (write), var12 (write), var10 (write), makeTenFootInterfaceStat (ref), updateTenFootStat (write)
			if var11 then
				var11:disconnect()
				var11 = nil
			end
			if var12 then
				var12:disconnect()
				var12 = nil
			end
			var10 = value
			
			if var10 then
				makeTenFootInterfaceStat()
				updateTenFootStat(var10)
				var12 = var10.AncestryChanged:connect(function()
					-- upvalues: updateTenFootStat (copy), var10 (copy)
					updateTenFootStat(var10, "Parent")
				end)
				var11 = var10.Changed:connect(function(p3)
					-- upvalues: updateTenFootStat (copy), var10 (copy)
					updateTenFootStat(var10, p3)
				end)
			end
		end
		
		updateTenFootStat = function(p3, p4)
			-- upvalues: var14 (write), setDisplayedStat (ref), var9 (write)
			if p4 and p4 == "Parent" then
				var14.StatName.Text = ""
				var14.StatValue.Text = ""
				setDisplayedStat(nil)
				tenFootInterfaceChanged()
				
				return
			elseif var9 then
				var14.StatName.Text = " " .. tostring(p3.Name) .. ":"
				var14.StatValue.Text = tostring(p3.Value)
				
				return
			end
			var14.StatName.Text = ""
			var14.StatValue.Text = ""
		end
		
		local function isValidStat(p3)
			return p3:IsA("StringValue") or (p3:IsA("IntValue") or (p3:IsA("BoolValue") or (p3:IsA("NumberValue") or (p3:IsA("DoubleConstrainedValue") or p3:IsA("IntConstrainedValue")))))
		end
		
		local function _(p3)
			-- upvalues: var10 (write), isValidStat (ref), setDisplayedStat (ref)
			if not var10 and isValidStat(p3) then
				setDisplayedStat(p3)
			end
		end
		
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService.PlayerAdded:wait()
			localPlayer = playersService.LocalPlayer
		end
		function tenFootInterfaceChanged()
			-- upvalues: localPlayer (write), var10 (write), isValidStat (ref), setDisplayedStat (ref), var13 (write)
			local leaderstats = localPlayer:FindFirstChild("leaderstats")
			
			if leaderstats then
				local children = leaderstats:GetChildren()
				
				for i = 1, #children do
					local var15 = children[i]
					
					if not var10 and isValidStat(var15) then
						setDisplayedStat(var15)
					end
				end
				if var13 then
					var13:disconnect()
				end
				var13 = leaderstats.ChildAdded:connect(function(p3)
					-- upvalues: var10 (copy), isValidStat (copy), setDisplayedStat (copy)
					if not var10 and isValidStat(p3) then
						setDisplayedStat(p3)
					end
				end)
			end
		end
		
		if localPlayer:FindFirstChild("leaderstats") then
			tenFootInterfaceChanged()
		else
			localPlayer.ChildAdded:connect(tenFootInterfaceChanged)
		end
		return {
			SetTopStatEnabled = function(_, p3)
				-- upvalues: var9 (write), var10 (write), updateTenFootStat (write)
				var9 = p3
				
				if var10 then
					updateTenFootStat(var10, "")
				end
			end
		}
	end
	
	return t
end)()

function t.CreateHealthBar(_)
	-- upvalues: var2 (ref)
	return var2:CreateHealthBar()
end

function t.CreateAccountType(_, p3)
	-- upvalues: var2 (ref)
	return var2:CreateAccountType(p3)
end

function t.SetupTopStat(_)
	-- upvalues: var2 (ref)
	return var2:SetupTopStat()
end

return t