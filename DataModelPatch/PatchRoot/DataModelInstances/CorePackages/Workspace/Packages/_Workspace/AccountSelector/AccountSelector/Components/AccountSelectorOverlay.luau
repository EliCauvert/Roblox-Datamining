local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local PartialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBlox.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local UseStyleFunction = UIBlox.Core.Style.useStyle
local UseStateFunction = React.useState
local UseEffectFunction = React.useEffect
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local UseDesignTokensFunction = DependenciesModule.Style.useDesignTokens
local AccountSelectionListModule = require(script.Parent.AccountSelectionList)
local _ = require(script.Parent.AccountSelection)
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), UseStateFunction (copy), UseLocalizationFunction (copy), GetPartialPageModalMiddleContentWidthFunction (copy), React (copy), UseEffectFunction (copy), AnalyticsEventsModule (copy), PartialPageModal (copy), AccountSelectionListModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local BaseSize = UseStyleResult.Font.BaseSize
	local Size1600: number = UseDesignTokensResult.Size.Size_1600
	local YOffset = #p1.users < 7 and Size1600 * #p1.users or Size1600 * 7.5
	local UseLocalizationResult = UseLocalizationFunction({ titleText = p1.titleTextKey, helpText = p1.helpTextKey })
	local PartialPageModalMiddleContentWidth = GetPartialPageModalMiddleContentWidthFunction(p1.screenSize.X)
	local UseRefResult = React.useRef(false)
	UseEffectFunction(function()
		-- upvalues: p1 (copy), AnalyticsEventsModule (upval), UseRefResult (copy)
		local Text = ""
		
		for _, user in p1.users do
			Text ..= tostring(user.id) .. ","
		end
		AnalyticsEventsModule.sendPageLoadEvent(p1.context, p1.origin, (Text:sub(1, -2)))
		
		return function()
			-- upvalues: UseRefResult (upval), p1 (upval)
			if not UseRefResult.current then
				p1.onAccountSelectionAbandoned()
			end
		end
	end, {})
	
	return React.createElement(PartialPageModal, {
		screenSize = p1.screenSize,
		title = UseLocalizationResult.titleText,
		onCloseClicked = p1.onAccountSelectionAbandoned
	}, {
		ViewContainer = React.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ContentPadding = React.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 24)
			}),
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 6),
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			HelpText = React.createElement("TextLabel", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = UseLocalizationResult.helpText,
				TextSize = BaseSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
				Font = UseStyleResult.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			AccountSelectionContent = React.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, YOffset)
			}, {
				AccountSelectionList = React.createElement(AccountSelectionListModule, {
					isScrollable = true,
					users = p1.users,
					onAccountSelection = function(p2)
						-- upvalues: UseStateResult2 (copy), p1 (copy), AnalyticsEventsModule (upval), UseRefResult (copy)
						UseStateResult2(true)
						p1.onAccountSelection(p2)
						AnalyticsEventsModule.sendSelectEvent(p1.context, p1.origin, (tostring(p2)))
						UseRefResult.current = true
					end,
					height = YOffset,
					isDisabled = UseStateResult
				})
			})
		})
	})
end