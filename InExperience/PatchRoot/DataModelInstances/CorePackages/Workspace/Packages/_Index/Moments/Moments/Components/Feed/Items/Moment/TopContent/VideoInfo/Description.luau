local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalBindingFunction = require(Parent.SignalsReact).useSignalBinding
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)

return ReactModule.memo(function(Frame) --[[ Line: 31 | Named "Description" ]]
	-- upvalues: UseTokensFunction (copy), MomentContextModule (copy), UseSignalBindingFunction (copy), ReactModule (copy), View (copy), Text (copy), GetColorStyleWithTransparencyModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMomentResult = MomentContextModule.useMoment()
	local UseSignalBindingResult = UseSignalBindingFunction(UseMomentResult.store.getIsModerated)
	local AnimationRatio = UseMomentResult.animationRatio
	local Description = UseMomentResult.store.getData(false).description
	
	return if Description and Description ~= "" then ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		Visible = UseSignalBindingResult:map(function(p1): boolean --[[ Line: 48 ]]
			return not p1
		end)
	}, {
		DescriptionText = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-large text-wrap text-align-x-left text-align-y-top text-truncate-split content-emphasis",
			Text = Description,
			textStyle = AnimationRatio:map(function(p1) --[[ Line: 57 ]]
				-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
				return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Emphasis, p1)
			end)
		})
	}) else nil
end)