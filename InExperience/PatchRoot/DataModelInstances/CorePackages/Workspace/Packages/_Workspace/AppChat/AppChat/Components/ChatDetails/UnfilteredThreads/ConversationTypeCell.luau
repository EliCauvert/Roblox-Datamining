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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useIsInExperienceModule (ref), reactModule (ref), baseCellModule (ref), foundationModule (ref), fFlagHideConversationTypeInfoIfNoWebViewModule (ref), iconButton (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style or useStyle()
	local theme = style.Theme
	local size300 = style.Tokens.Size.Size_300
	local var2 = useTokens()
	local var3 = useIsInExperienceModule()
	local var4, var5 = reactModule.useBinding(0)
	
	return reactModule.createElement(baseCellModule, {
		Selectable = false,
		isDisabled = true,
		showDivider = false,
		Size = UDim2.new(1, 0, 0, var1.cellHeight),
		BackgroundColor3 = if var3 then var2.Color.None.Color3 else theme.BackgroundDefault.Color,
		BackgroundTransparency = if var3 then var2.Color.None.Transparency else style.Theme.BackgroundDefault.Transparency,
		LayoutOrder = var1.layoutOrder,
		dividerColor3 = theme.Divider.Color,
		dividerTransparency = theme.Divider.Transparency
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, size300),
			PaddingRight = UDim.new(0, size300)
		}),
		Content = reactModule.createElement(foundationModule.View, {
			tag = "row size-full align-y-center",
			onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
				-- upvalues: var5 (ref)
				var5(p2.AbsoluteSize.X)
			end, {})
		}, {
			Text = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "size-0-full auto-x content-emphasis text-align-x-left text-title-large text-truncate-end",
				Text = var1.bodyText,
				sizeConstraint = {
					MaxSize = var4:map(function(p2)
						-- upvalues: fFlagHideConversationTypeInfoIfNoWebViewModule (copy), var1 (ref)
						local var6 = p2 - (if fFlagHideConversationTypeInfoIfNoWebViewModule and not var1.shouldShowIcon then 0 else var1.iconCellWidth)
						
						return Vector2.new(if var6 > 0 then var6 else 1e999, 1e999)
					end)
				}
			}),
			InfoIcon = if fFlagHideConversationTypeInfoIfNoWebViewModule and not var1.shouldShowIcon then nil else reactModule.createElement(iconButton, {
				backgroundTransparency = 1,
				layoutOrder = 2,
				icon = var1.iconImage,
				iconColor3 = theme.IconDefault.Color,
				iconSize = var1.iconSize,
				iconTransparency = theme.IconDefault.Transparency,
				size = UDim2.fromOffset(var1.iconCellWidth, var1.iconCellWidth),
				onActivated = var1.onIconActivated
			})
		})
	})
end