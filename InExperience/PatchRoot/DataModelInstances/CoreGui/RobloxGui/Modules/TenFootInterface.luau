local _Color3 = Color3.new(0.10588235294117647, 0.9882352941176471, 0.4196078431372549)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local IsTenFootInterface = require(CorePackages.Workspace.Packages.AppCommonLib).isTenFootInterface()
local v1 = (function()
	-- upvalues: CreateFunction (copy), RobloxGui (copy), _Color3 (copy), Players (copy)
	local config = { Container = nil }
	local t = {}
	local BindableEvent = Instance.new("BindableEvent")
	local BindableEvent1 = Instance.new("BindableEvent")
	
	local function createContainer()
		-- upvalues: config (copy), CreateFunction (upval), RobloxGui (upval)
		if not config.Container then
			config.Container = CreateFunction("ImageButton")({
				Name = "TopRightContainer",
				AutoButtonColor = false,
				Image = "",
				Active = false,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 350, 0, 100),
				Position = UDim2.new(1, -415, 0, 10),
				Parent = RobloxGui
			})
		end
	end
	
	function removeFromDisplayStack(Frame)
		-- upvalues: t (copy), BindableEvent (copy)
		local v2: number? = nil
		
		for i = 1, #t do
			if t[i] ~= Frame then
				continue
			end
			v2 = i + 1
			break
		end
		local Frame1 = Frame
		
		for i1 = v2, #t do
			local Entry = t[i1]
			Entry.Position = UDim2.new(Entry.Position.X.Scale, Entry.Position.X.Offset, Entry.Position.Y.Scale, Frame1.AbsolutePosition.Y)
			Frame1 = Entry
		end
		BindableEvent:Fire()
	end
	
	function addBackToDisplayStack(Frame)
		-- upvalues: t (copy), BindableEvent (copy)
		local v3 = 0
		
		for i = 1, #t do
			if t[i] ~= Frame then
				continue
			end
			v3 = i + 1
			break
		end
		local Frame1 = Frame
		
		for i1 = v3, #t do
			local Entry = t[i1]
			Entry.Position = UDim2.new(Entry.Position.X.Scale, Entry.Position.X.Offset, Entry.Position.Y.Scale, Frame1.AbsolutePosition.Y + Frame1.AbsoluteSize.Y + 4)
			Frame1 = Entry
		end
		BindableEvent:Fire()
	end
	
	function addToDisplayStack(p1)
		-- upvalues: t (copy), createContainer (copy), config (copy), BindableEvent (copy)
		local Entry = if #t > 0 then t[#t] else nil
		t[#t + 1] = p1
		p1.Position = UDim2.new(p1.Position.X.Scale, p1.Position.X.Offset, p1.Position.Y.Scale, if Entry then Entry.AbsolutePosition.Y + Entry.AbsoluteSize.Y + 4 else 0)
		createContainer()
		p1.Parent = config.Container
		p1.Changed:connect(function(p2)
			-- upvalues: p1 (copy)
			if p2 == "Visible" then
				if not p1.Visible then
					removeFromDisplayStack(p1)
					
					return
				end
				addBackToDisplayStack(p1)
			end
		end)
		BindableEvent:Fire()
	end
	
	function config:CreateHealthBar()
		-- upvalues: config (copy), CreateFunction (upval), _Color3 (upval), createContainer (copy), BindableEvent1 (copy)
		config.HealthContainer = CreateFunction("Frame")({
			Name = "HealthContainer",
			BorderSizePixel = 0,
			BackgroundTransparency = 0.5,
			Size = UDim2.new(1, -86, 0, 50),
			Position = UDim2.new(0, 92, 0, 0),
			BackgroundColor3 = Color3.new(0, 0, 0)
		})
		local v4 = CreateFunction("Frame")({
			Name = "HealthFill",
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = _Color3,
			Parent = CreateFunction("Frame")({
				Name = "HealthFillHolder",
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -10, 1, -10),
				Position = UDim2.new(0, 5, 0, 5),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Parent = config.HealthContainer
			})
		})
		local _ = CreateFunction("TextLabel")({
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
			Parent = config.HealthContainer
		})
		local v5 = CreateFunction("TextLabel")({ Visible = false })
		local v6 = CreateFunction("TextLabel")({ Visible = false })
		addToDisplayStack(config.HealthContainer)
		createContainer()
		config.HealthContainer.Changed:connect(function()
			-- upvalues: BindableEvent1 (upval)
			BindableEvent1:Fire()
		end)
		
		return config.Container, v5, config.HealthContainer, v4, v6
	end
	
	function config:CreateAccountType(Text)
		-- upvalues: config (copy), CreateFunction (upval), RobloxGui (upval)
		config.AccountTypeContainer = CreateFunction("Frame")({
			Name = "AccountTypeContainer",
			BorderSizePixel = 0,
			BackgroundTransparency = 0.5,
			Size = UDim2.new(0, 50, 0, 50),
			Position = UDim2.new(1, -55, 0, 10),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Parent = RobloxGui
		})
		local _ = CreateFunction("TextLabel")({
			Name = "AccountTypeText",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = Color3.new(0, 0, 0),
			Font = Enum.Font.SourceSans,
			FontSize = Enum.FontSize.Size36,
			Text = Text,
			TextColor3 = Color3.new(1, 1, 1),
			Parent = config.AccountTypeContainer,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	end
	
	function config:SetupTopStat()
		-- upvalues: CreateFunction (upval), Players (upval)
		local TopStatEnabled = true
		local DisplayedStat = nil
		local ChangedConnection = nil
		local AncestryChangedConnection = nil
		local ChildAddedConnection = nil
		local Parent = nil
		
		local function makeTenFootInterfaceStat()
			-- upvalues: Parent (ref), CreateFunction (upval)
			if not Parent then
				Parent = CreateFunction("Frame")({
					Name = "OneStatFrame",
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 36),
					Position = UDim2.new(0, 0, 0, 0)
				})
				local StatValue = CreateFunction("TextLabel")({
					Name = "StatName",
					BackgroundTransparency = 1,
					TextStrokeTransparency = 0,
					Text = " StatName:",
					BorderSizePixel = 0,
					ClipsDescendants = true,
					Size = UDim2.new(0.5, 0, 0, 36),
					Font = Enum.Font.SourceSans,
					FontSize = Enum.FontSize.Size36,
					TextStrokeColor3 = Color3.new(0.40784313725490196, 0.40784313725490196, 0.40784313725490196),
					TextColor3 = Color3.new(1, 1, 1),
					TextXAlignment = Enum.TextXAlignment.Left,
					Parent = Parent
				}):clone()
				StatValue.Position = UDim2.new(0.5, 0, 0, 0)
				StatValue.Name = "StatValue"
				StatValue.Text = "123,643,231"
				StatValue.TextXAlignment = Enum.TextXAlignment.Right
				StatValue.Parent = Parent
				addToDisplayStack(Parent)
				
				return
			end
		end
		
		local Callback = nil
		
		local function setDisplayedStat(Value)
			-- upvalues: ChangedConnection (ref), AncestryChangedConnection (ref), DisplayedStat (ref), makeTenFootInterfaceStat (copy), Callback (ref)
			if ChangedConnection then
				ChangedConnection:disconnect()
				ChangedConnection = nil
			end
			if AncestryChangedConnection then
				AncestryChangedConnection:disconnect()
				AncestryChangedConnection = nil
			end
			DisplayedStat = Value
			
			if DisplayedStat then
				makeTenFootInterfaceStat()
				Callback(DisplayedStat)
				AncestryChangedConnection = DisplayedStat.AncestryChanged:connect(function()
					-- upvalues: Callback (upval), DisplayedStat (upval)
					Callback(DisplayedStat, "Parent")
				end)
				ChangedConnection = DisplayedStat.Changed:connect(function(p1)
					-- upvalues: Callback (upval), DisplayedStat (upval)
					Callback(DisplayedStat, p1)
				end)
			end
		end
		
		Callback = function(DisplayedStat, p1)
			-- upvalues: Parent (ref), setDisplayedStat (copy), TopStatEnabled (ref)
			if p1 and p1 == "Parent" then
				Parent.StatName.Text = ""
				Parent.StatValue.Text = ""
				setDisplayedStat(nil)
				tenFootInterfaceChanged()
				
				return
			end
			if TopStatEnabled then
				Parent.StatName.Text = " " .. tostring(DisplayedStat.Name) .. ":"
				Parent.StatValue.Text = tostring(DisplayedStat.Value)
				
				return
			else
				Parent.StatName.Text = ""
				Parent.StatValue.Text = ""
			end
		end
		
		local function isValidStat(Object)
			return Object:IsA("StringValue") or (Object:IsA("IntValue") or (Object:IsA("BoolValue") or (Object:IsA("NumberValue") or (Object:IsA("DoubleConstrainedValue") or Object:IsA("IntConstrainedValue")))))
		end
		
		local function _(p1)
			-- upvalues: DisplayedStat (ref), isValidStat (copy), setDisplayedStat (copy)
			if not DisplayedStat and isValidStat(p1) then
				setDisplayedStat(p1)
			end
		end
		
		local LocalPlayer = Players.LocalPlayer
		while not LocalPlayer do
			Players.PlayerAdded:wait()
			LocalPlayer = Players.LocalPlayer
		end
		function tenFootInterfaceChanged()
			-- upvalues: LocalPlayer (ref), DisplayedStat (ref), isValidStat (copy), setDisplayedStat (copy), ChildAddedConnection (ref)
			local Leaderstats = LocalPlayer:FindFirstChild("leaderstats")
			
			if Leaderstats then
				local Children = Leaderstats:GetChildren()
				
				for i = 1, #Children do
					local Child = Children[i]
					
					if not DisplayedStat and isValidStat(Child) then
						setDisplayedStat(Child)
					end
				end
				if ChildAddedConnection then
					ChildAddedConnection:disconnect()
				end
				ChildAddedConnection = Leaderstats.ChildAdded:connect(function(Child)
					-- upvalues: DisplayedStat (upval), isValidStat (upval), setDisplayedStat (upval)
					if not DisplayedStat and isValidStat(Child) then
						setDisplayedStat(Child)
					end
				end)
			end
		end
		
		if LocalPlayer:FindFirstChild("leaderstats") then
			tenFootInterfaceChanged()
		else
			LocalPlayer.ChildAdded:connect(tenFootInterfaceChanged)
		end
		return {
			SetTopStatEnabled = function(_, Value)
				-- upvalues: TopStatEnabled (ref), DisplayedStat (ref), Callback (ref)
				TopStatEnabled = Value
				
				if DisplayedStat then
					Callback(DisplayedStat, "")
				end
			end
		}
	end
	
	return config
end)()

return {
	IsEnabled = function(_)
		-- upvalues: IsTenFootInterface (copy)
		return IsTenFootInterface
	end,
	CreateHealthBar = function(_)
		-- upvalues: v1 (copy)
		return v1:CreateHealthBar()
	end,
	CreateAccountType = function(_, p1)
		-- upvalues: v1 (copy)
		return v1:CreateAccountType(p1)
	end,
	SetupTopStat = function(_)
		-- upvalues: v1 (copy)
		return v1:SetupTopStat()
	end
}