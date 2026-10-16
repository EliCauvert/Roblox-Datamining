local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1) --[[ Line: 19 | Named "makeStepStub" ]]
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return function(_) --[[ Line: 20 | Named "StepStub" ]]
		-- upvalues: ReactModule (upval), View (upval), Text (upval), p1 (copy)
		return ReactModule.createElement(View, { tag = "col align-x-center align-y-center size-full" }, {
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-align-x-center content-default",
				Text = `{p1} placeholder`
			})
		})
	end
end