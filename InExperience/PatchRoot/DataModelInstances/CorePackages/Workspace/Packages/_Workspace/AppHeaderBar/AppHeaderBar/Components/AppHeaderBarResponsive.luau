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

return function(p1)
	-- upvalues: useBreakpointXOrLarger (ref), responsiveModule (ref), usePreferredInput (ref), useStyle (ref), reactModule (ref), cryoModule (ref), appHeaderBarComponentModule (ref)
	local var1 = useBreakpointXOrLarger(responsiveModule.Keys.Medium)
	local var2 = useBreakpointXOrLarger(responsiveModule.Keys.Large)
	local var3 = usePreferredInput() == responsiveModule.Input.Directional
	local tokens = useStyle().Tokens
	local titleFontStyle = p1.titleFontStyle
	local shouldRenderTitle = p1.shouldRenderTitle
	local shouldRenderCenter = p1.shouldRenderCenter
	local isTitleCentered = p1.isTitleCentered
	local utilitiesGap = p1.utilitiesGap
	local paddingTop = p1.paddingTop
	local paddingBottom = p1.paddingBottom
	local onMedia = p1.onMedia
	
	return reactModule.createElement(appHeaderBarComponentModule, cryoModule.Dictionary.join(p1, reactModule.useMemo(function()
		-- upvalues: var2 (ref), var3 (ref), cryoModule (copy), shouldRenderCenter (ref), paddingTop (ref), tokens (ref), paddingBottom (ref), onMedia (ref), shouldRenderTitle (ref), var1 (ref), isTitleCentered (ref), titleFontStyle (ref), utilitiesGap (ref)
		local t = {
			title = if var2 and var3 then cryoModule.None else nil,
			renderCenter = if var2 and not var3 or shouldRenderCenter then nil else cryoModule.None,
			renderUserInfo = if var2 then nil else cryoModule.None,
			avatarActionIcon = if var2 then cryoModule.None else nil,
			searchActionIcon = if var2 and not var3 then cryoModule.None else nil,
			paddingTop = if var2 and not paddingTop then UDim.new(0, tokens.Size.Size_400) else nil,
			paddingBottom = if var2 and not paddingBottom then UDim.new(0, tokens.Size.Size_400) else nil,
			onMedia = if var2 and var3 and onMedia == nil then true else nil
		}
		
		if shouldRenderTitle then
			t.title = nil
		end
		t.titleFontStyle = if titleFontStyle then nil elseif var1 and not isTitleCentered then tokens.Typography.HeadingLarge else tokens.Typography.HeadingSmall
		t.utilitiesGap = if utilitiesGap then nil elseif var1 then UDim.new(0, tokens.Size.Size_600) else UDim.new(0, tokens.Size.Size_400)
		
		return t
	end, {
		var1, var2, var3, tokens, titleFontStyle, shouldRenderCenter, isTitleCentered,
		utilitiesGap, paddingTop, paddingBottom, onMedia
	})))
end