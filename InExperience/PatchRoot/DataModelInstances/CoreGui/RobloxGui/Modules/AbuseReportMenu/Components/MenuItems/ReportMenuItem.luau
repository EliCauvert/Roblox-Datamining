local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local GetMenuItemDimensionsModule = require(AbuseReportMenu.Components.getMenuItemDimensions)

return function(p1) --[[ Line: 23 | Named "DropdownReportMenuItem" ]]
	-- upvalues: UseStyleFunction (copy), GetMenuItemDimensionsModule (copy), ConstantsModule (copy), ReactModule (copy), TextService (copy), AppFonts (copy), CryoModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Size150 = if p1.label == "" or p1.isRightComponentFullWidth then 0 else UseStyleResult.Tokens.Size.Size_150
	local Theme = UseStyleResult.Theme
	local MenuItemDimensionsModule = GetMenuItemDimensionsModule(p1.menuContainerWidth)
	local Largest = math.max(p1.menuContainerWidth - ConstantsModule.MenuItemDynamicWidthOffset, MenuItemDimensionsModule.LeftWidth + MenuItemDimensionsModule.RightWidth)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseStyleResult.Tokens.Size.Size_1000)
	ReactModule.useEffect(function() --[[ Line: 37 ]]
		-- upvalues: UseStateResult2 (copy), UseStyleResult (copy), TextService (upval), p1 (copy), MenuItemDimensionsModule (copy), AppFonts (upval), Largest (copy)
		UseStateResult2((math.max(UseStyleResult.Tokens.Size.Size_1000, TextService:GetTextSize(p1.label, MenuItemDimensionsModule.TextSize, AppFonts.default:getMedium(), Vector2.new(if p1.isSmallPortraitViewport then Largest else MenuItemDimensionsModule.LeftWidth, 1e999)).Y)))
	end, {})
	local config = {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = if p1.isSmallPortraitViewport then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = if p1.isSmallPortraitViewport then UDim.new(0, Size150) else UDim.new(0, 0)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Size150),
			PaddingBottom = UDim.new(0, Size150)
		})
	}
	local JoinResult = nil
	
	if p1.isRightComponentFullWidth then
		JoinResult = CryoModule.Dictionary.join(config, {
			RightComponentWrapper = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(0, math.max(p1.menuContainerWidth - ConstantsModule.MenuItemDynamicWidthOffset, MenuItemDimensionsModule.LeftWidth + MenuItemDimensionsModule.RightWidth), 0, ConstantsModule.MenuItemHeight),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				RightComponent = p1.rightComponent
			})
		})
	else
		local Largest1 = math.max(0, p1.menuContainerWidth - MenuItemDimensionsModule.LeftWidth - MenuItemDimensionsModule.RightWidth - ConstantsModule.MenuItemDynamicWidthOffset)
		JoinResult = CryoModule.Dictionary.join(config, {
			Label = if p1.label == "" and p1.isSmallPortraitViewport then nil else ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = p1.label,
				Font = AppFonts.default:getMedium(),
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextSize = MenuItemDimensionsModule.TextSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = if p1.isSmallPortraitViewport then UDim2.new(0, Largest, 0, 0) else UDim2.new(0, MenuItemDimensionsModule.LeftWidth, 0, UseStateResult),
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			MiddleSpaceHolder = if p1.isSmallPortraitViewport then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(0, Largest1, 0, ConstantsModule.MenuItemHeight)
			}),
			RightComponentWrapper = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = if p1.isSmallPortraitViewport then UDim2.new(0, Largest, 0, 0) else UDim2.new(0, MenuItemDimensionsModule.RightWidth, 0, ConstantsModule.MenuItemHeight),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = if p1.isSmallPortraitViewport then Enum.HorizontalAlignment.Left else nil
				}),
				RightComponent = p1.rightComponent
			})
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, if p1.heightOverride then p1.heightOverride else UseStateResult),
		AutomaticSize = if p1.isRightComponentFullWidth or p1.isSmallPortraitViewport then Enum.AutomaticSize.Y else nil,
		LayoutOrder = p1.layoutOrder
	}, JoinResult)
end