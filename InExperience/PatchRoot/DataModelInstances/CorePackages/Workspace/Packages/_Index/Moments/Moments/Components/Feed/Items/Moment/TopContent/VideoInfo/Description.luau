local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useSignalBinding = signalsReactModule.useSignalBinding
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), momentContextModule (ref), useSignalBinding (ref), reactModule (ref), view (ref), text (ref), getColorStyleWithTransparencyModule (ref)
	local var6 = useTokens()
	local var7 = momentContextModule.useMoment()
	local description = var7.store.getData(false).description
	
	return if description and description ~= "" then reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder,
		Visible = useSignalBinding(var7.store.getIsModerated):map(function(p1)
			return not p1
		end)
	}, {
		DescriptionText = reactModule.createElement(text, {
			tag = "auto-xy text-body-large text-wrap text-align-x-left text-align-y-top text-truncate-split content-emphasis",
			Text = description,
			textStyle = var7.animationRatio:map(function(p2)
				-- upvalues: getColorStyleWithTransparencyModule (copy), var6 (ref)
				return getColorStyleWithTransparencyModule(var6.Color.Content.Emphasis, p2)
			end)
		})
	}) else nil
end)