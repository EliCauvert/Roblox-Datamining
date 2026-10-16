local Parent = script.Parent
local Parent1 = Parent.Parent
local ConstantsModule = require(Parent1.constants)
local Context = Parent1.context
local _ = require(Parent1.type)
local NotificationActionsFrameModule = require(Parent.NotificationActionsFrame)
local NotificationContentFrameModule = require(Parent.NotificationContentFrame)
local UseNotificationCardDataModule = require(Context.useNotificationCardData)
local UseNotificationCardStateModule = require(Context.useNotificationCardState)
local UIBlox = require(Parent1.dependencies).UIBlox
local ReactModule = require(Parent1.Parent.React)
local UseStyleFunction = UIBlox.Core.Style.useStyle
local Interactable = UIBlox.Core.Control.Interactable
local DefaultCardPadding = ConstantsModule.Padding.DefaultCardPadding
local DefaultContentPadding = ConstantsModule.DefaultContentPadding
local DefaultCardCornerRadius = ConstantsModule.DefaultCardCornerRadius

return function(p1) --[[ Line: 32 ]]
	-- upvalues: UseNotificationCardDataModule (copy), ConstantsModule (copy), DefaultCardPadding (copy), UseStyleFunction (copy), UseNotificationCardStateModule (copy), ReactModule (copy), Interactable (copy), DefaultCardCornerRadius (copy), DefaultContentPadding (copy), NotificationContentFrameModule (copy), NotificationActionsFrameModule (copy)
	local UseNotificationCardDataModuleResult = UseNotificationCardDataModule()
	local CardSize = UseNotificationCardDataModuleResult.cardSize
	local CardPadding = if CardSize and CardSize.cardPadding then CardSize.cardPadding else DefaultCardPadding
	local UseStyleResult = UseStyleFunction()
	local HandleActionsFunction = UseNotificationCardDataModuleResult.handleActions
	local TextBody = UseNotificationCardStateModule("textBody")
	local TextBodyEntry = TextBody and TextBody[1]
	
	return ReactModule.createElement(Interactable, {
		AutoButtonColor = false,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = if UseNotificationCardDataModuleResult.cardTransparency then UseNotificationCardDataModuleResult.cardTransparency else ConstantsModule.CardTransparency.Default,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		onStateChanged = function() --[[ Line: 50 ]] end,
		Size = UDim2.new(1, 0, 0, 0),
		[ReactModule.Event.Activated] = function() --[[ Line: 52 ]]
			-- upvalues: HandleActionsFunction (copy), TextBodyEntry (copy)
			if HandleActionsFunction and TextBodyEntry then
				HandleActionsFunction(TextBodyEntry)
			end
		end
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = DefaultCardCornerRadius }),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, DefaultContentPadding),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, CardPadding),
			PaddingLeft = UDim.new(0, CardPadding),
			PaddingRight = UDim.new(0, CardPadding),
			PaddingTop = UDim.new(0, CardPadding)
		}),
		NotificationContentFrame = ReactModule.createElement(NotificationContentFrameModule, {
			showHoldButton = p1.showHoldButton,
			shouldAutoFocus = p1.shouldAutoFocus,
			holdProgress = p1.holdProgress
		}),
		NotificationActionsFrame = ReactModule.createElement(NotificationActionsFrameModule, { shouldAutoFocus = p1.shouldAutoFocus })
	})
end