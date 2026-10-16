local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local TextArea = FoundationModule.TextArea
local TextKeysModule = require(EditProfile.Common.TextKeys)
local ConstantsModule = require(EditProfile.Common.Constants)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1) --[[ Line: 23 ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), ConstantsModule (copy), View (copy), Text (copy), TextArea (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		AboutModalCaption = TextKeysModule.AboutModalCaption,
		AboutPlaceholder = TextKeysModule.AboutPlaceholder,
		PinLocked = TextKeysModule.PinLocked,
		ThrottleError = TextKeysModule.TooManyAttemptsTryAgainLater
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.bioText)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(string.len(p1.bioText) >= 1000)
	
	local function _(Text: string) --[[ Line: 34 | Named "textChanged" ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), p1 (copy)
		local Length = string.len(Text)
		UseStateResult2(Text)
		UseStateResult2_1(Length > 1000)
		
		if p1.onDataChange then
			p1.onDataChange((string.sub(Text, 1, 1000)))
		end
	end
	
	local PinLocked = if p1.errorCode == ConstantsModule.DescriptionErrorCodes.PinLocked then UseLocalizationResult.PinLocked else UseLocalizationResult.ThrottleError
	
	return ReactModule.createElement(View, { tag = "col size-full-0 auto-y gap-large" }, {
		Caption = ReactModule.createElement(Text, {
			tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left",
			Text = UseLocalizationResult.AboutModalCaption
		}),
		BioTextArea = ReactModule.createElement(TextArea, {
			label = "",
			numLines = 4,
			text = UseStateResult,
			width = UDim.new(1, 0),
			onChanged = function(Text: string) --[[ Line: 60 ]]
				-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), p1 (copy)
				local Length = string.len(Text)
				UseStateResult2(Text)
				UseStateResult2_1(Length > 1000)
				
				if p1.onDataChange then
					p1.onDataChange((string.sub(Text, 1, 1000)))
				end
			end,
			hint = if p1.errorCode then PinLocked else string.format("%d/%d", string.len(UseStateResult), 1000),
			placeholder = UseLocalizationResult.AboutPlaceholder,
			hasError = UseStateResult1 or p1.errorCode ~= nil,
			textBoxRef = p1.textBoxRef
		})
	})
end