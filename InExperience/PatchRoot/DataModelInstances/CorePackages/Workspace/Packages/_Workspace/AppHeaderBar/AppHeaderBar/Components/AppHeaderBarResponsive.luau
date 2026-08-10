local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local cryoModule = require(parent_1.Cryo)
local responsiveModule = require(parent_1.Responsive)
local appHeaderBarComponentModule = require(script.Parent.AppHeaderBarComponent)
local useStyle = UIBloxModule.Core.Style.useStyle
local useBreakpointXOrLarger = responsiveModule.useBreakpointXOrLarger
local usePreferredInput = responsiveModule.usePreferredInput
local _ = require(parent.Types)

return function(p0) --[[ line: 20 | named "AppHeaderBarResponsive" ]]
	-- upvalues: useBreakpointXOrLarger (ref), responsiveModule (ref), usePreferredInput (ref), useStyle (ref), reactModule (ref), cryoModule (ref), appHeaderBarComponentModule (ref)
	local var5 = useBreakpointXOrLarger(responsiveModule.Keys.Medium)
	local var6 = useBreakpointXOrLarger(responsiveModule.Keys.Large)
	local var7 = usePreferredInput() == responsiveModule.Input.Directional
	local tokens = useStyle().Tokens
	local titleFontStyle = p0.titleFontStyle
	local shouldRenderTitle = p0.shouldRenderTitle
	local shouldRenderCenter = p0.shouldRenderCenter
	local isTitleCentered = p0.isTitleCentered
	local utilitiesGap = p0.utilitiesGap
	local paddingTop = p0.paddingTop
	local paddingBottom = p0.paddingBottom
	local onMedia = p0.onMedia
	
	return reactModule.createElement(appHeaderBarComponentModule, cryoModule.Dictionary.join(p0, reactModule.useMemo(function() --[[ line: 37 ]]
		-- upvalues: var6 (ref), var7 (ref), cryoModule (copy), shouldRenderCenter (ref), paddingTop (ref), tokens (ref), paddingBottom (ref), onMedia (ref), shouldRenderTitle (ref), var5 (ref), isTitleCentered (ref), titleFontStyle (ref), utilitiesGap (ref)
		local t = {
			title = if var6 and var7 then cryoModule.None else nil,
			renderCenter = if var6 and not var7 or shouldRenderCenter then nil else cryoModule.None,
			renderUserInfo = if var6 then nil else cryoModule.None,
			avatarActionIcon = if var6 then cryoModule.None else nil,
			searchActionIcon = if var6 and not var7 then cryoModule.None else nil,
			paddingTop = if var6 and not paddingTop then UDim.new(0, tokens.Size.Size_400) else nil,
			paddingBottom = if var6 and not paddingBottom then UDim.new(0, tokens.Size.Size_400) else nil,
			onMedia = if var6 and var7 and onMedia == nil then true else nil
		}
		
		if shouldRenderTitle then
			t.title = nil
		end
		t.titleFontStyle = if titleFontStyle then nil elseif var5 and not isTitleCentered then tokens.Typography.HeadingLarge else tokens.Typography.HeadingSmall
		t.utilitiesGap = if utilitiesGap then nil elseif var5 then UDim.new(0, tokens.Size.Size_600) else UDim.new(0, tokens.Size.Size_400)
		
		return t
	end, {
		var5, var6, var7, tokens, titleFontStyle, shouldRenderCenter, isTitleCentered,
		utilitiesGap, paddingTop, paddingBottom, onMedia
	})))
end