local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local _ = require(Parent.Configs.ConfigTypes)
local ExtraKeysEnumModule = require(Parent.Enums.ExtraKeysEnum)
local ConstantsModule = require(Parent.Constants)
local FFlagHelpPageCCLModule = require(Parent.Flags.FFlagHelpPageCCL)
local UseLocalizedLabelsModule = require(Parent.Hooks.useLocalizedLabels)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local KEYCODEORDER = ConstantsModule.HELP_PAGE.KEYCODE_ORDER

local function getKeyCodeName(KeyCode)
	-- upvalues: ConstantsModule (copy), UserInputService (copy)
	return if ConstantsModule.HELP_PAGE.KEYCODES_LOCALIZED[KeyCode] then {
		needsLocalization = true,
		keyCodeName = ConstantsModule.HELP_PAGE.KEYCODES_LOCALIZED[KeyCode]
	} elseif ConstantsModule.HELP_PAGE.KEYCODES_UNLOCALIZED[KeyCode] then {
		needsLocalization = false,
		keyCodeName = ConstantsModule.HELP_PAGE.KEYCODES_UNLOCALIZED[KeyCode]
	} else {
		needsLocalization = false,
		keyCodeName = UserInputService:GetStringForKeyCode(KeyCode)
	}
end

local function _(DPad)
	-- upvalues: KEYCODEORDER (copy), ExtraKeysEnumModule (copy)
	return if KEYCODEORDER[DPad] then KEYCODEORDER[DPad] elseif DPad == ExtraKeysEnumModule.DPad or DPad == ExtraKeysEnumModule.TouchPad then 1e999 else DPad.Value
end

local function getDisplayableKeyCodes(Combo)
	-- upvalues: getKeyCodeName (copy)
	local KeyCodes = {}
	
	for i = 1, #Combo do
		local ComboEntry = Combo[i]
		
		if ComboEntry ~= Enum.KeyCode.None and getKeyCodeName(ComboEntry).keyCodeName ~= "" then
			table.insert(KeyCodes, ComboEntry)
		end
	end
	return KeyCodes
end

local function KeyCodeComponent(p1)
	-- upvalues: UseTokensFunction (copy), getKeyCodeName (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), Text (copy), FFlagHelpPageCCLModule (copy)
	local UseTokensResult = UseTokensFunction()
	local KeyCodeName = getKeyCodeName(p1.keyCode)
	local KeyCodeNames = {}
	
	if KeyCodeName.needsLocalization then
		KeyCodeNames[KeyCodeName.keyCodeName] = KeyCodeName.keyCodeName
	end
	local UseLocalizationResult = UseLocalizationFunction(KeyCodeNames)
	local UseLocalizationResultEntry = KeyCodeName.needsLocalization and UseLocalizationResult[KeyCodeName.keyCodeName] or KeyCodeName.keyCodeName
	
	if p1.addSeparator then
		UseLocalizationResultEntry = ConstantsModule.HELP_PAGE.SEPARATORS.COMBO .. UseLocalizationResultEntry
	end
	return ReactModule.createElement(Text, {
		tag = "auto-xy text-body-small text-wrap text-align-x-left",
		textStyle = if FFlagHelpPageCCLModule and p1.disabled then UseTokensResult.Color.Extended.White.White_50 else UseTokensResult.Color.Extended.White.White_100,
		Text = UseLocalizationResultEntry
	})
end

local function KeyCodeComboComponent(p1)
	-- upvalues: UseTokensFunction (copy), getDisplayableKeyCodes (copy), ReactModule (copy), View (copy), Text (copy), FFlagHelpPageCCLModule (copy), ConstantsModule (copy), KeyCodeComponent (copy)
	local UseTokensResult = UseTokensFunction()
	local DisplayableKeyCodes = getDisplayableKeyCodes(p1.combo)
	
	return ReactModule.createElement(View, { tag = "row wrap auto-xy" }, (ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), View (upval), Text (upval), FFlagHelpPageCCLModule (upval), UseTokensResult (copy), ConstantsModule (upval), DisplayableKeyCodes (copy), KeyCodeComponent (upval)
		local Elements = {}
		
		if p1.addSeparator then
			table.insert(Elements, ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = -1e999, key = "separator" }, {
				Separator = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-small text-align-x-left text-truncate-end",
					textStyle = if FFlagHelpPageCCLModule and p1.disabled then UseTokensResult.Color.Extended.White.White_50 else UseTokensResult.Color.Extended.White.White_100,
					Text = ConstantsModule.HELP_PAGE.SEPARATORS.ALTERNATIVE
				})
			}))
		end
		for Key, displayableKeyCode in ipairs(DisplayableKeyCodes) do
			table.insert(Elements, ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = Key, key = Key }, {
				KeyCodeComponent = ReactModule.createElement(KeyCodeComponent, {
					keyCode = displayableKeyCode,
					addSeparator = Key ~= 1,
					disabled = p1.disabled
				})
			}))
		end
		return Elements
	end, {
		DisplayableKeyCodes,
		p1.addSeparator,
		p1.disabled,
		UseTokensResult.Color.Extended.White.White_50,
		UseTokensResult.Color.Extended.White.White_100
	})))
end

local function InputComponent(p2)
	-- upvalues: ReactModule (copy), KEYCODEORDER (copy), ExtraKeysEnumModule (copy), getDisplayableKeyCodes (copy), View (copy), KeyCodeComboComponent (copy)
	return ReactModule.createElement(View, { tag = "row wrap auto-xy" }, (ReactModule.useMemo(function()
		-- upvalues: p2 (copy), KEYCODEORDER (upval), ExtraKeysEnumModule (upval), getDisplayableKeyCodes (upval), ReactModule (upval), View (upval), KeyCodeComboComponent (upval)
		for _, value in ipairs(p2.input) do
			table.sort(value, function(A, B): boolean
				-- upvalues: KEYCODEORDER (upval), ExtraKeysEnumModule (upval)
				return (if KEYCODEORDER[A] then KEYCODEORDER[A] elseif A == ExtraKeysEnumModule.DPad or A == ExtraKeysEnumModule.TouchPad then 1e999 else A.Value) < (if KEYCODEORDER[B] then KEYCODEORDER[B] elseif B == ExtraKeysEnumModule.DPad or B == ExtraKeysEnumModule.TouchPad then 1e999 else B.Value)
			end)
		end
		table.sort(p2.input, function(A, B): boolean
			-- upvalues: KEYCODEORDER (upval), ExtraKeysEnumModule (upval)
			if #A ~= #B then
				return #A < #B
			end
			for i = 1, #A do
				if A[i] ~= B[i] then
					local Entry = A[i]
					local Entry1 = B[i]
					
					return (if KEYCODEORDER[Entry] then KEYCODEORDER[Entry] elseif Entry == ExtraKeysEnumModule.DPad or Entry == ExtraKeysEnumModule.TouchPad then 1e999 else Entry.Value) < (if KEYCODEORDER[Entry1] then KEYCODEORDER[Entry1] elseif Entry1 == ExtraKeysEnumModule.DPad or Entry1 == ExtraKeysEnumModule.TouchPad then 1e999 else Entry1.Value)
				end
			end
			return false
		end)
		local Elements = {}
		
		for LayoutOrder, Combo in ipairs(p2.input) do
			if #getDisplayableKeyCodes(Combo) ~= 0 then
				table.insert(Elements, ReactModule.createElement(View, {
					tag = "auto-xy",
					LayoutOrder = LayoutOrder,
					key = LayoutOrder
				}, {
					KeyCodeComboComponent = ReactModule.createElement(KeyCodeComboComponent, {
						combo = Combo,
						addSeparator = #Elements ~= 0,
						layoutOrder = LayoutOrder,
						disabled = p2.disabled
					})
				}))
			end
		end
		return Elements
	end, { p2.input, p2.disabled })))
end

return ReactModule.memo(function(p3)
	-- upvalues: UseTokensFunction (copy), UseLocalizedLabelsModule (copy), ReactModule (copy), UserInputService (copy), FFlagHelpPageCCLModule (copy), View (copy), Text (copy), InputComponent (copy)
	local UseTokensResult = UseTokensFunction()
	local Control = p3.control
	local UseLocalizedLabelsModuleResult = UseLocalizedLabelsModule({ actionText = Control.label })
	local KeyboardInput = Control.keyboardInput
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: KeyboardInput (copy), UserInputService (upval)
		if KeyboardInput == nil then
			return nil
		end
		local Input = KeyboardInput.input
		
		if Input == nil then
			if UserInputService:GetPlatform() == Enum.Platform.OSX then
				return KeyboardInput.macInput
			end
			Input = KeyboardInput.winInput
		end
		return Input
	end, { KeyboardInput })
	
	if KeyboardInput == nil or UseMemoResult == nil then
		return nil
	else
		local Disabled = Control.disabled
		
		return ReactModule.createElement(View, {
			tag = {
				["row wrap flex-x-fill align-x-left align-y-center gap-small size-full-0 auto-y padding-small radius-xsmall clip"] = FFlagHelpPageCCLModule,
				["row wrap flex-fill align-x-left align-y-center gap-small size-full-1100 padding-x-small radius-xsmall clip"] = not FFlagHelpPageCCLModule
			},
			backgroundStyle = if FFlagHelpPageCCLModule and Disabled then UseTokensResult.Color.Extended.Gray.Gray_1000 else UseTokensResult.Color.Extended.Gray.Gray_800,
			LayoutOrder = KeyboardInput.layoutOrder
		}, {
			ActionLabelContainer = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = {
					["col align-x-left align-y-center auto-y"] = FFlagHelpPageCCLModule,
					["col align-x-left align-y-center"] = not FFlagHelpPageCCLModule
				}
			}, {
				ActionLabel = ReactModule.createElement(Text, {
					tag = "auto-xy text-title-small text-wrap text-align-x-left",
					textStyle = if FFlagHelpPageCCLModule and Disabled then UseTokensResult.Color.Extended.White.White_50 else UseTokensResult.Color.Extended.White.White_100,
					Text = UseLocalizedLabelsModuleResult.actionText
				})
			}),
			InputLabelContainer = ReactModule.createElement(View, {
				LayoutOrder = 2,
				testId = "input-label-container",
				tag = {
					["col align-x-left align-y-center auto-y"] = FFlagHelpPageCCLModule,
					["col align-x-left align-y-center"] = not FFlagHelpPageCCLModule
				}
			}, {
				InputLabel = ReactModule.createElement(InputComponent, { input = UseMemoResult, disabled = Disabled })
			})
		})
	end
end)