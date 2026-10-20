local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local Orientation = FoundationModule.Enums.Orientation

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ButtonVariant (copy), Dialog (copy), Orientation (copy)
	local BodyText = p1.bodyText or p1.bodyComponent
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.primaryButtonAction then
			p1.primaryButtonAction()
			
			if p1.primaryButtonSideEffectAction then
				p1.primaryButtonSideEffectAction()
			end
		end
	end, { p1.primaryButtonAction, p1.primaryButtonSideEffectAction })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.secondaryButtonAction then
			p1.secondaryButtonAction()
			
			if p1.secondaryButtonSideEffectAction then
				p1.secondaryButtonSideEffectAction()
			end
		end
	end, {
		p1.secondaryButtonAction,
		p1.secondaryButtonSideEffectAction
	})
	local List = nil
	
	if p1.primaryButtonAction or p1.primaryButtonText or p1.primaryButtonIcon then
		List = List or {}
		table.insert(List, {
			testId = "--sdui-dialog-primary-button",
			variant = ButtonVariant.Emphasis,
			text = p1.primaryButtonText,
			icon = p1.primaryButtonIcon,
			onActivated = UseResult,
			inputDelay = p1.primaryButtonInputDelay
		})
	end
	if p1.secondaryButtonAction or p1.secondaryButtonText or p1.secondaryButtonIcon then
		List = List or {}
		table.insert(List, {
			testId = "--sdui-dialog-secondary-button",
			variant = ButtonVariant.Standard,
			text = p1.secondaryButtonText,
			icon = p1.secondaryButtonIcon,
			onActivated = UseResult1,
			inputDelay = p1.secondaryButtonInputDelay
		})
	end
	return ReactModule.createElement(Dialog.Root, {
		size = p1.size,
		onClose = p1.onClose,
		disablePortal = p1.disablePortal == nil or p1.disablePortal,
		hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop
	}, {
		DialogTitle = p1.titleText and ReactModule.createElement(Dialog.Title, { text = p1.titleText }) or nil,
		DialogMedia = p1.image and ReactModule.createElement(Dialog.HeroMedia, {
			media = p1.image,
			aspectRatio = p1.imageAspectRatio or 1.7777777777777777
		}) or nil,
		DialogContent = BodyText and ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			BodyContent = if p1.bodyComponent then p1.bodyComponent elseif p1.bodyText then ReactModule.createElement(Dialog.Text, { Text = p1.bodyText }) else nil
		}) or nil,
		DialogActions = List and ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = List,
			label = p1.actionsLabel,
			orientation = p1.actionsOrientation or Orientation.Horizontal
		}) or nil
	})
end)