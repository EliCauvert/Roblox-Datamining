local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)

return function(p0) --[[ line: 5 | named "AudioDeviceInputDebugger" ]]
	-- upvalues: reactModule (ref), cryoModule (ref)
	local var3, var4 = reactModule.useState(true)
	local instances = p0.instances
	local mutedPlayers = p0.mutedPlayers
	local var5 = cryoModule.List.map(cryoModule.Dictionary.keys(instances), function(p1, p2) --[[ line: 15 ]]
		-- upvalues: mutedPlayers (ref), reactModule (copy)
		return reactModule.createElement("TextLabel", {
			RichText = true,
			BackgroundTransparency = 1,
			TextSize = 18,
			Text = string.format("<b>%s</b>: %s, %s, %s", if p1.Player then p1.Player.Name else "(no player)", if p1.Active then "active" else "inactive", if p1.Player and mutedPlayers[p1.Player.UserId] then "muted" else "unmuted", if p1.MutedByLocalUser then "mutedByLocalUser" else "not-mutedByLocalUser"),
			Size = UDim2.fromOffset(20, 25),
			AutomaticSize = Enum.AutomaticSize.X,
			LayoutOrder = p2,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Font = Enum.Font.SourceSans
		})
	end)
	var5.Title = reactModule.createElement("TextButton", {
		Text = "<b>AudioDeviceInputs</b>",
		[reactModule.Event.Activated] = function() --[[ line: 37 ]]
			-- upvalues: var4 (ref), var3 (ref)
			var4(not var3)
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
	var5.UIListLayout = reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 3)
	})
	var5.UIPadding = reactModule.createElement("UIPadding", {
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
		Size = UDim2.new(0.333333333333, 0, if var3 then 0.333333333333 else 0, if var3 then 0 else 25),
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		CanvasSize = UDim2.new(0, 0, 0, #cryoModule.Dictionary.keys(instances) * 28),
		BackgroundTransparency = if var3 then 0.2 else 1
	}, var5))
end