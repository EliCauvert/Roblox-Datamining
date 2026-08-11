local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local baseCellModule = require(appChat.Components.Cells.BaseCell)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local t = {
	bodyText = "Placeholder body",
	iconImage = nil,
	iconCellWidth = 30,
	cellHeight = 28,
	iconSize = iconSize.Small,
	onIconActivated = function() --[[ line: 37 ]] end
}

return function(p0) --[[ line: 42 | named "ConversationTypeCell" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useIsInExperienceModule (ref), reactModule (ref), baseCellModule (ref), foundationModule (ref), iconButton (ref)
	local var8 = cryoModule.Dictionary.join(t, p0)
	local style = var8.style or useStyle()
	local theme = style.Theme
	local size300 = style.Tokens.Size.Size_300
	local var10 = useTokens()
	local var11 = useIsInExperienceModule()
	local var12, var13 = reactModule.useBinding(0)
	
	return reactModule.createElement(baseCellModule, {
		Selectable = false,
		isDisabled = true,
		showDivider = false,
		Size = UDim2.new(1, 0, 0, var8.cellHeight),
		BackgroundColor3 = if var11 then var10.Color.None.Color3 else theme.BackgroundDefault.Color,
		BackgroundTransparency = if var11 then var10.Color.None.Transparency else style.Theme.BackgroundDefault.Transparency,
		LayoutOrder = var8.layoutOrder,
		dividerColor3 = theme.Divider.Color,
		dividerTransparency = theme.Divider.Transparency
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, size300),
			PaddingRight = UDim.new(0, size300)
		}),
		Content = reactModule.createElement(foundationModule.View, {
			tag = "row size-full align-y-center",
			onAbsoluteSizeChanged = reactModule.useCallback(function(p1) --[[ line: 51 ]]
				-- upvalues: var13 (ref)
				var13(p1.AbsoluteSize.X)
			end, {})
		}, {
			Text = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "size-0-full auto-x content-emphasis text-align-x-left text-title-large text-truncate-end",
				Text = var8.bodyText,
				sizeConstraint = {
					MaxSize = var12:map(function(p2) --[[ line: 80 ]]
						-- upvalues: var8 (ref)
						local var14 = p2 - var8.iconCellWidth
						
						return Vector2.new(if var14 > 0 then var14 else 1e999, 1e999)
					end)
				}
			}),
			InfoIcon = reactModule.createElement(iconButton, {
				backgroundTransparency = 1,
				layoutOrder = 2,
				icon = var8.iconImage,
				iconColor3 = theme.IconDefault.Color,
				iconSize = var8.iconSize,
				iconTransparency = theme.IconDefault.Transparency,
				size = UDim2.fromOffset(var8.iconCellWidth, var8.iconCellWidth),
				onActivated = var8.onIconActivated
			})
		})
	})
end