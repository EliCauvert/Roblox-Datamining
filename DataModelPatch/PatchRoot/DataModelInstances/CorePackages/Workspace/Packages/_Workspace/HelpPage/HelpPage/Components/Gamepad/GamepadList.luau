local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local _ = require(Parent.Configs.ConfigTypes)
local ConstantsModule = require(Parent.Constants)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ExtraKeysEnumModule = require(Parent.Enums.ExtraKeysEnum)
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "auto-xy text-align-x-center text-align-y-center text-title-large",
		Text = UseLocalizationFunction({ action = p1.action }).action
	})
end)
local MemoResult1 = ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ExtraKeysEnumModule (copy), ConstantsModule (copy), View (copy), Icon (copy), Enums (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ExtraKeysEnumModule (upval), ConstantsModule (upval)
		local GAMEPADICONMAPPLAYSTATIONEntries = {}
		
		for _, button in ipairs(p1.buttons) do
			if button ~= ExtraKeysEnumModule.TouchPad then
				GAMEPADICONMAPPLAYSTATIONEntries[button] = if p1.isSpatial then ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_SPATIAL[button] elseif ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[p1.platform] then if p1.platform == Enum.Platform.PS5 and ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[button] ~= nil then ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[button] else ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[button] else ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_XBOX[button]
			elseif ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[p1.platform] then
				if p1.platform == Enum.Platform.PS5 and ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[button] ~= nil then
					GAMEPADICONMAPPLAYSTATIONEntries[button] = ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[button]
				else
					GAMEPADICONMAPPLAYSTATIONEntries[button] = ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[button]
				end
			end
		end
		return GAMEPADICONMAPPLAYSTATIONEntries
	end, { p1.buttons })
	
	return ReactModule.createElement(View, {
		tag = "align-x-center align-y-center auto-xy gap-xsmall row"
	}, (ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), View (upval), UseTokensResult (copy), UseMemoResult (copy), ConstantsModule (upval), Icon (upval), Enums (upval)
		local Elements = {}
		
		if p1.addBlankIcon and p1.layoutOrderReversed then
			table.insert(Elements, ReactModule.createElement(View, {
				BackgroundTransparency = 1,
				LayoutOrder = -1,
				key = "BlankIconBefore",
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_600, UseTokensResult.Size.Size_600)
			}))
		end
		for i, Name in UseMemoResult do
			table.insert(Elements, ReactModule.createElement(View, {
				tag = "align-x-center align-y-center auto-xy",
				LayoutOrder = ConstantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[i],
				key = ConstantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[i]
			}, {
				Icon = ReactModule.createElement(Icon, { name = Name, size = Enums.IconSize.Large })
			}))
		end
		return Elements
	end, { UseMemoResult, p1.addBlankIcon, p1.layoutOrderReversed })))
end)

return ReactModule.memo((ReactModule.memo(function(p2)
	-- upvalues: ReactModule (copy), ConstantsModule (copy), View (copy), MemoResult (copy), MemoResult1 (copy)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p2 (copy), ConstantsModule (upval), ReactModule (upval), View (upval), MemoResult (upval), MemoResult1 (upval)
		local Elements = {}
		local Elements1 = {}
		
		for i, control in p2.controls do
			if control.gamepadInput then
				local GamepadInput = control.gamepadInput
				local Input = GamepadInput.input
				
				if Input == nil then
					Input = if p2.isSpatial then GamepadInput.spatialGamepadInput elseif ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[p2.platform] then GamepadInput.playstationInput else GamepadInput.xboxInput
				end
				if Input ~= nil and #Input > 0 then
					local GAMEPADLAYOUTORDEREntry = ConstantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[Input[1]]
					
					if p2.layoutOrderReversed then
						GAMEPADLAYOUTORDEREntry = -GAMEPADLAYOUTORDEREntry
					end
					table.insert(Elements, ReactModule.createElement(View, {
						tag = "align-y-center auto-x col size-0-1000",
						LayoutOrder = GAMEPADLAYOUTORDEREntry,
						key = "Text-" .. i
					}, {
						ActionText = ReactModule.createElement(MemoResult, { action = control.label })
					}))
					table.insert(Elements1, ReactModule.createElement(View, {
						tag = "align-y-center auto-x col size-0-1000",
						LayoutOrder = GAMEPADLAYOUTORDEREntry,
						key = "Icon-" .. i
					}, {
						IconContainer = ReactModule.createElement(MemoResult1, {
							buttons = Input,
							platform = p2.platform,
							addBlankIcon = p2.addBlankIcon,
							layoutOrderReversed = p2.layoutOrderReversed,
							isSpatial = p2.isSpatial
						})
					}))
				end
			end
		end
		return Elements, Elements1
	end, {
		p2.controls,
		p2.platform,
		p2.addBlankIcon,
		p2.layoutOrderReversed
	})
	
	return ReactModule.createElement(View, { tag = "row auto-xy gap-small" }, {
		TextCol = ReactModule.createElement(View, {
			tag = {
				["col auto-xy align-x-right"] = not p2.layoutOrderReversed,
				["col auto-xy align-x-left"] = p2.layoutOrderReversed
			},
			LayoutOrder = if p2.layoutOrderReversed then 3 else 1
		}, UseMemoResult),
		IconCol = ReactModule.createElement(View, { tag = "col auto-xy", LayoutOrder = 2 }, UseMemoResult2)
	})
end)))