local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: ReactModule (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy)
	local TestId = p1.testId or "archive-game-dialog"
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onArchive()
	end, { p1.onArchive })
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
					text = "Archive",
					variant = ButtonVariant.Alert,
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
		disablePortal = p1.disablePortal == true,
		hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
		size = DialogSize.Small,
		testId = TestId
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.title or "Archive Game" }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Description = ReactModule.createElement(Dialog.Text, {
				Text = p1.description or "Archiving your game will remove it from Build. You can access and restore your archived games from Creator Hub or Roblox Studio."
			})
		}),
		Actions = ReactModule.createElement(Dialog.Actions, UseMemoResult)
	})
end