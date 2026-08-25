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
local fFlagHideConversationTypeInfoIfNoWebViewModule = require(appChat.Flags.FFlagHideConversationTypeInfoIfNoWebView)
local t = {
	bodyText = "Placeholder body",
	iconImage = nil,
	iconCellWidth = 30,
	shouldShowIcon = true,
	cellHeight = 28,
	iconSize = iconSize.Small,
	onIconActivated = function() end
}

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useIsInExperienceModule (ref), reactModule (ref), baseCellModule (ref), foundationModule (ref), fFlagHideConversationTypeInfoIfNoWebViewModule (ref), iconButton (ref)
	local var9 = cryoModule.Dictionary.join(t, p0)
	local style = var9.style or useStyle()
	local theme = style.Theme
	local size300 = style.Tokens.Size.Size_300
	local var11 = useTokens()
	local var12 = useIsInExperienceModule()
	local var13, var14 = reactModule.useBinding(0)
	
	return reactModule.createElement(baseCellModule, {
		Selectable = false,
		isDisabled = true,
		showDivider = false,
		Size = UDim2.new(1, 0, 0, var9.cellHeight),
		BackgroundColor3 = if var12 then var11.Color.None.Color3 else theme.BackgroundDefault.Color,
		BackgroundTransparency = if var12 then var11.Color.None.Transparency else style.Theme.BackgroundDefault.Transparency,
		LayoutOrder = var9.layoutOrder,
		dividerColor3 = theme.Divider.Color,
		dividerTransparency = theme.Divider.Transparency
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, size300),
			PaddingRight = UDim.new(0, size300)
		}),
		Content = reactModule.createElement(foundationModule.View, {
			tag = "row size-full align-y-center",
			onAbsoluteSizeChanged = reactModule.useCallback(function(p1)
				-- upvalues: var14 (ref)
				var14(p1.AbsoluteSize.X)
			end, {})
		}, {
			Text = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "size-0-full auto-x content-emphasis text-align-x-left text-title-large text-truncate-end",
				Text = var9.bodyText,
				sizeConstraint = {
					MaxSize = var13:map(function(p2)
						-- upvalues: fFlagHideConversationTypeInfoIfNoWebViewModule (copy), var9 (ref)
						local var15 = p2 - (if fFlagHideConversationTypeInfoIfNoWebViewModule and not var9.shouldShowIcon then 0 else var9.iconCellWidth)
						
						return Vector2.new(if var15 > 0 then var15 else 1e999, 1e999)
					end)
				}
			}),
			InfoIcon = if fFlagHideConversationTypeInfoIfNoWebViewModule and not var9.shouldShowIcon then nil else reactModule.createElement(iconButton, {
				backgroundTransparency = 1,
				layoutOrder = 2,
				icon = var9.iconImage,
				iconColor3 = theme.IconDefault.Color,
				iconSize = var9.iconSize,
				iconTransparency = theme.IconDefault.Transparency,
				size = UDim2.fromOffset(var9.iconCellWidth, var9.iconCellWidth),
				onActivated = var9.onIconActivated
			})
		})
	})
end