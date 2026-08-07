local parent = script:FindFirstAncestor("MomentsCreation").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View

return function(p0) --[[ line: 19 | named "makeStepStub" ]]
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return function(_) --[[ line: 20 | named "StepStub" ]]
		-- upvalues: reactModule (copy), view (copy), text (copy), p0 (ref)
		return reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, {
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium text-align-x-center content-default",
				Text = `{p0} placeholder`
			})
		})
	end
end