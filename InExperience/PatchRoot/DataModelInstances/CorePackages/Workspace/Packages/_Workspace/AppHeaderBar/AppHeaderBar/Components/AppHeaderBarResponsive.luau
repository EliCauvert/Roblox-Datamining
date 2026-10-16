local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local ResponsiveModule = require(Parent1.Responsive)
local AppHeaderBarComponentModule = require(script.Parent.AppHeaderBarComponent)
local UseStyleFunction = require(Parent1.UIBlox).Core.Style.useStyle
local UseBreakpointXOrLargerFunction = ResponsiveModule.useBreakpointXOrLarger
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local _ = require(Parent.Types)

return function(p1) --[[ Line: 20 | Named "AppHeaderBarResponsive" ]]
	-- upvalues: UseBreakpointXOrLargerFunction (copy), ResponsiveModule (copy), UsePreferredInputFunction (copy), UseStyleFunction (copy), ReactModule (copy), CryoModule (copy), AppHeaderBarComponentModule (copy)
	local UseBreakpointXOrLargerResult = UseBreakpointXOrLargerFunction(ResponsiveModule.Keys.Medium)
	local UseBreakpointXOrLargerResult1 = UseBreakpointXOrLargerFunction(ResponsiveModule.Keys.Large)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local Tokens = UseStyleFunction().Tokens
	local TitleFontStyle = p1.titleFontStyle
	local ShouldRenderTitle = p1.shouldRenderTitle
	local ShouldRenderCenter = p1.shouldRenderCenter
	local IsTitleCentered = p1.isTitleCentered
	local UtilitiesGap = p1.utilitiesGap
	local PaddingTop = p1.paddingTop
	local PaddingBottom = p1.paddingBottom
	local OnMedia = p1.onMedia
	
	return ReactModule.createElement(AppHeaderBarComponentModule, (CryoModule.Dictionary.join(p1, (ReactModule.useMemo(function() --[[ Line: 37 ]]
		-- upvalues: UseBreakpointXOrLargerResult1 (copy), IsUsePreferredInputResultMatch (copy), CryoModule (upval), ShouldRenderCenter (copy), PaddingTop (copy), Tokens (copy), PaddingBottom (copy), OnMedia (copy), ShouldRenderTitle (copy), UseBreakpointXOrLargerResult (copy), IsTitleCentered (copy), TitleFontStyle (copy), UtilitiesGap (copy)
		local config = {
			title = if UseBreakpointXOrLargerResult1 and IsUsePreferredInputResultMatch then CryoModule.None else nil,
			renderCenter = if UseBreakpointXOrLargerResult1 and not IsUsePreferredInputResultMatch then nil elseif ShouldRenderCenter then nil else CryoModule.None,
			renderUserInfo = if UseBreakpointXOrLargerResult1 then nil else CryoModule.None,
			avatarActionIcon = if UseBreakpointXOrLargerResult1 then CryoModule.None else nil,
			searchActionIcon = if UseBreakpointXOrLargerResult1 and not IsUsePreferredInputResultMatch then CryoModule.None else nil,
			paddingTop = if UseBreakpointXOrLargerResult1 and not PaddingTop then UDim.new(0, Tokens.Size.Size_400) else nil,
			paddingBottom = if UseBreakpointXOrLargerResult1 and not PaddingBottom then UDim.new(0, Tokens.Size.Size_400) else nil,
			onMedia = UseBreakpointXOrLargerResult1 and IsUsePreferredInputResultMatch and OnMedia == nil or nil
		}
		
		if ShouldRenderTitle then
			config.title = nil
		end
		local HeadingLarge = if UseBreakpointXOrLargerResult and not IsTitleCentered then Tokens.Typography.HeadingLarge else Tokens.Typography.HeadingSmall
		config.titleFontStyle = if TitleFontStyle then nil else HeadingLarge
		local _UDim: UDim = if UseBreakpointXOrLargerResult then UDim.new(0, Tokens.Size.Size_600) else UDim.new(0, Tokens.Size.Size_400)
		config.utilitiesGap = if UtilitiesGap then nil else _UDim
		
		return config
	end, {
		UseBreakpointXOrLargerResult, UseBreakpointXOrLargerResult1,
		IsUsePreferredInputResultMatch, Tokens, TitleFontStyle, ShouldRenderCenter,
		IsTitleCentered, UtilitiesGap, PaddingTop, PaddingBottom, OnMedia
	})))))
end