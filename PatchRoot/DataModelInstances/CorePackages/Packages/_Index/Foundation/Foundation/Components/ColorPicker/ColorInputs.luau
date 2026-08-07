-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:01 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local _ = require(foundation.Components.Types)
local dropdownModule = require(foundation.Components.Dropdown)
local numberInputModule = require(foundation.Components.NumberInput)
local textInputModule = require(foundation.Components.TextInput)
local viewModule = require(foundation.Components.View)
local colorInputModeModule = require(foundation.Enums.ColorInputMode)
local inputSizeModule = require(foundation.Enums.InputSize)
local numberInputControlsVariantModule = require(foundation.Enums.NumberInputControlsVariant)
local colorInputUtilsModule = require(foundation.Components.ColorPicker.colorInputUtils)
local colorUtilsModule = require(foundation.Components.ColorPicker.colorUtils)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Providers.Style.Tokens)
local useTokensModule = require(foundation.Providers.Style.useTokens)

local function createNumberInputElement(p0, p1, p2) --[[ line: 38 ]]
	-- upvalues: reactModule (ref), numberInputModule (ref), dashModule (ref)
	local value = p0.value:getValue()
	
	return if value == nil then reactModule.createElement(numberInputModule, dashModule.join({
		value = -1,
		onChanged = function(p4) --[[ line: 51 ]]
			-- upvalues: p0 (ref)
			if p4 ~= -1 then
				p0.handler(p4, p0.component)
			end
		end,
		controlsVariant = p1,
		minimum = p0.minimum or 0,
		maximum = p0.maximum or 255,
		step = p0.step or 1,
		precision = p0.precision or 0,
		formatAsString = function(_) --[[ line: 61 ]]
			return ""
		end
	}, p2)) else reactModule.createElement(numberInputModule, dashModule.join({
		value = value,
		onChanged = function(p3) --[[ line: 72 ]]
			-- upvalues: p0 (ref)
			p0.handler(p3, p0.component)
		end,
		controlsVariant = p1,
		minimum = p0.minimum or 0,
		maximum = p0.maximum or 255,
		step = p0.step or 1,
		precision = p0.precision or 0
	}, p2))
end

local function renderInput(_, p5, p6, p7, p8) --[[ line: 84 ]]
	-- upvalues: inputSizeModule (ref), colorInputModeModule (ref), reactModule (ref), viewModule (ref), textInputModule (ref), createNumberInputElement (ref), numberInputControlsVariantModule (ref)
	return if p5.key == colorInputModeModule.Hex then reactModule.createElement(viewModule, { tag = "grow-1 size-0-full", LayoutOrder = p6 }, {
		Input = reactModule.createElement(textInputModule, {
			label = "",
			text = p5.value:getValue(),
			onChanged = function(p9) --[[ line: 109 ]]
				-- upvalues: p5 (ref)
				p5.handler(p9, p5.component)
			end,
			placeholder = p5.placeholder or "#000000",
			size = inputSizeModule.XSmall,
			width = UDim.new(1, 0),
			testId = `{p8}-{p7}`
		})
	}) else reactModule.createElement(viewModule, { tag = "grow-1 size-0-full", LayoutOrder = p6 }, {
		Input = createNumberInputElement(p5, numberInputControlsVariantModule.None, {
			label = "",
			size = inputSizeModule.XSmall,
			width = UDim.new(1, 0),
			LayoutOrder = p6,
			testId = `{p8}-{p7}{if p7 == p5.key:lower() then "" else `-{p5.key:lower()}`}`
		})
	})
end

local t = { alpha = reactModule.createBinding(1) }

return function(p10) --[[ line: 143 | named "ColorInputs" ]]
	-- upvalues: colorInputModeModule (ref), withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), colorUtilsModule (ref), viewModule (ref), textInputModule (ref), inputSizeModule (ref), colorInputUtilsModule (ref), renderInput (ref), withCommonPropsModule (ref), dashModule (ref), dropdownModule (ref)
	local availableModes = p10.availableModes or {
		colorInputModeModule.RGB,
		colorInputModeModule.HSV,
		colorInputModeModule.Hex,
		colorInputModeModule.Brick
	}
	local var20 = withDefaultsModule(p10, t)
	local var21 = useTokensModule()
	local mode = var20.mode or colorInputModeModule.RGB
	local color = var20.color
	local alpha = var20.alpha
	local var23 = reactModule.useCallback(function(p11) --[[ line: 153 ]]
		-- upvalues: var20 (ref)
		if var20.onColorChanged then
			var20.onColorChanged(p11)
		end
	end, { var20.onColorChanged })
	local onAlphaChanged = var20.onAlphaChanged
	local var24 = var20.onAlphaChanged ~= nil
	local var25 = color:map(function(p12) --[[ line: 163 ]]
		-- upvalues: colorUtilsModule (copy)
		if colorUtilsModule.isPartialHSV(p12) then
			return { r = nil, g = nil, b = nil }
		end
		local var33 = colorUtilsModule.toColor3(p12)
		
		return {
			r = math.round(var33.R * 255),
			g = math.round(var33.G * 255),
			b = math.round(var33.B * 255)
		}
	end)
	local var26 = color:map(function(p13) --[[ line: 176 ]]
		if type(p13) == "table" then
			return { h = p13.H, s = p13.S, v = p13.V }
		end
		local var34, var35, var36 = p13:ToHSV()
		
		return {
			h = math.round(var34 * 360),
			s = math.round(var35 * 100),
			v = math.round(var36 * 100)
		}
	end)
	local var27 = var25:map(function(p14) --[[ line: 189 ]]
		return if p14.r == nil or p14.g == nil or p14.b == nil then "" else string.format("#%02X%02X%02X", p14.r, p14.g, p14.b)
	end)
	local var28 = reactModule.useCallback(function(p15, p16) --[[ line: 197 ]]
		-- upvalues: var25 (ref), var23 (ref)
		local cloned = table.clone(var25:getValue())
		cloned[p16] = math.clamp(p15, 0, 255)
		
		if cloned.r == nil or cloned.g == nil or cloned.b == nil then
			return
		end
		var23(Color3.fromRGB(cloned.r, cloned.g, cloned.b))
	end, { var25, var23 })
	local var29 = reactModule.useCallback(function(p17) --[[ line: 213 ]]
		-- upvalues: onAlphaChanged (ref)
		if onAlphaChanged then
			onAlphaChanged(p17)
		end
	end, { onAlphaChanged })
	local var30 = reactModule.useCallback(function(p18, p19) --[[ line: 219 ]]
		-- upvalues: var26 (ref), var23 (ref)
		local cloned = table.clone(var26:getValue())
		
		if cloned[p19] == nil and p18 == 0 then
			return
		end
		cloned[p19] = math.clamp(p18, 0, if p19 == "h" then 360 else 100)
		var23(Color3.fromHSV(cloned.h / 360, (cloned.s or 100) / 100, (cloned.v or 100) / 100))
	end, { var26, var23 })
	local var31 = reactModule.useCallback(function(p20) --[[ line: 233 ]]
		-- upvalues: var23 (ref)
		local var39 = p20:gsub("#", ""):upper()
		
		if var39:match("^%x%x%x%x%x%x$") then
			local var40 = tonumber(var39:sub(1, 2), 16)
			local var41 = tonumber(var39:sub(3, 4), 16)
			local var42 = tonumber(var39:sub(5, 6), 16)
			
			if var40 and var41 and var42 then
				var23(Color3.fromRGB(var40, var41, var42))
			end
		end
	end, { var23 })
	local var32 = reactModule.useMemo(function() --[[ line: 249 ]]
		-- upvalues: colorInputModeModule (copy), var24 (ref), availableModes (ref)
		local list = {
			{
				id = colorInputModeModule.RGB,
				text = colorInputModeModule.RGB
			},
			{
				id = colorInputModeModule.HSV,
				text = colorInputModeModule.HSV
			},
			{
				id = colorInputModeModule.Hex,
				text = colorInputModeModule.Hex
			},
			{
				id = colorInputModeModule.Brick,
				text = colorInputModeModule.Brick
			}
		}
		
		if var24 then
			table.insert(list, 2, {
				id = colorInputModeModule.RGBA,
				text = colorInputModeModule.RGBA
			})
		end
		if not availableModes then
			return list
		end
		local t = {}
		
		for i, v in list do
			local id = v.id
			
			for i_1, v_1 in availableModes do
				if if id ~= v_1 then id == colorInputModeModule.RGBA and (v_1 == colorInputModeModule.RGB and var24) else true then
					table.insert(t, v)
					continue
				end
			end
		end
		return t
	end, { var24 })
	reactModule.useEffect(function() --[[ line: 284 ]]
		-- upvalues: mode (ref), colorInputModeModule (copy), var24 (ref), var20 (ref)
		if mode == colorInputModeModule.RGBA and not var24 and var20.onModeChanged then
			var20.onModeChanged(colorInputModeModule.RGB)
		end
	end, { mode, var24 })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var20, { tag = "row gap-xsmall size-full-600" }), dashModule.join({
		ModeDropdown = if #var32 > 1 then reactModule.createElement(dropdownModule.Root, {
			label = "",
			items = var32,
			value = mode,
			onItemChanged = function(p21) --[[ line: 344 ]]
				-- upvalues: var20 (ref)
				if var20.onModeChanged then
					var20.onModeChanged(p21)
				end
			end,
			size = inputSizeModule.XSmall,
			width = UDim.new(0, var21.Size.Size_1600),
			testId = `{var20.testId}--mode-dropdown`
		}) else nil
	}, (function() --[[ line: 292 ]]
		-- upvalues: mode (ref), colorInputModeModule (copy), reactModule (copy), viewModule (copy), textInputModule (copy), color (ref), inputSizeModule (copy), var20 (ref), colorInputUtilsModule (copy), var25 (ref), var26 (ref), var27 (ref), alpha (ref), var28 (ref), var30 (ref), var31 (ref), var29 (ref), var21 (ref), renderInput (copy)
		if mode == colorInputModeModule.Brick then
			return {
				BrickColorName = reactModule.createElement(viewModule, { tag = "grow-1 size-0-full", LayoutOrder = 1 }, {
					Input = reactModule.createElement(textInputModule, {
						isDisabled = true,
						label = "",
						text = BrickColor.new(color:getValue()).Name,
						onChanged = function() --[[ line: 301 ]] end,
						size = inputSizeModule.XSmall,
						width = UDim.new(1, 0),
						testId = `{var20.testId}-brick-name`
					})
				})
			}
		end
		local var45 = colorInputUtilsModule.createInputConfigs(var25, var26, var27, alpha, var28, var30, var31, var29, var21)[mode]
		
		if not var45 then
			return nil
		end
		local t = {}
		
		for i, v in ipairs(var45) do
			t[v.key .. "Input"] = renderInput(var21, v, i, mode:lower(), var20.testId)
		end
		return t
	end)()))
end