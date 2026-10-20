local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: ReactModule (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy)
	local TestId = p1.testId or "restore-version-dialog"
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onRestore()
	end, { p1.onRestore })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onCancel()
	end, { p1.onCancel })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ButtonVariant (upval), UseResult (copy), UseResult1 (copy)
		return {
			LayoutOrder = 3,
			actions = {
				{
					text = "Restore",
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult
				},
				{
					text = "Cancel",
					variant = ButtonVariant.Standard,
					onActivated = UseResult1
				}
			}
		}
	end, { UseResult, UseResult1 })
	
	return if p1.isOpen == false then nil else ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = DialogSize.Small,
		testId = TestId
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Description = ReactModule.createElement(Dialog.Text, { Text = p1.description })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, UseMemoResult)
	})
end