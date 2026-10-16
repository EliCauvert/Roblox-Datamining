local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local _ = require(Parent.Configs.ConfigTypes)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.Components.Common.ActionText)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local ControlActionRowModule = require(Parent.Components.Common.ControlActionRow)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ExtraKeysEnumModule = require(Parent.Enums.ExtraKeysEnum)
local FFlagHelpPageCCLModule = require(Parent.Flags.FFlagHelpPageCCL)
local MemoResult = ReactModule.memo(function(p1) --[[ Line: 69 ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "auto-xy text-title-large text-align-x-center text-align-y-center",
		Text = UseLocalizationFunction({ action = p1.action }).action
	})
end)
local MemoResult1 = ReactModule.memo(function(Frame) --[[ Line: 80 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ExtraKeysEnumModule (copy), ConstantsModule (copy), View (copy), Icon (copy), Enums (copy), FFlagHelpPageCCLModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Config = if Frame.isDisabled then {
		Transparency = 0.5,
		Color3 = UseTokensResult.Color.Content.Default.Color3
	} else nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 90 ]]
		-- upvalues: Frame (copy), ExtraKeysEnumModule (upval), ConstantsModule (upval)
		local GAMEPADICONMAPPLAYSTATIONEntries = {}
		
		for _, button in ipairs(Frame.buttons) do
			if button ~= ExtraKeysEnumModule.TouchPad then
				GAMEPADICONMAPPLAYSTATIONEntries[button] = if Frame.isSpatial then ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_SPATIAL[button] elseif ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[Frame.platform] then if Frame.platform == Enum.Platform.PS5 and ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[button] ~= nil then ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[button] else ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[button] else ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_XBOX[button]
			elseif ConstantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[Frame.platform] then
				if Frame.platform == Enum.Platform.PS5 and ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[button] ~= nil then
					GAMEPADICONMAPPLAYSTATIONEntries[button] = ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[button]
				else
					GAMEPADICONMAPPLAYSTATIONEntries[button] = ConstantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[button]
				end
			end
		end
		return GAMEPADICONMAPPLAYSTATIONEntries
	end, { Frame.buttons, Frame.isSpatial, Frame.platform })
	local v1 = #Frame.buttons + (if Frame.addBlankIcon and Frame.layoutOrderReversed then 1 else 0)
	local NewSize = UseTokensResult.Size.Size_600 * v1 + UseTokensResult.Gap.XSmall * (v1 - 1)
	
	return ReactModule.createElement(View, {
		tag = {
			["row align-x-center align-y-center gap-xsmall auto-xy"] = not FFlagHelpPageCCLModule,
			["row align-x-right align-y-center gap-xsmall auto-y"] = FFlagHelpPageCCLModule and not Frame.layoutOrderReversed,
			["row align-x-left align-y-center gap-xsmall auto-y"] = FFlagHelpPageCCLModule and Frame.layoutOrderReversed
		},
		Size = if FFlagHelpPageCCLModule then UDim2.fromOffset(NewSize, 0) else nil,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId .. "Container"
	}, (ReactModule.useMemo(function() --[[ Line: 132 ]]
		-- upvalues: Frame (copy), ReactModule (upval), View (upval), UseTokensResult (copy), UseMemoResult (copy), ConstantsModule (upval), Icon (upval), Enums (upval), Config (copy)
		local Elements = {}
		
		if Frame.addBlankIcon and Frame.layoutOrderReversed then
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
				Icon = ReactModule.createElement(Icon, {
					name = Name,
					size = Enums.IconSize.Large,
					style = Config,
					testId = Frame.testId
				})
			}))
		end
		return Elements
	end, {
		UseMemoResult, Frame.addBlankIcon, Frame.layoutOrderReversed, Config,
		Frame.testId, UseTokensResult.Size.Size_600
	})))
end)
local MemoResult2 = ReactModule.memo(function(p1) --[[ Line: 189 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ControlActionRowModule (copy), MemoResult1 (copy)
	local UseTokensResult = UseTokensFunction()
	local LayoutOrder: number = if p1.layoutOrderReversed then 1 else 2
	local v2 = #p1.buttons + (if p1.addBlankIcon and p1.layoutOrderReversed then 1 else 0)
	local NewSize = UseTokensResult.Size.Size_600 * v2 + UseTokensResult.Gap.XSmall * (v2 - 1)
	local IsDisabled = true
	
	for _, actionLabel in ipairs(p1.actionLabels) do
		if not actionLabel.disabled then
			IsDisabled = false
			break
		end
	end
	return ReactModule.createElement(ControlActionRowModule, {
		actionLabels = p1.actionLabels,
		layoutOrderReversed = p1.layoutOrderReversed,
		layoutOrder = p1.layoutOrder,
		iconWidth = NewSize,
		testId = "GamepadActionText-" .. p1.testId,
		icon = ReactModule.createElement(MemoResult1, {
			buttons = p1.buttons,
			platform = p1.platform,
			addBlankIcon = p1.addBlankIcon,
			layoutOrderReversed = p1.layoutOrderReversed,
			isSpatial = p1.isSpatial,
			isDisabled = IsDisabled,
			testId = "GamepadActionIcon-" .. p1.testId,
			LayoutOrder = LayoutOrder
		})
	})
end)

return ReactModule.memo((ReactModule.memo(function(p2) --[[ Line: 221 ]]
	-- upvalues: ReactModule (copy), ConstantsModule (copy), FFlagHelpPageCCLModule (copy), MemoResult2 (copy), View (copy), MemoResult (copy), MemoResult1 (copy)
	local UseMemoResult, UseMemoResult2, UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 223 ]]
		-- upvalues: p2 (copy), ConstantsModule (upval), FFlagHelpPageCCLModule (upval), ReactModule (upval), MemoResult2 (upval), View (upval), MemoResult (upval), MemoResult1 (upval)
		local Elements = {}
		local Elements1 = {}
		local Elements2 = {}
		
		for TestId, control in p2.controls do
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
					if FFlagHelpPageCCLModule then
						table.insert(Elements2, ReactModule.createElement(MemoResult2, {
							actionLabels = control.actionLabels or { { label = control.label } },
							buttons = Input,
							platform = p2.platform,
							layoutOrder = GAMEPADLAYOUTORDEREntry,
							layoutOrderReversed = p2.layoutOrderReversed,
							addBlankIcon = p2.addBlankIcon,
							isSpatial = p2.isSpatial,
							testId = TestId,
							key = "ActionRow-" .. TestId
						}))
					else
						table.insert(Elements, ReactModule.createElement(View, {
							tag = "col align-y-center size-0-1000 auto-x",
							LayoutOrder = GAMEPADLAYOUTORDEREntry,
							key = "Text-" .. TestId
						}, {
							ActionText = ReactModule.createElement(MemoResult, {
								action = control.label,
								testId = "GamepadActionText-" .. TestId
							})
						}))
						table.insert(Elements1, ReactModule.createElement(View, {
							tag = "col align-y-center size-0-1000 auto-x",
							LayoutOrder = GAMEPADLAYOUTORDEREntry,
							key = "Icon-" .. TestId
						}, {
							IconContainer = ReactModule.createElement(MemoResult1, {
								buttons = Input,
								platform = p2.platform,
								addBlankIcon = p2.addBlankIcon,
								layoutOrderReversed = p2.layoutOrderReversed,
								isSpatial = p2.isSpatial,
								testId = "GamepadActionIcon-" .. TestId
							})
						}))
					end
				end
			end
		end
		return Elements, Elements1, Elements2
	end, {
		p2.controls,
		p2.platform,
		p2.addBlankIcon,
		p2.layoutOrderReversed,
		p2.isSpatial
	})
	
	return if FFlagHelpPageCCLModule then ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, UseMemoResult3) else ReactModule.createElement(View, { tag = "row gap-small auto-xy" }, {
		TextCol = ReactModule.createElement(View, {
			tag = {
				["col align-x-right auto-xy"] = not p2.layoutOrderReversed,
				["col align-x-left auto-xy"] = p2.layoutOrderReversed
			},
			LayoutOrder = if p2.layoutOrderReversed then 3 else 1
		}, UseMemoResult),
		IconCol = ReactModule.createElement(View, { tag = "col auto-xy", LayoutOrder = 2 }, UseMemoResult2)
	})
end)))