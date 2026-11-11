local GuiService = game:GetService("GuiService")
local Roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local FocusHandlerContextModule = require(script.Parent.FocusHandlerContext)
local FocusHandlerContextProvider = Roact.PureComponent:extend("FocusHandlerContextProvider")

function FocusHandlerContextProvider.init(p1)
	p1.state = { candidateHandlerId = nil, currentHandlerId = nil }
	p1.previousSelections = {}
end

function FocusHandlerContextProvider.requestFocusForHandlerId(p1, CurrentHandlerId)
	p1:setState(function(p2)
		-- upvalues: CurrentHandlerId (copy)
		return if p2.currentHandlerId == nil then { currentHandlerId = CurrentHandlerId } elseif CurrentHandlerId == p2.currentHandlerId then nil else { candidateHandlerId = CurrentHandlerId }
	end)
end

function FocusHandlerContextProvider.blurCurrentFocusHandler(p1, CurrentHandlerId, p2)
	-- upvalues: GuiService (copy), Roact (copy)
	p1:setState(function(State)
		-- upvalues: CurrentHandlerId (copy), p2 (copy), GuiService (upval), p1 (copy), Roact (upval)
		if State.currentHandlerId == CurrentHandlerId then
			p1.previousSelections[CurrentHandlerId] = if p2 then nil else GuiService.SelectedCoreObject
			
			return if State.candidateHandlerId == nil then { currentHandlerId = Roact.None } else {
				currentHandlerId = State.candidateHandlerId,
				candidateHandlerId = Roact.None
			}
		else
			return nil
		end
	end)
end

function FocusHandlerContextProvider.forgetLastSelectionForHandlerId(p1, p2)
	p1.previousSelections[p2] = nil
end

function FocusHandlerContextProvider.render(p1)
	-- upvalues: Roact (copy), FocusHandlerContextModule (copy)
	return Roact.createElement(FocusHandlerContextModule.Provider, {
		value = {
			currentHandlerId = p1.state.currentHandlerId,
			candidateHandlerId = p1.state.candidateHandlerId,
			previousSelections = p1.previousSelections,
			requestFocusForHandlerId = function(p2)
				-- upvalues: p1 (copy)
				p1:requestFocusForHandlerId(p2)
			end,
			forgetLastSelectionForHandlerId = function(p2)
				-- upvalues: p1 (copy)
				p1:forgetLastSelectionForHandlerId(p2)
			end,
			blurCurrentFocusHandler = function(p2, p3)
				-- upvalues: p1 (copy)
				p1:blurCurrentFocusHandler(p2, p3)
			end
		}
	}, p1.props[Roact.Children])
end

return FocusHandlerContextProvider