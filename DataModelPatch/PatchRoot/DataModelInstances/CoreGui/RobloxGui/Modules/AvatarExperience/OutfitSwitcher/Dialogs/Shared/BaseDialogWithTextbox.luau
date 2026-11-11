local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Dialog = FoundationModule.Dialog
local TextInput = FoundationModule.TextInput
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local AXOutfitTextBoxCharacterLimit = game:DefineFastInt("AXOutfitTextBoxCharacterLimit", 80)

return function(p1)
	-- upvalues: ReactModule (copy), AXOutfitTextBoxCharacterLimit (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy), TextInput (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.defaultText or "")
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: AXOutfitTextBoxCharacterLimit (upval), UseRefResult (copy), UseStateResult (copy), UseStateResult2 (copy)
		if AXOutfitTextBoxCharacterLimit >= #p2 then
			UseStateResult2(p2)
		elseif UseRefResult.current then
			local TextBox = UseRefResult.current:FindFirstChild("TextBox", true)
			
			if TextBox then
				TextBox.Text = UseStateResult
				
				return
			end
		end
	end, { UseStateResult2, UseStateResult })
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseStateResult (copy)
		return p1.isTextValid(UseStateResult)
	end, { UseStateResult, p1.isTextValid })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseStateResult (copy)
		p1.onConfirm(UseStateResult)
	end, { p1.onConfirm, UseStateResult })
	
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
			OutfitNameInput = ReactModule.createElement(TextInput, {
				label = "",
				LayoutOrder = 2,
				text = UseStateResult,
				width = UDim.new(1, 0),
				hasError = UseMemoResult2 ~= nil,
				hint = UseMemoResult2,
				onChanged = UseResult,
				ref = UseRefResult
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), ButtonVariant (upval), UseMemoResult (copy), UseResult1 (copy)
				return {
					{
						text = p1.cancelButtonText,
						variant = ButtonVariant.Standard,
						onActivated = p1.onClose
					},
					{
						text = p1.confirmButtonText,
						variant = ButtonVariant.Emphasis,
						isDisabled = not UseMemoResult or nil,
						onActivated = UseResult1
					}
				}
			end, {
				p1.cancelButtonText,
				p1.onClose,
				p1.confirmButtonText,
				UseMemoResult,
				UseResult1
			})
		})
	}))
end