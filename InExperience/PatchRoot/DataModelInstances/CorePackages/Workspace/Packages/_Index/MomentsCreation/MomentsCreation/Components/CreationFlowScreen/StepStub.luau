local parent = script:FindFirstAncestor("MomentsCreation").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return function(_)
		-- upvalues: reactModule (copy), view (copy), text (copy), p1 (ref)
		return reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, {
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium text-align-x-center content-default",
				Text = `{p1} placeholder`
			})
		})
	end
end