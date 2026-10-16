local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)

return function(p1) --[[ Line: 5 | Named "AudioDeviceInputDebugger" ]]
	-- upvalues: ReactModule (copy), CryoModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local Instances = p1.instances
	local MutedPlayers = p1.mutedPlayers
	local MapResult = CryoModule.List.map(CryoModule.Dictionary.keys(Instances), function(p2, LayoutOrder) --[[ Line: 15 ]]
		-- upvalues: MutedPlayers (copy), ReactModule (upval)
		local Active = p2.Active
		
		return ReactModule.createElement("TextLabel", {
			RichText = true,
			BackgroundTransparency = 1,
			TextSize = 18,
			Text = string.format("<b>%s</b>: %s, %s, %s", p2.Player and p2.Player.Name or "(no player)", if Active then "active" else "inactive", if p2.Player and MutedPlayers[p2.Player.UserId] then "muted" else "unmuted", if p2.MutedByLocalUser then "mutedByLocalUser" else "not-mutedByLocalUser"),
			Size = UDim2.fromOffset(20, 25),
			AutomaticSize = Enum.AutomaticSize.X,
			LayoutOrder = LayoutOrder,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Font = Enum.Font.SourceSans
		})
	end)
	MapResult.Title = ReactModule.createElement("TextButton", {
		Text = "<b>AudioDeviceInputs</b>",
		[ReactModule.Event.Activated] = function() --[[ Line: 37 ]]
			-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
			UseStateResult2(not UseStateResult)
		end,
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
		TextStrokeTransparency = 0.5,
		Size = UDim2.fromOffset(20, 25),
		RichText = true,
		AutomaticSize = Enum.AutomaticSize.X,
		LayoutOrder = 0,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Font = Enum.Font.SourceSansBold,
		TextSize = 20
	})
	MapResult.UIListLayout = ReactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 3)
	})
	MapResult.UIPadding = ReactModule.createElement("UIPadding", {
		PaddingTop = UDim.new(0, 3),
		PaddingBottom = UDim.new(0, 3),
		PaddingLeft = UDim.new(0, 3),
		PaddingRight = UDim.new(0, 3)
	})
	
	return ReactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		DisplayOrder = 100,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, ReactModule.createElement("ScrollingFrame", {
		Active = true,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		Size = UDim2.new(0.3333333333333333, 0, if UseStateResult then 0.3333333333333333 else 0, if UseStateResult then 0 else 25),
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		CanvasSize = UDim2.new(0, 0, 0, #CryoModule.Dictionary.keys(Instances) * 28),
		BackgroundTransparency = if UseStateResult then 0.2 else 1
	}, MapResult))
end