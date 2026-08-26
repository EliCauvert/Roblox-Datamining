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

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), momentContextModule (ref), useSignalBinding (ref), reactModule (ref), view (ref), text (ref), getColorStyleWithTransparencyModule (ref)
	local var1 = useTokens()
	local var2 = momentContextModule.useMoment()
	local description = var2.store.getData(false).description
	
	return if description and description ~= "" then reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		Visible = useSignalBinding(var2.store.getIsModerated):map(function(p2)
			return not p2
		end)
	}, {
		DescriptionText = reactModule.createElement(text, {
			tag = "auto-xy text-body-large text-wrap text-align-x-left text-align-y-top text-truncate-split content-emphasis",
			Text = description,
			textStyle = var2.animationRatio:map(function(p2)
				-- upvalues: getColorStyleWithTransparencyModule (copy), var1 (ref)
				return getColorStyleWithTransparencyModule(var1.Color.Content.Emphasis, p2)
			end)
		})
	}) else nil
end)