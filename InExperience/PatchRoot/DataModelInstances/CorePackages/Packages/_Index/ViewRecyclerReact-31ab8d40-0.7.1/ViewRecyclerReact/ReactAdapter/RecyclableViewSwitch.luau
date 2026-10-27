local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewRegistryModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)

return function(p1)
	-- upvalues: ReactModule (copy), RecyclableViewRegistryModule (copy), SignalsModule (copy)
	local SelectedFunction = p1.selected
	local Views = p1.views
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Views (copy), RecyclableViewRegistryModule (upval), SelectedFunction (copy), SignalsModule (upval)
		local t = {}
		
		for i, view in Views do
			assert(RecyclableViewRegistryModule.isRegistered(view), `RecyclableViewSwitch: views.{i} is not a Recyclable view type`)
			
			if type(SelectedFunction) == "function" then
				t[i] = SignalsModule.createComputed(function(p2): boolean
					-- upvalues: SelectedFunction (upval), i (copy)
					return SelectedFunction(p2) == i
				end)
			else
				t[i] = SelectedFunction == i
			end
		end
		return t
	end, { SelectedFunction, Views })
	local Elements = {}
	
	for i, view in Views do
		Elements[i] = ReactModule.createElement(view, { active = UseMemoResult[i], itemSignal = p1.itemSignal })
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end