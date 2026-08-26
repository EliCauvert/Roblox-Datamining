local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local argCheckModule = require(corePackagesService.Workspace.Packages.ArgCheck)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local baseMenu = UIBloxModule.App.Menu.BaseMenu
local truncationExpandSmall = images["icons/actions/truncationExpand_small"]
local var1 = argCheckModule.wrap(tModule.strictInterface({
	buttonSize = tModule.UDim2,
	dropdownList = tModule.table,
	selectedIndex = tModule.number,
	onSelection = tModule.callback,
	layoutOrder = tModule.number
}))

return function(p1)
	-- upvalues: var1 (ref), useStyle (ref), reactModule (ref), roactModule (ref), imageSetLabel (ref), truncationExpandSmall (ref), baseMenu (ref)
	assert(var1(p1))
	local var2 = useStyle()
	local captionHeader = var2.Font.CaptionHeader
	local var3 = captionHeader.RelativeSize * var2.Font.BaseSize
	local var4 = if var2.UIBloxThemeEnabled then var2.color("ControlInputBackground") else Color3.fromRGB(79, 84, 95)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState({})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var5 (ref)
		var6(not var5)
	end)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), captionHeader (ref), var6 (ref), var8 (ref)
		local t = {}
		
		for i, v in pairs(p1.dropdownList) do
			t[i] = {
				leftPaddingOffset = -12,
				selectedIconPaddingRight = 12,
				text = v,
				fontStyle = {
					Font = captionHeader.Font,
					RelativeSize = captionHeader.RelativeSize
				},
				onActivated = function()
					-- upvalues: p1 (copy), i (ref), var6 (copy)
					p1.onSelection(i)
					var6(false)
				end,
				selected = i == p1.selectedIndex
			}
		end
		var8(t)
	end, { p1.dropdownList, p1.selectedIndex })
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 3,
		Size = p1.buttonSize,
		LayoutOrder = p1.layoutOrder
	}, {
		SpawnButton = roactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			Text = p1.dropdownList[p1.selectedIndex],
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = var3,
			Font = captionHeader.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = var4,
			BackgroundTransparency = 0,
			LayoutOrder = p1.layoutOrder,
			[roactModule.Event.Activated] = var9
		}, {
			UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
			UIPadding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 12) }),
			UIStroke = roactModule.createElement("UIStroke", {
				Thickness = 1,
				Transparency = 0.8,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.new(1, 1, 1)
			}),
			Arrow = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = truncationExpandSmall,
				Size = UDim2.new(0, 16, 0, 16),
				Position = UDim2.new(1, -28, 0.5, -8)
			})
		}),
		Dropdown = var5 and roactModule.createElement(baseMenu, {
			layoutOrder = 2,
			elementHeight = 40,
			showDropShadow = true,
			buttonProps = var7,
			position = UDim2.new(0, 0, 1, 6),
			background = { Color = var4 }
		})
	})
end