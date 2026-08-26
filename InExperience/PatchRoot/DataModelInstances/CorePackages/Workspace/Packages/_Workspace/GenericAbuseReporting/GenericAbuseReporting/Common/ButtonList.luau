local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local inputLabel = foundationModule.InputLabel
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local controlState = foundationModule.Enums.ControlState
local inputLabelSize = foundationModule.Enums.InputLabelSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens

local function createButtons(p1, p2, p3, p4, p5)
	-- upvalues: useTokens (ref), reactModule (ref), controlState (ref), view (ref), inputLabel (ref), inputLabelSize (ref), icon (ref), iconSize (ref)
	local var1 = useTokens()
	local t = {}
	local var2, var3 = reactModule.useState(p5 or "")
	
	for i, v in pairs(p1) do
		local var4, var5 = reactModule.useState(false)
		local var6 = reactModule.useCallback(function()
			-- upvalues: var3 (ref), v (ref), p3 (ref), p4 (ref), p2 (ref), var5 (ref)
			var3(v.value)
			p3(v.value, v.text)
			
			if p4 then
				p4(p2[v.value])
			end
			var5(true)
		end, { p3, p4, var5 })
		table.insert(t, reactModule.createElement(view, { tag = "auto-xy col gap-xsmall padding-bottom-xsmall" }, {
			ButtonContainer = reactModule.createElement(view, {
				tag = "size-full-0 auto-y radius-medium row flex-between",
				onStateChanged = reactModule.useCallback(function(p6)
					-- upvalues: controlState (copy), var5 (ref)
					if p6 == controlState.Hover or p6 == controlState.Pressed then
						var5(true)
						
						return
					end
					var5(false)
				end, { var5, var6 }),
				onActivated = var6
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10)
				}),
				Button = reactModule.createElement(inputLabel, {
					Text = v.text,
					textStyle = if var4 then var1.Color.Content.Emphasis else var1.Color.Content.Default,
					onActivated = var6,
					onHover = var5,
					size = inputLabelSize.Medium
				}),
				Icon = if v.value == var2 then reactModule.createElement(icon, {
					name = "icons/status/success_small",
					size = iconSize.Small
				}) else nil
			}),
			Divider = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				stroke = {
					Thickness = 0.5,
					Color = var1.Color.Content.Default.Color3,
					Transparency = if next(p1, i) ~= nil then var1.Color.Content.Default.Transparency else 1
				}
			})
		}))
	end
	return t
end

return function(p6)
	-- upvalues: reactModule (ref), cryoModule (ref), useLocalization (ref), createButtons (ref), view (ref)
	local var7 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p6 (ref)
		return cryoModule.Dictionary.map(p6.options, function(p7)
			return p7.localizationKey, p7.value
		end)
	end))
	
	return reactModule.createElement(view, { tag = "size-full col" }, {
		createButtons(reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), p6 (ref), var7 (ref)
			return cryoModule.List.map(p6.options, function(p7)
				-- upvalues: var7 (copy)
				return { text = var7[p7.value] or "", value = p7.value }
			end)
		end, { p6.options, var7 }), useLocalization(reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), p6 (ref)
			return cryoModule.Dictionary.map(p6.options, function(p7)
				return p7.descriptionLocalizationKey, p7.value
			end)
		end)), p6.onSelected, p6.setDescription, p6.defaultValue)
	})
end