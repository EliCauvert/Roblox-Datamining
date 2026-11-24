local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local IsOutfitNameValidModule = require(AvatarWorkshop.Utils.isOutfitNameValid)
local _ = require(script.Parent.NameAvatarDialogView)

local function _(Text: string)
	-- upvalues: IsOutfitNameValidModule (copy)
	local Match: string = if string.find(Text, "%S") then string.match(Text, "^%s*(.*%S)") else ""
	local Inverted: boolean = Text ~= "" and not IsOutfitNameValidModule(Match)
	
	return Match, Inverted, Text ~= "" and not Inverted
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), IsOutfitNameValidModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.Avatar.Title.NameAvatarOutfit",
		add = "Feature.Avatar.Label.Add",
		cancel = "CommonUI.Controls.Action.Cancel",
		invalidName = "Feature.Avatar.Message.InvalidName",
		defaultAvatarName = "Feature.AvatarWorkshop.Label.DefaultAvatarName"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.defaultName or UseLocalizationResult.defaultAvatarName)
	local UseRefResult = ReactModule.useRef(UseStateResult)
	local Match: string = if string.find(UseStateResult, "%S") then string.match(UseStateResult, "^%s*(.*%S)") else ""
	local Inverted: boolean = UseStateResult ~= "" and not IsOutfitNameValidModule(Match)
	local OnConfirmFunction = p1.onConfirm
	
	return {
		title = UseLocalizationResult.title,
		addText = UseLocalizationResult.add,
		cancelText = UseLocalizationResult.cancel,
		name = UseStateResult,
		hasNameError = Inverted,
		nameHint = if Inverted then UseLocalizationResult.invalidName else nil,
		canConfirm = UseStateResult ~= "" and not Inverted,
		onNameChanged = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
			UseRefResult.current = Current
			UseStateResult2(Current)
		end, {}),
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), IsOutfitNameValidModule (upval), OnConfirmFunction (copy)
			local Current: string = UseRefResult.current
			local Match: string = if string.find(Current, "%S") then string.match(Current, "^%s*(.*%S)") else ""
			local Inverted: boolean = Current ~= "" and not IsOutfitNameValidModule(Match)
			
			if Current ~= "" and not Inverted then
				OnConfirmFunction(Match)
			end
		end, { OnConfirmFunction }),
		onCancel = p1.onCancel
	}
end