local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local plannedSubPartModule = require(script.Parent.PlannedSubPart)

return function(p1)
	-- upvalues: reactModule (ref), plannedSubPartModule (ref)
	return {
		summary = `{p1} documentation is in progress.`,
		stories = {
			{
				name = "Playground",
				story = function()
					-- upvalues: reactModule (copy), plannedSubPartModule (copy), p1 (ref)
					return reactModule.createElement(plannedSubPartModule, { name = p1 })
				end
			}
		}
	}
end