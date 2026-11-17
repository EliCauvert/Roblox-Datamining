local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local IconName = FoundationModule.Enums.IconName

return function(p1)
	-- upvalues: UseTokensFunction (copy), ButtonVariant (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), View (copy), Icon (copy), IconName (copy), Text (copy)
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "two-options-ad-campaign-funded-error-dialog",
		ref = p1.dialogRef,
		size = DialogSize.Medium,
		onClose = if p1.isRetryPending then nil else p1.onDismiss
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Body = ReactModule.createElement(View, { tag = "col align-x-center gap-medium size-full-0 auto-y" }, {
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					tag = "content-emphasis",
					name = IconName.TriangleExclamation,
					size = UseTokensFunction().Size.Size_1200
				}),
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = p1.description
				})
			})
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = p1.retryText,
					variant = ButtonVariant.Emphasis,
					isLoading = p1.isRetryPending,
					onActivated = p1.onRetry,
					ref = p1.retryRef
				}
			}
		})
	})
end