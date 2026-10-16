local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local TModule = require(CorePackages.Packages.t)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local BaseMenu = UIBloxModule.App.Menu.BaseMenu
local IconsActionsTruncationExpandSmall = UIBloxModule.App.ImageSet.Images["icons/actions/truncationExpand_small"]
local WrapResult = require(CorePackages.Workspace.Packages.ArgCheck).wrap(TModule.strictInterface({
	buttonSize = TModule.UDim2,
	dropdownList = TModule.table,
	selectedIndex = TModule.number,
	onSelection = TModule.callback,
	layoutOrder = TModule.number
}))

return function(p1) --[[ Line: 48 | Named "DropdownMenu" ]]
	-- upvalues: WrapResult (copy), UseStyleFunction (copy), ReactModule (copy), RoactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ImageSetLabel (copy), IconsActionsTruncationExpandSmall (copy), BaseMenu (copy)
	assert(WrapResult(p1))
	local UseStyleResult = UseStyleFunction()
	local CaptionHeader = UseStyleResult.Font.CaptionHeader
	local ScaledRelativeSize = CaptionHeader.RelativeSize * UseStyleResult.Font.BaseSize
	local ControlInputBackground = if UseStyleResult.UIBloxThemeEnabled then UseStyleResult.color("ControlInputBackground") else Color3.fromRGB(79, 84, 95)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 61 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
		UseStateResult2(not UseStateResult)
	end)
	ReactModule.useEffect(function() --[[ Line: 65 ]]
		-- upvalues: p1 (copy), CaptionHeader (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
		local t = {}
		
		for i, Text in pairs(p1.dropdownList) do
			t[i] = {
				leftPaddingOffset = -12,
				selectedIconPaddingRight = 12,
				text = Text,
				fontStyle = {
					Font = CaptionHeader.Font,
					RelativeSize = CaptionHeader.RelativeSize
				},
				onActivated = function() --[[ Line: 74 ]]
					-- upvalues: p1 (upval), i (copy), UseStateResult2 (upval)
					p1.onSelection(i)
					UseStateResult2(false)
				end,
				selected = i == p1.selectedIndex
			}
		end
		UseStateResult2_1(t)
	end, { p1.dropdownList, p1.selectedIndex })
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 3,
		Size = p1.buttonSize,
		LayoutOrder = p1.layoutOrder
	}, {
		SpawnButton = RoactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			Text = p1.dropdownList[p1.selectedIndex],
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = ScaledRelativeSize,
			Font = if FoundationFontFaceMigration then nil else CaptionHeader.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.CaptionLarge.Font) else nil,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = ControlInputBackground,
			BackgroundTransparency = 0,
			LayoutOrder = p1.layoutOrder,
			[RoactModule.Event.Activated] = UseResult
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
			UIPadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 12) }),
			UIStroke = RoactModule.createElement("UIStroke", {
				Thickness = 1,
				Transparency = 0.8,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.new(1, 1, 1)
			}),
			Arrow = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = IconsActionsTruncationExpandSmall,
				Size = UDim2.new(0, 16, 0, 16),
				Position = UDim2.new(1, -28, 0.5, -8)
			})
		}),
		Dropdown = UseStateResult and RoactModule.createElement(BaseMenu, {
			layoutOrder = 2,
			elementHeight = 40,
			showDropShadow = true,
			buttonProps = UseStateResult1,
			position = UDim2.new(0, 0, 1, 6),
			background = { Color = ControlInputBackground }
		})
	})
end