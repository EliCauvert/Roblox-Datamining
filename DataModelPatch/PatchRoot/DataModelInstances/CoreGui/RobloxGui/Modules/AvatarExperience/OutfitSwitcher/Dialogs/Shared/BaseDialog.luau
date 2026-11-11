local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Dialog = FoundationModule.Dialog
local Text = FoundationModule.Text
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: ReactModule (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy), Text (copy)
	return ReactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		Selectable = false,
		[ReactModule.Event.Activated] = p1.onClose
	}, ReactModule.createElement(Dialog.Root, {
		hasBackdrop = false,
		onClose = nil,
		size = DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.titleText }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2, tag = "col gap-medium size-full-0" }, {
			Body = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
				LayoutOrder = 1,
				Text = p1.bodyText
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), ButtonVariant (upval)
				return {
					{
						text = p1.cancelButtonText,
						variant = ButtonVariant.Standard,
						onActivated = p1.onClose
					},
					{
						text = p1.confirmButtonText,
						variant = ButtonVariant.Emphasis,
						onActivated = p1.onConfirm
					}
				}
			end, {
				p1.cancelButtonText,
				p1.onClose,
				p1.confirmButtonText,
				p1.onConfirm
			})
		})
	}))
end