local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)

return function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref)
	local var1, var2 = reactModule.useState(true)
	local instances = p1.instances
	local mutedPlayers = p1.mutedPlayers
	local var3 = cryoModule.List.map(cryoModule.Dictionary.keys(instances), function(p2, p3)
		-- upvalues: mutedPlayers (ref), reactModule (copy)
		return reactModule.createElement("TextLabel", {
			RichText = true,
			BackgroundTransparency = 1,
			TextSize = 18,
			Text = string.format("<b>%s</b>: %s, %s, %s", if p2.Player then p2.Player.Name else "(no player)", if p2.Active then "active" else "inactive", if p2.Player and mutedPlayers[p2.Player.UserId] then "muted" else "unmuted", if p2.MutedByLocalUser then "mutedByLocalUser" else "not-mutedByLocalUser"),
			Size = UDim2.fromOffset(20, 25),
			AutomaticSize = Enum.AutomaticSize.X,
			LayoutOrder = p3,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Font = Enum.Font.SourceSans
		})
	end)
	var3.Title = reactModule.createElement("TextButton", {
		Text = "<b>AudioDeviceInputs</b>",
		[reactModule.Event.Activated] = function()
			-- upvalues: var2 (ref), var1 (ref)
			var2(not var1)
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
	var3.UIListLayout = reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 3)
	})
	var3.UIPadding = reactModule.createElement("UIPadding", {
		PaddingTop = UDim.new(0, 3),
		PaddingBottom = UDim.new(0, 3),
		PaddingLeft = UDim.new(0, 3),
		PaddingRight = UDim.new(0, 3)
	})
	
	return reactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		DisplayOrder = 100,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, reactModule.createElement("ScrollingFrame", {
		Active = true,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		Size = UDim2.new(0.333333333333, 0, if var1 then 0.333333333333 else 0, if var1 then 0 else 25),
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		CanvasSize = UDim2.new(0, 0, 0, #cryoModule.Dictionary.keys(instances) * 28),
		BackgroundTransparency = if var1 then 0.2 else 1
	}, var3))
end