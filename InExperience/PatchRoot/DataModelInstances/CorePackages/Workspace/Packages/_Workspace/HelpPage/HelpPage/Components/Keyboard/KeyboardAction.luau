local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local _ = require(parent.Configs.ConfigTypes)
local extraKeysEnumModule = require(parent.Enums.ExtraKeysEnum)
local localizationModule = require(parent_1.Localization)
local constantsModule = require(parent.Constants)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local KEYCODE_ORDER = constantsModule.HELP_PAGE.KEYCODE_ORDER

local function getKeyCodeName(p0)
	-- upvalues: constantsModule (ref), userInputService (ref)
	return if constantsModule.HELP_PAGE.KEYCODES_LOCALIZED[p0] then {
		needsLocalization = true,
		keyCodeName = constantsModule.HELP_PAGE.KEYCODES_LOCALIZED[p0]
	} elseif constantsModule.HELP_PAGE.KEYCODES_UNLOCALIZED[p0] then {
		needsLocalization = false,
		keyCodeName = constantsModule.HELP_PAGE.KEYCODES_UNLOCALIZED[p0]
	} else {
		needsLocalization = false,
		keyCodeName = userInputService:GetStringForKeyCode(p0)
	}
end

local function _(p1)
	-- upvalues: KEYCODE_ORDER (ref), extraKeysEnumModule (ref)
	return if KEYCODE_ORDER[p1] then KEYCODE_ORDER[p1] elseif p1 == extraKeysEnumModule.DPad or p1 == extraKeysEnumModule.TouchPad then 1e999 else p1.Value
end

local function KeyCodeComponent(p2)
	-- upvalues: useTokens (ref), getKeyCodeName (ref), useLocalization (ref), constantsModule (ref), reactModule (ref), text (ref)
	local var10 = useTokens()
	local var11 = getKeyCodeName(p2.keyCode)
	local t = {}
	
	if var11.needsLocalization then
		t[var11.keyCodeName] = var11.keyCodeName
	end
	local var13 = if var11.needsLocalization then useLocalization(t)[var11.keyCodeName] else var11.keyCodeName
	
	if p2.addSeparator then
		var13 = constantsModule.HELP_PAGE.SEPARATORS.COMBO .. var13
	end
	return reactModule.createElement(text, {
		tag = "auto-xy text-align-x-left text-wrap text-body-small",
		textStyle = var10.Color.Extended.White.White_100,
		Text = var13
	})
end

local function KeyCodeComboComponent(p3)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), constantsModule (ref), KeyCodeComponent (ref)
	local var14 = useTokens()
	
	return reactModule.createElement(view, { tag = "row auto-xy wrap" }, reactModule.useMemo(function()
		-- upvalues: p3 (ref), reactModule (copy), view (copy), text (copy), var14 (ref), constantsModule (copy), KeyCodeComponent (copy)
		local t = {}
		
		if p3.addSeparator then
			table.insert(t, reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = -1e999, key = "separator" }, {
				Separator = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-truncate text-body-small",
					textStyle = var14.Color.Extended.White.White_100,
					Text = constantsModule.HELP_PAGE.SEPARATORS.ALTERNATIVE
				})
			}))
		end
		for i, v in ipairs(p3.combo) do
			table.insert(t, reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = i, key = i }, {
				KeyCodeComponent = reactModule.createElement(KeyCodeComponent, { keyCode = v, addSeparator = i ~= 1 })
			}))
		end
		return t
	end, { p3.combo, p3.addSeparator }))
end

local function InputComponent(p4)
	-- upvalues: reactModule (ref), KEYCODE_ORDER (ref), extraKeysEnumModule (ref), view (ref), KeyCodeComboComponent (ref)
	if p4.input == nil then
		return nil
	end
	reactModule.useMemo(function()
		-- upvalues: p4 (ref), KEYCODE_ORDER (copy), extraKeysEnumModule (copy)
		for i, v in ipairs(p4.input) do
			table.sort(v, function(p5, p6)
				-- upvalues: KEYCODE_ORDER (copy), extraKeysEnumModule (copy)
				return (if KEYCODE_ORDER[p5] then KEYCODE_ORDER[p5] elseif p5 == extraKeysEnumModule.DPad or p5 == extraKeysEnumModule.TouchPad then 1e999 else p5.Value) < (if KEYCODE_ORDER[p6] then KEYCODE_ORDER[p6] elseif p6 == extraKeysEnumModule.DPad or p6 == extraKeysEnumModule.TouchPad then 1e999 else p6.Value)
			end)
		end
		table.sort(p4.input, function(p7, p8)
			-- upvalues: KEYCODE_ORDER (copy), extraKeysEnumModule (copy)
			if #p7 ~= #p8 then
				return #p7 < #p8
			end
			for i = 1, #p7 do
				if p7[i] == p8[i] then
					continue
				end
				local var16 = p7[i]
				local var17 = if KEYCODE_ORDER[var16] then KEYCODE_ORDER[var16] elseif var16 == extraKeysEnumModule.DPad or var16 == extraKeysEnumModule.TouchPad then 1e999 else var16.Value
				local var18 = p8[i]
				var16 = if KEYCODE_ORDER[var18] then KEYCODE_ORDER[var18] elseif var18 == extraKeysEnumModule.DPad or var18 == extraKeysEnumModule.TouchPad then 1e999 else var18.Value
				
				return var17 < var16
			end
			return false
		end)
	end, { p4.input })
	
	return reactModule.createElement(view, { tag = "row auto-xy wrap" }, reactModule.useMemo(function()
		-- upvalues: p4 (ref), reactModule (copy), view (copy), KeyCodeComboComponent (copy)
		local t = {}
		
		for i, v in ipairs(p4.input) do
			table.insert(t, reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = i, key = i }, {
				KeyCodeComboComponent = reactModule.createElement(KeyCodeComboComponent, { combo = v, addSeparator = i ~= 1, layoutOrder = i })
			}))
		end
		return t
	end, { p4.input }))
end

return reactModule.memo(function(p9)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), userInputService (ref), view (ref), text (ref), InputComponent (ref)
	local var20 = useTokens()
	local var21 = useLocalization({ actionText = p9.control.label })
	local keyboardInput = p9.control.keyboardInput
	local var22 = reactModule.useMemo(function()
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
	
	return if keyboardInput == nil or var22 == nil then nil else reactModule.createElement(view, {
		tag = "size-full-1100 row align-y-center align-x-left wrap flex-fill padding-x-small gap-small radius-xsmall",
		ClipsDescendants = true,
		backgroundStyle = var20.Color.Extended.Gray.Gray_800,
		LayoutOrder = keyboardInput.layoutOrder
	}, {
		ActionLabelContainer = reactModule.createElement(view, { tag = "align-y-center align-x-left col", LayoutOrder = 1 }, {
			ActionLabel = reactModule.createElement(text, {
				tag = "auto-xy text-align-x-left text-title-small text-wrap",
				textStyle = var20.Color.Extended.White.White_100,
				Text = var21.actionText
			})
		}),
		InputLabelContainer = reactModule.createElement(view, {
			tag = "align-y-center align-x-left col",
			LayoutOrder = 2,
			testId = "input-label-container"
		}, {
			InputLabel = reactModule.createElement(InputComponent, { input = var22 })
		})
	})
end)