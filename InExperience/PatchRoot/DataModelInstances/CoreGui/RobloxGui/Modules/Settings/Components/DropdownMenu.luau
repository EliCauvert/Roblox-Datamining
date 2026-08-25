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
local var6 = argCheckModule.wrap(tModule.strictInterface({
	buttonSize = tModule.UDim2,
	dropdownList = tModule.table,
	selectedIndex = tModule.number,
	onSelection = tModule.callback,
	layoutOrder = tModule.number
}))

return function(p0)
	-- upvalues: var6 (ref), useStyle (ref), reactModule (ref), roactModule (ref), imageSetLabel (ref), truncationExpandSmall (ref), baseMenu (ref)
	assert(var6(p0))
	local var7 = useStyle()
	local captionHeader = var7.Font.CaptionHeader
	local var8 = captionHeader.RelativeSize * var7.Font.BaseSize
	local var9 = if var7.UIBloxThemeEnabled then var7.color("ControlInputBackground") else Color3.fromRGB(79, 84, 95)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState({})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var10 (ref)
		var11(not var10)
	end)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), captionHeader (ref), var11 (ref), var13 (ref)
		local t = {}
		
		for i, v in pairs(p0.dropdownList) do
			t[i] = {
				leftPaddingOffset = -12,
				selectedIconPaddingRight = 12,
				text = v,
				fontStyle = {
					Font = captionHeader.Font,
					RelativeSize = captionHeader.RelativeSize
				},
				onActivated = function()
					-- upvalues: p0 (copy), i (ref), var11 (copy)
					p0.onSelection(i)
					var11(false)
				end,
				selected = i == p0.selectedIndex
			}
		end
		var13(t)
	end, { p0.dropdownList, p0.selectedIndex })
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 3,
		Size = p0.buttonSize,
		LayoutOrder = p0.layoutOrder
	}, {
		SpawnButton = roactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			Text = p0.dropdownList[p0.selectedIndex],
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = var8,
			Font = captionHeader.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = var9,
			BackgroundTransparency = 0,
			LayoutOrder = p0.layoutOrder,
			[roactModule.Event.Activated] = var14
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
		Dropdown = var10 and roactModule.createElement(baseMenu, {
			layoutOrder = 2,
			elementHeight = 40,
			showDropShadow = true,
			buttonProps = var12,
			position = UDim2.new(0, 0, 1, 6),
			background = { Color = var9 }
		})
	})
end