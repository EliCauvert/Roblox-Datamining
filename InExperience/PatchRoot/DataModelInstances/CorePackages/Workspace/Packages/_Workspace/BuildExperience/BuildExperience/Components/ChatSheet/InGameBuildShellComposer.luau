local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Chip = FoundationModule.Chip
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance

local function noop() end

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Chip (copy), IconName (copy), ChipSize (copy), ChipVariant (copy), StateLayerAffordance (copy), IconButton (copy), InputSize (copy), ButtonVariant (copy), Text (copy), noop (copy)
	local Replaced: string = if p1.draftText == nil then "" else string.gsub(p1.draftText, "%s+", " ")
	local HasMatch = string.match(Replaced, "%S") ~= nil
	local TestIdPrefix = p1.testIdPrefix
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-small size-full-0 auto-y",
		testId = `{TestIdPrefix}-composer-container`
	}, {
		AttachmentCount = if (p1.attachmentCount or 0) > 0 then ReactModule.createElement(Chip, {
			LayoutOrder = 1,
			leading = IconName.Image,
			onActivated = p1.onActivated,
			size = ChipSize.Small,
			text = p1.attachmentCountText or "",
			variant = ChipVariant.Standard,
			testId = `{TestIdPrefix}-attachment-count`
		}) else nil,
		Composer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-xsmall stroke-default radius-circle bg-shift-100",
			onActivated = p1.onActivated,
			stateLayer = { affordance = StateLayerAffordance.None },
			testId = `{TestIdPrefix}-composer`
		}, {
			Add = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				icon = IconName.PlusLarge,
				onActivated = p1.onActivated,
				size = InputSize.Small,
				testId = `{TestIdPrefix}-composer-add`,
				variant = ButtonVariant.Utility
			}),
			Draft = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = if HasMatch then Replaced else p1.placeholder,
				tag = {
					["fill auto-y text-body-large text-align-x-left text-truncate-end"] = true,
					["content-default"] = HasMatch,
					["content-muted"] = not HasMatch
				},
				testId = `{TestIdPrefix}-composer-draft`
			}),
			Select = if p1.showAttachTools == false then nil else ReactModule.createElement(IconButton, {
				LayoutOrder = 3,
				icon = IconName.CursorStars,
				isDisabled = p1.isAttachingDisabled,
				onActivated = p1.onSelectionActivated or noop,
				size = InputSize.Small,
				testId = `{TestIdPrefix}-select`,
				variant = ButtonVariant.Utility
			}),
			Capture = if p1.showAttachTools == false then nil else ReactModule.createElement(IconButton, {
				LayoutOrder = 4,
				icon = IconName.FrameCameraCenter,
				isDisabled = p1.isAttachingDisabled,
				onActivated = p1.onCaptureActivated or noop,
				size = InputSize.Small,
				testId = `{TestIdPrefix}-capture`,
				variant = ButtonVariant.Utility
			})
		})
	})
end