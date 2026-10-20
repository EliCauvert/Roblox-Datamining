local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local AuthStatefulRoundCornerBorder = require(CorePackages.Workspace.Packages.AuthCommon).Components.AuthStatefulRoundCornerBorder

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), ContextualMenu (copy), DashModule (copy), MenuDirection (copy), AuthStatefulRoundCornerBorder (copy), ImageSetButton (copy), ImageSetLabel (copy), Images (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		January = "CommonUI.Controls.Label.January",
		February = "CommonUI.Controls.Label.February",
		March = "CommonUI.Controls.Label.March",
		April = "CommonUI.Controls.Label.April",
		May = "CommonUI.Controls.Label.May",
		June = "CommonUI.Controls.Label.June",
		July = "CommonUI.Controls.Label.July",
		August = "CommonUI.Controls.Label.August",
		September = "CommonUI.Controls.Label.September",
		October = "CommonUI.Controls.Label.October",
		November = "CommonUI.Controls.Label.November",
		December = "CommonUI.Controls.Label.December",
		Month = "Authentication.SignUp.Label.Month"
	})
	local list = {
		{ key = 1, text = UseLocalizationResult.January },
		{ key = 2, text = UseLocalizationResult.February },
		{ key = 3, text = UseLocalizationResult.March },
		{ key = 4, text = UseLocalizationResult.April },
		{ key = 5, text = UseLocalizationResult.May },
		{ key = 6, text = UseLocalizationResult.June },
		{ key = 7, text = UseLocalizationResult.July },
		{ key = 8, text = UseLocalizationResult.August },
		{ key = 9, text = UseLocalizationResult.September },
		{ key = 10, text = UseLocalizationResult.October },
		{ key = 11, text = UseLocalizationResult.November },
		{ key = 12, text = UseLocalizationResult.December }
	}
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	local function toggleDropdown()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy)
		UseStateResult2_1(not UseStateResult1)
	end
	
	local function _(Text, p2)
		-- upvalues: UseStateResult2 (copy), p1 (copy), UseStateResult2_1 (copy), UseStateResult (copy)
		return {
			text = Text,
			onActivated = function()
				-- upvalues: UseStateResult2 (upval), p2 (copy), p1 (upval), UseStateResult2_1 (upval)
				UseStateResult2(p2)
				p1.onMonthSelected(p2)
				UseStateResult2_1(false)
			end,
			selected = UseStateResult == p2
		}
	end
	
	local function dropdownMenuList()
		-- upvalues: ReactModule (upval), p1 (copy), ContextualMenu (upval), DashModule (upval), list (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult (copy), UseStateResult1 (copy), MenuDirection (upval), toggleDropdown (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1.25, 0, 0, 0),
			AnchorPoint = if p1.shouldExpandRight then Vector2.new(0, 0) else Vector2.new(1, 0),
			Position = if p1.shouldExpandRight then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			MonthMenu = ReactModule.createElement(ContextualMenu, {
				buttonProps = DashModule.map(list, function(p2)
					-- upvalues: UseStateResult2 (upval), p1 (upval), UseStateResult2_1 (upval), UseStateResult (upval)
					local Key = p2.key
					
					return {
						text = p2.text,
						onActivated = function()
							-- upvalues: UseStateResult2 (upval), Key (copy), p1 (upval), UseStateResult2_1 (upval)
							UseStateResult2(Key)
							p1.onMonthSelected(Key)
							UseStateResult2_1(false)
						end,
						selected = UseStateResult == Key
					}
				end),
				open = UseStateResult1,
				menuDirection = MenuDirection.Down,
				screenSize = p1.screenSize,
				openPositionY = UDim.new(0, p1.textInputHeight * -1),
				contextMenuWidthOverride = UDim.new(1, 0),
				onDismiss = toggleDropdown
			})
		})
	end
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		Button = ReactModule.createElement(AuthStatefulRoundCornerBorder, {
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, p1.textInputHeight),
			borderState = AuthStatefulRoundCornerBorder.BorderState.Default
		}, {
			Base = ReactModule.createElement(ImageSetButton, {
				Size = UDim2.new(1, 0, 1, 0),
				Image = "LuaApp/buttons/buttonFill",
				BackgroundColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = UseStyleResult.Theme.BackgroundUIContrast.Transparency,
				BorderSizePixel = 0,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				[ReactModule.Event.Activated] = toggleDropdown
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) }),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 0),
					PaddingBottom = UDim.new(0, 0),
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				TextLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -16, 1, 0),
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					Text = if UseStateResult > 0 then list[UseStateResult].text else UseLocalizationResult.Month,
					Font = UseStyleResult.Font.Body.Font,
					TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize,
					TextColor3 = if UseStateResult then UseStyleResult.Theme.TextDefault.Color else UseStyleResult.Theme.UIDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency
				}),
				ImageLabel = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(1, 0, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					Image = UseStateResult1 and Images["truncate_arrows/actions_truncationCollapse"] or Images["truncate_arrows/actions_truncationExpand"],
					ImageColor3 = UseStyleResult.Theme.UIDefault.Color,
					ImageTransparency = UseStyleResult.Theme.UIDefault.Transparency
				})
			})
		}),
		DropdownMenu = UseStateResult1 and dropdownMenuList()
	})
end