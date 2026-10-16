local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput
local IconName = FoundationModule.Enums.IconName
local TextKeysModule = require(EditProfile.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(EditProfile.Common.Constants)
local UseDisplayNameTextModule = require(EditProfile.Hooks.useDisplayNameText)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local AnalyticsServiceV2Module = require(EditProfile.Analytics.AnalyticsServiceV2)
local MaxDisplayNameCharacters = game:DefineFastInt("MaxDisplayNameCharacters", 20)
local MinDisplayNameCharacters = game:DefineFastInt("MinDisplayNameCharacters", 3)
local DisplayNameValidationNetworkDelay = game:DefineFastInt("DisplayNameValidationNetworkDelay", 500)

return function(p1) --[[ Line: 33 ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), UseDisplayNameTextModule (copy), ReactModule (copy), SetTimeoutFunction (copy), DisplayNameValidationNetworkDelay (copy), ConstantsModule (copy), ClearTimeoutFunction (copy), MinDisplayNameCharacters (copy), AnalyticsServiceV2Module (copy), MaxDisplayNameCharacters (copy), View (copy), Text (copy), TextInput (copy), IconName (copy)
	local UseLocalizationResult = UseLocalizationFunction({ DisplayNameCaption = TextKeysModule.DisplayNameCaption })
	local UseDisplayNameTextModuleResult = UseDisplayNameTextModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialDisplayName)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UseDisplayNameTextModuleResult.displayNameChangeError)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(SetTimeoutFunction(function() --[[ Line: 42 ]] end, DisplayNameValidationNetworkDelay))
	ReactModule.useEffect(function() --[[ Line: 44 ]]
		-- upvalues: p1 (copy), UseStateResult1 (copy), UseStateResult4 (copy)
		if p1.updateErrorState then
			p1.updateErrorState(UseStateResult1 or UseStateResult4)
		end
	end, { UseStateResult1, UseStateResult4 })
	ReactModule.useEffect(function() --[[ Line: 50 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p1.initialDisplayName)
	end, { p1.initialDisplayName })
	
	local function getErrorMessage(Code) --[[ Line: 54 ]]
		-- upvalues: ConstantsModule (upval), UseDisplayNameTextModuleResult (copy)
		return ({
			[ConstantsModule.DisplayNameValidationErrorCodes.TooShort] = UseDisplayNameTextModuleResult.nameTooShortError,
			[ConstantsModule.DisplayNameValidationErrorCodes.TooLong] = UseDisplayNameTextModuleResult.nameTooLongError,
			[ConstantsModule.DisplayNameValidationErrorCodes.InvalidCharacters] = UseDisplayNameTextModuleResult.nameUnsupportedCharsError,
			[ConstantsModule.DisplayNameValidationErrorCodes.Moderated] = UseDisplayNameTextModuleResult.nameInappropriateError,
			[ConstantsModule.DisplayNameValidationErrorCodes.Throttled] = UseDisplayNameTextModuleResult.nameHasChangedError,
			[ConstantsModule.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination] = UseDisplayNameTextModuleResult.displayNameChangeMixedCharactersError,
			[ConstantsModule.DisplayNameValidationErrorCodes.NameNotAvailable] = UseDisplayNameTextModuleResult.nameNotAvailableError
		})[Code] or UseDisplayNameTextModuleResult.displayNameChangeError
	end
	
	local function textChanged(p2) --[[ Line: 67 ]]
		-- upvalues: ClearTimeoutFunction (upval), UseRefResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy), MinDisplayNameCharacters (upval), AnalyticsServiceV2Module (upval), UseStateResult2_2 (copy), UseDisplayNameTextModuleResult (copy), MaxDisplayNameCharacters (upval), SetTimeoutFunction (upval), p1 (copy), getErrorMessage (copy), DisplayNameValidationNetworkDelay (upval)
		ClearTimeoutFunction(UseRefResult.current)
		local Text = p2 or ""
		local Length: number = utf8.len(Text) or 0
		UseStateResult2(Text)
		UseStateResult2_1(false)
		UseStateResult2_3(false)
		
		if Length < MinDisplayNameCharacters then
			AnalyticsServiceV2Module.sendDisplayNameTooShort(Text)
			UseStateResult2_2(UseDisplayNameTextModuleResult.nameTooShortError)
			UseStateResult2_1(true)
			
			return
		end
		if MaxDisplayNameCharacters < Length then
			UseStateResult2_2(UseDisplayNameTextModuleResult.nameTooLongError)
			UseStateResult2_1(true)
			
			return
		else
			UseStateResult2_3(true)
			UseRefResult.current = SetTimeoutFunction(function() --[[ Line: 88 ]]
				-- upvalues: p1 (upval), Text (ref), UseStateResult2_1 (upval), UseStateResult2_3 (upval), AnalyticsServiceV2Module (upval), UseStateResult2_2 (upval), getErrorMessage (upval)
				p1.validateDisplayName(Text):andThen(function(_) --[[ Line: 91 ]]
					-- upvalues: UseStateResult2_1 (upval), UseStateResult2_3 (upval), p1 (upval), Text (upval)
					UseStateResult2_1(false)
					UseStateResult2_3(false)
					p1.onDataChange(Text)
				end):catch(function(Err) --[[ Line: 96 ]]
					-- upvalues: AnalyticsServiceV2Module (upval), Text (upval), UseStateResult2_2 (upval), getErrorMessage (upval), UseStateResult2_1 (upval), UseStateResult2_3 (upval)
					local Code = Err and Err.errors and Err.errors[1] and Err.errors[1].code or -1
					AnalyticsServiceV2Module.sendFilteredDisplayName(Text)
					UseStateResult2_2((getErrorMessage(Code)))
					UseStateResult2_1(true)
					UseStateResult2_3(false)
				end)
			end, DisplayNameValidationNetworkDelay)
		end
	end
	
	return ReactModule.createElement(View, {
		tag = "auto-y col gap-medium bg-transparent",
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Caption = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left",
			Text = UseLocalizationResult.DisplayNameCaption
		}),
		DisplayNameInput = ReactModule.createElement(TextInput, {
			LayoutOrder = 2,
			label = "",
			tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left",
			text = UseStateResult,
			width = UDim.new(1, 0),
			placeholder = p1.initialDisplayName,
			hint = if UseStateResult1 then UseStateResult3 else string.format("%d/%d", utf8.len(UseStateResult or "") or 0, MaxDisplayNameCharacters),
			onChanged = function(p2) --[[ Line: 131 ]]
				-- upvalues: textChanged (copy)
				textChanged(p2)
			end,
			hasError = UseStateResult1,
			iconTrailing = if UseStateResult and #UseStateResult > 0 then {
				name = IconName.CircleX,
				onActivated = function() --[[ Line: 138 ]]
					-- upvalues: textChanged (copy)
					textChanged("")
				end
			} else nil,
			textBoxRef = p1.textBoxRef
		})
	})
end