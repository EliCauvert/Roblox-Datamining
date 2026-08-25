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

local function createButtons(p0, p1, p2, p3, p4)
	-- upvalues: useTokens (ref), reactModule (ref), controlState (ref), view (ref), inputLabel (ref), inputLabelSize (ref), icon (ref), iconSize (ref)
	local var4 = useTokens()
	local t = {}
	local var6, var7 = reactModule.useState(p4 or "")
	
	for i, v in pairs(p0) do
		local var8, var9 = reactModule.useState(false)
		local var10 = reactModule.useCallback(function()
			-- upvalues: var7 (ref), v (ref), p2 (ref), p3 (ref), p1 (ref), var9 (ref)
			var7(v.value)
			p2(v.value, v.text)
			
			if p3 then
				p3(p1[v.value])
			end
			var9(true)
		end, { p2, p3, var9 })
		table.insert(t, reactModule.createElement(view, { tag = "auto-xy col gap-xsmall padding-bottom-xsmall" }, {
			ButtonContainer = reactModule.createElement(view, {
				tag = "size-full-0 auto-y radius-medium row flex-between",
				onStateChanged = reactModule.useCallback(function(p5)
					-- upvalues: controlState (copy), var9 (ref)
					if p5 == controlState.Hover or p5 == controlState.Pressed then
						var9(true)
						
						return
					end
					var9(false)
				end, { var9, var10 }),
				onActivated = var10
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10)
				}),
				Button = reactModule.createElement(inputLabel, {
					Text = v.text,
					textStyle = if var8 then var4.Color.Content.Emphasis else var4.Color.Content.Default,
					onActivated = var10,
					onHover = var9,
					size = inputLabelSize.Medium
				}),
				Icon = if v.value == var6 then reactModule.createElement(icon, {
					name = "icons/status/success_small",
					size = iconSize.Small
				}) else nil
			}),
			Divider = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				stroke = {
					Thickness = 0.5,
					Color = var4.Color.Content.Default.Color3,
					Transparency = if next(p0, i) ~= nil then var4.Color.Content.Default.Transparency else 1
				}
			})
		}))
	end
	return t
end

return function(p6)
	-- upvalues: reactModule (ref), cryoModule (ref), useLocalization (ref), createButtons (ref), view (ref)
	local var11 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p6 (ref)
		return cryoModule.Dictionary.map(p6.options, function(p7)
			return p7.localizationKey, p7.value
		end)
	end))
	
	return reactModule.createElement(view, { tag = "size-full col" }, {
		createButtons(reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), p6 (ref), var11 (ref)
			return cryoModule.List.map(p6.options, function(p8)
				-- upvalues: var11 (copy)
				return { text = var11[p8.value] or "", value = p8.value }
			end)
		end, { p6.options, var11 }), useLocalization(reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), p6 (ref)
			return cryoModule.Dictionary.map(p6.options, function(p9)
				return p9.descriptionLocalizationKey, p9.value
			end)
		end)), p6.onSelected, p6.setDescription, p6.defaultValue)
	})
end