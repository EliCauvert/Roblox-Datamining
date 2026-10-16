local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local InputLabel = FoundationModule.InputLabel
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local ControlState = FoundationModule.Enums.ControlState
local InputLabelSize = FoundationModule.Enums.InputLabelSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function createButtons(UseMemoResult, p1, Callback, Callback1, DefaultValue) --[[ Line: 30 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ControlState (copy), View (copy), InputLabel (copy), InputLabelSize (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local Elements = {}
	local UseStateResult, UseStateResult2 = ReactModule.useState(DefaultValue or "")
	
	for i, value in pairs(UseMemoResult) do
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
		local UseResult = ReactModule.useCallback(function() --[[ Line: 43 ]]
			-- upvalues: UseStateResult2 (copy), value (copy), Callback (copy), Callback1 (copy), p1 (copy), UseStateResult2_1 (copy)
			UseStateResult2(value.value)
			Callback(value.value, value.text)
			
			if Callback1 then
				Callback1(p1[value.value])
			end
			UseStateResult2_1(true)
		end, { Callback, Callback1, UseStateResult2_1 })
		table.insert(Elements, ReactModule.createElement(View, { tag = "auto-xy col gap-xsmall padding-bottom-xsmall" }, {
			ButtonContainer = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y radius-medium row flex-between",
				onStateChanged = ReactModule.useCallback(function(Hover) --[[ Line: 52 ]]
					-- upvalues: ControlState (upval), UseStateResult2_1 (copy)
					if Hover == ControlState.Hover or Hover == ControlState.Pressed then
						UseStateResult2_1(true)
						
						return
					else
						UseStateResult2_1(false)
					end
				end, { UseStateResult2_1, UseResult }),
				onActivated = UseResult
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10)
				}),
				Button = ReactModule.createElement(InputLabel, {
					Text = value.text,
					textStyle = if UseStateResult1 then UseTokensResult.Color.Content.Emphasis else UseTokensResult.Color.Content.Default,
					onActivated = UseResult,
					onHover = UseStateResult2_1,
					size = InputLabelSize.Medium
				}),
				Icon = if value.value == UseStateResult then ReactModule.createElement(Icon, {
					name = "icons/status/success_small",
					size = IconSize.Small
				}) else nil
			}),
			Divider = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				stroke = {
					Thickness = 0.5,
					Color = UseTokensResult.Color.Content.Default.Color3,
					Transparency = if next(UseMemoResult, i) == nil then 1 else UseTokensResult.Color.Content.Default.Transparency or 1
				}
			})
		}))
	end
	return Elements
end

return function(p2) --[[ Line: 112 | Named "ButtonList" ]]
	-- upvalues: ReactModule (copy), CryoModule (copy), UseLocalizationFunction (copy), createButtons (copy), View (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 119 ]]
		-- upvalues: CryoModule (upval), p2 (copy)
		return CryoModule.Dictionary.map(p2.options, function(p3) --[[ Line: 120 ]]
			return p3.descriptionLocalizationKey, p3.value
		end)
	end)
	local UseLocalizationResult = UseLocalizationFunction((ReactModule.useMemo(function() --[[ Line: 113 ]]
		-- upvalues: CryoModule (upval), p2 (copy)
		return CryoModule.Dictionary.map(p2.options, function(p3) --[[ Line: 114 ]]
			return p3.localizationKey, p3.value
		end)
	end)))
	
	return ReactModule.createElement(View, { tag = "size-full col" }, {
		(createButtons(ReactModule.useMemo(function() --[[ Line: 128 ]]
			-- upvalues: CryoModule (upval), p2 (copy), UseLocalizationResult (copy)
			return CryoModule.List.map(p2.options, function(p3) --[[ Line: 129 ]]
				-- upvalues: UseLocalizationResult (upval)
				return {
					text = UseLocalizationResult[p3.value] or "",
					value = p3.value
				}
			end)
		end, { p2.options, UseLocalizationResult }), UseLocalizationFunction(UseMemoResult), p2.onSelected, p2.setDescription, p2.defaultValue))
	})
end