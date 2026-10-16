local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local ControlStateModule = require(Foundation.Enums.ControlState)
local StateLayerModeModule = require(Foundation.Enums.StateLayerMode)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

local function _(p1, Key) --[[ Line: 14 | Named "buildDayTags" ]]
	local config = {
		["size-full text-title-small text-align-x-center text-align-y-center"] = true,
		["radius-circle"] = not p1
	}
	
	if p1 and Key and Key ~= "" then
		config[Key] = true
	end
	return config
end

return function(Frame) --[[ Line: 42 | Named "CalendarGridDayLabel" ]]
	-- upvalues: UseTokensModule (copy), ConstantsModule (copy), ReactModule (copy), ControlStateModule (copy), TextModule (copy), StateLayerModeModule (copy), ViewModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local EmphasisColor3 = if Frame.isSelected then UseTokensModuleResult.Inverse.Content.Emphasis.Color3 elseif Frame.isSelectable and Frame.emphasizeText then UseTokensModuleResult.Color.Content.Emphasis.Color3 else UseTokensModuleResult.Color.Content.Muted.Color3
	local DISABLEDTRANSPARENCY = if Frame.isSelected or Frame.isSelectable and Frame.emphasizeText then 0 else ConstantsModule.DISABLED_TRANSPARENCY
	local NoIsSelected: boolean = Frame.highlight == true and not Frame.isSelected
	local BandRadiusTag = Frame.bandRadiusTag
	local Tag = {
		["size-full text-title-small text-align-x-center text-align-y-center"] = true,
		["radius-circle"] = not NoIsSelected
	}
	
	if NoIsSelected and BandRadiusTag and BandRadiusTag ~= "" then
		Tag[BandRadiusTag] = true
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 57 ]]
		-- upvalues: Frame (copy), ControlStateModule (upval)
		return if Frame.onHoverEnter == nil then nil else function(Hover) --[[ Line: 61 ]]
			-- upvalues: ControlStateModule (upval), Frame (upval)
			if Hover == ControlStateModule.Hover then
				Frame.onHoverEnter()
			end
		end
	end, { Frame.onHoverEnter })
	
	return ReactModule.createElement(ViewModule, { tag = "size-full", LayoutOrder = Frame.LayoutOrder }, {
		Band = if Frame.bandPosition and Frame.bandSize then ReactModule.createElement(ViewModule, {
			ZIndex = 0,
			backgroundStyle = UseTokensModuleResult.Color.ActionStandard.Background,
			Position = Frame.bandPosition,
			Size = Frame.bandSize,
			tag = if Frame.bandRadiusTag and Frame.bandRadiusTag ~= "" then Frame.bandRadiusTag else nil
		}) else nil,
		Day = ReactModule.createElement(TextModule, {
			backgroundStyle = if Frame.isSelected then UseTokensModuleResult.Color.System.Contrast elseif Frame.highlight then UseTokensModuleResult.Color.ActionStandard.Background else nil,
			onActivated = if Frame.isSelectable then Frame.onActivated else nil,
			onStateChanged = if Frame.isSelectable then UseMemoResult else nil,
			RichText = not Frame.isSelectable,
			stateLayer = {
				mode = if Frame.isSelected then StateLayerModeModule.Inverse else StateLayerModeModule.Default
			},
			tag = Tag,
			testId = Frame.testId,
			Text = if Frame.isSelectable then Frame.label else `<s>{Frame.label}</s>`,
			textStyle = {
				Color3 = EmphasisColor3,
				Transparency = DISABLEDTRANSPARENCY
			}
		})
	})
end