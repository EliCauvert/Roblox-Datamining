local Parent = script.Parent.Parent
local InspectOpenedModule = require(Parent.Actions.InspectOpened)
local NetworkingModule = require(Parent.App.Networking)

return function(p1)
	-- upvalues: NetworkingModule (copy), InspectOpenedModule (copy)
	return function(p2)
		-- upvalues: NetworkingModule (upval), p1 (copy), InspectOpenedModule (upval)
		p2:dispatch(NetworkingModule.NetworkingCurrentlyWearing.GetItemDetails.API(p1)):andThen(function()
			-- upvalues: p2 (copy), InspectOpenedModule (upval), p1 (upval)
			p2:dispatch(InspectOpenedModule(p1))
		end):catch(function() end)
	end
end