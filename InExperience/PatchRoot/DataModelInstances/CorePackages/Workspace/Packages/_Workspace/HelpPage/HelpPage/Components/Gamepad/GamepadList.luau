local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local _ = require(parent.Configs.ConfigTypes)
local constantsModule = require(parent.Constants)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local useTokens = foundationModule.Hooks.useTokens
local extraKeysEnumModule = require(parent.Enums.ExtraKeysEnum)
local var4 = reactModule.memo(function(p0) --[[ line: 45 ]]
	-- upvalues: useLocalization (ref), reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		tag = "auto-xy text-align-x-center text-align-y-center text-title-large",
		Text = useLocalization({ action = p0.action }).action
	})
end)
local var5 = reactModule.memo(function(p1) --[[ line: 56 ]]
	-- upvalues: useTokens (ref), reactModule (ref), extraKeysEnumModule (ref), constantsModule (ref), view (ref), icon (ref), enums (ref)
	local var6 = useTokens()
	local var7 = reactModule.useMemo(function() --[[ line: 60 ]]
		-- upvalues: p1 (ref), extraKeysEnumModule (copy), constantsModule (copy)
		local t = {}
		
		for i, v in ipairs(p1.buttons) do
			if v == extraKeysEnumModule.TouchPad then
				if constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[p1.platform] then
					if p1.platform == Enum.Platform.PS5 and constantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[v] ~= nil then
						t[v] = constantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[v]
					else
						t[v] = constantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[v]
					end
				end
			end
			local _ = nil
			t[v] = if p1.isSpatial then constantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_SPATIAL[v] elseif not constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[p1.platform] then if p1.platform == Enum.Platform.PS5 and constantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[v] ~= nil then constantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[v] else constantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[v] else constantsModule.HELP_PAGE.GAMEPAD_ICON_MAP_XBOX[v]
		end
		return t
	end, { p1.buttons })
	
	return reactModule.createElement(view, {
		tag = "align-x-center align-y-center auto-xy gap-xsmall row"
	}, reactModule.useMemo(function() --[[ line: 102 ]]
		-- upvalues: p1 (ref), reactModule (copy), view (copy), var6 (ref), var7 (ref), constantsModule (copy), icon (copy), enums (copy)
		local t = {}
		
		if p1.addBlankIcon and p1.layoutOrderReversed then
			table.insert(t, reactModule.createElement(view, {
				BackgroundTransparency = 1,
				LayoutOrder = -1,
				key = "BlankIconBefore",
				Size = UDim2.fromOffset(var6.Size.Size_600, var6.Size.Size_600)
			}))
		end
		for i, v in var7 do
			table.insert(t, reactModule.createElement(view, {
				tag = "align-x-center align-y-center auto-xy",
				LayoutOrder = constantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[i],
				key = constantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[i]
			}, {
				Icon = reactModule.createElement(icon, { name = v, size = enums.IconSize.Large })
			}))
		end
		return t
	end, { var7, p1.addBlankIcon, p1.layoutOrderReversed }))
end)

return reactModule.memo(reactModule.memo(function(p2) --[[ line: 141 ]]
	-- upvalues: reactModule (ref), constantsModule (ref), view (ref), var4 (ref), var5 (ref)
	local var10, var11 = reactModule.useMemo(function() --[[ line: 142 ]]
		-- upvalues: p2 (ref), constantsModule (copy), reactModule (copy), view (copy), var4 (copy), var5 (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in p2.controls do
			if v.gamepadInput then
				local gamepadInput = v.gamepadInput
				local input = gamepadInput.input
				
				if input == nil then
					input = if p2.isSpatial then gamepadInput.spatialGamepadInput elseif constantsModule.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[p2.platform] then gamepadInput.playstationInput else gamepadInput.xboxInput
				end
				if input ~= nil and #input > 0 then
					local var14 = constantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[input[1]]
					
					if p2.layoutOrderReversed then
						var14 = -var14
					end
					table.insert(t, reactModule.createElement(view, {
						tag = "align-y-center auto-x col size-0-1000",
						LayoutOrder = var14,
						key = "Text-" .. i
					}, {
						ActionText = reactModule.createElement(var4, { action = v.label })
					}))
					table.insert(t_1, reactModule.createElement(view, {
						tag = "align-y-center auto-x col size-0-1000",
						LayoutOrder = var14,
						key = "Icon-" .. i
					}, {
						IconContainer = reactModule.createElement(var5, {
							buttons = input,
							platform = p2.platform,
							addBlankIcon = p2.addBlankIcon,
							layoutOrderReversed = p2.layoutOrderReversed,
							isSpatial = p2.isSpatial
						})
					}))
				end
			end
		end
		return t, t_1
	end, {
		p2.controls,
		p2.platform,
		p2.addBlankIcon,
		p2.layoutOrderReversed
	})
	
	return reactModule.createElement(view, { tag = "row auto-xy gap-small" }, {
		TextCol = reactModule.createElement(view, {
			tag = {
				["col auto-xy align-x-right"] = not p2.layoutOrderReversed,
				["col auto-xy align-x-left"] = p2.layoutOrderReversed
			},
			LayoutOrder = if p2.layoutOrderReversed then 3 else 1
		}, var10),
		IconCol = reactModule.createElement(view, { tag = "col auto-xy", LayoutOrder = 2 }, var11)
	})
end))