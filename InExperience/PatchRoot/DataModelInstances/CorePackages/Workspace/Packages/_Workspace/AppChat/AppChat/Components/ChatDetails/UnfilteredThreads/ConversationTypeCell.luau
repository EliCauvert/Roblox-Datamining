local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconButton = UIBloxModule.App.Button.IconButton
local BaseCellModule = require(AppChat.Components.Cells.BaseCell)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	bodyText = "Placeholder body",
	iconImage = nil,
	iconCellWidth = 30,
	shouldShowIcon = true,
	cellHeight = 28,
	iconSize = UIBloxModule.App.ImageSet.Enum.IconSize.Small,
	onIconActivated = function() --[[ Line: 39 ]] end
}

return function(p1) --[[ Line: 44 | Named "ConversationTypeCell" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseIsInExperienceModule (copy), ReactModule (copy), BaseCellModule (copy), FoundationModule (copy), IconButton (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	local Theme = Style.Theme
	local Size300 = Style.Tokens.Size.Size_300
	local UseTokensResult = UseTokensFunction()
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement(BaseCellModule, {
		Selectable = false,
		isDisabled = true,
		showDivider = false,
		Size = UDim2.new(1, 0, 0, JoinResult.cellHeight),
		BackgroundColor3 = if UseIsInExperienceModuleResult then UseTokensResult.Color.None.Color3 else Theme.BackgroundDefault.Color,
		BackgroundTransparency = if UseIsInExperienceModuleResult then UseTokensResult.Color.None.Transparency else Style.Theme.BackgroundDefault.Transparency,
		LayoutOrder = JoinResult.layoutOrder,
		dividerColor3 = Theme.Divider.Color,
		dividerTransparency = Theme.Divider.Transparency
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Size300),
			PaddingRight = UDim.new(0, Size300)
		}),
		Content = ReactModule.createElement(FoundationModule.View, {
			tag = "row size-full align-y-center",
			onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 53 ]]
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(Frame.AbsoluteSize.X)
			end, {})
		}, {
			Text = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "size-0-full auto-x content-emphasis text-align-x-left text-title-large text-truncate-end",
				Text = JoinResult.bodyText,
				sizeConstraint = {
					MaxSize = UseBindingResult:map(function(p2): Vector2 --[[ Line: 82 ]]
						-- upvalues: JoinResult (copy)
						local v1 = p2 - (if JoinResult.shouldShowIcon then JoinResult.iconCellWidth else 0)
						
						return Vector2.new(if v1 > 0 then v1 else 1e999, 1e999)
					end)
				}
			}),
			InfoIcon = if JoinResult.shouldShowIcon then ReactModule.createElement(IconButton, {
				backgroundTransparency = 1,
				layoutOrder = 2,
				icon = JoinResult.iconImage,
				iconColor3 = Theme.IconDefault.Color,
				iconSize = JoinResult.iconSize,
				iconTransparency = Theme.IconDefault.Transparency,
				size = UDim2.fromOffset(JoinResult.iconCellWidth, JoinResult.iconCellWidth),
				onActivated = JoinResult.onIconActivated
			}) else nil
		})
	})
end