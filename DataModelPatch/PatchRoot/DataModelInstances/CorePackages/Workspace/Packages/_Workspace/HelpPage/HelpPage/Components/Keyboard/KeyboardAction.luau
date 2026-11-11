local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local _ = require(Parent.Configs.ConfigTypes)
local ExtraKeysEnumModule = require(Parent.Enums.ExtraKeysEnum)
local ConstantsModule = require(Parent.Constants)
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

local function KeyCodeComponent(p1)
	-- upvalues: UseTokensFunction (copy), getKeyCodeName (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), Text (copy)
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
		tag = "auto-xy text-align-x-left text-wrap text-body-small",
		textStyle = UseTokensResult.Color.Extended.White.White_100,
		Text = UseLocalizationResultEntry
	})
end

local function KeyCodeComboComponent(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy), ConstantsModule (copy), KeyCodeComponent (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, { tag = "row auto-xy wrap" }, (ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), View (upval), Text (upval), UseTokensResult (copy), ConstantsModule (upval), KeyCodeComponent (upval)
		local Elements = {}
		
		if p1.addSeparator then
			table.insert(Elements, ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = -1e999, key = "separator" }, {
				Separator = ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left text-truncate text-body-small",
					textStyle = UseTokensResult.Color.Extended.White.White_100,
					Text = ConstantsModule.HELP_PAGE.SEPARATORS.ALTERNATIVE
				})
			}))
		end
		for Key, KeyCode in ipairs(p1.combo) do
			table.insert(Elements, ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = Key, key = Key }, {
				KeyCodeComponent = ReactModule.createElement(KeyCodeComponent, { keyCode = KeyCode, addSeparator = Key ~= 1 })
			}))
		end
		return Elements
	end, { p1.combo, p1.addSeparator })))
end

local function InputComponent(p2)
	-- upvalues: ReactModule (copy), KEYCODEORDER (copy), ExtraKeysEnumModule (copy), View (copy), KeyCodeComboComponent (copy)
	if p2.input == nil then
		return nil
	else
		ReactModule.useMemo(function()
			-- upvalues: p2 (copy), KEYCODEORDER (upval), ExtraKeysEnumModule (upval)
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
		end, { p2.input })
		
		return ReactModule.createElement(View, { tag = "row auto-xy wrap" }, (ReactModule.useMemo(function()
			-- upvalues: p2 (copy), ReactModule (upval), View (upval), KeyCodeComboComponent (upval)
			local Elements = {}
			
			for LayoutOrder, Combo in ipairs(p2.input) do
				table.insert(Elements, ReactModule.createElement(View, {
					tag = "auto-xy",
					LayoutOrder = LayoutOrder,
					key = LayoutOrder
				}, {
					KeyCodeComboComponent = ReactModule.createElement(KeyCodeComboComponent, {
						combo = Combo,
						addSeparator = LayoutOrder ~= 1,
						layoutOrder = LayoutOrder
					})
				}))
			end
			return Elements
		end, { p2.input })))
	end
end

return ReactModule.memo(function(p3)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), UserInputService (copy), View (copy), Text (copy), InputComponent (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({ actionText = p3.control.label })
	local KeyboardInput = p3.control.keyboardInput
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
	
	return if KeyboardInput == nil or UseMemoResult == nil then nil else ReactModule.createElement(View, {
		tag = "size-full-1100 row align-y-center align-x-left wrap flex-fill padding-x-small gap-small radius-xsmall",
		ClipsDescendants = true,
		backgroundStyle = UseTokensResult.Color.Extended.Gray.Gray_800,
		LayoutOrder = KeyboardInput.layoutOrder
	}, {
		ActionLabelContainer = ReactModule.createElement(View, { tag = "align-y-center align-x-left col", LayoutOrder = 1 }, {
			ActionLabel = ReactModule.createElement(Text, {
				tag = "auto-xy text-align-x-left text-title-small text-wrap",
				textStyle = UseTokensResult.Color.Extended.White.White_100,
				Text = UseLocalizationResult.actionText
			})
		}),
		InputLabelContainer = ReactModule.createElement(View, {
			tag = "align-y-center align-x-left col",
			LayoutOrder = 2,
			testId = "input-label-container"
		}, {
			InputLabel = ReactModule.createElement(InputComponent, { input = UseMemoResult })
		})
	})
end)