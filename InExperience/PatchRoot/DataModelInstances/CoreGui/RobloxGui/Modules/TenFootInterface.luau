local color3 = Color3.new(0.105882352941, 0.988235294118, 0.419607843137)
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local create = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Create
local var4 = guiService:IsTenFootInterface()
local t = {
	IsEnabled = function(_) --[[ line: 361 ]]
		-- upvalues: var4 (ref)
		return var4
	end
}
local var6 = (function() --[[ line: 30 | named "CreateModule" ]]
	-- upvalues: create (ref), robloxGui (ref), color3 (ref), playersService (ref)
	local t = { Container = nil }
	local t_1 = {}
	local bindableEvent = Instance.new("BindableEvent")
	local bindableEvent_1 = Instance.new("BindableEvent")
	
	local function createContainer() --[[ line: 39 ]]
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
	
	function removeFromDisplayStack(p0) --[[ line: 55 ]]
		-- upvalues: t_1 (ref), bindableEvent (ref)
		local var12 = nil
		
		for i = 1, #t_1 do
			if t_1[i] ~= p0 then
				continue
			end
			var12 = i + 1
			break
		end
		local var13 = p0
		
		for i_1 = var12, #t_1 do
			local var14 = t_1[i_1]
			var14.Position = UDim2.new(var14.Position.X.Scale, var14.Position.X.Offset, var14.Position.Y.Scale, var13.AbsolutePosition.Y)
			var13 = var14
		end
		bindableEvent:Fire()
	end
	
	function addBackToDisplayStack(p1) --[[ line: 75 ]]
		-- upvalues: t_1 (ref), bindableEvent (ref)
		local var15 = 0
		
		for i = 1, #t_1 do
			if t_1[i] ~= p1 then
				continue
			end
			var15 = i + 1
			break
		end
		local var16 = p1
		
		for i_1 = var15, #t_1 do
			local var17 = t_1[i_1]
			var17.Position = UDim2.new(var17.Position.X.Scale, var17.Position.X.Offset, var17.Position.Y.Scale, var16.AbsolutePosition.Y + var16.AbsoluteSize.Y + 4)
			var16 = var17
		end
		bindableEvent:Fire()
	end
	
	function addToDisplayStack(p2) --[[ line: 96 ]]
		-- upvalues: t_1 (ref), createContainer (ref), t (ref), bindableEvent (ref)
		local var18 = if #t_1 > 0 then t_1[#t_1] else nil
		t_1[#t_1 + 1] = p2
		p2.Position = UDim2.new(p2.Position.X.Scale, p2.Position.X.Offset, p2.Position.Y.Scale, if var18 then var18.AbsolutePosition.Y + var18.AbsoluteSize.Y + 4 else 0)
		createContainer()
		p2.Parent = t.Container
		p2.Changed:connect(function(p3) --[[ line: 114 ]]
			-- upvalues: p2 (ref)
			if p3 == "Visible" then
				if not p2.Visible then
					removeFromDisplayStack(p2)
					
					return
				end
				addBackToDisplayStack(p2)
			end
		end)
		bindableEvent:Fire()
	end
	
	function t.CreateHealthBar(_) --[[ line: 126 ]]
		-- upvalues: t (ref), create (copy), color3 (copy), createContainer (ref), bindableEvent_1 (ref)
		t.HealthContainer = create("Frame")({
			Name = "HealthContainer",
			BorderSizePixel = 0,
			BackgroundTransparency = 0.5,
			Size = UDim2.new(1, -86, 0, 50),
			Position = UDim2.new(0, 92, 0, 0),
			BackgroundColor3 = Color3.new(0, 0, 0)
		})
		local var19 = create("Frame")({
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
		local var20 = create("TextLabel")({ Visible = false })
		local var21 = create("TextLabel")({ Visible = false })
		addToDisplayStack(t.HealthContainer)
		createContainer()
		t.HealthContainer.Changed:connect(function() --[[ line: 181 ]]
			-- upvalues: bindableEvent_1 (copy)
			bindableEvent_1:Fire()
		end)
		
		return t.Container, var20, t.HealthContainer, var19, var21
	end
	
	function t.CreateAccountType(_, p4) --[[ line: 188 ]]
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
			Text = p4,
			TextColor3 = Color3.new(1, 1, 1),
			Parent = t.AccountTypeContainer,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	end
	
	function t.SetupTopStat(_) --[[ line: 216 ]]
		-- upvalues: create (copy), playersService (copy)
		local var22 = true
		local var23 = nil
		local var24 = nil
		local var25 = nil
		local var26 = nil
		local var27 = nil
		
		local function makeTenFootInterfaceStat() --[[ line: 224 ]]
			-- upvalues: var27 (write), create (copy)
			if var27 then
				return
			end
			var27 = create("Frame")({
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
				Parent = var27
			}):clone()
			statValue.Position = UDim2.new(0.5, 0, 0, 0)
			statValue.Name = "StatValue"
			statValue.Text = "123,643,231"
			statValue.TextXAlignment = Enum.TextXAlignment.Right
			statValue.Parent = var27
			addToDisplayStack(var27)
		end
		
		local updateTenFootStat = nil
		
		local function setDisplayedStat(value) --[[ line: 261 ]]
			-- upvalues: var24 (write), var25 (write), var23 (write), makeTenFootInterfaceStat (ref), updateTenFootStat (write)
			if var24 then
				var24:disconnect()
				var24 = nil
			end
			if var25 then
				var25:disconnect()
				var25 = nil
			end
			var23 = value
			
			if var23 then
				makeTenFootInterfaceStat()
				updateTenFootStat(var23)
				var25 = var23.AncestryChanged:connect(function() --[[ line: 276 ]]
					-- upvalues: updateTenFootStat (copy), var23 (copy)
					updateTenFootStat(var23, "Parent")
				end)
				var24 = var23.Changed:connect(function(p5) --[[ line: 277 ]]
					-- upvalues: updateTenFootStat (copy), var23 (copy)
					updateTenFootStat(var23, p5)
				end)
			end
		end
		
		updateTenFootStat = function(p6, p7) --[[ line: 281 | named "updateTenFootStat" ]]
			-- upvalues: var27 (write), setDisplayedStat (ref), var22 (write)
			if p7 and p7 == "Parent" then
				var27.StatName.Text = ""
				var27.StatValue.Text = ""
				setDisplayedStat(nil)
				tenFootInterfaceChanged()
				
				return
			elseif var22 then
				var27.StatName.Text = " " .. tostring(p6.Name) .. ":"
				var27.StatValue.Text = tostring(p6.Value)
				
				return
			end
			var27.StatName.Text = ""
			var27.StatValue.Text = ""
		end
		
		local function isValidStat(p8) --[[ line: 299 ]]
			return p8:IsA("StringValue") or (p8:IsA("IntValue") or (p8:IsA("BoolValue") or (p8:IsA("NumberValue") or (p8:IsA("DoubleConstrainedValue") or p8:IsA("IntConstrainedValue")))))
		end
		
		local function _(p9) --[[ line: 304 | named "tenFootInterfaceNewStat" ]]
			-- upvalues: var23 (write), isValidStat (ref), setDisplayedStat (ref)
			if not var23 and isValidStat(p9) then
				setDisplayedStat(p9)
			end
		end
		
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService.PlayerAdded:wait()
			localPlayer = playersService.LocalPlayer
		end
		function tenFootInterfaceChanged() --[[ line: 316 ]]
			-- upvalues: localPlayer (write), var23 (write), isValidStat (ref), setDisplayedStat (ref), var26 (write)
			local leaderstats = localPlayer:FindFirstChild("leaderstats")
			
			if leaderstats then
				local children = leaderstats:GetChildren()
				
				for i = 1, #children do
					local var35 = children[i]
					
					if not var23 and isValidStat(var35) then
						setDisplayedStat(var35)
					end
				end
				if var26 then
					var26:disconnect()
				end
				var26 = leaderstats.ChildAdded:connect(function(p10) --[[ line: 324 ]]
					-- upvalues: var23 (copy), isValidStat (copy), setDisplayedStat (copy)
					if not var23 and isValidStat(p10) then
						setDisplayedStat(p10)
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
			SetTopStatEnabled = function(_, p11) --[[ line: 341 ]]
				-- upvalues: var22 (write), var23 (write), updateTenFootStat (write)
				var22 = p11
				
				if var23 then
					updateTenFootStat(var23, "")
				end
			end
		}
	end
	
	return t
end)()

function t.CreateHealthBar(_) --[[ line: 365 ]]
	-- upvalues: var6 (ref)
	return var6:CreateHealthBar()
end

function t.CreateAccountType(_, p12) --[[ line: 369 ]]
	-- upvalues: var6 (ref)
	return var6:CreateAccountType(p12)
end

function t.SetupTopStat(_) --[[ line: 373 ]]
	-- upvalues: var6 (ref)
	return var6:SetupTopStat()
end

return t