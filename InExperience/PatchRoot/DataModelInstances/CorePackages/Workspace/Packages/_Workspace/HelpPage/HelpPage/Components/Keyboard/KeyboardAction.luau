local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local _ = require(parent.Configs.ConfigTypes)
local extraKeysEnumModule = require(parent.Enums.ExtraKeysEnum)
local localizationModule = require(parent_1.Localization)
local constantsModule = require(parent.Constants)
local fFlagHelpPageCCLModule = require(parent.Flags.FFlagHelpPageCCL)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local KEYCODE_ORDER = constantsModule.HELP_PAGE.KEYCODE_ORDER

local function getKeyCodeName(p1)
	-- upvalues: constantsModule (ref), userInputService (ref)
	return if constantsModule.HELP_PAGE.KEYCODES_LOCALIZED[p1] then {
		needsLocalization = true,
		keyCodeName = constantsModule.HELP_PAGE.KEYCODES_LOCALIZED[p1]
	} elseif constantsModule.HELP_PAGE.KEYCODES_UNLOCALIZED[p1] then {
		needsLocalization = false,
		keyCodeName = constantsModule.HELP_PAGE.KEYCODES_UNLOCALIZED[p1]
	} else {
		needsLocalization = false,
		keyCodeName = userInputService:GetStringForKeyCode(p1)
	}
end

local function _(p1)
	-- upvalues: KEYCODE_ORDER (ref), extraKeysEnumModule (ref)
	return if KEYCODE_ORDER[p1] then KEYCODE_ORDER[p1] elseif p1 == extraKeysEnumModule.DPad or p1 == extraKeysEnumModule.TouchPad then 1e999 else p1.Value
end

local function KeyCodeComponent(p1)
	-- upvalues: useTokens (ref), getKeyCodeName (ref), useLocalization (ref), constantsModule (ref), reactModule (ref), text (ref), fFlagHelpPageCCLModule (ref)
	local var1 = useTokens()
	local var2 = getKeyCodeName(p1.keyCode)
	local t = {}
	
	if var2.needsLocalization then
		t[var2.keyCodeName] = var2.keyCodeName
	end
	local var3 = if var2.needsLocalization then useLocalization(t)[var2.keyCodeName] else var2.keyCodeName
	
	if p1.addSeparator then
		var3 = constantsModule.HELP_PAGE.SEPARATORS.COMBO .. var14
	end
	return reactModule.createElement(text, {
		tag = "auto-xy text-align-x-left text-wrap text-body-small",
		textStyle = if fFlagHelpPageCCLModule and p1.disabled then var1.Color.Extended.White.White_50 else var1.Color.Extended.White.White_100,
		Text = var3
	})
end

local function KeyCodeComboComponent(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), fFlagHelpPageCCLModule (ref), constantsModule (ref), KeyCodeComponent (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, { tag = "row auto-xy wrap" }, reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), view (copy), text (copy), fFlagHelpPageCCLModule (copy), var1 (ref), constantsModule (copy), KeyCodeComponent (copy)
		local t = {}
		
		if p1.addSeparator then
			table.insert(t, reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = -1e999, key = "separator" }, {
				Separator = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-truncate text-body-small",
					textStyle = if fFlagHelpPageCCLModule and p1.disabled then var1.Color.Extended.White.White_50 else var1.Color.Extended.White.White_100,
					Text = constantsModule.HELP_PAGE.SEPARATORS.ALTERNATIVE
				})
			}))
		end
		for i, v in ipairs(p1.combo) do
			table.insert(t, reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = i, key = i }, {
				KeyCodeComponent = reactModule.createElement(KeyCodeComponent, {
					keyCode = v,
					addSeparator = i ~= 1,
					disabled = p1.disabled
				})
			}))
		end
		return t
	end, {
		p1.combo,
		p1.addSeparator,
		p1.disabled,
		var1.Color.Extended.White.White_50,
		var1.Color.Extended.White.White_100
	}))
end

local function InputComponent(p2)
	-- upvalues: reactModule (ref), KEYCODE_ORDER (ref), extraKeysEnumModule (ref), view (ref), KeyCodeComboComponent (ref)
	return reactModule.createElement(view, { tag = "row auto-xy wrap" }, reactModule.useMemo(function()
		-- upvalues: p2 (ref), KEYCODE_ORDER (copy), extraKeysEnumModule (copy), reactModule (copy), view (copy), KeyCodeComboComponent (copy)
		for i, v in ipairs(p2.input) do
			table.sort(v, function(p3, p4)
				-- upvalues: KEYCODE_ORDER (copy), extraKeysEnumModule (copy)
				return (if KEYCODE_ORDER[p3] then KEYCODE_ORDER[p3] elseif p3 == extraKeysEnumModule.DPad or p3 == extraKeysEnumModule.TouchPad then 1e999 else p3.Value) < (if KEYCODE_ORDER[p4] then KEYCODE_ORDER[p4] elseif p4 == extraKeysEnumModule.DPad or p4 == extraKeysEnumModule.TouchPad then 1e999 else p4.Value)
			end)
		end
		table.sort(p2.input, function(p3, p4)
			-- upvalues: KEYCODE_ORDER (copy), extraKeysEnumModule (copy)
			if #p3 ~= #p4 then
				return #p3 < #p4
			end
			for i = 1, #p3 do
				if p3[i] == p4[i] then
					continue
				end
				local var2 = p3[i]
				local var3 = if KEYCODE_ORDER[var2] then KEYCODE_ORDER[var2] elseif var2 == extraKeysEnumModule.DPad or var2 == extraKeysEnumModule.TouchPad then 1e999 else var2.Value
				local var4 = p4[i]
				var2 = if KEYCODE_ORDER[var4] then KEYCODE_ORDER[var4] elseif var4 == extraKeysEnumModule.DPad or var4 == extraKeysEnumModule.TouchPad then 1e999 else var4.Value
				
				return var3 < var2
			end
			return false
		end)
		local t = {}
		
		for i_1, v_1 in ipairs(p2.input) do
			table.insert(t, reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = i_1, key = i_1 }, {
				KeyCodeComboComponent = reactModule.createElement(KeyCodeComboComponent, {
					combo = v_1,
					addSeparator = i_1 ~= 1,
					layoutOrder = i_1,
					disabled = p2.disabled
				})
			}))
		end
		return t
	end, { p2.input, p2.disabled }))
end

return reactModule.memo(function(p3)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), userInputService (ref), fFlagHelpPageCCLModule (ref), view (ref), text (ref), InputComponent (ref)
	local var2 = useTokens()
	local var3 = useLocalization({ actionText = p3.control.label })
	local control = p3.control
	local keyboardInput = control.keyboardInput
	local var4 = reactModule.useMemo(function()
		-- upvalues: keyboardInput (ref), userInputService (copy)
		if keyboardInput == nil then
			return nil
		end
		local input = keyboardInput.input
		
		if input == nil then
			if userInputService:GetPlatform() == Enum.Platform.OSX then
				return keyboardInput.macInput
			end
			input = keyboardInput.winInput
		end
		return input
	end, { keyboardInput })
	
	if keyboardInput == nil or var4 == nil then
		return nil
	end
	local disabled = control.disabled
	
	return reactModule.createElement(view, {
		ClipsDescendants = true,
		tag = {
			["row wrap flex-x-fill align-x-left align-y-center gap-small size-full-0 auto-y padding-small radius-xsmall"] = fFlagHelpPageCCLModule,
			["row wrap flex-fill align-x-left align-y-center gap-small size-full-1100 padding-x-small radius-xsmall"] = not fFlagHelpPageCCLModule
		},
		backgroundStyle = if fFlagHelpPageCCLModule and disabled then var2.Color.Extended.Gray.Gray_1000 else var2.Color.Extended.Gray.Gray_800,
		LayoutOrder = keyboardInput.layoutOrder
	}, {
		ActionLabelContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["col align-x-left align-y-center auto-y"] = fFlagHelpPageCCLModule,
				["col align-x-left align-y-center"] = not fFlagHelpPageCCLModule
			}
		}, {
			ActionLabel = reactModule.createElement(text, {
				tag = "auto-xy text-align-x-left text-title-small text-wrap",
				textStyle = if fFlagHelpPageCCLModule and disabled then var2.Color.Extended.White.White_50 else var2.Color.Extended.White.White_100,
				Text = var3.actionText
			})
		}),
		InputLabelContainer = reactModule.createElement(view, {
			LayoutOrder = 2,
			testId = "input-label-container",
			tag = {
				["col align-x-left align-y-center auto-y"] = fFlagHelpPageCCLModule,
				["col align-x-left align-y-center"] = not fFlagHelpPageCCLModule
			}
		}, {
			InputLabel = reactModule.createElement(InputComponent, { input = var4, disabled = disabled })
		})
	})
end)